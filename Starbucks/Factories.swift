//
//  Factories.swift
//  Starbucks
//
//  Created by Ayush Bhatt on 02/10/22.
//

import UIKit

extension UIFont{
    func withTraits(traits: UIFontDescriptor.SymbolicTraits) -> UIFont{
        let descriptor = fontDescriptor.withSymbolicTraits(traits)
        return UIFont(descriptor: descriptor!, size: 0)
    }
    
    func bold() -> UIFont{
        return withTraits(traits: .traitBold)
    }
}

extension UIColor{
    static let starYellow = UIColor(red: 204/255, green: 153/255, blue: 51/255, alpha: 1)
    static let tileBrown = UIColor(red: 235/255, green: 235/255, blue: 228/255, alpha: 1)
    static let darkGreen = UIColor(red: 0/255, green: 133/255, blue: 67/255, alpha: 1)
    static let lightGreen = UIColor(red: 0/255, green: 171/255, blue: 98/255, alpha: 1)
    static let backgroundWhite = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
}

public extension NSLayoutConstraint{
    
    @objc func setActiveBreakable(priority: UILayoutPriority = UILayoutPriority(900)){
        self.priority = priority
        isActive = true
    }
}

func makeGreenButton(with title: String) -> UIButton{
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle(title, for: .normal)
    button.titleLabel?.adjustsFontSizeToFitWidth = true
    button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
    button.layer.cornerRadius = 40/2
    button.backgroundColor = .darkGreen
    
    return button
}

func makeSymbolImageView(systemName: String, scale: UIImage.SymbolScale) -> UIImageView{
    let configuration = UIImage.SymbolConfiguration(scale: scale)
    let image = UIImage(systemName: systemName, withConfiguration: configuration)
    
    return UIImageView(image: image)
}

func makeClearButton(with text: String) -> UIButton{
    let b = UIButton()
    b.translatesAutoresizingMaskIntoConstraints = false
    b.setTitle(text, for: .normal)
    b.titleLabel?.adjustsFontSizeToFitWidth = true
    b.contentEdgeInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
    b.layer.cornerRadius = 40/2
    b.layer.borderWidth = 0.5
    
    b.setTitleColor(.label, for: .normal)
    b.layer.borderColor = UIColor.label.cgColor
    b.backgroundColor = .systemBackground
    
    return b
}
