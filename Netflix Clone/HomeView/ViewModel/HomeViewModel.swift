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
    
    func fetchPopularMovie() async {
        guard let url = URL(string: "\(AppConfig.baseURL)\(EndPoints.popularMovie)\(AppConfig.MiddleWare)\(AppConfig.apiKey)") else { return }
        do {
            let (data, _) = try await URLSession.shared.data(from: url) // hit in  the url to the Browser
            let decode = try JSONDecoder().decode(PopularMoviesResponse.self, from: data) // get data change to the model for showing data
            await MainActor.run {
                self.popularMovies = decode.results // here we pass the data to the UI
                debugPrint("✅ Data fetched sucessfully \(decode.results)")
            }
        } catch {
           debugPrint("❌ Fail to get the popular movie \(error)")
        }
    }
}

