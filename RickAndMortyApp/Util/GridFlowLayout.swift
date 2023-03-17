//
//  GridFlowLayout.swift
//  RickAndMortyApp
//
//  Created by kaan gokcek on 17.03.2023.
//

import Foundation
import UIKit

class GridFlowLayout: UICollectionViewFlowLayout {
    
    // here you can define the height of each cell
    let itemHeight: CGFloat = 350
    
    override init() {
        super.init()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayout()
    }
    /**
     Sets up the layout for the collectionView. 1pt distance between each cell and 1pt distance between each row plus use a vertical layout
     */
    func setupLayout() {
        minimumInteritemSpacing = 4
        minimumLineSpacing = 10
        scrollDirection = .vertical
    }
    /// here we define the width of each cell, creating a 2 column layout. In case you would create 3 columns, change the number 2 to 3
    var itemWidth: CGFloat {
        return (UIScreen.main.bounds.width - 30) / 2
    }
    
    override var itemSize: CGSize {
        set {
          self.itemSize = CGSize(width: itemWidth, height: itemWidth * 1.5)
            
        }
        get {
            return CGSize(width: itemWidth, height: itemHeight)
        }
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        return collectionView!.contentOffset
    }
}
