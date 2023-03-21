//
//  CharacterGender.swift
//  RickAndMortyApp
//
//  Created by kaan gokcek on 13.03.2023.
//

import Foundation

enum CharacterStatus: String, Codable{
  case alive = "Alive"
  case unknown = "unknown"
  case dead = "Dead"
  var text:String{
    switch self{
    case .alive,.dead:
      return rawValue
    case .unknown:
      return "Unknown"
    }
  }
}

enum CharacterGender: String, Codable{
  case male = "Male"
  case female = "Female"
  case unknown = "unknown"
  case genderless = "Genderless"
  var text:String{
    switch self {
    case .male,.female,.genderless:
      return rawValue
    case .unknown:
      return "Unknown"
    }
  }
}
