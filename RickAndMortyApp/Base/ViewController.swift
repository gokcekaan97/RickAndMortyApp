//
//  ViewController.swift
//  RickAndMortyApp
//
//  Created by kaan gokcek on 8.03.2023.
//

import UIKit

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  @IBAction func GoToCharacters(_ sender: Any) {
    guard let myNavigation = self.navigationController else { return }
    let characterCoordinator = CharacterListViewCoordinator(router: myNavigation)
    characterCoordinator.pushCoordinator(animated: true, completion: nil)
  }
  @IBAction func GoToLocation(_ sender: Any) {
  }
  @IBAction func GoToEpisodes(_ sender: Any) {
  }
}

