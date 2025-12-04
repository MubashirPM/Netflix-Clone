//
//  DetailsPage.swift
//  Netflix Clone
//
//  Created by MUNAVAR PM on 12/11/25.
//
import SwiftUI
import SDWebImageSwiftUI

struct MovieDetailView: View {
    @StateObject var viewModel = DetailsViewModel()
    @StateObject var RatingData = HomeViewModel()
    
    @State var showSheet = false
    @State private var selectedRating = 1

    
    let movieId : Int
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 16) {
                    WebImage(
                        url: URL(
                            string: AppConfig
                                .imageBaseURL + (
                                    viewModel.movieDetails?.posterPath ?? ""
                                )
                        )
                    )
                    .resizable()
                    .indicator(.activity)
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
                    
                    HStack {
                        Text(viewModel.movieDetails?.title ?? "")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        if viewModel.movieDetails?.adult ?? false {
                            Text("🔞")
                                .font(.largeTitle)
                                .padding(.bottom, 20)
                        }
                        
                    }
                    .padding(.leading,16)
                
                
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
                    
                    // Rating with star and text
                    HStack(spacing: 4) {
                        Image(systemName: "star.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 16, height: 16)
                            .foregroundColor(.yellow)
                        
                        Text("\(viewModel.movieDetails?.voteAverage ?? 0, specifier: "%.1f")/10")
                            .foregroundColor(.white)
                            .font(.subheadline)
                        HStack {
                            if let rated =  RatingData.userRatedMovies.first(where: { $0.id == viewModel.movieDetails?.id}){
                                    Text("Your Logged this Movie \(rated.rating)")
                                .foregroundStyle(.gray)
                                Button {
                                    Task{
                                        await viewModel.deleteMovieRating(movieId: movieId)
                                        await RatingData.fetchUserRatedMovies()
                                    }
                                } label: {
                                    Image(systemName: "trash")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 20)
                                }

                            }else{
                                Button {
                                    showSheet = true
                                } label: {
                                    Text("Add Review")
                                        .font(.caption)
                                        .underline()
                                        .foregroundStyle(.red)
                                }
                                .sheet(isPresented: $showSheet) {
                                    VStack(spacing: 20) {
                                        Text("Give Review")
                                            .font(.title2)
                                            .bold()
                                        
                                        Picker("Rating", selection: $selectedRating) {
                                            ForEach(1..<6) { num in
                                                Text("\(num)")
                                                    .tag(num)
                                            }
                                        }
                                        .pickerStyle(.wheel)
                                        .frame(height: 150)
                                        
                                        Text("Select Rating \(selectedRating)")
                                            .font(.headline)
                                        
                                        Button("Submit")  {
                                            Task {
                                                await viewModel.addReview(rating: selectedRating, id: movieId)
                                                await RatingData.fetchUserRatedMovies()
                                                showSheet = false
                                            }
                                        }
                                        Button("Close"){
                                            showSheet = false
                                        }
                                        .padding(.top)
                                    }
                                    .padding()
                                }
                                
                            }
                        }
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
                .padding(.leading,16)
            }
            .background(Color.black)
            .task {
                await viewModel.fetchDetailPage(id: movieId)
                await RatingData.fetchUserRatedMovies()
            }
        }
        .padding(.top,0)
        .ignoresSafeArea()
    }
}
