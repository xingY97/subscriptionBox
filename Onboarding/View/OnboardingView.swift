//
//  myCustomView.swift
//  scrollViewCode
//
//  Created by X Y on 2/8/21.
//

import UIKit

class OnboardingView: UIView {
    
    var pageColor: UIColor!
    var message: String!
    var isLastPage: Bool!
    var imageName: String!
    
    let subscribeButton: UIButton = {
        let subscribeButton = UIButton()
        subscribeButton.setTitle("Subscribe Now", for: .normal)
        subscribeButton.setTitleColor(#colorLiteral(red: 0.9412223697, green: 0.3539934321, blue: 0.5135805739, alpha: 1), for: .normal)
        subscribeButton.backgroundColor = UIColor(white: 1.0, alpha: 0.8)
        return subscribeButton
    }()
    
    override init(frame:CGRect){
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    convenience init(color:UIColor, message:String, isLastPage: Bool, imageName: String){
        self.init(frame: .zero)
        self.pageColor = color
        self.message = message
        self.isLastPage = isLastPage
        self.imageName = imageName
        setup()
    }
    
    
    func setup(){
        self.backgroundColor = pageColor
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
        
        imageView.image = UIImage(named: imageName)
        messageLabel.text = message
        self.backgroundColor = pageColor
        
        if isLastPage {
            stackView.addArrangedSubview(subscribeButton)
            subscribeButton.heightAnchor.constraint(equalToConstant: 40) .isActive = true
            subscribeButton.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        }
        
    }
    
}

