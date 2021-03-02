//
//  ViewController.swift
//  scrollViewCode
//
//  Created by X Y on 2/3/21.
//

import UIKit

class OnboardingVC: UIViewController, UIScrollViewDelegate {
    
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
        
        
        let firstPage = OnboardingView(color: #colorLiteral(red: 0.9412223697, green: 0.4081160426, blue: 0.3795590997, alpha: 1), message: "Tell us about your favorite flavor", isLastPage: false, imageName: "dog")
        
        let secondPage = OnboardingView(color: #colorLiteral(red: 0.2167053504, green: 0.9412223697, blue: 0.7895563811, alpha: 1), message: "Subscribe to yuor first box", isLastPage: false, imageName: "food")
        
        let thirdPage = OnboardingView(color: #colorLiteral(red: 0.5544445669, green: 0.594695744, blue: 0.9412223697, alpha: 1), message: "Get custom ice creans every month", isLastPage: true, imageName: "phone")
        thirdPage.subscribeButton.addTarget(self, action: #selector(self.goLogin), for: .touchUpInside)
        
        
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
        
        
        return page
    }
    
    func scrollViewDidEndDecelerating(_ scrollViww: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
        
    }
    
    @objc func goLogin(){
        let initialpage = LoginVC()
        self.navigationController?.pushViewController(initialpage, animated: true)
    }
}






