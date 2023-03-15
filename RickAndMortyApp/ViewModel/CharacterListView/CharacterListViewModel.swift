//
//  CharacterListViewModel.swift
//  RickAndMortyApp
//
//  Created by kaan gokcek on 10.03.2023.
//

import Foundation

class CharacterListViewModel {
  var characterList: [CharacterModel]?
  let characterListUseCase = CharacterListUseCase()
  init(){
    getList()
  }
  
  func getList() {
    characterListUseCase.getCharacterList { result in
      switch result {
      case .success(let character):
        self.characterList = character.results
      case .failure(let error):
        print(error)
      }
    }
  }
}


protocol CharacterListUseCaseType {
  func getCharacterList(completion: @escaping (Result<CharacterListResponse,Error>) -> Void )
}

struct CharacterListUseCase: CharacterListUseCaseType {

  func getCharacterList(completion: @escaping (Result<CharacterListResponse,Error>) -> Void ) {
    ApiService.shared.execute(.characterListRequest, expecting: CharacterListResponse.self){ result in
      switch result{
      case .success(let character):
        completion(.success(character))
      case .failure(let error):
        completion(.failure(error))
      }
    }
  }
}


