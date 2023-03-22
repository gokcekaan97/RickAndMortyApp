//
//  CharacterDetailView.swift
//  RickAndMortyApp
//
//  Created by kaan gokcek on 10.03.2023.
//

import Foundation
import RxSwift
import RxRelay

class CharacterDetailViewModel {
  var character: CharacterModel?
  var name = BehaviorRelay<String>(value: "")
  var status = BehaviorSubject<String>(value: "")
  var species = BehaviorSubject<String>(value: "")
  var type = BehaviorSubject<String>(value: "")
  var gender = BehaviorSubject<String>(value: "")
  var origin = BehaviorSubject<String>(value: "")
  var location = BehaviorSubject<String>(value: "")
  var image = BehaviorRelay<String>(value: "")
  var episode = BehaviorSubject<[String]>(value: [""])
  init(character:CharacterModel){
    self.character = character
    self.name.accept(character.name)
    self.status.onNext(character.status.text)
    self.species.onNext(character.species)
    self.type.onNext(character.type)
    self.gender.onNext(character.gender.text)
    self.origin.onNext(character.origin.name)
    self.location.onNext(character.location.name)
    self.image.accept(character.image)
    self.episode.onNext(character.episode)
  }
}
