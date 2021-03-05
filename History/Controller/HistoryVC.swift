//
//  HistoryVC.swift
//  scrollViewCode
//
//  Created by X Y on 3/2/21.
//

import Foundation
import UIKit

class HistoryVC: UIViewController {

    var iceCreamArray: [IceCreamBox]! = []
    
    
    let table: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.rowHeight = 100
        table.register(IceCreamCell.self, forCellReuseIdentifier: "IceCreamCell")
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "blue")
        self.title = "History"
        createData()
        setTable()

    }
    
    func setTable(){
        table.delegate = self
        table.dataSource = self
        self.view.addSubview(table)
        table.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
        table.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        table.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        table.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor).isActive = true
    }
    
    func createData(){

        let item = BoxItem(name: "StrawBerry", flavor: [.strawBerry], isFavorite: false)
        let item2 = BoxItem(name: "CheeseCake", flavor: [.cheesecake], isFavorite: false)
        let item3 = BoxItem(name: "Peach", flavor: [.peach], isFavorite: true)
        
        for _ in 0...4{
            let box = IceCreamBox(date: Date(), items: [item, item2, item3], imageStr: "shippingbox")
            iceCreamArray.append(box)
        }
}
}
extension HistoryVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return iceCreamArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IceCreamCell", for: indexPath) as! IceCreamCell
        let itemBox = iceCreamArray[indexPath.row]
        cell.boxImage.image = UIImage(systemName: itemBox.imageStr)
        
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

}

