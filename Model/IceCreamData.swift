//
//  IceCreamData.swift
//  scrollViewCode
//
//  Created by X Y on 3/4/21.
//

import Foundation


struct IceCreamBox{
    var date: Date
    var items: [BoxItem]
    var imageStr: String
}


struct BoxItem {
    var name: String
    var flavor: [Flavor]
    var isFavorite: Bool
}

enum Flavor: String, CaseIterable{
    case strawBerry = "strawBerry"
    case peach = "peach"
    case cheesecake = "cheesecake"
    
    func displayName() -> String {
        return self.rawValue.capitalized
    }
}
