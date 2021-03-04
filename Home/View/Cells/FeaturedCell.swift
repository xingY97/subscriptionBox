//
//  FeaturedCell.swift
//  scrollViewCode
//
//  Created by X Y on 3/4/21.
//

import Foundation
import UIKit

class FeaturedCell: UICollectionViewCell {
    static var identifier: String = "FeaturedCell"
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var backView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func setup(){
        self.backView.backgroundColor = UIColor(named: "purple")
        self.backView.layer.cornerRadius = 20
        mainLabel.textColor = UIColor(named: "white")
    }
    
    func setContents(category: Category){
        imgView.image = UIImage(named: category.rawValue)
        mainLabel.text = category.displayName()
    }
}
