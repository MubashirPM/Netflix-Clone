//
//  UpComingViewModel.swift
//  Netflix Clone
//
//  Created by MUNAVAR PM on 15/11/25.
//

import Foundation
import Combine

class UpComingViewModel: ObservableObject {
    @Published var UpComing : [UpcomingMovieResult] = []
    
    func fetchUpCominigPage() async {
        guard let url = URL(string: "\(AppConfig.baseURL)\(EndPoints.upcomingMovie)\(AppConfig.MiddleWare)\(AppConfig.apiKey)") else {return}
        
        do {
            let (data,_) = try await URLSession.shared.data(from: url)
            let decode = try JSONDecoder().decode(UpcomingMoviesResponse.self, from: data)
            await MainActor.run {
                self.UpComing = decode.results
                debugPrint("✅UpComingMovies Sucess")
            }
        } catch {
            debugPrint("fail to get the UpComingMovies")
        }
    }
}
