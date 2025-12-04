//
//  RatedSeries.swift
//  Netflix Clone
//
//  Created by MUNAVAR PM on 03/12/25.
//

struct RatingRequest : Codable {
    let value : Double
}
struct RatingResponse : Codable {
    let success : Bool
    let status_code : Int
    let status_message : String
}
