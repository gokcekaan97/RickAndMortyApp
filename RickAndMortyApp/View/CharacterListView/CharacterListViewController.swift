//
//  CharacterListView.swift
//  RickAndMortyApp
//
//  Created by kaan gokcek on 10.03.2023.
//

import Foundation
import UIKit

class CharacterListViewController: UIViewController{
  public var viewModel: CharacterListViewModel!
  override func viewDidLoad() {
    navigationController?.navigationBar.prefersLargeTitles = true
    title = "Characters"
    
  }
}
