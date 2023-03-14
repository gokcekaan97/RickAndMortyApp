//
//  Character.swift
//  RickAndMortyApp
//
//  Created by kaan gokcek on 13.03.2023.
//

import Foundation

struct CharacterModel: Codable{
  let id: Int
  let name: String
  let status: CharacterStatus
  let species: String
  let type: String
  let gender: CharacterGender
  let origin: CharacterOriginModel
  let location: CharacterLocationModel
  let image: String
  let episode: [String]
  let url: String
  let created: String    
}
