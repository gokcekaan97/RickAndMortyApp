//
//  
//  RickAndMortyApp
//
//  Created by kaan gokcek on 10.03.2023.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift
import Kingfisher

final class CharacterListViewController: UIViewController{
  
  public var viewModel: CharacterListViewModel!
  let disposeBag = DisposeBag()
  lazy var characterListView = CharacterListView()
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemGreen
    navigationController?.navigationBar.prefersLargeTitles = true
    title = "Characters"
    setUpView()
    setCollectionViewCell()
    characterListView.characterCollectionView.reloadData()
  }

  private func setUpView(){
    view.addSubview(characterListView)
    NSLayoutConstraint.activate([
      characterListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      characterListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
      characterListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      characterListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor)
    ])
  }
  private func setCollectionViewCell(){
    characterListView.characterCollectionView.rx.setDelegate(self).disposed(by: disposeBag)
    viewModel.characterList.bind(
      to: characterListView.characterCollectionView.rx.items(
        cellIdentifier: CharacterListViewCell.cellIdentifier,cellType: CharacterListViewCell.self))
    { (indexPath,model,cell ) in
      let imageUrl = URL(string: model.image)
      cell.imageView.kf.setImage(with: imageUrl)
      cell.nameLabel.text = model.name
      cell.statusLabel.text = model.status.rawValue
    }.disposed(by: disposeBag)
    
  }
}

extension CharacterListViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = (UIScreen.main.bounds.width - 30) / 2
    return CGSize(width: width,
                  height: (width * 1.5))
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 20
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterListViewCell.cellIdentifier, for: indexPath) as? CharacterListViewCell else {fatalError("cell not found")}
    return cell
  }


}


