//
//  LocationModel.swift
//  RickAndMortyApp
//
//  Created by kaan gokcek on 13.03.2023.
//

import Foundation

struct LocationModel: Codable{
  let id:Int
  let name:String
  let type:String
  let dimension:String
  let residents:[String]
  let url:String
  let created:String
}
