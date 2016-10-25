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
    var recipeImage: UIImage
    
    init() {
        self.recipeName = "Salmon with Brown Sugar Glaze"
        self.ingredientsArray = ["1/4 cup packed light brown sugar", "2 tablespoons Dijon Mustard", "4 boneless salmon fillets", "salt and ground black pepper"]
        self.instructionsArray = ["Preheat the oven's broiler and set the oven rack at about 6 inches from the heat source; prepare the rack of a broiler pan with cooking spray.", "Season the salmon with salt and pepper and arrange onto the prepared broiler pan. Whisk together the brown sugar and Dijon mustard in a small bowl; spoon mixture evenly onto top of salmon fillets.", "Cook under the preheated broiler until the fish flakes easily with a fork, 10 to 15 minutes."]
        self.recipeImage = UIImage(named: "Salmon-with-Brown-Sugar-Glaze")!
    }
}
