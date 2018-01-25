//
//  Extension+String.swift
//  OliviaApp
//
//  Created by John Nik on 11/22/17.
//  Copyright © 2017 johnik703. All rights reserved.
//

import Foundation
public extension String {
    
    var isEmptyStr: Bool{
        return self.trimmingCharacters(in: NSCharacterSet.whitespaces).isEmpty
    }
}
