//
//  PostModel.swift
//  Netflix Clone
//
//  Created by MUNAVAR PM on 17/11/25.
//


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let postModel = try? JSONDecoder().decode(PostModel.self, from: jsonData)

import Foundation

// MARK: - PostModel
struct RatingBody : Codable {
    let value : Int
}
struct ResponseBody: Codable {
    let status_code : Int
    let status_message : String
}
