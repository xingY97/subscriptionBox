//
//  IceCreamCell2TableViewCell.swift
//  scrollViewCode
//
//  Created by X Y on 3/5/21.
//

import UIKit

class IceCreamCell: UITableViewCell {



    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    let stack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .fill
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let boxImage: UIImageView = {
        let box = UIImageView()
        box.clipsToBounds = true
        box.contentMode = .scaleAspectFit
        box.translatesAutoresizingMaskIntoConstraints = false
        return box
    }()
    
    let dateLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "Helvetica", size: 18)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setup()
    }

    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        setup()
    }

    
    func setup(){
        self.contentView.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            stack.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            stack.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            stack.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10)
        ])
        stack.addArrangedSubview(boxImage)
        
        boxImage.heightAnchor.constraint(equalTo: self.stack.heightAnchor).isActive = true
        boxImage.widthAnchor.constraint(equalTo: boxImage.heightAnchor).isActive = true
        
    }
}
