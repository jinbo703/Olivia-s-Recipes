//
//  StyleGuideManager.swift
//  OliviaApp
//
//  Created by John Nik on 11/22/17.
//  Copyright © 2017 johnik703. All rights reserved.
//

import UIKit

public class StyleGuideManager {
    private init(){}
    
    static let sharedInstance : StyleGuideManager = {
        let instance = StyleGuideManager()
        return instance
    }()
    
    //intro
    static let signinButtonColor = UIColor(r: 0, g: 204, b: 253)
    static let currentPageIndicatorTintColor = UIColor(r: 247, g: 154, b: 27)
    static let currentPageIndicatorGreenTintColor = UIColor(r: 123, g: 147, b: 44)
    static let defaultGreenTintColor = UIColor(r: 132, g: 152, b: 66)
    
    //intro textcolor
    static let firstTextColor = UIColor.black
    static let secondTextColor = UIColor.white
    static let thirdTextColor = UIColor(r: 60, g: 180, b: 75)
    
    //button colors
    static let signinButtonBackgroundColor = UIColor(r: 123, g: 147, b: 44)
    
    //status bar colors
    static let loginStatusBarColor = UIColor(r: 215, g: 214, b: 213)
    static let signupStatusBarColor = UIColor(r: 65, g: 65, b: 65)
    
    //recipe colors
    static let transparentColor = UIColor(white: 0.5, alpha: 0.4)
    
    
    //Fonts
    func loginFontLarge() -> UIFont {
        return UIFont(name: "Helvetica Light", size: 30)!
        
    }
}

