//
//  StarAndPointsView.swift
//  Starbucks
//
//  Created by Ayush Bhatt on 03/10/22.
//

import UIKit

class StarAndPointsView: UIView {

    let pointsLabel = UILabel()
    let starsImageView = makeSymbolImageView(systemName: "star.fill", scale: .small)
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize{
        return CGSize(width: 60, height: 16)
    }
    
    func style(){
        pointsLabel.translatesAutoresizingMaskIntoConstraints = false
        starsImageView.translatesAutoresizingMaskIntoConstraints = false
        
        pointsLabel.font = UIFont.preferredFont(forTextStyle: .callout).bold()
        pointsLabel.textAlignment = .right
        
        starsImageView.tintColor = .starYellow
        starsImageView.contentMode = .scaleAspectFit
    }
    
    func layout(){
        addSubview(pointsLabel)
        addSubview(starsImageView)
        
        NSLayoutConstraint.activate([
            pointsLabel.topAnchor.constraint(equalTo: topAnchor),
            pointsLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            pointsLabel.trailingAnchor.constraint(equalTo: starsImageView.leadingAnchor, constant: -2),
            
            starsImageView.centerYAnchor.constraint(equalTo: pointsLabel.centerYAnchor),
            starsImageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
