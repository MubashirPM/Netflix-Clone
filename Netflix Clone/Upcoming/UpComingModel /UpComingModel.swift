//
//  UpComingModel.swift
//  Netflix Clone
//
//  Created by MUNAVAR PM on 14/11/25.
//


import Foundation

// MARK: - UpcomingMoviesResponse
struct UpcomingMoviesResponse: Codable {
    let dates: UpcomingMovieDates
    let page: Int
    let results: [UpcomingMovieResult]
    let totalPages: Int
    let totalResults: Int

    enum CodingKeys: String, CodingKey {
        case dates, page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - UpcomingMovieDates
struct UpcomingMovieDates: Codable {
    let maximum: String
    let minimum: String
}

// MARK: - UpcomingMovieResult
struct UpcomingMovieResult: Codable, Identifiable {
    let adult: Bool
    let backdropPath: String
    let genreIDS: [Int]
    let id: Int
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String
    let releaseDate: String
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
