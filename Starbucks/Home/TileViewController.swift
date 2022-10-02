//
//  TileViewController.swift
//  Starbucks
//
//  Created by Ayush Bhatt on 02/10/22.
//

import UIKit

class TileViewController: UIViewController {

    var tileView = TileView()
    
    init(title: String, body: String, imagename: String){
        super.init(nibName: nil, bundle: nil)
        tileView.titleLabel.text = title
        tileView.bodyLabel.text = body
        tileView.imageView.image = UIImage(named: imagename)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    func style(){
        tileView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func layout(){
        view.addSubview(tileView)
        
        NSLayoutConstraint.activate([
            tileView.topAnchor.constraint(equalTo: view.topAnchor),
            tileView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tileView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tileView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}
