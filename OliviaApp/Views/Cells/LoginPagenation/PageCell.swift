//
//  PageCell.swift
//  OliviaApp
//
//  Created by John Nik on 11/22/17.
//  Copyright © 2017 johnik703. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var page: Page? {
        didSet {
            
            guard let page = page else { return }
            
            let imageName = page.imageName
            
            imageView.image = UIImage(named: imageName)
            
            let color = page.textColor
            let attributedText = NSMutableAttributedString(string: page.title, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 24, weight: .medium), NSAttributedStringKey.foregroundColor: color])
            attributedText.append(NSAttributedString(string: "\n\n\(page.message)", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18), NSAttributedStringKey.foregroundColor: color]))
            let paragraphStrye = NSMutableParagraphStyle()
            paragraphStrye.alignment = .center

            let length = attributedText.string.count
            attributedText.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStrye, range: NSRange(location: 0, length: length))

            textView.attributedText = attributedText
        }
    }
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .black
        iv.image = UIImage(named: "a1")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    let appIconImageView: UIImageView = {
        let iv = UIImageView()
//        iv.backgroundColor = .clear
        let image = UIImage(named: AssetName.appLogo.rawValue)
        iv.image = image
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    let textView: UITextView = {
        let tv = UITextView()
        tv.text = "Sample text for now"
        tv.isEditable = false
        tv.contentInset = UIEdgeInsets(top: 4, left: 0, bottom: 0, right: 0)
        tv.backgroundColor = .clear
        return tv
    }()
    
    let lineSeperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.9, alpha: 1)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    func setupViews() {
        addSubview(imageView)
        addSubview(appIconImageView)
        addSubview(textView)
//        addSubview(lineSeperatorView)
        
        imageView.anchorToTop(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        
        _ = appIconImageView.anchor(topAnchor, left: nil, bottom: nil, right: nil, topConstant: 30, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 180, heightConstant: 180)
        appIconImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        textView.anchorWithConstantsToTop(centerYAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        textView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
//
//        lineSeperatorView.anchorToTop(nil, left: leftAnchor, bottom: textView.topAnchor, right: rightAnchor)
//        lineSeperatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}



