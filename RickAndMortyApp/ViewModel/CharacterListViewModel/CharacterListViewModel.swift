//
//  CharacterListViewModel.swift
//  RickAndMortyApp
//
//  Created by kaan gokcek on 10.03.2023.
//

import Foundation
import RxSwift

class CharacterListViewModel {
  var characterList = PublishSubject<[CharacterModel]>()
  var characters = [CharacterModel]()
  var pageUrl: String?
  let characterListUseCase = CharacterListUseCase()
  init(){
    getList()
  }
  
  func getList() {
    characterListUseCase.getCharacterList { result in
      switch result {
      case .success(let character):
        self.characters.append(contentsOf: character.results)
        self.pageUrl = character.info.next
        self.characterList.onNext(self.characters)
      case .failure(let error):
        print(error)
      }
    }
  }
  func getMore(){
    guard let pageNumber = pageUrl?.components(separatedBy:"=") else {return}
    characterListUseCase.getMoreCharacter(pageUrl:String(describing: pageNumber[1])) { result in
      switch result {
      case .success(let character):
        self.characters.append(contentsOf: character.results)
        self.pageUrl = character.info.next
        self.characterList.onNext(self.characters)
      case .failure(let error):
        print(error)
      }
    }
  }
}

protocol CharacterListUseCaseType {
  func getCharacterList(completion: @escaping (Result<CharacterListResponse,Error>) -> Void )
  func getMoreCharacter(pageUrl:String, completion: @escaping (Result<CharacterListResponse,Error>) -> Void )
}

struct CharacterListUseCase: CharacterListUseCaseType {

  func getCharacterList(completion: @escaping (Result<CharacterListResponse,Error>) -> Void ) {
    ApiService.shared.execute(.characterListRequest,
                              expecting: CharacterListResponse.self){ result in
      switch result{
      case .success(let character):
        completion(.success(character))
      case .failure(let error):
        completion(.failure(error))
      }
    }
  }
  func getMoreCharacter(pageUrl:String, completion: @escaping (Result<CharacterListResponse,Error>) -> Void ){
    let request = ApiRequest(endpoint: .character,
                             queryParameters: [
                             URLQueryItem(name: "page", value: pageUrl)
                             ])
    ApiService.shared.execute(request, expecting: CharacterListResponse.self) { result in
      switch result{
      case .success(let character):
        completion(.success(character))
      case .failure(let error):
        completion(.failure(error))
      }
    }
  }
}


