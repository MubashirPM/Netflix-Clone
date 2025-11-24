//
//  HomeViewModel.swift
//  Netflix Clone
//
//  Created by MUNAVAR PM on 13/11/25.
//

import Foundation
import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    @Published var popularMovies: [PopularMovie] = []
    @Published var topRatedMovies: [TopRatedMovie] = []
    @Published var nowPlayingMovies: [Result] = []
    @Published var TrendingNow : [Trending] = []
    @Published var userRatedMovies : [MovieRatingBody] = []
    @Published var tvSeries : [tvSeriesModel] = []
    @Published var seriesDetails : seriesDetailResponse?
    
    
    func fetchPopularMovie() async {
        guard let url = URL(string: "\(AppConfig.baseURL)\(EndPoints.popularMovie)\(AppConfig.MiddleWare)\(AppConfig.apiKey)") else {
            return
        }
        debugPrint(url)
        do {
            let (data, _) = try await URLSession.shared.data(
                from: url
            ) // hit in  the url to the Browser
            debugPrint(data)
            let decode = try JSONDecoder().decode(
                PopularMoviesResponse.self,
                from: data
            ) // get data change to the model for showing data
            await MainActor.run {
                self.popularMovies = decode.results // here we pass the data to the UI
                debugPrint("✅ Data fetched sucessfully")
            }
        } catch {
            debugPrint("❌ Fail to get the popular movie \(error)")
        }
    }
    
    func fetchTopRatedMovie() async {
        guard let url = URL(string: "\(AppConfig.baseURL)\(EndPoints.topRatedMovie)\(AppConfig.MiddleWare)\(AppConfig.apiKey)") else {
            return
        }
        
        do {
            let (data,_) = try await URLSession.shared.data(from: url)
            let decode = try JSONDecoder().decode(
                TopRatedMoviesResponse.self,
                from: data
            )
            await MainActor.run {
                self.topRatedMovies = decode.results
                debugPrint("✅TopRatedMovie Sucess")
            }
            
        } catch {
            debugPrint("❌Fail to get the toprated movies")
        }
    }
    
    func fetchNowPlayingMovie() async {
        guard let url = URL(string: "\(AppConfig.baseURL)\(EndPoints.nowPlayingMovie)\(AppConfig.MiddleWare)\(AppConfig.apiKey)") else {
            return
        }
        
        do {
            let (data,_) = try await URLSession.shared.data(from: url)
            let decode = try JSONDecoder().decode(Welcome.self, from: data)
            await MainActor.run {
                self.nowPlayingMovies = decode.results
                debugPrint("✅NowPlayingMovie Sucess")
            }
        } catch {
            debugPrint("❌Fail to get the NowPlaying movies")
        }
    }
    
    func fetchtrendIngNow() async {
        guard let url = URL(string: "\(AppConfig.baseURL)\(EndPoints.TrendingNow)\(AppConfig.MiddleWare)\(AppConfig.apiKey)") else {
            return
        }
        do {
            let (data,_ ) = try await URLSession.shared.data(from: url)
            let decode = try JSONDecoder().decode(
                TrendingAllDay.self,
                from: data
            )
            await MainActor.run {
                self.TrendingNow = decode.results
            }
        } catch {
            debugPrint(error)
        }
    }
    
    func fetchUserRatedMovies() async {
        guard let  url = URL(string: "\(AppConfig.baseURL)/account/22461844/rated/movies\(AppConfig.MiddleWare)\(AppConfig.apiKey)") else {return}
        debugPrint(url)
        var req = URLRequest(url: url)
        req.setValue("Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlNjA0OGFmNTgzODBiNTRiOWEyYzg1MmQyMTNiZWNkMyIsIm5iZiI6MTc2Mjg4MjM5NC44MDcwMDAyLCJzdWIiOiI2OTEzNzM1YWQwNDUwZmEzMDYzYTM4NzEiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.-4rCK3TnABjGorADOsfK6R9JwpSusk_X4HR9TJEoJMw", forHTTPHeaderField: "Authorization")
        do {
            let (data,_) = try await URLSession.shared.data(for:req)
            debugPrint(data)
            
            let decode = try JSONDecoder().decode(MovieRatingResponse.self, from: data)
//            debugPrint(decode.results)
            
//            userRatedMovies = decode.results

            await MainActor.run {
                self.userRatedMovies = decode.results
                debugPrint(userRatedMovies)
                
            }
        } catch {
           debugPrint("fail to get userRated Movies ",error)
        }
    }
    func fetchTvSeries() async {
        guard let url = URL(string: "\(AppConfig.baseURL)/tv/top_rated\(AppConfig.MiddleWare)\(AppConfig.apiKey)") else {
            return
        }
        do {
            let (data,_) = try await URLSession.shared.data(from: url) // sent data
            
            let decode = try JSONDecoder().decode(tvSeriesResponseModel.self, from: data) // decode the coming data
            
            self.tvSeries = decode.results
        } catch {
            debugPrint("Fail to get Tv Seires",error)
        }
    }
    
    func fetchSeriesDetails(id : Int) async {
        guard let url = URL(string: "\(AppConfig.baseURL)/tv/\(id)\(AppConfig.MiddleWare)\(AppConfig.apiKey)") else {
            return
        }
        debugPrint(url)
        do {
            let (data,_) = try await URLSession.shared.data(from: url)
            debugPrint(try JSONSerialization.jsonObject(with: data))
            
            let decode = try JSONDecoder().decode(seriesDetailResponse.self, from: data)
              await MainActor.run {
                self.seriesDetails = decode
            }
            debugPrint("Decode successfully..",decode)
        } catch {
            debugPrint("Series Not Get",error)
        }
    }
}
    
