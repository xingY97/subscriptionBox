//
//  LoginViewController.swift
//  scrollViewCode
//
//  Created by X Y on 2/15/21.
//

import UIKit

class LoginVC: UIViewController {
    
    let logoImage: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "sf")
        logo.translatesAutoresizingMaskIntoConstraints = false
        return logo
    }()
    
    let username: UITextField = {
        let usernametxt = UITextField()
        usernametxt.tintColor = UIColor(named: "white")
        usernametxt.textColor = UIColor(named: "white")
        usernametxt.autocapitalizationType = .none
        usernametxt.translatesAutoresizingMaskIntoConstraints = false
        usernametxt.attributedPlaceholder = NSAttributedString(string: "username",
                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        usernametxt.borderStyle = .roundedRect
        return usernametxt
    }()

    let password: UITextField = {
        let passwordtxt = UITextField()
        passwordtxt.tintColor = UIColor(named: "white")
        passwordtxt.textColor = UIColor(named: "white")
        passwordtxt.isSecureTextEntry = true
        passwordtxt.translatesAutoresizingMaskIntoConstraints = false
        passwordtxt.attributedPlaceholder = NSAttributedString(string: "password",
                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        passwordtxt.borderStyle = .roundedRect
        return passwordtxt
    }()
    
    let button : UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.setTitleColor(UIColor(named: "black"), for: .normal)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.backgroundColor = UIColor(white: 1.0, alpha: 0.8)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let stackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 40
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        setStackView()
        button.addTarget(self, action: #selector(login), for: .touchUpInside)
    }
    
    func setStackView(){
        self.view.addSubview(stackView)
        
        stackView.widthAnchor.constraint(equalTo: self.view.layoutMarginsGuide.widthAnchor, multiplier: 0.80).isActive = true
        stackView.heightAnchor.constraint(equalTo: self.view.layoutMarginsGuide.heightAnchor, multiplier: 0.7).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.addArrangedSubview(logoImage)
        logoImage.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.6).isActive = true
        stackView.addArrangedSubview(username)
        stackView.addArrangedSubview(password)
        button.heightAnchor.constraint(equalToConstant: 20).isActive = true
        stackView.addArrangedSubview(button)
        
    }
    
    @objc func login(){
        UIApplication.shared.windows.first?.rootViewController = TabBarController()
    }
}
