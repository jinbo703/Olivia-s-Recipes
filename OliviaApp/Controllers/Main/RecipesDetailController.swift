//
//  RecipesDetailController.swift
//  OliviaApp
//
//  Created by John Nik on 11/12/17.
//  Copyright © 2017 johnik703. All rights reserved.
//

import UIKit

class RecipesDetailController: UICollectionViewController {
    
    let groceryListCellId = "groceryListCellId"
    let recipesCellId = "recipesCellId"
    let directionsCellId = "directionsCellId"
    
    var weekContent: RecipeContent? {
        
        didSet {
            navigationItem.title = weekContent?.title
        }
    }
    
    lazy var menuBar: MenuBar = {
        let mb = MenuBar()
        mb.recipesContentController = self
        return mb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
}

//MARK: handle collectionview
extension RecipesDetailController: UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: recipesCellId, for: indexPath) as! RecipeCell
            cell.recipe = weekContent
            
            return cell
        } else if indexPath.item == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: groceryListCellId, for: indexPath)
            
            cell.backgroundColor = .yellow
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: directionsCellId, for: indexPath)
           
            cell.backgroundColor = .purple
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height - 50)
    }
    
    
}

//MARK: handle scroll
extension RecipesDetailController {
    
    func scrollToMenuIndex(menuIndex: Int) {
        let indexPath = IndexPath(item: menuIndex, section: 0)
        collectionView?.scrollToItem(at: indexPath, at: [], animated: true)
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        menuBar.horizontalBArLeftAnchorConstraint?.constant = scrollView.contentOffset.x / 3
        
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let index = targetContentOffset.pointee.x / view.frame.width
        let indexPath = IndexPath(item: Int(index), section: 0)
        menuBar.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
        
    }
}

//MARK: handle dismiss controller
extension RecipesDetailController {
    @objc fileprivate func handleDismissController() {
        navigationController?.popViewController(animated: true)
    }
}
//MARK: setup views
extension RecipesDetailController {
    
    fileprivate func setupViews() {
        setupNavBar()
        setupMenuBar()
        setupCollectionView()
//        setupStatusBar()
    }
    
    private func setupNavBar() {
        
        let dismissImage = UIImage(named: AssetName.leftArrow.rawValue)
        let dismissButton = UIBarButtonItem(image: dismissImage, style: .plain, target: self, action: #selector(handleDismissController))
        navigationItem.leftBarButtonItem = dismissButton
        
    }
    
    private func setupCollectionView() {
        
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 0
        }
        
        collectionView?.backgroundColor = .lightGray
        
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: groceryListCellId)
        collectionView?.register(RecipeCell.self, forCellWithReuseIdentifier: recipesCellId)
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: directionsCellId)
        
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







