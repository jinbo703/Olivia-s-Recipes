//
//  RecipeContent.swift
//  OliviaApp
//
//  Created by John Nik on 11/25/17.
//  Copyright © 2017 johnik703. All rights reserved.
//

import UIKit

struct RecipeContent {
    
    let recipeId: String?
    let recipeName: String?
    let imageUrl: String?
    let title: String?
    
    let groceryList: String?
    let directions: String?
    
    let recipeInfo: RecipeInfo?
    
    let comments: [Comment]?
}

struct RecipeInfo {
    
    let recipe: String?
    let prepareTime: String?
    let cookTime: String?
    let serves: String?
    let nutritionalInfo: String?
    
}

struct Comment {
    
    let commentId: String?
    let userId: String?
    let userName: String?
    let fullName: String?
    let imageUrl: String?
    let time: String?
    let comment: String?
    
    let replies: [CommentReply]?
}

struct CommentReply {
    
    let userId: String?
    let userName: String?
    let fullName: String?
    let imageUrl: String?
    let time: String
    let reply: String?
}









