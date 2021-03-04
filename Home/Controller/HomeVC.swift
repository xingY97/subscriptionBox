//
//  HomeVC.swift
//  scrollViewCode
//
//  Created by X Y on 3/2/21.
//

import Foundation
import UIKit

class HomeVC: UIViewController {
    
    let flavors : [Category] = [.strawBerry, .cheesecake, .peach]
    var collectionView: UICollectionView!
    
    lazy var sections: [Section] = [
        TitleSection(title: "types of ice cream we offer"),
        FeaturedSection(items: flavors),
        TitleSection(title: "premiums"),
        FavoritesSection()
    ]
    
    lazy var collectionViewLayout: UICollectionViewLayout = {
        var sections = self.sections
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, environment) -> NSCollectionLayoutSection? in
            return sections[sectionIndex].layoutSection()
        }
        return layout
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "white")
        self.title = "Home"
        setupCollectionView()

    }
    
    func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: collectionViewLayout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.white
        collectionView.register(UINib(nibName: "TitleCell", bundle: .main), forCellWithReuseIdentifier: "TitleCell")
        collectionView.register(UINib(nibName: "FeaturedCell", bundle: .main), forCellWithReuseIdentifier: "FeaturedCell")
        collectionView.register(UINib(nibName: "FavoritesCell", bundle: .main), forCellWithReuseIdentifier: "FavoritesCell")
        collectionView.register(UINib(nibName: "GridCell", bundle: .main), forCellWithReuseIdentifier: "GridCell")
        self.view.addSubview(collectionView)
        collectionView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.reloadData()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        collectionView.reloadData()
    }
}

extension HomeVC: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return sections[indexPath.section].configureCell(collectionView: collectionView, indexPath: indexPath)
    }
}

extension HomeVC: UICollectionViewDelegate {}

