//
//  TabBarController.swift
//  scrollViewCode
//
//  Created by X Y on 3/2/21.
//

import Foundation
import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.tabBar.barTintColor = UIColor.black
        self.tabBar.tintColor = UIColor.white
        setupTabBarControllers()
    }
    
    func setupTabBarControllers() {
        
        let homeVC = HomeVC()
        homeVC.tabBarItem = UITabBarItem(title:"Home", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))

        let historyVC = HistoryVC()
        historyVC.tabBarItem = UITabBarItem(title:"History", image: UIImage(systemName: "calendar"), selectedImage: UIImage(systemName: "calendar"))

        let newBoxVC = NewBoxVC()
        newBoxVC.tabBarItem = UITabBarItem(title:"New Box", image: UIImage(systemName: "shippingbox"), selectedImage: UIImage(systemName: "shippingbox.fill"))

        let sections = [homeVC, historyVC, newBoxVC]
        var navControllers = [UINavigationController]()
        
        for vc in sections{
            let navController = UINavigationController(rootViewController: vc)
            navController.navigationBar.prefersLargeTitles = true
            navControllers.append(navController)
        }
        
        viewControllers = navControllers
    }
}
