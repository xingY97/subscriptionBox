//
//  myCustomView.swift
//  scrollViewCode
//
//  Created by X Y on 2/8/21.
//

import UIKit

class myCustomView: UIView {

        
        var color: UIColor? = .white
        
        override init(frame:CGRect){
            super.init(frame: frame)
            setup()
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            setup()
        }
        

        
        func setup(){
            self.backgroundColor = color
            self.translatesAutoresizingMaskIntoConstraints = false
        }
    }


