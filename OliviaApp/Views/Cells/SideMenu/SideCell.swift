//
//  SideCell.swift
//  OliviaApp
//
//  Created by John Nik on 11/22/17.
//  Copyright © 2017 johnik703. All rights reserved.
//

import UIKit

class SideCell: UITableViewCell {
    
    var side: Side? {
        
        didSet {
            
            guard let side = self.side else { return }
            
            self.iconImageView.image = UIImage(named: side.imageName)
            self.titleLabel.text = side.title
            
        }
        
    }
    
    let iconImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
        
    }()
    
    let titleLabel: UILabel = {
        
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        return label
        
    }()
    
    let seperatorLineView: UIView = {
        
        let view = UIView()
        view.backgroundColor = .darkGray
        return view
        
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        
    }
    
    private func setupViews() {
        
        addSubview(iconImageView)
        addSubview(titleLabel)
        addSubview(seperatorLineView)
        
        _ = iconImageView.anchor(topAnchor, left: nil, bottom: nil, right: nil, topConstant: 15, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        iconImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        _ = titleLabel.anchor(iconImageView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 15)
        
        _ = seperatorLineView.anchor(nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 20, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
