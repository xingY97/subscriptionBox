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
        self.backgroundColor = UIColor.purple
        self.translatesAutoresizingMaskIntoConstraints = false
        
        
        let stackView : UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.axis = .vertical
            stackView.spacing = 20
            stackView.distribution = .fill
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
        }()
        
        let imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        let messageLabel: UILabel = {
            let messageLabel = UILabel()
            messageLabel.numberOfLines = 0
            messageLabel.textAlignment = .center
            messageLabel.font = UIFont(name: "Helvetica", size: 20)
            messageLabel.textColor = UIColor(white: 1.0, alpha: 0.8)
            return messageLabel
        }()
        
        self.addSubview(stackView)
        
        stackView.widthAnchor.constraint(greaterThanOrEqualTo: self.layoutMarginsGuide.widthAnchor, multiplier: 0.5) .isActive = true
        stackView.heightAnchor.constraint(equalTo: self.layoutMarginsGuide.heightAnchor, multiplier: 0.5) . isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor) .isActive = true
        stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor) .isActive = true
        
        
        stackView.addArrangedSubview(imageView)
        imageView.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.6) .isActive = true
        stackView.addArrangedSubview(messageLabel)
        
}

}
