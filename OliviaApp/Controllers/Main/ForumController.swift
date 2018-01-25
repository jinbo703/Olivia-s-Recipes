//
//  ForumController.swift
//  OliviaApp
//
//  Created by John Nik on 11/22/17.
//  Copyright © 2017 johnik703. All rights reserved.
//

import UIKit
class ForumController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupBackground()
    }
    
}

//MARK: setupViews
extension ForumController {
    
    fileprivate func setupViews() {
        setupBackground()
    }
    
    fileprivate func setupBackground() {
        view.backgroundColor = .white
        
        navigationItem.title = "Forum"
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = StyleGuideManager.currentPageIndicatorGreenTintColor
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 24)]
        
//        setupStatusBar()
    }
    fileprivate func setupStatusBar() {
        let statusBarBackgroundView = UIView()
        statusBarBackgroundView.backgroundColor = StyleGuideManager.currentPageIndicatorGreenTintColor
        if let window = UIApplication.shared.keyWindow {
            window.addSubview(statusBarBackgroundView)
            window.addConnstraintsWith(Format: "H:|[v0]|", views: statusBarBackgroundView)
            window.addConnstraintsWith(Format: "V:|[v0(20)]", views: statusBarBackgroundView)
        }
    }
}
