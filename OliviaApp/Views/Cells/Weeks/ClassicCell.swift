//
//  ClassicCell.swift
//  OliviaApp
//
//  Created by John Nik on 11/22/17.
//  Copyright © 2017 johnik703. All rights reserved.
//

import UIKit

class ClassicCell: BaseCell {
    
    let cellId = "cellId"
    
    var homeController: HomeTabBarController?
    
    var weekContents = [RecipeContent]()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    override func setupViews() {
        super.setupViews()
        
        fetchWeekContents()
        
        addSubview(collectionView)
        addConnstraintsWith(Format: "H:|[v0]|", views: collectionView)
        addConnstraintsWith(Format: "V:|[v0]|", views: collectionView)
        
        collectionView.register(WeekCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    func fetchWeekContents() {
        
        ApiService.sharedInstance.fetchClassicWeekContents { (weekContents: [RecipeContent]) in
            self.weekContents = weekContents
            self.collectionView.reloadData()
        }
    }
}

extension ClassicCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weekContents.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! WeekCell
        
        cell.weekContent = weekContents[indexPath.item]
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height = frame.width * 267 / 750
        return CGSize(width: frame.width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let weekContent = weekContents[indexPath.item]
        
        let layout = UICollectionViewFlowLayout()
        let recipesDetailController = RecipesDetailController(collectionViewLayout: layout)
        recipesDetailController.weekContent = weekContent
        homeController?.navigationController?.pushViewController(recipesDetailController, animated: true)
    }
    
}
