//
//  HomeView.swift
//  Netflix Clone
//
//  Created by MUNAVAR PM on 08/11/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading){
                        AutoScrollImageView(images: ["HomePageIm","HomePageIm","HomePageIm"])
                            .edgesIgnoringSafeArea(.top)

                        
                        HomeActionButtons()
                            .padding(.horizontal,40)
                        Text("Popular Movies")
                            .foregroundColor(.white)
                            .bold()
                            .font(.title)
                            .padding(.leading,16)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                ForEach(
                                    0..<viewModel.popularMovies.count,
                                    id: \.self
                                ) { popularmovies in
                                    NavigationLink(destination: MovieDetailView(movieId: viewModel
                                        .popularMovies[popularmovies].id)){
                                            HomeScrollView(
                                                imageURL: viewModel
                                                    .popularMovies[popularmovies].backdropPath
                                            )
                                        }
                                }
                            }
                            
                        }
                        .padding(.leading,16)
                        
                        Text("TopRated Movies")
                            .foregroundColor(.white)
                            .bold()
                            .font(.title)
                            .padding(.leading,16)
                        
                        ScrollView(.horizontal,showsIndicators: false){
                            HStack(spacing: 12) {
                                ForEach(
                                    0..<viewModel.topRatedMovies.count,
                                    id: \.self
                                ){ topratedMoviess in
                                    HomeScrollRectangleView(
                                        imageURL: viewModel
                                            .topRatedMovies[topratedMoviess].backdropPath
                                    )                                }
                            }
                        }
                        .padding(.leading,16)
                        
                        Text("NowPlaying Movies")
                            .foregroundColor(.white)
                            .bold()
                            .font(.title)
                            .padding(.leading,16)
                        
                        ScrollView(.horizontal,showsIndicators: false){
                            HStack(spacing: 12) {
                                ForEach(
                                    0..<viewModel.nowPlayingMovies.count,
                                    id: \.self
                                ){ nowPlaying in
                                    HomeScrollRectangleView(
                                        imageURL: viewModel
                                            .nowPlayingMovies[nowPlaying].backdropPath
                                    )                                }
                            }
                        }
                        .padding(.leading,16)
                    }
                }
                .ignoresSafeArea(edges: .top)
                .overlay(alignment: .top) {
                    HStack (spacing: 46){
                        Image("NetflixLogo")
                            .resizable()
                            .frame(width: 53,height: 57)
                        Group {
                            Text("TV Shows")
                            Text("Movies")
                            Text("My List")
                        }
                        .foregroundStyle(.white)
                    }
                }
            }
            
        }
        .background(Color.black)
        .task {
            await viewModel.fetchPopularMovie()
            await viewModel.fetchTopRatedMovie()
            await viewModel.fetchNowPlayingMovie()
        }
        
    }
}

#Preview {
    HomeView()
}
