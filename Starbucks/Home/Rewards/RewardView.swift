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
    let starRewardsView = StarRewardsView()
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
            
            starRewardsView.topAnchor.constraint(equalTo: rewardsGraphicView.bottomAnchor, constant: 8),
            starRewardsView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: starRewardsView.trailingAnchor, multiplier: 1),
            heightConstraint,
            
            detailButton.topAnchor.constraint(equalToSystemSpacingBelow: starRewardsView.bottomAnchor, multiplier: 2),
            detailButton.leadingAnchor.constraint(equalTo: balanceView.leadingAnchor),
            bottomAnchor.constraint(equalToSystemSpacingBelow: detailButton.bottomAnchor, multiplier: 1)
        ])
        
        starRewardsView.isHidden = true
    }
    
    func makeRewardsButton(){
        rewardsButton.translatesAutoresizingMaskIntoConstraints = false
        
        rewardsButton.addTarget(self, action: #selector(rewardOptionsTapped), for: .primaryActionTriggered)
        
        let configuration = UIImage.SymbolConfiguration(scale: .small)
        let image = UIImage(systemName: "chevron.down", withConfiguration: configuration)
        rewardsButton.setImage(image, for: .normal)
        
        rewardsButton.setTitle("Rewards options", for: .normal)
        rewardsButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .footnote)
        rewardsButton.setTitleColor(.label, for: .normal)
        
        rewardsButton.semanticContentAttribute = .forceRightToLeft
        rewardsButton.imageEdgeInsets = UIEdgeInsets(top: 2, left: 10, bottom: 0, right: 0)
        rewardsButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
    }
}

extension RewardView{
    
    @objc
    func rewardOptionsTapped(){
        if heightConstraint.constant == 0{
            self.setChevronUp()
            let heightAnimator = UIViewPropertyAnimator(duration: 0.75, curve: .easeInOut) {
                self.heightConstraint.constant = 250
                self.layoutIfNeeded()
            }
            heightAnimator.startAnimation()
            let alphaAnimator = UIViewPropertyAnimator(duration: 0.25, curve: .easeInOut){
                self.starRewardsView.isHidden = false
                self.starRewardsView.alpha = 1
            }
            alphaAnimator.startAnimation(afterDelay: 0.5)
        }
        else{
            self.setChevronDown()
            let animator = UIViewPropertyAnimator(duration: 0.75, curve: .easeInOut){
                self.heightConstraint.constant = 0
                self.starRewardsView.isHidden = true
                self.starRewardsView.alpha = 0
                self.layoutIfNeeded()
            }
            animator.startAnimation()
        }
    }
    
    func setChevronUp(){
        let configuration = UIImage.SymbolConfiguration(scale: .small)
        rewardsButton.setImage(UIImage(systemName: "chevron.up", withConfiguration: configuration), for: .normal)
    }
    
    func setChevronDown(){
        let configuration = UIImage.SymbolConfiguration(scale: .small)
        rewardsButton.setImage(UIImage(systemName: "chevron.down", withConfiguration: configuration), for: .normal)
    }
}
