//
//  TitleSection.swift
//  scrollViewCode
//
//  Created by X Y on 3/4/21.
//

import Foundation
import UIKit

struct TitleSection: Section {
    
    // 1:
    let numberOfItems = 1
    let title: String
    // 2:
    init(title: String) {
        self.title = title
    }

    
    func layoutSection() -> NSCollectionLayoutSection? {
        // Step 1:
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        // Step 2:
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Step 3:
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(70))
        
        // Step 4:
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // Step 5:
        let section = NSCollectionLayoutSection(group: group)
        return section
    }

    
    //Step 6:
    func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: TitleCell.self), for: indexPath) as! TitleCell
        cell.set(title: title)
        return cell
    }
}
