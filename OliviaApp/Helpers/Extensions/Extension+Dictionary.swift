//
//  Extension+Dictionary.swift
//  OliviaApp
//
//  Created by John Nik on 11/19/17.
//  Copyright © 2017 johnik703. All rights reserved.
//

import UIKit

extension Dictionary {
    
    func toNSAttributedStringKeys() -> [NSAttributedStringKey: Any] {
        
        var atts = [NSAttributedStringKey: Any]()
        
        for key in keys {
            
            if let keyString = key as? String {
                atts[NSAttributedStringKey(keyString)] = self[key]
            }
            
        }
        
        return atts
    }
    
}
