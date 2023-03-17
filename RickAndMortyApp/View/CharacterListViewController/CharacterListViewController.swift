//
//  
//  RickAndMortyApp
//
//  Created by kaan gokcek on 10.03.2023.
//

import Foundation
import UIKit

final class CharacterListViewController: UIViewController{
  
  public var viewModel: CharacterListViewModel!
  private let layout = GridFlowLayout()
  lazy var characterListView = CharacterListView()
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemGreen
    navigationController?.navigationBar.prefersLargeTitles = true
    title = "Characters"
    view.addSubview(characterListView)
    characterListView.characterCollectionView.dataSource = self
    characterListView.characterCollectionView.delegate = self
    characterListView.characterCollectionView.collectionViewLayout = layout
    setUpView()
    DispatchQueue.main.async{
      self.characterListView.characterCollectionView.reloadData()
    }
  }

  private func setUpView(){
   
    NSLayoutConstraint.activate([
      characterListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      characterListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
      characterListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      characterListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor)
    ])
  }
}

extension CharacterListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
//  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//    let width = (collectionView.bounds.width-48)/2
//    return CGSize(width: width, height: width * 1.5)
//  }
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 20
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) else {return UICollectionViewCell()}
//    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? UICollectionViewCell else { return UICollectionViewCell() }
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath)
    cell.backgroundColor = .systemRed
    return cell
  }


}


