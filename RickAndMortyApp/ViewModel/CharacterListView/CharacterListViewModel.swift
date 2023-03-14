//
//  CharacterListViewModel.swift
//  RickAndMortyApp
//
//  Created by kaan gokcek on 10.03.2023.
//

import Foundation

class CharacterListViewModel {
  func getList() {
    ApiService.shared.execute(.characterListRequest, expecting: CharacterListResponse.self){ result in
      switch result{
      case .success(let character):
        print(String(describing: character))
      case .failure(let error):
        print(String(describing: error))
      }
    }
  }
}
