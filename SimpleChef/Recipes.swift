//
//  Recipes.swift
//  SimpleChef
//
//  Created by Maribel Montejano on 10/25/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit

class Recipes {
    var recipeId: String
    var recipeName: String
    var ingredientsArray: [String]
    var instructionsArray: [String]
    // var equipmentArray: [String]
    var readyInMinutes: Int
    var recipeImageUrl: String
    
    init(recipeId: String, recipeName: String, ingredientArray: [String], instructionArray: [String], readyInMinutes: Int, recipeImageUrl: String) {
        self.recipeId = recipeId
        self.recipeName = recipeName
        self.ingredientsArray = ingredientArray
        self.instructionsArray = instructionArray
        // self.equipmentArray = equipmentArray
        self.readyInMinutes = readyInMinutes
        self.recipeImageUrl = recipeImageUrl
    }
}
