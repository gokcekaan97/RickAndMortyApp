//
//  CharacterListViewBuilder.swift
//  RickAndMortyApp
//
//  Created by kaan gokcek on 10.03.2023.
//

import Foundation
import UIKit
class CharacterListViewBuilder {
  func build() -> UIViewController? {
    let characterListViewStoryboard = UIStoryboard(name: "CharacterListViewStoryboard", bundle: nil)
    let characterListViewController = characterListViewStoryboard.instantiateViewController(withIdentifier: "CharacterListViewStoryboard") as! CharacterListViewController
    characterListViewController.viewModel = CharacterListViewModel()
    return characterListViewController
  }
}

