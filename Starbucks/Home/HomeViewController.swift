//
//  ViewController.swift
//  Starbucks
//
//  Created by Ayush Bhatt on 01/10/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    var headerView = HomeHeaderView()
    var spacerView = UIView()
    var headerViewTopContraint: NSLayoutConstraint!
    
    var scrollView = UIScrollView()
    var stackView = UIStackView()
    
    var tiles = [RewardViewController(),
                 TileViewController(title: "Breakfast made meatless", body: "Try the Beyond Meat, Cheddar & Egg Breakfast Sandwich. Vegatarian and protein packed.", imagename: "meatless"),
                 TileViewController(title: "Uplifting our communities", body: "Thanks to our partners' nominations, the Starbucks Foundation is donating $145K to more than 50 local charities.", imagename: "communities"),
                 TileViewController(title: "Spend atleast $15 for 50 Bonus stars", body: "Collect 50 bonus stars when you spend atleast $15 pre-tax.", imagename: "bonus")
                ]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        
        style()
        layout()
    }
    
}

extension HomeViewController{
    func style(){
        spacerView.backgroundColor = .white
        
        view.backgroundColor = .backgroundWhite
        setUpTabBarItem()
        setUpScrollView()
        
        spacerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = .vertical
        stackView.spacing = 8
    }
    
    func layout(){
        view.addSubview(spacerView)
        view.addSubview(headerView)
        view.addSubview(scrollView)
        
        scrollView.addSubview(stackView)
        
        for tileVC in tiles{
            addChild(tileVC)
            stackView.addArrangedSubview(tileVC.view)
            tileVC.didMove(toParent: self)
        }
        
        headerViewTopContraint =
        headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        NSLayoutConstraint.activate([
            spacerView.topAnchor.constraint(equalTo: view.topAnchor),
            spacerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            spacerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            spacerView.heightAnchor.constraint(equalToConstant: 100),
            
            headerViewTopContraint,
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            scrollView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 8),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
    }
    
    
    func setUpTabBarItem(){
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: "house.fill", withConfiguration: configuration)
        tabBarItem = UITabBarItem(title: "Home", image: image, tag: 0)
    }
    
    func setUpScrollView(){
        scrollView.delegate = self
    }
}

extension HomeViewController: UIScrollViewDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y
        
        let swipingDown = y <= 20
        let shouldSnap = y > 30
        let labelHeight = headerView.greetingsLabel.frame.height + 16
        
        UIView.animate(withDuration: 0.3, delay: 0) {
            self.headerView.greetingsLabel.alpha = swipingDown ? 1.0 : 0.0
        }
        
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.3, delay: 0, options: []) {
            self.headerViewTopContraint.constant = shouldSnap ? -labelHeight : 0
            self.view.layoutIfNeeded()
        }
        
    }
}
