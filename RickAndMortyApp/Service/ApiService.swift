//
//  ApiService.swift
//  RickAndMortyApp
//
//  Created by kaan gokcek on 13.03.2023.
//

import Foundation

final class ApiService {
  static let shared = ApiService()
  private init() {
    
  }
  public func execute(_ request: ApiRequest, completion: @escaping () -> Void ){
    
  }
}
