//
//  IceCreamDetail.swift
//  scrollViewCode
//
//  Created by X Y on 3/5/21.
//

import UIKit

class IceCreamDetail: UIViewController {

    var box: IceCreamBox?
    
    let table: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(ItemCell.self, forCellReuseIdentifier: "ItemCell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(named: "white")
        setTable()
        
    }
    
    func setTable(){
        table.delegate = self
        table.dataSource = self
        self.view.addSubview(table)
        NSLayoutConstraint.activate([
            table.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            table.topAnchor.constraint(equalTo: self.view.topAnchor),
            table.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }
    
}

extension IceCreamDetail: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return box!.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        let item = box!.items[indexPath.row]
        cell.titleLabel.text = item.name
        cell.boxImage.image = UIImage(systemName: box!.imageStr)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}



