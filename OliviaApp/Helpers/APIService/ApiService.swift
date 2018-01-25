//
//  ApiService.swift
//  OliviaApp
//
//  Created by John Nik on 11/22/17.
//  Copyright © 2017 johnik703. All rights reserved.
//

import UIKit

let recipe = "1. Pair this entree with a simple rice pilaf; Heat 1 tablespoon canola oil in a large saucepan over medium-high heat.\n\n2. Add 1/2 cup chopped onion and 2 teasppons grated peeled fresh ginger to pan; saute 2 minutes.\n\n3. Stir in 1 cup water, 1/2 cup long-grain rice, and 1/4 teasppon salt; bring to a boil.\n\n4. Cover, reduce heat, and simmer 12 minutes or until liquid is absorbed.\n\n5. Remove from heat; stir in 2 tablespoons chopped fresh cilantro.\n\n6. Add 1/2 cup chopped onion and 2 teasppoons grated peeled fresh ginger.\n\n5. Remove from heat; stir in 2 tablespoons chopped fresh cilantro.\n\n6. Add 1/2 cup chopped onion and 2 teasponns grated peeled fresh ginger."

let nutritionalInfo = "Calories 257\nFat 9g\nMonofat 42g\nPolyfat 23g\nProtein 26g\nCarbohydrate 17g\nFiber 19g"

class ApiService: NSObject {
    
    static let sharedInstance = ApiService()
    
    let baseUrl = "https://s3-us-west-2.amazonaws.com/youtubeassets"
    
    func fetchClassicWeekContents(completion: @escaping ([RecipeContent]) -> ()) {
        fetchWeekContentsWithUrlString("\(baseUrl)/home.json", numbers: ["3", "4", "5", "1", "2"], completion: completion)
        
    }
    
    func fetchFamilyWeekContents(completion: @escaping ([RecipeContent]) -> ()) {
        fetchWeekContentsWithUrlString("\(baseUrl)/trending.json", numbers: ["1", "3", "4", "2", "5"], completion: completion)
    }
    
    func fetchVeganWeekContents(completion: @escaping ([RecipeContent]) -> ()) {
        fetchWeekContentsWithUrlString("\(baseUrl)/subscriptions.json", numbers: ["2", "5", "4", "3", "1"], completion: completion)
    }
    
    func fetchWeekContentsWithUrlString(_ urlString: String, numbers: [String], completion: @escaping ([RecipeContent]) -> ()) {
//        let url = URL(string: urlString)
        
        let recipeInfo = RecipeInfo(recipe: recipe, prepareTime: "20 Minutes", cookTime: "20 Minutes", serves: "4 Persons", nutritionalInfo: nutritionalInfo)
        
        let comment1 = Comment(commentId: nil, userId: nil, userName: "LANA WINTERS", fullName: "LANA WINTERS", imageUrl: nil, time: "2 DAYS AGO", comment: "Maecenas vestibulum ex at libero pulvina. et iaculis diam condimentum. Proin nec est sit amet", replies: [CommentReply(userId: nil, userName: "ELSA PEPPERS", fullName: "ELSA PEPPERS", imageUrl: nil, time: "2 DAYS AGO", reply: "Mae cenas vestibulum ex at libero pulviar. et iaculis diam")])
        let comment2 = Comment(commentId: nil, userId: nil, userName: "LANA WINTERS", fullName: "LANA WINTERS", imageUrl: nil, time: "2 DAYS AGO", comment: "Maecenas vestibulum ex at libero pulvina. et iaculis diam condimentum. Proin nec est sit amet", replies: [ CommentReply(userId: nil, userName: "ELSA PEPPERS", fullName: "ELSA PEPPERS", imageUrl: nil, time: "2 DAYS AGO", reply: "Mae cenas vestibulum ex at libero pulviar. et iaculis diam")])
        
        let recipe1 = RecipeContent(recipeId: nil, recipeName: "Peameal bacon", imageUrl: "weeks-\(numbers[0]).jpg", title: "Week1", groceryList: nil, directions: nil, recipeInfo: recipeInfo, comments: [comment1, comment2])
        
        let recipe2 = RecipeContent(recipeId: nil, recipeName: "Nanaimo bar", imageUrl: "weeks-\(numbers[1]).jpg", title: "Week2", groceryList: nil, directions: nil, recipeInfo: recipeInfo, comments: [comment1, comment2])
        
        let recipe3 = RecipeContent(recipeId: nil, recipeName: "Bannock Burger", imageUrl: "weeks-\(numbers[2]).jpg", title: "Week3", groceryList: nil, directions: nil, recipeInfo: recipeInfo, comments: [comment1, comment2])
        
        let recipe4 = RecipeContent(recipeId: nil, recipeName: "Quebecois meat pie", imageUrl: "weeks-\(numbers[3]).jpg", title: "Week4", groceryList: nil, directions: nil, recipeInfo: recipeInfo, comments: [comment1, comment2])
        
        let recipe5 = RecipeContent(recipeId: nil, recipeName: "Poutine", imageUrl: "weeks-\(numbers[4]).jpg", title: "Week5", groceryList: nil, directions: nil, recipeInfo: recipeInfo, comments: [comment1, comment2])
        
        
        
        completion([recipe1, recipe2, recipe3, recipe4, recipe5])
        
    }
    
