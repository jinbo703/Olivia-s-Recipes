//
//  SideController.swift
//  OliviaApp
//
//  Created by John Nik on 11/22/17.
//  Copyright © 2017 johnik703. All rights reserved.
//

import UIKit
import SideMenuController


class SideController: UITableViewController {
    
    let cellId = "cellId"
    
    let sides: [Side] = {
        
        let first = Side(imageName: AssetName.featured.rawValue, title: "FEATURED")
        let second = Side(imageName: AssetName.profileIcon.rawValue, title: "PROFILE")
        let third = Side(imageName: AssetName.messages.rawValue, title: "MESSAGES")
        let fourth = Side(imageName: AssetName.settingIcon.rawValue, title: "SETTINGS")
        let fifth = Side(imageName: AssetName.logout.rawValue, title: "LOGOUT")
        
        return [first, second, third, fourth, fifth]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadData), name: .sideMenuReloadData, object: nil)
        
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .sideMenuReloadData, object: nil)
    }
    
    @objc private func reloadData() {
        tableView.reloadData()
    }
}

//MARK; handle tableview
extension SideController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sides.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! SideCell
        
        cell.backgroundColor = StyleGuideManager.currentPageIndicatorGreenTintColor
        cell.selectionStyle = .none
        
        let side = sides[indexPath.row]
        cell.side = side
        
        if indexPath.row == sides.count - 1 {
            cell.seperatorLineView.isHidden = true
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var navController: UINavigationController?
        
        if indexPath.row == 0 {
            let layout = UICollectionViewFlowLayout()
            let homeController = HomeTabBarController(collectionViewLayout: layout)
            navController = UINavigationController(rootViewController: homeController)
        } else if indexPath.row == 4 {
            
            self.handleLogOff()
            
        } else if indexPath.row == 1 {
            
            let profileController = ProfileController()
            navController = UINavigationController(rootViewController: profileController)
        } else if indexPath.row == 2 {
            
            let forumController = ForumController()
            navController = UINavigationController(rootViewController: forumController)
        } else if indexPath.row == 3 {
            
            let settingController = SettingControllr()
            navController = UINavigationController(rootViewController: settingController)
        }
        
        guard let embedController = navController else { return }
        
        sideMenuController?.embed(centerViewController: embedController)
        
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 150, height: 165))
        containerView.backgroundColor = StyleGuideManager.currentPageIndicatorGreenTintColor
        
        let imageView = UIImageView(frame: CGRect(x: 35, y: 35, width: 80, height: 80))
        imageView.image = UIImage(named: AssetName.appLogo.rawValue)
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 40
        imageView.layer.masksToBounds = true
        
        let userDefaults = UserDefaults.standard
        if let profileImageName = userDefaults.getImage() {
            imageView.image = UIImage(named: profileImageName)
        } else {
            if let fullname = userDefaults.getFullname() {
                imageView.image = UIImage.makeLetterAvatar(withUsername: fullname)
            }
        }
        
        containerView.addSubview(imageView)
        
        let label = UILabel(frame: CGRect(x: 0, y: 125, width: 150, height: 40))
        label.font = UIFont.systemFont(ofSize: 25)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "Olivia's User"
        if let username = userDefaults.getUsername() {
            label.text = username
        }
        
        containerView.addSubview(label)
        
        
        
        return containerView
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 165
    }
}

//MARK: handle logout
extension SideController {
    @objc fileprivate func handleLogOff() {
        self.showJHTAlertDefaultWithIcon(message: "Are you sure you want to Log out?", firstActionTitle: "No", secondActionTitle: "Yes") { (action) in
            
            UserDefaults.standard.setIsLoggedIn(value: false)
            
            let loginController = LoginController()
            self.present(loginController, animated: true, completion: nil)
        }
    }
}

//MARK: setup Views
extension SideController {
    
    fileprivate func setupViews() {
        setupTableView()
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
    
    private func setupTableView() {
        tableView.backgroundColor = StyleGuideManager.currentPageIndicatorGreenTintColor
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        
        tableView.register(SideCell.self, forCellReuseIdentifier: cellId)
    }
    
}
