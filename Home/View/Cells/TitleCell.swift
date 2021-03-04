//
//  TitleCell.swift
//  scrollViewCode
//
//  Created by X Y on 3/4/21.
//

import Foundation
import UIKit


class TitleCell: UICollectionViewCell {
    static var identifier: String = "TitleCell"
    @IBOutlet private var lblTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func set(title: String) {
        lblTitle.text = title
    }

}
