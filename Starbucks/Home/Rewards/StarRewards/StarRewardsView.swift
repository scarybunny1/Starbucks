//
//  StarRewardsView.swift
//  Starbucks
//
//  Created by Ayush Bhatt on 03/10/22.
//

import UIKit

class StarRewardsView: UIView {
    
    struct Reward{
        var numberOfPoints: String
        var description: String
    }

    let rewards = [
        Reward(numberOfPoints: "25", description: "Customize your drink"),
        Reward(numberOfPoints: "50", description: "Brewed hot coffee, tea or bakery item"),
        Reward(numberOfPoints: "150", description: "Handcrafted drink, hot breakfast or parfait"),
        Reward(numberOfPoints: "250", description: "Lunch Sandwich or protein box"),
        Reward(numberOfPoints: "400", description: "Select merchandise or at home coffee"),
    ]
    let label = UILabel()
    let stackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension StarRewardsView{
    func style(){
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = .tileBrown
        layer.cornerRadius = 10
        
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 16, bottom: 16, trailing: -16)
        
        label.text = "Rewards you can get with stars"
        label.font = UIFont.preferredFont(forTextStyle: .title3).bold()
        
    }
    
    func layout(){
        stackView.addArrangedSubview(label)
        for reward in rewards{
            stackView.addArrangedSubview(StarRewardsRow(numberOfPoints: reward.numberOfPoints, description: reward.description))
        }
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
