//
//  DetailsPage.swift
//  Netflix Clone
//
//  Created by MUNAVAR PM on 12/11/25.
//
import SwiftUI

struct MovieDetailView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 16) {
                
                ZStack(alignment: .bottomLeading) {
                    Image("HomePageIm")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 300)
                        .clipped()
                       
                
                    
                    Text("Extraction 2")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .padding(.bottom, 20)
                }
                
                VStack(alignment: .leading, spacing: 6) {
                    Text("Action • Thriller • 2023")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                    
                    Text("Tyler Rake returns for another dangerous mission. Full of high-octane action and stunning visuals.")
                        .foregroundColor(.white)
                        .font(.body)
                        .lineLimit(nil)
                }
                .padding(.horizontal)
                
                HStack(spacing: 15) {
                    Button(action: {}) {
                        HStack {
                            Image(systemName: "play.fill")
                            Text("Play")
                                .fontWeight(.bold)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 10)
                
                
                Text("More Like This")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .padding(.top, 20)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(1..<6) { index in
                            Image("TrendingIM")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 120, height: 180)
                                .cornerRadius(10)
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
        
        .background(Color.black.ignoresSafeArea())
        .navigationTitle("Details Page")
        .navigationBarTitleDisplayMode(.inline)
        .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    MovieDetailView()
}
