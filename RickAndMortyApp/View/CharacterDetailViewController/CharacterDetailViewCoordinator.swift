//
//  CharacterDetailViewCoordinator.swift
//  RickAndMortyApp
//
//  Created by kaan gokcek on 21.03.2023.
//

import Foundation
import UIKit

class CharacterDetailViewCoordinator {
  var router: UINavigationController!
  var character: CharacterModel?
  init(router: UINavigationController,character:CharacterModel){
    self.character = character
    self.router = router
  }
  public func pushCoordinator(animated: Bool,
                      completion: (() -> Void)?) {
    guard let builder = CharacterDetailViewBuilder().build(character: character!) else { return }
      router.pushViewController(builder, animated: true)
  }
}
