//
//  CharacterDetailViewBuilder.swift
//  RickAndMortyApp
//
//  Created by kaan gokcek on 21.03.2023.
//

import Foundation
import UIKit
class CharacterDetailViewBuilder {
  func build(character:CharacterModel) -> UIViewController? {
    let characterDetailViewStoryboard = UIStoryboard(name: "CharacterDetailViewStoryboard", bundle: nil)
    let characterDetailViewController = characterDetailViewStoryboard.instantiateViewController(withIdentifier: "CharacterDetailViewStoryboard") as! CharacterDetailViewController
    characterDetailViewController.viewModel = CharacterDetailViewModel(character: character)
    return characterDetailViewController
  }
}