    func fetchFeaturedContents(completion: ([RecipeContent]) -> ()) {
        fetchFeaturedContentsWithUrlString("\(baseUrl)", completion: completion)
    }
    
    func fetchFeaturedContentsWithUrlString(_ urlString: String, completion: ([RecipeContent]) -> ()) {
        
//        let recipe1 = FeaturedContent(imageUrl: "dish6.jpg", recipe: "Featured\nRecipe 1", commentsCount: "12", detail: nil)
//        let recipe2 = FeaturedContent(imageUrl: "dish5.jpg", recipe: "Recipe\n2", commentsCount: "23", detail: "Frisee and Baby Spinach Salad with Roasted Walnut, Crumbled Blue Cheese, Sweet Apple")
//        let recipe3 = FeaturedContent(imageUrl: "dish3.jpg", recipe: "Recipe 3", commentsCount: "9", detail: nil)
//        let recipe4 = FeaturedContent(imageUrl: "weeks-5.jpg", recipe: "Recipe 4", commentsCount: "15", detail: nil)
//        let recipe5 = FeaturedContent(imageUrl: "dish4.jpg", recipe: "Recipe 5", commentsCount: "19", detail: nil)
//        let recipe6 = FeaturedContent(imageUrl: "dish6.jpg", recipe: "Recipe 6", commentsCount: "7", detail: nil)
        
        let recipeInfo = RecipeInfo(recipe: recipe, prepareTime: "20 Minutes", cookTime: "20 Minutes", serves: "4 Persons", nutritionalInfo: nutritionalInfo)
        
        let comment1 = Comment(commentId: nil, userId: nil, userName: "LANA WINTERS", fullName: "LANA WINTERS", imageUrl: nil, time: "2 DAYS AGO", comment: "Maecenas vestibulum ex at libero pulvina. et iaculis diam condimentum. Proin nec est sit amet", replies: [CommentReply(userId: nil, userName: "ELSA PEPPERS", fullName: "ELSA PEPPERS", imageUrl: nil, time: "2 DAYS AGO", reply: "Mae cenas vestibulum ex at libero pulviar. et iaculis diam")])
        let comment2 = Comment(commentId: nil, userId: nil, userName: "LANA WINTERS", fullName: "LANA WINTERS", imageUrl: nil, time: "2 DAYS AGO", comment: "Maecenas vestibulum ex at libero pulvina. et iaculis diam condimentum. Proin nec est sit amet", replies: [ CommentReply(userId: nil, userName: "ELSA PEPPERS", fullName: "ELSA PEPPERS", imageUrl: nil, time: "2 DAYS AGO", reply: "Mae cenas vestibulum ex at libero pulviar. et iaculis diam")])
        
        let recipe1 = RecipeContent(recipeId: nil, recipeName: "Peameal bacon", imageUrl: "dish6.jpg", title: "Featured\nRecipe 1", groceryList: nil, directions: nil, recipeInfo: recipeInfo, comments: [comment1, comment2, comment1, comment1, comment2])
        
        let recipe2 = RecipeContent(recipeId: nil, recipeName: "Nanaimo bar", imageUrl: "dish5.jpg", title: "Recipe\n2", groceryList: nil, directions: nil, recipeInfo: recipeInfo, comments: [comment1, comment2, comment2, comment1])
        
        let recipe3 = RecipeContent(recipeId: nil, recipeName: "Bannock Burger", imageUrl: "dish3.jpg", title: "Recipe 3", groceryList: nil, directions: nil, recipeInfo: recipeInfo, comments: [comment1, comment2, comment1, comment1, comment1, comment1, comment1])
        
        let recipe4 = RecipeContent(recipeId: nil, recipeName: "Quebecois meat pie", imageUrl: "weeks-5.jpg", title: "Week4", groceryList: nil, directions: nil, recipeInfo: recipeInfo, comments: [comment1, comment2, comment2, comment2, comment1, comment1, comment1, comment1, comment1, comment1])
        
        let recipe5 = RecipeContent(recipeId: nil, recipeName: "Poutine", imageUrl: "dish4.jpg", title: "Recipe 5", groceryList: nil, directions: nil, recipeInfo: recipeInfo, comments: [comment1, comment2])
        
        let recipe6 = RecipeContent(recipeId: nil, recipeName: "Poutine", imageUrl: "dish6.jpg", title: "Recipe 5", groceryList: nil, directions: nil, recipeInfo: recipeInfo, comments: [comment1, comment2, comment1, comment1, comment2, comment1, comment1, comment2, comment1, comment1, comment2, comment1])
        
        
        completion([recipe1, recipe2, recipe3, recipe4, recipe5, recipe6])
    }
}




















