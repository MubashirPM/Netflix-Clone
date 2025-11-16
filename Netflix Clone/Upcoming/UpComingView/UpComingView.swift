//
//  UpComingView.swift
//  Netflix Clone
//
//  Created by MUNAVAR PM on 13/11/25.
//

import SwiftUI
import SDWebImageSwiftUI
import Foundation

struct UpcomingView: View {
    @StateObject var viewModel = UpComingViewModel()
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 30) {
                
                //                ZStack(alignment: .bottomLeading) {
                //                     WebImage(
                //                        url: URL(
                //                            string: AppConfig
                //                                .imageBaseURL + (viewModel.UpComing.first?.backdropPath ?? "")
                //                        )
                //                    )
                //
                //                        .resizable()
                //                        .aspectRatio(contentMode: .fill)
                //                        .frame(height: 400)
                //                        .clipped()
                //
                //
                //                    Text("Featured")
                //                        .font(.title)
                //                        .bold()
                //                        .foregroundColor(.white)
                //                        .padding()
                //                        .background(
                //                            LinearGradient(
                //                                gradient: Gradient(colors: [Color.black.opacity(0.7), .clear]),
                //                                startPoint: .bottom,
                //                                endPoint: .top
                //                            )
                //                        )
                //                }
                
                Text("Upcoming Movies")
                    .font(.title2)
                    .bold()
                    .padding(.horizontal)
                    .foregroundColor(.white)
                
                VStack(spacing: 16) {
                    ForEach(
                        0..<viewModel.UpComing.count ,
                        id: \.self) { id in
                            NavigationLink(destination: MovieDetailView(movieId: viewModel
                                .UpComing[id].id)){
                                    HStack {
                                        WebImage(
                                            url: URL(
                                                string: AppConfig
                                                    .imageBaseURL + (viewModel.UpComing[id].backdropPath)
                                            )
                                        )
                                        
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 120, height: 180)
                                        .clipped()
                                        .cornerRadius(12)
                                        VStack {
                                            Text(viewModel.UpComing[id].title)
                                                .font(.headline)
                                                .foregroundColor(.white)
                                                .padding(.leading, 8)
                                            
                                            Text(viewModel.UpComing[id].overview)
                                                .font(.caption2)
                                                .foregroundColor(.gray)
                                                .padding(.leading, 6)
                                                .lineLimit(5)
                                        }
                                    }
                                    .padding(.horizontal)
                                }
                        }
                }
            }
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
        
        .task {
            await viewModel.fetchUpCominigPage()
        }
    }
}
#Preview {
    UpcomingView()
}
