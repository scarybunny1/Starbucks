//
//  StarRewardsRow.swift
//  Starbucks
//
//  Created by Ayush Bhatt on 03/10/22.
//

import UIKit

class StarRewardsRow: UIView {

    let starAndPointsView = StarAndPointsView()
    let label = UILabel()
    
    init(numberOfPoints: String, description: String) {
        super.init(frame: .zero)
        starAndPointsView.pointsLabel.text = numberOfPoints
        label.text = description
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func style(){
        starAndPointsView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = UIFont.preferredFont(forTextStyle: .footnote)
        label.sizeToFit()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
    }
    
    func layout(){
        addSubview(starAndPointsView)
        addSubview(label)
        
        NSLayoutConstraint.activate([
            starAndPointsView.topAnchor.constraint(equalTo: topAnchor),
            starAndPointsView.leadingAnchor.constraint(equalTo: leadingAnchor),
            starAndPointsView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            label.topAnchor.constraint(equalTo: topAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            label.leadingAnchor.constraint(equalTo: starAndPointsView.trailingAnchor, constant: 4)
        ])
        
        starAndPointsView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        label.heightAnchor.constraint(equalToConstant: label.frame.size.height).setActiveBreakable()
    }

}
