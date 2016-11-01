//
//  Recipes.swift
//  SimpleChef
//
//  Created by Maribel Montejano on 10/25/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit

class Recipes {
    var recipeName: String
    var ingredientsArray: [String]
    var instructionsArray: [String]
    // var equipmentArray: [String]
    var recipeImageUrl: String
    
    init(recipeName: String, ingredientArray: [String], instructionArray: [String], recipeImageUrl: String) {
        self.recipeName = recipeName
        self.ingredientsArray = ingredientArray
        self.instructionsArray = instructionArray
        // self.equipmentArray = equipmentArray
        self.recipeImageUrl = recipeImageUrl
    }
}
