//
//  WeekCell.swift
//  OliviaApp
//
//  Created by John Nik on 11/12/17.
//  Copyright © 2017 johnik703. All rights reserved.
//

import UIKit

class WeekCell: BaseCell {
    
    var weekContent: RecipeContent? {
    
        didSet {
            
            guard let weekContent = weekContent else {
                return
            }
            
            if let imageName = weekContent.imageUrl {
                self.weekImageView.image = UIImage(named: imageName)
            }
            
            if let title = weekContent.title {
                self.titleLabel.text = title
            }
            
        }
    }
    
    let weekImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.backgroundColor = .green
        imageView.contentMode = .scaleAspectFill
        return imageView
        
    }()
    
    let titleLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Week"
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont.italicSystemFont(ofSize: 40)
        return label
        
    }()
    
    override func setupViews() {
        
        addSubview(weekImageView)
        addSubview(titleLabel)
    
        _ = weekImageView.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        _ = titleLabel.anchor(nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 30, bottomConstant: 25, rightConstant: 0, widthConstant: 0, heightConstant: 30)
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
