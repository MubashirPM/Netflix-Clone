//
//  TvSeriesModel.swift
//  Netflix Clone
//
//  Created by MUNAVAR PM on 22/11/25.
//

import Foundation

struct tvSeriesResponseModel : Codable {
    
    let page : Int
    let results : [tvSeriesModel]
    let total_pages: Int
    let total_results : Int
}
struct tvSeriesModel : Codable {
    let id : Int
    let adult : Bool
    let backdrop_path : String?
    let name : String?
    let  poster_path : String?
}
