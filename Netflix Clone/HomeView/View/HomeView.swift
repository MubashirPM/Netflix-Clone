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
                        let trendingMovie: [AutoScrollMovie] = viewModel.TrendingNow
                            .prefix(3)
                            .map { movie in
                                AutoScrollMovie(
                                    id: movie.id, image: movie.backdropPath,
                                    title: movie.title ?? "Untitled"
                                )
                            }
                        AutoScrollImageView(movies: trendingMovie)
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
                                                    .popularMovies[popularmovies].posterPath
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
                                    viewModel.topRatedMovies.indices,
                                    id: \.self
                                ) { index in
                                    NavigationLink(
                                        destination: MovieDetailView(movieId: viewModel
                                                .topRatedMovies[index].id
                                        )
                                    ) {
                                        HomeScrollRectangleView(
                                            imageURL: viewModel
                                                .topRatedMovies[index].posterPath
                                        )
                                    }
                                }
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
                                    viewModel.nowPlayingMovies.indices,
                                    id: \.self
                                ) { index in
                                    NavigationLink(
                                        destination: MovieDetailView(movieId: viewModel
                                                .nowPlayingMovies[index].id
                                        )
                                    ) {
                                        HomeScrollRectangleView(
                                            imageURL: viewModel
                                                .nowPlayingMovies[index].posterPath
                                        )
                                    }
                                }
                            }

                        }
                        Text("TopRated Series ")
                            .foregroundColor(.white)
                            .bold()
                            .font(.title)
                            .padding(.leading,16)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                ForEach(
                                    viewModel.tvSeries.indices,
                                    id: \.self
                                ) { index in
                                    NavigationLink(destination: SeriesDetailView(seriesId: viewModel.tvSeries[index].id)
) {
                                        HomeScrollRectangleView(
                                            imageURL: viewModel.tvSeries[index].poster_path ?? ""
                                        )
                                    }
                                }
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
            await viewModel.fetchtrendIngNow()
            await viewModel.fetchUserRatedMovies()
            await viewModel.fetchTvSeries()
        }
    }
}

#Preview {
    HomeView()
}
