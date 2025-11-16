//
//  SearchViewModel.swift
//  Netflix Clone
//
//  Created by MUNAVAR PM on 16/11/25.
//

import Foundation
import Combine

class SearchViewModel : ObservableObject {
    @Published var searchData : [SearchResult] = []
    
    func searchMovie(query : String) async {
        debugPrint(query)
        guard !query.isEmpty else {return}
        let query = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        guard let url = URL(string:
            "\(AppConfig.baseURL)\(EndPoints.searchMovie)?query=\(query)&api_key=\(AppConfig.apiKey)"
        ) else { return }
        debugPrint(url)
        
        do {
            let (data,_) = try await URLSession.shared.data(from: url)
            let decode = try JSONDecoder().decode(SearchResultModel.self, from: data)
            await MainActor.run {
                self.searchData = decode.results
                debugPrint(decode.results)
            }
        } catch {
            debugPrint(error)
        }
    }
}
