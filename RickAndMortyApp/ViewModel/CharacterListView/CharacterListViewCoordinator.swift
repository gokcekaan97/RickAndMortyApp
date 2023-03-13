//
//  CharacterListViewCoordinator.swift
//  RickAndMortyApp
//
//  Created by kaan gokcek on 10.03.2023.
//

import Foundation
import UIKit

class CharacterListViewCoordinator {
  var router: UINavigationController!
  init(router: UINavigationController){
    self.router = router
  }
  public func pushCoordinator(animated: Bool,
                      completion: (() -> Void)?) {
    guard let builder = CharacterListViewBuilder().build() else { return }
      router.pushViewController(builder, animated: true)
  }
}
