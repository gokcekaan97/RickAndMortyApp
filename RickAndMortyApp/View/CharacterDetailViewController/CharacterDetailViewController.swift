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
  let scrollView: UIScrollView = {
    let view = UIScrollView()
    view.showsVerticalScrollIndicator = true
    view.isDirectionalLockEnabled = true
    view.showsHorizontalScrollIndicator = false
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  let contentView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemYellow
    navigationController?.navigationBar.prefersLargeTitles = true
    setUpView()
    setUpViewItems()
  }
  private func setUpView(){
    view.addSubview(scrollView)
    NSLayoutConstraint.activate([
      scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
      scrollView.leftAnchor.constraint(equalTo: view.leftAnchor)
    ])
    scrollView.addSubview(characterDetailView)
    NSLayoutConstraint.activate([
      characterDetailView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
      characterDetailView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
      characterDetailView.rightAnchor.constraint(equalTo: scrollView.contentLayoutGuide.rightAnchor),
      characterDetailView.leftAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leftAnchor),
      characterDetailView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
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
