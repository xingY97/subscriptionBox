//
//  Section.swift
//  scrollViewCode
//
//  Created by X Y on 3/4/21.
//

import Foundation
import UIKit

protocol Section {
    var numberOfItems: Int { get }
    func layoutSection() -> NSCollectionLayoutSection?
    func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell
}
