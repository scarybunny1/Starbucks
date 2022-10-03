//
//  HomeHeaderView.swift
//  Starbucks
//
//  Created by Ayush Bhatt on 02/10/22.
//

import UIKit

class HomeHeaderView: UIView {
    
    var greetingsLabel = UILabel()
    var inboxButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit(){
        style()
        layout()
    }

}

extension HomeHeaderView{
    func style(){
        backgroundColor = .white
        greetingsLabel.translatesAutoresizingMaskIntoConstraints = false
        greetingsLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        greetingsLabel.text = "Good afternoon, Ayush ☀️"
        greetingsLabel.numberOfLines = 0
        greetingsLabel.lineBreakMode = .byWordWrapping
        
        makeInboxButton()
    }
    
    func layout(){
        addSubview(greetingsLabel)
        addSubview(inboxButton)
        
        NSLayoutConstraint.activate([
            greetingsLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            greetingsLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: greetingsLabel.trailingAnchor, multiplier: 1),
            
            inboxButton.topAnchor.constraint(equalToSystemSpacingBelow: greetingsLabel.bottomAnchor, multiplier: 2),
            inboxButton.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            bottomAnchor.constraint(equalToSystemSpacingBelow: inboxButton.bottomAnchor, multiplier: 2),
            inboxButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.25)
        ])
    }
}


extension HomeHeaderView{
    func makeInboxButton(){
        inboxButton.translatesAutoresizingMaskIntoConstraints = false
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: "envelope", withConfiguration: configuration)
        
        inboxButton.setImage(image, for: .normal)
        inboxButton.imageView?.tintColor = .secondaryLabel
        inboxButton.imageView?.contentMode = .scaleAspectFit
        
        inboxButton.setTitle("Inbox", for: .normal)
        inboxButton.setTitleColor(.secondaryLabel, for: .normal)
        inboxButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16)
        inboxButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
