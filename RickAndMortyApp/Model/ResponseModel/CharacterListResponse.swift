//
//  CharacterListResponse.swift
//  RickAndMortyApp
//
//  Created by kaan gokcek on 14.03.2023.
//

import Foundation

struct CharacterListResponse: Codable{
  let info: Info
  let results: [CharacterModel]
}
struct Info:Codable{
  let count: Int
  let pages: Int
  let next: String?
  let prev: String?
}
