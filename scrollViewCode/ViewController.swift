//
//  ViewController.swift
//  scrollViewCode
//
//  Created by X Y on 2/3/21.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    var pageControl : UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = .white
        pageControl.currentPage = 0
        return pageControl
    }()
        
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    let container: UIStackView = {
        let container = UIStackView()
        container.axis = .horizontal
        container.spacing = 0
        container.distribution = .fillEqually
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(scrollView)
        setUpScrollView()
        scrollView.addSubview(container)
        setUpContainer()
        
        scrollView.delegate = self
        
        let firstPage = createOnboardingPage(message: "Tell us about your pet's personality", imageName: "dog", color:#colorLiteral(red: 0.9412223697, green: 0.4081160426, blue: 0.3795590997, alpha: 1), isLastPage: false )
        
        let secondPage = createOnboardingPage(message: "Subscribe to yuor first box", imageName: "food", color:#colorLiteral(red: 0.2167053504, green: 0.9412223697, blue: 0.7895563811, alpha: 1), isLastPage: false )
        
        let thirdPage = createOnboardingPage(message: "Get snacks and toys that your pet will love", imageName: "phone", color:#colorLiteral(red: 0.5544445669, green: 0.594695744, blue: 0.9412223697, alpha: 1), isLastPage: true)
        

        let pagesArray = [firstPage, secondPage, thirdPage]
        
        for page in pagesArray {
            page.translatesAutoresizingMaskIntoConstraints = false
            container.addArrangedSubview(page)
            page.widthAnchor.constraint(equalToConstant: view.frame.size.width) .isActive = true
        }
        
        view.addSubview(pageControl)
        pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 40).isActive = true
        pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        pageControl.numberOfPages = pagesArray.count

    }
    func setUpScrollView() {
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func setUpContainer() {
        container.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        container.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        container.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        container.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        container.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
    }
    
    func createOnboardingPage(message:String, imageName: String, color: UIColor, isLastPage: Bool) -> UIView{
        
        let page = UIView()
        
        let subscribeButton: UIButton = {
            let subscribeButton = UIButton()
            subscribeButton.setTitle("Subscribe Now", for: .normal)
            subscribeButton.setTitleColor(#colorLiteral(red: 0.9412223697, green: 0.3539934321, blue: 0.5135805739, alpha: 1), for: .normal)
            subscribeButton.backgroundColor = UIColor(white: 1.0, alpha: 0.8)
            return subscribeButton
        }()
        
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
        
        page.addSubview(stackView)
        
        stackView.widthAnchor.constraint(greaterThanOrEqualTo: page.layoutMarginsGuide.widthAnchor, multiplier: 0.5) .isActive = true
        stackView.heightAnchor.constraint(equalTo: page.layoutMarginsGuide.heightAnchor, multiplier: 0.5) . isActive = true
        stackView.centerYAnchor.constraint(equalTo: page.centerYAnchor) .isActive = true
        stackView.centerXAnchor.constraint(equalTo: page.centerXAnchor) .isActive = true

        
        stackView.addArrangedSubview(imageView)
        imageView.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.6) .isActive = true
        stackView.addArrangedSubview(messageLabel)

        imageView.image = UIImage(named: imageName)
        messageLabel.text = message
        page.backgroundColor = color
        
        if isLastPage {
            stackView.addArrangedSubview(subscribeButton)
            subscribeButton.heightAnchor.constraint(equalToConstant: 40) .isActive = true
            subscribeButton.widthAnchor.constraint(equalTo: page.widthAnchor).isActive = true
        }
        return page
    }

    func scrollViewDidEndDecelerating(_ scrollViww: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
    }
    
}

