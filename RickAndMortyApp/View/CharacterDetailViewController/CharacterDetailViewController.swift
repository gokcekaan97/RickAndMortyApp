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
  let disposeBag = DisposeBag()
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
    title = viewModel.name.value
    setUpView()
    bindView()
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
  private func bindView(){
    viewModel.name.bind(to: characterDetailView.nameLabel.rx.text).disposed(by: disposeBag)
    viewModel.status.bind(to: characterDetailView.statusLabel.rx.text).disposed(by: disposeBag)
    viewModel.location.bind(to: characterDetailView.locationLabel.rx.text).disposed(by: disposeBag)
    viewModel.origin.bind(to: characterDetailView.originLabel.rx.text).disposed(by: disposeBag)
    viewModel.gender.bind(to: characterDetailView.genderLabel.rx.text).disposed(by: disposeBag)
    viewModel.species.bind(to: characterDetailView.speciesLabel.rx.text).disposed(by: disposeBag)
    characterDetailView.imageView.kf.setImage(with: URL(string: viewModel.image.value))
    viewModel.episode.subscribe { episodeList in
      self.characterDetailView.episodeLabel.text = ""
      for episode in episodeList{
        self.characterDetailView.episodeLabel.text += episode + "\n"
      }
    }.disposed(by: disposeBag)
  }
}
