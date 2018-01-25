//
//  RecipeCell.swift
//  OliviaApp
//
//  Created by John Nik on 11/25/17.
//  Copyright © 2017 johnik703. All rights reserved.
//

import UIKit

class RecipeCell: BaseCell {
    
    let cellId = "cellId"
    
    var recipe: RecipeContent? {
        
        didSet {
            
            guard let recipe = recipe else { return }
            
            if let imageUrl = recipe.imageUrl {
                self.dishImageView.image = UIImage(named: imageUrl)
            }
            
            if let recipeName = recipe.recipeName {
                self.titleLabel.text = recipeName
            }
            
            if let prepareTime = recipe.recipeInfo?.prepareTime {
                self.prepareWhiteLabel.text = prepareTime
            }
            
            if let cookTime = recipe.recipeInfo?.cookTime {
                self.cookWhiteLabel.text = cookTime
            }
            
            if let serves = recipe.recipeInfo?.serves {
                self.serveWhiteLabel.text = serves
            }
            
            if let info = recipe.recipeInfo?.nutritionalInfo {
                self.infoTextView.text = info
            }
            
        }
        
    }
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: AssetName.recipeBackground.rawValue)
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let dishImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "dish5.jpg")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let titleLabel: UILabel = {
        
        let label = UILabel()
        label.text = ""
        label.font = UIFont.italicSystemFont(ofSize: 30)
        label.textColor = .white
        label.textAlignment = .center
        return label
        
    }()
    
    let recipePrepareImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: AssetName.recipePrepare.rawValue)?.withRenderingMode(.alwaysOriginal)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let recipeCookImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: AssetName.recipeCook.rawValue)?.withRenderingMode(.alwaysOriginal)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    let recipeServesImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: AssetName.recipeServes.rawValue)?.withRenderingMode(.alwaysOriginal)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    let recipeInfoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: AssetName.recipeInfo.rawValue)?.withRenderingMode(.alwaysOriginal)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let prepareBlackLabel: UILabel = {
        let label = UILabel()
        label.text = "Prepare"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let prepareWhiteLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let cookBlackLabel: UILabel = {
        let label = UILabel()
        label.text = "Cook time"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let cookWhiteLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let serveBlackLabel: UILabel = {
        let label = UILabel()
        label.text = "For"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let serveWhiteLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let infoWhiteLabel: UILabel = {
        let label = UILabel()
        label.text = "Nutritional\nInformation"
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 2
        return label
    }()
    
    let infoTextView: UITextView = {
        let textView = UITextView()
        textView.textAlignment = .left
        textView.textColor = .darkGray
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.backgroundColor = .clear
        textView.isEditable = false
        textView.isSelectable = false
        textView.text = ""
        return textView
        
    }()
    
    lazy var tableView: UITableView = {
        
        let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.backgroundColor = .white
        return tv
    }()
    
    override func setupViews() {
        
        if UI_USER_INTERFACE_IDIOM() == .pad {
            setupRightSideStuffForPad()
        } else if UI_USER_INTERFACE_IDIOM() == .phone {
            
            setupRightSideStuff()
        }
        
        
        
        setupTableView()
    }
    
    private func setupTableView() {
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
        addSubview(tableView)
        
        let tableViewWidth = DEVICE_WIDTH * 2 / 3 - 10
        
        _ = tableView.anchor(dishImageView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, topConstant: 10, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: tableViewWidth, heightConstant: 0)
    }
    
    private func setupRightSideStuffForPad() {
        
        prepareBlackLabel.font = UIFont.systemFont(ofSize: 20)
        prepareWhiteLabel.font = UIFont.systemFont(ofSize: 20)
        cookBlackLabel.font = UIFont.systemFont(ofSize: 20)
        cookWhiteLabel.font = UIFont.systemFont(ofSize: 20)
        serveBlackLabel.font = UIFont.systemFont(ofSize: 20)
        serveWhiteLabel.font = UIFont.systemFont(ofSize: 20)
        infoWhiteLabel.font = UIFont.systemFont(ofSize: 20)
        infoTextView.font = UIFont.systemFont(ofSize: 19)
        
        addSubview(backgroundImageView)
        addSubview(dishImageView)
        addSubview(titleLabel)
        addSubview(recipePrepareImageView)
        addSubview(recipeCookImageView)
        addSubview(recipeServesImageView)
        addSubview(recipeInfoImageView)
        addSubview(prepareBlackLabel)
        addSubview(prepareWhiteLabel)
        addSubview(cookBlackLabel)
        addSubview(cookWhiteLabel)
        addSubview(serveBlackLabel)
        addSubview(serveWhiteLabel)
        addSubview(infoWhiteLabel)
        addSubview(infoTextView)
        
        _ = backgroundImageView.anchorToTop(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        
        _ = dishImageView.anchor(topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 200)
        
        _ = titleLabel.anchor(nil, left: leftAnchor, bottom: dishImageView.bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 35, rightConstant: 0, widthConstant: 0, heightConstant: 40)
        
        let leftConstant = DEVICE_WIDTH / 3 - 100
        
        _ = recipePrepareImageView.anchor(dishImageView.bottomAnchor, left: nil, bottom: nil, right: rightAnchor, topConstant: 40, leftConstant: 0, bottomConstant: 0, rightConstant: leftConstant, widthConstant: 50, heightConstant: 50)
        
        _ = recipeCookImageView.anchor(recipePrepareImageView.bottomAnchor, left: nil, bottom: nil, right: rightAnchor, topConstant: 35, leftConstant: 0, bottomConstant: 0, rightConstant: leftConstant, widthConstant: 50, heightConstant: 50)
        
        _ = recipeServesImageView.anchor(recipeCookImageView.bottomAnchor, left: nil, bottom: nil, right: rightAnchor, topConstant: 35, leftConstant: 0, bottomConstant: 0, rightConstant: leftConstant, widthConstant: 50, heightConstant: 50)
        
        _ = recipeInfoImageView.anchor(recipeServesImageView.bottomAnchor, left: nil, bottom: nil, right: rightAnchor, topConstant: 35, leftConstant: 0, bottomConstant: 0, rightConstant: leftConstant, widthConstant: 50, heightConstant: 50)
        
        _ = prepareBlackLabel.anchor(recipePrepareImageView.topAnchor, left: recipePrepareImageView.rightAnchor, bottom: nil, right: rightAnchor, topConstant: -5, leftConstant: 5, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 25)
        
        _ = prepareWhiteLabel.anchor(nil, left: prepareBlackLabel.leftAnchor, bottom: recipePrepareImageView.bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: -5, rightConstant: 0, widthConstant: 0, heightConstant: 25)
        
        _ = cookBlackLabel.anchor(recipeCookImageView.topAnchor, left: recipeCookImageView.rightAnchor, bottom: nil, right: rightAnchor, topConstant: -5, leftConstant: 5, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 25)
        
        _ = cookWhiteLabel.anchor(nil, left: prepareBlackLabel.leftAnchor, bottom: recipeCookImageView.bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: -5, rightConstant: 0, widthConstant: 0, heightConstant: 25)
        
        _ = serveBlackLabel.anchor(recipeServesImageView.topAnchor, left: recipeServesImageView.rightAnchor, bottom: nil, right: rightAnchor, topConstant: -5, leftConstant: 5, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 25)
        
        _ = serveWhiteLabel.anchor(nil, left: prepareBlackLabel.leftAnchor, bottom: recipeServesImageView.bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: -5, rightConstant: 0, widthConstant: 0, heightConstant: 25)
        
        _ = infoWhiteLabel.anchor(recipeInfoImageView.topAnchor, left: recipeInfoImageView.rightAnchor, bottom: recipeInfoImageView.bottomAnchor, right: rightAnchor, topConstant: -5, leftConstant: 5, bottomConstant: -5, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        _ = infoTextView.anchor(recipeInfoImageView.bottomAnchor, left: recipeInfoImageView.leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
    private func setupRightSideStuff() {
        
        addSubview(backgroundImageView)
        addSubview(dishImageView)
        addSubview(titleLabel)
        addSubview(recipePrepareImageView)
        addSubview(recipeCookImageView)
        addSubview(recipeServesImageView)
        addSubview(recipeInfoImageView)
        addSubview(prepareBlackLabel)
        addSubview(prepareWhiteLabel)
        addSubview(cookBlackLabel)
        addSubview(cookWhiteLabel)
        addSubview(serveBlackLabel)
        addSubview(serveWhiteLabel)
        addSubview(infoWhiteLabel)
        addSubview(infoTextView)
        
        _ = backgroundImageView.anchorToTop(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        
        _ = dishImageView.anchor(topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 200)
        
        _ = titleLabel.anchor(nil, left: leftAnchor, bottom: dishImageView.bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 35, rightConstant: 0, widthConstant: 0, heightConstant: 40)
        
        let leftConstant = DEVICE_WIDTH / 3 - 40
        
        _ = recipePrepareImageView.anchor(dishImageView.bottomAnchor, left: nil, bottom: nil, right: rightAnchor, topConstant: 30, leftConstant: 0, bottomConstant: 0, rightConstant: leftConstant, widthConstant: 25, heightConstant: 25)
        
        _ = recipeCookImageView.anchor(recipePrepareImageView.bottomAnchor, left: nil, bottom: nil, right: rightAnchor, topConstant: 25, leftConstant: 0, bottomConstant: 0, rightConstant: leftConstant, widthConstant: 25, heightConstant: 25)
        
        _ = recipeServesImageView.anchor(recipeCookImageView.bottomAnchor, left: nil, bottom: nil, right: rightAnchor, topConstant: 25, leftConstant: 0, bottomConstant: 0, rightConstant: leftConstant, widthConstant: 25, heightConstant: 25)
        
        _ = recipeInfoImageView.anchor(recipeServesImageView.bottomAnchor, left: nil, bottom: nil, right: rightAnchor, topConstant: 25, leftConstant: 0, bottomConstant: 0, rightConstant: leftConstant, widthConstant: 25, heightConstant: 25)
        
        _ = prepareBlackLabel.anchor(recipePrepareImageView.topAnchor, left: recipePrepareImageView.rightAnchor, bottom: nil, right: rightAnchor, topConstant: -5, leftConstant: 5, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 15)
        
        _ = prepareWhiteLabel.anchor(nil, left: prepareBlackLabel.leftAnchor, bottom: recipePrepareImageView.bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: -5, rightConstant: 0, widthConstant: 0, heightConstant: 15)
        
        _ = cookBlackLabel.anchor(recipeCookImageView.topAnchor, left: recipeCookImageView.rightAnchor, bottom: nil, right: rightAnchor, topConstant: -5, leftConstant: 5, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 15)
        
        _ = cookWhiteLabel.anchor(nil, left: prepareBlackLabel.leftAnchor, bottom: recipeCookImageView.bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: -5, rightConstant: 0, widthConstant: 0, heightConstant: 15)
        
        _ = serveBlackLabel.anchor(recipeServesImageView.topAnchor, left: recipeServesImageView.rightAnchor, bottom: nil, right: rightAnchor, topConstant: -5, leftConstant: 5, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 15)
        
        _ = serveWhiteLabel.anchor(nil, left: prepareBlackLabel.leftAnchor, bottom: recipeServesImageView.bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: -5, rightConstant: 0, widthConstant: 0, heightConstant: 15)
        
        _ = infoWhiteLabel.anchor(recipeInfoImageView.topAnchor, left: recipeInfoImageView.rightAnchor, bottom: recipeInfoImageView.bottomAnchor, right: rightAnchor, topConstant: -5, leftConstant: 5, bottomConstant: -5, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        _ = infoTextView.anchor(recipeInfoImageView.bottomAnchor, left: recipeInfoImageView.leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
    
}

extension RecipeCell: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let textView = UITextView()
        
        textView.text = ""
        
        if let recipeText = self.recipe?.recipeInfo?.recipe {
            textView.text = recipeText
        }
        
        textView.textColor = .darkGray
        textView.isSelectable = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.font = UIFont.systemFont(ofSize: 20)
        return textView
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        let tableViewWidth = DEVICE_WIDTH * 2 / 3 - 10
        
        if let recipeText = self.recipe?.recipeInfo?.recipe {
            let height: CGFloat = estimateFrameForText(text: recipeText, width: Int(tableViewWidth), fontSize: 21).height
            return height
        }
        
        return 0
    }
    
    private func estimateFrameForText(text: String, width: Int, fontSize: Int) -> CGRect {
        
        let size = CGSize(width: width, height: 1000)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        
        return NSString(string: text).boundingRect(with: size, options: options, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: CGFloat(fontSize))], context: nil)
        
    }
    
}


















