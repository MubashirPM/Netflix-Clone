//
//  SearchView.swift
//  Netflix Clone
//
//  Created by MUNAVAR PM on 10/11/25.
//

import SwiftUI

struct SearchView: View {
    @StateObject var viewModel = SearchViewModel()
    
    @State var query: String = ""
    
    var body: some View {
            VStack(alignment: .leading) {
                TextField("Search movies…", text: $query)
                    .onSubmit { print("submitted:", query) }
                    .textFieldStyle(.roundedBorder)
                    
                Text("Top Search")
                    .font(.title2)
                    .bold()
                    .foregroundStyle(.white)
                    .padding(.horizontal)
                ScrollView {
                    
                    LazyVStack {
                        ForEach(viewModel.searchData,id:\.id) { movie in
                            NavigationLink(destination: MovieDetailView(movieId: movie.id)){
                                SearchListingView(text: movie.title, imageURL: movie.backdropPath ?? "")
                            }
                        }
                    }
                }
            }
            .padding(.top,28)
        .navigationBarHidden(false)
        .background(Color.black)
        .onChange(of: query) { oldValue, newValue in
            print("🟡 onChange triggered:", newValue)

            Task {
                print("🟢 calling API…")
                await viewModel.searchMovie(query: newValue)
            }
        }
        .onAppear {
            debugPrint("SearchViewoooooo....")
        }
        
        
    }
}
#Preview {
    NavigationStack {
        SearchView(query: "")
    }
}
