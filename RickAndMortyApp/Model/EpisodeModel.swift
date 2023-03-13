//
//  EpisodeModel.swift
//  RickAndMortyApp
//
//  Created by kaan gokcek on 13.03.2023.
//

import Foundation

struct EpisodeModel:Codable{
  let id:String
  let name:String
  let airDate:String
  let episode:String
  let characters:[String]
  let url:String
  let created:String
  enum CodingKeys: String, CodingKey {
    case id
    case name
    case airDate = "air_date"
    case episode
    case characters
    case url
    case created
  }
}
