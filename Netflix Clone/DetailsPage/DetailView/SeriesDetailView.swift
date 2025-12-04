//
//  SeriesDetailView.swift
//  Netflix Clone
//
//  Created by MUNAVAR PM on 22/11/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct SeriesDetailView: View {
    @StateObject var viewModel = HomeViewModel()
    @State var showSheet = false
    @State private var selectedRating = 1
    
    
    let seriesId : Int
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 16) {
                WebImage(
                    url: URL(
                        string: AppConfig
                            .imageBaseURL + (
                                viewModel.seriesDetails?.poster_path ?? ""
                            )
                    )
                )
                .resizable()
                .indicator(.activity)
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width)
                .clipped()
                
                HStack {
                    Text(viewModel.seriesDetails?.name ?? "")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    if viewModel.seriesDetails?.adult ?? false {
                        Text("🔞")
                            .font(.largeTitle)
                            .padding(.bottom, 20)
                    }
                    
                }
                .padding(.leading,16)
                
                
                VStack(alignment: .leading, spacing: 6) {
                    if let genres = viewModel.seriesDetails?.genres {
                        Text(genres.map { $0.name }.joined(separator: " • "))
                            .foregroundColor(.gray)
                            .font(.subheadline)
                    }
                    
                    Text(viewModel.seriesDetails?.overview ?? "")
                        .foregroundColor(.white)
                        .font(.body)
                        .lineLimit(nil)
                    
                    
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
                    
                }
                .background(Color.black)
                .task {
                    await viewModel.fetchSeriesDetails(id: seriesId)
                }
            }
            .padding(.top,0)
            .ignoresSafeArea()
        }
        .background(Color.black) 
    }
}

