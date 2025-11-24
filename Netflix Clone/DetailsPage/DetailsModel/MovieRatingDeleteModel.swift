//
//  MovieRatingDeleteModel.swift
//  Netflix Clone
//
//  Created by MUNAVAR PM on 21/11/25.
//

import Foundation

struct DeleteRatingResponse : Codable {
    let success : Bool
    let status_code : Int
    let status_message : String
}
