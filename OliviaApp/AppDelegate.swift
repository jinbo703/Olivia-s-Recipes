//
//  AppDelegate.swift
//  OliviaApp
//
//  Created by John Nik on 11/11/17.
//  Copyright © 2017 johnik703. All rights reserved.
//

import UIKit
import SideMenuController

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        SideMenuController.preferences.drawing.menuButtonImage = UIImage(named: AssetName.menu.rawValue)?.withRenderingMode(.alwaysOriginal)
        SideMenuController.preferences.drawing.sidePanelPosition = .underCenterPanelLeft
        SideMenuController.preferences.drawing.sidePanelWidth = 150
        SideMenuController.preferences.drawing.centerPanelShadow = true
        SideMenuController.preferences.animating.statusBarBehaviour = .horizontalPan
        SideMenuController.preferences.animating.transitionAnimator = FadeAnimator.self
        
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
//        window?.rootViewController = MainNavigationController()
        
        let sideMenuViewController = SideMenuController()
        
        let layout = UICollectionViewFlowLayout()
        let homeController = HomeTabBarController(collectionViewLayout: layout)
        let navController = UINavigationController(rootViewController: homeController)
        let sideController = SideController()
        
        sideMenuViewController.embed(sideViewController: sideController)
        sideMenuViewController.embed(centerViewController: navController)
        
        window?.rootViewController = sideMenuViewController
        
        
        
        UINavigationBar.appearance().barTintColor = StyleGuideManager.currentPageIndicatorGreenTintColor
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 24)]
        
        //get rid of balck bar underneath navbar
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(),  for: .default)
        
        application.statusBarStyle = .lightContent
        
//        let statusBarBackgroundView = UIView()
//        statusBarBackgroundView.backgroundColor = StyleGuideManager.currentPageIndicatorGreenTintColor
//        window?.addSubview(statusBarBackgroundView)
//        window?.addConnstraintsWith(Format: "H:|[v0]|", views: statusBarBackgroundView)
//        window?.addConnstraintsWith(Format: "V:|[v0(20)]", views: statusBarBackgroundView)
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

