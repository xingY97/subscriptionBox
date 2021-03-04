//
//  FavoriteCell.swift
//  scrollViewCode
//
//  Created by X Y on 3/4/21.
//

import Foundation
import UIKit

class FavoritesCell: UICollectionViewCell {
    static var identifier: String = "FavoritesCell"
    @IBOutlet weak var imgView: UIImageView!

    @IBOutlet weak var title: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func setup(){
        //imgView.layer.cornerRadius = 10
        //title.text = "hello"
    }
    
}
