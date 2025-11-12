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
                        Image("HomePageIm")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 424, height: 415)
                            .clipped()
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
                                    HomeScrollView(
                                        imageURL: viewModel
                                            .popularMovies[popularmovies].backdropPath
                                    )
                                }
                            }
                            
                        }
                        .padding(.leading,16)
                        
                        Text("TopRated Movies")
                            .foregroundColor(.white)
                            .bold()
                            .font(.title)
                            .padding(.leading,16)
                        HomeScrollRectangleView(header:"Popular on Netflix")
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
        }
    }
}

#Preview {
    HomeView()
}
