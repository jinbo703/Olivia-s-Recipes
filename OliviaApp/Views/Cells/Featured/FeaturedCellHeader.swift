//
//  FeaturedCellHeader.swift
//  OliviaApp
//
//  Created by John Nik on 11/24/17.
//  Copyright © 2017 johnik703. All rights reserved.
//

import UIKit

class FeaturedCellHeader: BaseCell {
    
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
        imageView.image = UIImage(named: "dish5.jpg")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let titleLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Featured\nRecipe 1"
        label.font = UIFont.italicSystemFont(ofSize: 30)
        label.textColor = .white
        label.numberOfLines = 2
        return label
        
    }()
    
    lazy var commentButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("Comment(0)", for: .normal)
        button.setTitleColor(UIColor(white: 0.9, alpha: 0.8), for: .normal)
        return button
        
    }()
    
    override func setupViews() {
        
        addSubview(dishImageView)
        addSubview(titleLabel)
        addSubview(commentButton)
        
        dishImageView.anchorToTop(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        
        _ = titleLabel.anchor(nil, left: leftAnchor, bottom: bottomAnchor, right: nil, topConstant: 0, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: 200, heightConstant: 80)
        
        _ = commentButton.anchor(nil, left: nil, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 10, widthConstant: 120, heightConstant: 30)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}
