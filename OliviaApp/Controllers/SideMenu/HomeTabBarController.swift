//
//  HomeTabBarController.swift
//  OliviaApp
//
//  Created by John Nik on 11/22/17.
//  Copyright © 2017 johnik703. All rights reserved.
//

import UIKit

class HomeTabBarController: UICollectionViewController {
    
    let featuredCellId = "featuredCellId"
    let classicCellId = "classicCellId"
    let familyCellId = "familyCellId"
    let veganCellId = "veganCellId"
    
    lazy var menuBar: WeekMenuBar = {
        let mb = WeekMenuBar()
        mb.homeController = self
        return mb
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupViews()
        
        if isLoggedIn() {
            
        } else {
            
            perform(#selector(showLoginController), with: nil, afterDelay: 0.01)
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
}

//MARK: handle check login
extension HomeTabBarController {
    fileprivate func isLoggedIn() -> Bool {
        
        return UserDefaults.standard.isLoggedIn()
    }
    
    @objc func showLoginController() {
        let loginController = LoginController()
        present(loginController, animated: true, completion: {
            
            
            
        })
    }
}

//MARK: handle collectionview
extension HomeTabBarController: UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: featuredCellId, for: indexPath) as! FeaturedCell
            cell.homeController = self
            return cell
        } else if indexPath.item == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: classicCellId, for: indexPath) as! ClassicCell
            cell.homeController = self
            return cell
        } else if indexPath.item == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: familyCellId, for: indexPath) as! FamilyCell
            cell.homeController = self
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: veganCellId, for: indexPath) as! VeganCell
            cell.homeController = self
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height - 95)
    }
    
    
}

//MARK: handle scroll
extension HomeTabBarController {
    
    func scrollToMenuIndex(menuIndex: Int) {
        let indexPath = IndexPath(item: menuIndex, section: 0)
        collectionView?.scrollToItem(at: indexPath, at: [], animated: true)
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        menuBar.horizontalBArLeftAnchorConstraint?.constant = scrollView.contentOffset.x / 4
        
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let index = targetContentOffset.pointee.x / view.frame.width
        let indexPath = IndexPath(item: Int(index), section: 0)
        menuBar.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
        
    }
}


//MARK: Setup views

extension HomeTabBarController {
    
    fileprivate func setupViews() {
        setupNavigationBar()
        setupMenuBar()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 0
        }
        
        collectionView?.backgroundColor = .lightGray
        
        collectionView?.register(FeaturedCell.self, forCellWithReuseIdentifier: featuredCellId)
        collectionView?.register(ClassicCell.self, forCellWithReuseIdentifier: classicCellId)
        collectionView?.register(FamilyCell.self, forCellWithReuseIdentifier: familyCellId)
        collectionView?.register(VeganCell.self, forCellWithReuseIdentifier: veganCellId)
        
        collectionView?.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        
        collectionView?.isPagingEnabled = true
    }
    
    private func setupMenuBar() {
        
        let redView = UIView()
        redView.backgroundColor = StyleGuideManager.currentPageIndicatorGreenTintColor
        view.addSubview(redView)
        view.addConnstraintsWith(Format: "H:|[v0]|", views: redView)
        view.addConnstraintsWith(Format: "V:[v0(50)]", views: redView)
        
        view.addSubview(menuBar)
        
        view.addConnstraintsWith(Format: "H:|[v0]|", views: menuBar)
        view.addConnstraintsWith(Format: "V:[v0(50)]", views: menuBar)
        menuBar.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
    }
    
    private func setupNavigationBar() {
        
        view.backgroundColor = .white
        
        navigationItem.title = "Olivia's Recipes"
    }
    
    
}
