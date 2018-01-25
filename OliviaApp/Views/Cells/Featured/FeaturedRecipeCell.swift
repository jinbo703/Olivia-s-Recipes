//
//  RecipeCell1.swift
//  OliviaApp
//
//  Created by John Nik on 11/24/17.
//  Copyright © 2017 johnik703. All rights reserved.
//

import UIKit

class FeaturedRecipeCell: BaseCell {
    
    var featuredContent: RecipeContent? {
        
        didSet {
            
            guard let featuredContent = featuredContent else { return }
            
            if let imageName = featuredContent.imageUrl {
                self.dishImageView.image = UIImage(named: imageName)
            }
            
            if let recipe = featuredContent.title {
                self.titleLabel.text = recipe
            }
            
            if let comments = featuredContent.comments?.count {
                self.commentButton.setTitle("Comment (\(comments))", for: .normal)
            }
            
        }
        
    }
    
    let dishImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "dish1.jpg")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
        
    }()
    
    let transparentView: UIView = {
        let view = UIView()
        view.backgroundColor = StyleGuideManager.transparentColor
        return view
    }()
    
    let titleLabel: UILabel = {
        
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.italicSystemFont(ofSize: 18)
        label.text = "Recipe 3"
        return label
        
    }()
    
    let commentButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("Comment 0", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
        
    }()
    
    override func setupViews() {
        addSubview(dishImageView)
        addSubview(commentButton)
        addSubview(transparentView)
        addSubview(titleLabel)
        
        _ = dishImageView.anchorToTop(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        
        _ = transparentView.anchor(nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 30)
        
        _ = titleLabel.anchor(nil, left: leftAnchor, bottom: transparentView.topAnchor, right: rightAnchor, topConstant: 0, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 30)
        
        _ = commentButton.anchor(nil, left: nil, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 120, heightConstant: 30)
        commentButton.centerYAnchor.constraint(equalTo: transparentView.centerYAnchor).isActive = true
        
    }
    
}














