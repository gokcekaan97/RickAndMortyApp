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
      cell.statusLabel.text = "Status: \(model.status.text)"
    }.disposed(by: disposeBag)
  }
  private func callMoreCell(indexPath:IndexPath){
    if indexPath.row == viewModel.characters.endIndex - 2{
      viewModel.getMore()
    }
  }
}

extension CharacterListViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let characterId = viewModel.characters[indexPath.row].id
    guard let myNavigation = self.navigationController else { return }
    let characterDetailCoordinator = CharacterDetailViewCoordinator(router: myNavigation,character: viewModel.characters[indexPath.row])
    characterDetailCoordinator.pushCoordinator(animated: true, completion: nil)
  }
  
  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    callMoreCell(indexPath: indexPath)
  }
  
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


