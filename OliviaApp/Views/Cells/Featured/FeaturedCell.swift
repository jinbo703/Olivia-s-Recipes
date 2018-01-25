//
//  FeaturedCell.swift
//  OliviaApp
//
//  Created by John Nik on 11/22/17.
//  Copyright © 2017 johnik703. All rights reserved.
//

import UIKit

class FeaturedCell: BaseCell {
    
    let specialCellId = "specialCellId"
    let headerId = "headerId"
    let recipeCellId = "recipeCellId"
    
    fileprivate let sectionInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    
    var homeController: HomeTabBarController?
    
    var featuredContents = [RecipeContent]()
    
    lazy var collectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
        let layout = customLayout()
        layout.delegate = self
        layout.columnCount = 2
        layout.headerReferenceSize = CGSize(width: frame.width, height: 180)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    override func setupViews() {
        
        addSubview(collectionView)
        addConnstraintsWith(Format: "H:|[v0]|", views: collectionView)
        addConnstraintsWith(Format: "V:|[v0]|", views: collectionView)
        
        collectionView.register(SpecialRecipeCell.self, forCellWithReuseIdentifier: specialCellId)
        collectionView.register(FeaturedRecipeCell.self, forCellWithReuseIdentifier: recipeCellId)
        collectionView.register(FeaturedCellHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
        
        fetchFeaturedContents()
        
    }
    
    private func fetchFeaturedContents() {
        ApiService.sharedInstance.fetchFeaturedContents { (contents: [RecipeContent]) in
            
            self.featuredContents = contents
            self.collectionView.reloadData()
            
        }
    }
}

extension FeaturedCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, customLayoutDelegate {
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return featuredContents.count - 1
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let featuredContent = featuredContents[indexPath.row + 1]
        
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: specialCellId, for: indexPath) as! SpecialRecipeCell
            cell.featuredContent = featuredContent
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: recipeCellId, for: indexPath) as! FeaturedRecipeCell
            cell.featuredContent = featuredContent
            return cell
        }
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height: CGFloat = 130
        let paddingSpace = sectionInsets.left * 3
        let availableWidth = frame.width - paddingSpace
        let widthPerItem = availableWidth / 2
        if indexPath.item == 0 {
            return CGSize(width: widthPerItem, height: height * 2 + sectionInsets.left)
        }
        
        return CGSize(width: widthPerItem, height: height)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        handleShowingRecipesDetailWithContent(featuredContents[indexPath.item + 1])
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! FeaturedCellHeader
        
        headerView.featuredContent = featuredContents[0]
        
        headerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleShowFeaturedRecipeDetail)))
        
        return headerView
        
    }
    
    
    private func handleShowingRecipesDetailWithContent(_ content: RecipeContent) {
        
        let layout = UICollectionViewFlowLayout()
        let recipesDetailController = RecipesDetailController(collectionViewLayout: layout)
        recipesDetailController.weekContent = content
        homeController?.navigationController?.pushViewController(recipesDetailController, animated: true)
        
    }
    
    @objc private func handleShowFeaturedRecipeDetail() {
        let layout = UICollectionViewFlowLayout()
        let recipesDetailController = RecipesDetailController(collectionViewLayout: layout)
        recipesDetailController.weekContent = featuredContents[0]
        homeController?.navigationController?.pushViewController(recipesDetailController, animated: true)
    }
    
    
    
}
