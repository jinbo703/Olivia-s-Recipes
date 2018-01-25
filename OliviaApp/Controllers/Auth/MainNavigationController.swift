//
//  MainNavigationController.swift
//  OliviaApp
//
//  Created by John Nik on 11/22/17.
//  Copyright © 2017 johnik703. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let homeController = HomeTabBarController()
        viewControllers = [homeController]
        if isLoggedIn() {
            
//            let homeController = HomeTabBarController()
//            viewControllers = [homeController]
            
        } else {
            
            perform(#selector(showLoginController), with: nil, afterDelay: 0.01)
            
        }
    }
    
    fileprivate func isLoggedIn() -> Bool {
        
        return UserDefaults.standard.isLoggedIn()
    }
    
    @objc func showLoginController() {
        let loginController = LoginController()
        present(loginController, animated: true, completion: {
            
            
            
        })
    }
    
}
