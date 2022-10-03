//
//  RewardsView.swift
//  Starbucks
//
//  Created by Ayush Bhatt on 02/10/22.
//

import UIKit

class RewardView: UIView {
    
    let balanceView = BalanceView()
    let rewardsButton = UIButton()
    let rewardsGraphicView = RewardsGraphicView()
    let starRewardsView = UIView()
    var detailButton = UIButton()
    
    var heightConstraint: NSLayoutConstraint!
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        rewardsGraphicView.actualFrameWidth = frame.width
        rewardsGraphicView.drawRewardsGraphic()
    }
    
    func style(){
        balanceView.translatesAutoresizingMaskIntoConstraints = false
        detailButton.translatesAutoresizingMaskIntoConstraints = false
        starRewardsView.translatesAutoresizingMaskIntoConstraints = false
        rewardsGraphicView.translatesAutoresizingMaskIntoConstraints = false
        
        makeRewardsButton()
        detailButton = makeClearButton(with: "Details")
    }
    
    func layout(){
        addSubview(balanceView)
        addSubview(rewardsButton)
        addSubview(rewardsGraphicView)
        addSubview(starRewardsView)
        addSubview(detailButton)
        
        heightConstraint = starRewardsView.heightAnchor.constraint(equalToConstant: 0)
        
        NSLayoutConstraint.activate([
            balanceView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            balanceView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            
            rewardsButton.centerYAnchor.constraint(equalTo: balanceView.pointsLabel.centerYAnchor),
            trailingAnchor.constraint(equalToSystemSpacingAfter: rewardsButton.trailingAnchor, multiplier: 2),
            
            rewardsGraphicView.centerXAnchor.constraint(equalTo: centerXAnchor),
            rewardsGraphicView.widthAnchor.constraint(equalToConstant: frame.width),
            rewardsGraphicView.topAnchor.constraint(equalToSystemSpacingBelow: balanceView.bottomAnchor, multiplier: 2),
            
            starRewardsView.topAnchor.constraint(equalToSystemSpacingBelow: rewardsGraphicView.bottomAnchor, multiplier: 1),
            starRewardsView.leadingAnchor.constraint(equalTo: balanceView.leadingAnchor),
            starRewardsView.trailingAnchor.constraint(equalTo: rewardsButton.trailingAnchor),
            heightConstraint!,
            
            detailButton.topAnchor.constraint(equalToSystemSpacingBelow: rewardsGraphicView.bottomAnchor, multiplier: 2),
            detailButton.leadingAnchor.constraint(equalTo: balanceView.leadingAnchor),
            bottomAnchor.constraint(equalToSystemSpacingBelow: detailButton.bottomAnchor, multiplier: 1)
        ])
    }
    
    func makeRewardsButton(){
        rewardsButton.translatesAutoresizingMaskIntoConstraints = false
        
        let configuration = UIImage.SymbolConfiguration(scale: .small)
        let image = UIImage(systemName: "chevron.down", withConfiguration: configuration)
        rewardsButton.setImage(image, for: .normal)
        
        rewardsButton.setTitle("Rewards options", for: .normal)
        rewardsButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .footnote)
        rewardsButton.setTitleColor(.label, for: .normal)
        
        rewardsButton.semanticContentAttribute = .forceRightToLeft
        rewardsButton.imageEdgeInsets = UIEdgeInsets(top: 2, left: 20, bottom: 0, right: 0)
        rewardsButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
    }

}
