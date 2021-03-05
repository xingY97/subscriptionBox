//
//  ItemCell.swift
//  scrollViewCode
//
//  Created by X Y on 3/5/21.
//

import UIKit

class ItemCell: UITableViewCell {
    
    let stack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .fill
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let labelsStack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .fill
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 0
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "Helvetica", size: 18)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let boxImage: UIImageView = {
        let box = UIImageView()
        box.clipsToBounds = true
        box.contentMode = .scaleAspectFit
        box.translatesAutoresizingMaskIntoConstraints = false
        return box
    }()
    
    let favoriteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "star"), for: .normal)
        return button
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup() {
        self.contentView.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            stack.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            stack.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            stack.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10)
        ])
        stack.addArrangedSubview(boxImage)
        stack.addArrangedSubview(favoriteButton)
        labelsStack.addArrangedSubview(titleLabel)

        boxImage.heightAnchor.constraint(equalTo: self.stack.heightAnchor).isActive = true
        boxImage.widthAnchor.constraint(equalTo: boxImage.heightAnchor).isActive = true
        
        labelsStack.heightAnchor.constraint(equalTo: stack.heightAnchor).isActive = true
        
        favoriteButton.widthAnchor.constraint(equalTo: stack.widthAnchor, multiplier: 0.2).isActive = true
        favoriteButton.heightAnchor.constraint(equalTo: stack.heightAnchor).isActive = true

    }
}
