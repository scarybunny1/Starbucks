//
//  AppDelegate.swift
//  Starbucks
//
//  Created by Ayush Bhatt on 01/10/22.
//

import UIKit

class StarbucksViewController: UIViewController{
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func commonInit(){
        
    }
    
    func setTabBarItem(title: String, image: String){
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        tabBarItem = UITabBarItem(title: title, image: UIImage(systemName: image, withConfiguration: configuration), tag: 0)
    }
}

class ScanViewController: StarbucksViewController{
    override func viewDidLoad() {
        view.backgroundColor = .yellow
        title = "Scan"
    }
    
    override func commonInit() {
        setTabBarItem(title: "Scan", image: "qrcode")
    }
}
class OrderViewController: StarbucksViewController{
    override func viewDidLoad() {
        view.backgroundColor = .systemTeal
        title = "Order"
    }
    
    override func commonInit() {
        setTabBarItem(title: "Order", image: "arrow.up.bin.fill")
    }
}
class GiftViewController: StarbucksViewController{
    override func viewDidLoad() {
        view.backgroundColor = .gray
        title = "Gift"
    }
    
    override func commonInit() {
        setTabBarItem(title: "Gift", image: "qrcode")
    }
}
class StoreViewController: StarbucksViewController{
    override func viewDidLoad() {
        view.backgroundColor = .yellow
        title = "Store"
    }
    
    override func commonInit() {
        setTabBarItem(title: "Store", image: "location.fill")
    }
}

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        let homeVC = HomeViewController()
        let scanVC = ScanViewController()
        let orderVC = OrderViewController()
        let giftVC = GiftViewController()
        let storeVC = StoreViewController()
        
        let scanNC = UINavigationController(rootViewController: scanVC)
        let orderNC = UINavigationController(rootViewController: orderVC)
        let giftNC = UINavigationController(rootViewController: giftVC)
        let storeNC = UINavigationController(rootViewController: storeVC)
        
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().barTintColor = .gray
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [homeVC, scanNC, orderNC, giftNC, storeNC]
        
        tabBarController.tabBar.tintColor = .lightGreen
        tabBarController.tabBar.isTranslucent = false
        
        window?.rootViewController = tabBarController
        return true
    }
}

