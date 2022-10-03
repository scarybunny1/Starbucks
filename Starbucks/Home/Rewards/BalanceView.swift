//
//  BalanceView.swift
//  Starbucks
//
//  Created by Ayush Bhatt on 02/10/22.
//

import UIKit

class BalanceView: UIView {
    
    let pointsLabel = UILabel()
    let starBalanceLabel = UILabel()
    let starImageView = makeSymbolImageView(systemName: "star.fill", scale: .large)

    override init(frame: CGRect) {
        super.init(frame: .zero)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func style(){
        pointsLabel.translatesAutoresizingMaskIntoConstraints = false
        pointsLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle).bold()
        pointsLabel.text = "12"
        
        
        starImageView.translatesAutoresizingMaskIntoConstraints = false
        starImageView.tintColor = .systemYellow
        starImageView.contentMode = .scaleAspectFit
        
        starBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
        starBalanceLabel.text = "Star Balance"
        starBalanceLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        starBalanceLabel.textColor = .label
    }
    
    func layout(){
        addSubview(pointsLabel)
        addSubview(starImageView)
        addSubview(starBalanceLabel)
        
        NSLayoutConstraint.activate([
            pointsLabel.topAnchor.constraint(equalTo: topAnchor),
            pointsLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            starImageView.leadingAnchor.constraint(equalTo: pointsLabel.trailingAnchor, constant: -2),
            starImageView.centerYAnchor.constraint(equalTo: pointsLabel.centerYAnchor, constant: 4),
            starImageView.heightAnchor.constraint(equalToConstant: 15),
            
            starBalanceLabel.topAnchor.constraint(equalTo: pointsLabel.bottomAnchor),
            starBalanceLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            starBalanceLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            starBalanceLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

}
