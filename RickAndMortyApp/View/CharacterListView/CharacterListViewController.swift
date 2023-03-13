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
    let request = ApiRequest(
      endpoint: .character,
      queryParameters: [
        URLQueryItem(name: "name", value: "rick"),
        URLQueryItem(name: "status", value: "alive")
      ])
//    print(request.url)
  }
}
