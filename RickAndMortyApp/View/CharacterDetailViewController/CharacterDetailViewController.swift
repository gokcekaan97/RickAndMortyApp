//
//  CharacterDetailViewController.swift
//  RickAndMortyApp
//
//  Created by kaan gokcek on 21.03.2023.
//

import UIKit
import RxSwift
import Kingfisher

class CharacterDetailViewController: UIViewController {

  public var viewModel: CharacterDetailViewModel!
  public var characterDetailView = CharacterDetailView()
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemYellow
    navigationController?.navigationBar.prefersLargeTitles = true
    setUpView()
    setUpViewItems()
  }
  private func setUpView(){
    view.addSubview(characterDetailView)
    NSLayoutConstraint.activate([
//      characterDetailView.heightAnchor.constraint(equalToConstant: 1500),
      characterDetailView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      characterDetailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      characterDetailView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
      characterDetailView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor)
    ])
  }
  private func setUpViewItems(){
    guard let character = viewModel.character else {return}
    title = viewModel.character?.name
    let imageUrl = URL(string: character.image)
    characterDetailView.imageView.kf.setImage(with: imageUrl)
    characterDetailView.nameLabel.text = character.name
    characterDetailView.statusLabel.text = "Status: \(character.status.text)"
    characterDetailView.locationLabel.text = character.location.name
    characterDetailView.genderLabel.text = character.gender.text
    characterDetailView.speciesLabel.text = character.species
    characterDetailView.originLabel.text = character.origin.name
    characterDetailView.episodeLabel.text = ""
    for str in character.episode {
      characterDetailView.episodeLabel.text! += str + "\n"
    }
    
  }

}
