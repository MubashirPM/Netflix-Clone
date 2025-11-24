//
//  MovieRatingModel .swift
//  Netflix Clone
//
//  Created by MUNAVAR PM on 19/11/25.
//

import Foundation

struct MovieRatingResponse : Codable {
    let page : Int
    let results : [MovieRatingBody]
}

struct MovieRatingBody : Identifiable,Codable {
    let id : Int
    let rating : Int
}
