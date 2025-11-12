//
//  APIService.swift
//  Netflix Clone
//
//  Created by MUNAVAR PM on 12/11/25.
//

import Foundation


enum AppConfig {
    static var baseURL: String {
        "https://api.themoviedb.org/3"
    }

    static var MiddleWare: String {
        "?api_key="
    }
    
    static var apiKey: String {
        "e6048af58380b54b9a2c852d213becd3"
    }
    
    static let imageBaseURL = "https://image.tmdb.org/t/p/w500"
}


enum EndPoints {
    // Movies
    static let popularMovie       = "/movie/popular"       // GET popular movies :contentReference[oaicite:1]{index=1}
    static let nowPlayingMovie    = "/movie/now_playing"    // GET movies currently in theatres :contentReference[oaicite:2]{index=2}
    static let topRatedMovie      = "/movie/top_rated"      // GET top rated movies :contentReference[oaicite:3]{index=3}
    static let upcomingMovie      = "/movie/upcoming"       // GET upcoming movies :contentReference[oaicite:4]{index=4}
    static let movieDetails       = "/movie/{movie_id}"     // GET details of a movie :contentReference[oaicite:5]{index=5}
    static let movieCredits       = "/movie/{movie_id}/credits" // GET cast/crew of a movie :contentReference[oaicite:6]{index=6}
    static let movieImages        = "/movie/{movie_id}/images"  // GET images for a movie :contentReference[oaicite:7]{index=7}

    // Search
    static let searchMovie        = "/search/movie"        // Search movies by keyword :contentReference[oaicite:8]{index=8}

    // Genres
    static let movieGenreList     = "/genre/movie/list"    // Get list of genres for movies :contentReference[oaicite:9]{index=9}

    // More endpoints exist (TV shows, people, collections, etc.)
}




