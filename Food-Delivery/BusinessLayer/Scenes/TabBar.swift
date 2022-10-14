//
//  TabBar.swift
//  Food-Delivery
//
//  Created by Shuhrat Nurov on 14/10/22.
//

import UIKit

import UIKit
class TabBar: UITabBarController {
    
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = .white
        tabBar.backgroundColor = .white
        tabBar.tintColor = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 1)
        setupVCs()
    }
    
    func setupVCs() {
        viewControllers = [
            createNavControllers(for: MenuViewRouter.createModule(), title: "Меню", image: UIImage(named: "MenuIcon")),
            createNavControllers(for: UIViewController(), title: "Контакты", image: UIImage(named: "ContactsIcon")),
            createNavControllers(for: UIViewController(), title: "Профиль", image: UIImage(named: "ProfileIcon")),
            createNavControllers(for: UIViewController(), title: "Корзина", image: UIImage(named: "BasketIcon"))
        ]
    }
    
    fileprivate func createNavControllers(for rootViewController:UIViewController, title:String, image:UIImage?)->UIViewController{
        let navController = UINavigationController(rootViewController: rootViewController)  
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        rootViewController.navigationItem.title = title
        return navController
    }
}
