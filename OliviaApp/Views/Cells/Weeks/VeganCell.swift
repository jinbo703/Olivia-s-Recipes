//
//  VeganCell.swift
//  OliviaApp
//
//  Created by John Nik on 11/22/17.
//  Copyright © 2017 johnik703. All rights reserved.
//

import UIKit

class VeganCell: ClassicCell {
    override func fetchWeekContents() {
        ApiService.sharedInstance.fetchVeganWeekContents { (weekContents: [RecipeContent]) in
            
            self.weekContents = weekContents
            self.collectionView.reloadData()
            
        }
    }
}
