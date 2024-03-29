//
//  CharacterListView.swift
//  RickAndMortyApp
//
//  Created by kaan gokcek on 16.03.2023.
//

import UIKit

final class CharacterListView: UIView {

  private let loadIcon: UIActivityIndicatorView = {
    let loadIcon = UIActivityIndicatorView(style: .large)
    loadIcon.hidesWhenStopped = true
    loadIcon.translatesAutoresizingMaskIntoConstraints = false
    return loadIcon
  }()
  lazy var characterCollectionView: UICollectionView = {
    let collectionLayout = UICollectionViewFlowLayout()
    collectionLayout.scrollDirection = .vertical
    collectionLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.isHidden = true
    collectionView.register(CharacterListViewCell.self,
                            forCellWithReuseIdentifier: CharacterListViewCell.cellIdentifier)
    return collectionView
  }()
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .systemBlue
    translatesAutoresizingMaskIntoConstraints = false
    addSubview(characterCollectionView)
    addSubview(loadIcon)
    AddConstrains()
    loadIcon.startAnimating()
    SetUpCollectionView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  private func AddConstrains(){
    NSLayoutConstraint.activate([
      loadIcon.widthAnchor.constraint(equalToConstant: 100),
      loadIcon.heightAnchor.constraint(equalToConstant: 100),
      loadIcon.centerXAnchor.constraint(equalTo: centerXAnchor),
      loadIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
      characterCollectionView.topAnchor.constraint(equalTo: topAnchor),
      characterCollectionView.rightAnchor.constraint(equalTo: rightAnchor),
      characterCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
      characterCollectionView.leftAnchor.constraint(equalTo: leftAnchor)
    ])
  }
  private func SetUpCollectionView(){
    DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
      self.loadIcon.stopAnimating()
      self.characterCollectionView.isHidden = false
    })
  }

}


