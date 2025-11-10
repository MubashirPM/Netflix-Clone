//
//  HomeView.swift
//  Netflix Clone
//
//  Created by MUNAVAR PM on 08/11/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 0) {
                            Image("HomePageIm")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 424, height: 415)
                                .clipped()
                            
                            Spacer() 
                        }
                        .frame(maxWidth: .infinity, alignment: .top)
                    
                    HomeActionButtons()
                        .padding(.horizontal,40)
                    HomeScrollView(header: "Preview")
                    HomeScrollRectangleView(header:"Popular on Netflix")
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
    }
}

#Preview {
    HomeView()
}
