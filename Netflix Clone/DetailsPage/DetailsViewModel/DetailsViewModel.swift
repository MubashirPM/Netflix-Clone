//
//  DetailsViewModel.swift
//  Netflix Clone
//
//  Created by MUNAVAR PM on 19/11/25.
//
import Foundation
import SwiftUI
import Combine

class DetailsViewModel : ObservableObject {
    @Published var movieDetails : MovieDetailResponse?
    
    func fetchDetailPage(id : Int) async {
        guard let url = URL(
            string: "\(AppConfig.baseURL)\("/movie/")\(id)\(AppConfig.MiddleWare)\(AppConfig.apiKey)"
        )
        else {
            return
        }
        print(url)
        
        do {
            let (data,_) = try await URLSession.shared.data(from: url)
            let decode = try JSONDecoder().decode(
                MovieDetailResponse.self,
                from: data
            )
            self.movieDetails = decode
            debugPrint("✅Details Sucess")
        } catch {
            debugPrint("❌Fail to get the Details movies",error)
        }
    }
    
    
    func addReview(rating : Int,id : Int) async {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)/rating\(AppConfig.MiddleWare)\(AppConfig.apiKey)") else {
            return
        }
        print(url)
        
        let newRating = RatingBody(value: rating)
        
        let json = try? JSONEncoder().encode(newRating)
        
        var req = URLRequest(url: url)
        req.httpBody = json
        req.httpMethod = "POST"
        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        req
            .setValue(
                "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlNjA0OGFmNTgzODBiNTRiOWEyYzg1MmQyMTNiZWNkMyIsIm5iZiI6MTc2Mjg4MjM5NC44MDcwMDAyLCJzdWIiOiI2OTEzNzM1YWQwNDUwZmEzMDYzYTM4NzEiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.-4rCK3TnABjGorADOsfK6R9JwpSusk_X4HR9TJEoJMw",
                forHTTPHeaderField: "Authorization"
            )
      
        
        do {
            let (data,_) = try await URLSession.shared.data(
                for: req
            ) // Req Senting
            
            
            let decode = try JSONDecoder().decode(
                ResponseBody.self,
                from: data
            ) // decoding the response
            debugPrint(decode)
        } catch {
            debugPrint(error)
        }
    }
    
    func deleteMovieRating(movieId : Int) async {
        guard let url = URL(string: "\(AppConfig.baseURL)/movie/\(movieId)/rating\(AppConfig.MiddleWare)\(AppConfig.apiKey)") else {
            return
        }
        print(url)
        var req = URLRequest(url: url)
        req.httpMethod = "DELETE"
        req.allHTTPHeaderFields = [
            "accept": "application/json",
            "Content-Type": "application/json;charset=utf-8",
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlNjA0OGFmNTgzODBiNTRiOWEyYzg1MmQyMTNiZWNkMyIsIm5iZiI6MTc2Mjg4MjM5NC44MDcwMDAyLCJzdWIiOiI2OTEzNzM1YWQwNDUwZmEzMDYzYTM4NzEiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.-4rCK3TnABjGorADOsfK6R9JwpSusk_X4HR9TJEoJMw"
          ]
        do{
            let (data,_) = try await URLSession.shared.data(for: req)
            
            let decoded = try JSONDecoder().decode(DeleteRatingResponse.self, from: data)
            debugPrint(decoded)
        } catch {
            debugPrint("Fail to Delete Data",error)
        }
    }

    
}

