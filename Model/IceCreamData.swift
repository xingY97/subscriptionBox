//
//  IceCreamData.swift
//  scrollViewCode
//
//  Created by X Y on 3/4/21.
//

import Foundation

enum Category: String, CaseIterable{
    case strawBerry = "strawBerry"
    case peach = "peach"
    case cheesecake = "cheesecake"
    
    func displayName() -> String {
        return self.rawValue.capitalized
    }
}
