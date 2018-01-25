//
//  SpecialRecipeCell.swift
//  OliviaApp
//
//  Created by John Nik on 11/24/17.
//  Copyright © 2017 johnik703. All rights reserved.
//

import UIKit

class SpecialRecipeCell: BaseCell {
    
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
            
            if let detail = featuredContent.recipeInfo?.recipe {
                self.detailTextView.text = detail
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
    
    let whiteBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 235, g: 235, b: 235)
        return view
    }()
    
    
    
    let titleLabel: UILabel = {
        
        let label = UILabel()
        label.textColor = StyleGuideManager.currentPageIndicatorGreenTintColor
        label.font = UIFont.italicSystemFont(ofSize: 18)
        label.text = "Recipe\n2"
        label.numberOfLines = 2
        return label
        
    }()
    
    let specialDayLabel: UILabel = {
        let label = UILabel()
        label.textColor = StyleGuideManager.currentPageIndicatorGreenTintColor
        label.text = "Special Today"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let detailTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Frisee and Baby Spinach Salad with Roasted Walnut, Crumbled Blue Cheese, Sweet Apple"
        textView.textAlignment = .left
        textView.isUserInteractionEnabled = false
        textView.font = UIFont.systemFont(ofSize: 15)
        textView.backgroundColor = .clear
        textView.textColor = .gray
        return textView
    }()
    
    let commentButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("Comment 0", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
        
    }()
    override func setupViews() {
        
        addSubview(dishImageView)
        addSubview(whiteBackgroundView)
        addSubview(transparentView)
        addSubview(commentButton)
        addSubview(titleLabel)
        addSubview(specialDayLabel)
        addSubview(detailTextView)
        
        _ = dishImageView.anchor(topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 130)
        
        _ = whiteBackgroundView.anchorToTop(dishImageView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        
        _ = transparentView.anchor(nil, left: leftAnchor, bottom: dishImageView.bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 30)
        
        _ = commentButton.anchor(nil, left: nil, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 120, heightConstant: 30)
        commentButton.centerYAnchor.constraint(equalTo: transparentView.centerYAnchor).isActive = true
        
        _ = titleLabel.anchor(whiteBackgroundView.topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 15, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 50)
        
        _ = specialDayLabel.anchor(nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 25)
        
        _ = detailTextView.anchor(titleLabel.bottomAnchor, left: leftAnchor, bottom: specialDayLabel.topAnchor, right: rightAnchor, topConstant: 0, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
}
























