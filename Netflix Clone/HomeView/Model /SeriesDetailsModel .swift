//
//  SeriesDetailsModel .swift
//  Netflix Clone
//
//  Created by MUNAVAR PM on 22/11/25.
//

import Foundation
struct seriesDetailResponse : Codable {
    let adult : Bool?
    let backdrop_path : String?
    let poster_path : String?
    let name : String
    let overview : String
    let genres : [genresModel]
    let popularity : Double
    let id : Int
}
struct genresModel : Codable {
    let id : Int
    let name : String
}
