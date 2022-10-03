//
//  RewardsViewController.swift
//  Starbucks
//
//  Created by Ayush Bhatt on 02/10/22.
//

import UIKit

class RewardViewController: UIViewController {
    
    let rewardView = RewardView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        rewardView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(rewardView)
        NSLayoutConstraint.activate([
            rewardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            rewardView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            rewardView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            rewardView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

    }

}
