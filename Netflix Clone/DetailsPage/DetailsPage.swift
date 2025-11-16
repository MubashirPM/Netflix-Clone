//
//  DetailsPage.swift
//  Netflix Clone
//
//  Created by MUNAVAR PM on 12/11/25.
//
import SwiftUI
import SDWebImageSwiftUI

struct MovieDetailView: View {
    @StateObject var viewModel = HomeViewModel()
    let movieId : Int
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 16) {
                ZStack(alignment: .bottomLeading) {
                    WebImage(
                        url: URL(
                            string: AppConfig
                                .imageBaseURL + (
                                    viewModel.movieDetails?.backdropPath ?? ""
                                )
                        )
                    )
                    .resizable()
                    .indicator(.activity)
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width,height: 300)
                    .clipped()
                    
                    HStack {
                        Text(viewModel.movieDetails?.title ?? "")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.bottom, 20)
                        if viewModel.movieDetails?.adult ?? false {
                            Text("🔞")
                                .font(.largeTitle)
                                .padding(.bottom, 20)
                        }
                        
                    }
                    .padding(.leading,16)
                }
                
                VStack(alignment: .leading, spacing: 6) {
                    if let genres = viewModel.movieDetails?.genres {
                        Text(genres.map { $0.name }.joined(separator: " • "))
                            .foregroundColor(.gray)
                            .font(.subheadline)
                    }
                    
                    
                    Text(viewModel.movieDetails?.overview ?? "")
                        .foregroundColor(.white)
                        .font(.body)
                        .lineLimit(nil)
                }
                .padding(.horizontal)
                
                HStack(spacing: 15) {
                    Button(action: {}) {
                        HStack {
                            Spacer()
                            Image(systemName: "play.fill")
                            Text("Play")
                                .fontWeight(.bold)
                            Spacer()
                        }
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        
                    }
                }
                .padding(.horizontal)
                .padding(.top, 10)
                
                
                Text("Production Company")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .padding(.top, 20)
                
                if let logoPath = viewModel.movieDetails?.productionCompanies.first?.logoPath
                {   
                    WebImage(
                        url: URL(string: AppConfig.imageBaseURL + logoPath)
                    )
                    .resizable()
                    .indicator(.activity)
                    .scaledToFill()
                    .frame(width: 120, height: 180)
                    .cornerRadius(10)
                               
                           
                    .padding(.horizontal)
                }
                    
            }
        }
        .background(Color.black)
        .ignoresSafeArea(edges: .top)
        
        .task {
            await viewModel.fetchDetailPage(id: movieId)
        }
    }
}

#Preview {
    MovieDetailView( movieId: 0)
}
