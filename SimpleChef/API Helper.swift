//
//  API Helper.swift
//  SimpleChef
//
//  Created by Bob De Kort on 10/26/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol SearchResultProtocol {
    func dataLoaded(resultArray: [SearchResults])
}

protocol RecipeInfoProtocol{
    func recipeLoaded(instructionArray: [String])
}

class APIHelper {
    
    var APIkey = "EW5WjiJFqDmshK42DVEXJ255dL5ap1nWqePjsn0yWAsFv5plAc"
    var delegate: SearchResultProtocol?
    var infoDelegate: RecipeInfoProtocol?
    
    func requestRecipes(query: String){
        let urlString = "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/search?query=\(query)"
        let url = URL(string: urlString)
        let mutableRequest = NSMutableURLRequest(url: url!)
        mutableRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        mutableRequest.setValue("EW5WjiJFqDmshK42DVEXJ255dL5ap1nWqePjsn0yWAsFv5plAc", forHTTPHeaderField: "X-Mashape-Key")
        
        
        let task = URLSession.shared.dataTask(with: mutableRequest as URLRequest, completionHandler: { data, response, error -> Void in
            if let actualData = data {
                let json = JSON(data: actualData)
                let searchResults = APIHelper.searchParser(json: json)
                
                // check for ingredient list / future equipment list
                for result in searchResults{
                    APIHelper.getRecipeById(id: result.recipeId, stepBreakdown: false, completion: { tempJson in
                        if let json = tempJson{
                            var ingredientsList: [String] = []
                            var resultArray: [SearchResults] = []
                            let steps = json[0]["steps"].array
                            let ingredientsArray = steps?[0]["ingredients"].array
                            
                            for ingredient in ingredientsArray!{
                                ingredientsList.append(ingredient["name"].string!)
                            }
                            
                            if ingredientsList.count <= 5 {
                                resultArray.append(result)
                                if let delegate = self.delegate {
                                    delegate.dataLoaded(resultArray: resultArray)
                                }
                            }
                        }})
                }
            } else {
                print("no data received: \(error)")
            }})
        task.resume()
    }

    static func searchParser(json: JSON) -> [SearchResults]{
        let jsonRecipeArray = json["results"].array
        var resultArray: [SearchResults] = []
        
        if let recipeArray = jsonRecipeArray{
            for recipe in recipeArray{
                let recipeId = recipe["id"].int
                let recipeName = recipe["title"].string
                let imageUrl = recipe["image"].string
                
                resultArray.append(SearchResults(id: String(recipeId!), name: recipeName!, imageUrl: imageUrl!))
            }
        }
        return resultArray
    }
    
    static func getRecipeById(id: String, stepBreakdown: Bool, completion: @escaping (_ json: JSON?) -> Void){

        let urlString = "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/\(id)/analyzedInstructions?stepBreakdown=\(stepBreakdown)"
        let session = URLSession.shared
        let url = URL(string: urlString)
        let mutableRequest = NSMutableURLRequest(url: url!)
        mutableRequest.setValue("EW5WjiJFqDmshK42DVEXJ255dL5ap1nWqePjsn0yWAsFv5plAc", forHTTPHeaderField: "X-Mashape-Key")
        
        let task = session.dataTask(with: mutableRequest as URLRequest, completionHandler: { data, response, error -> Void in
            if let actualData = data {
                let json = JSON(data: actualData)
                completion(json)
            }
            else {
                print("no data received: \(error)")
            }
        })
        task.resume()
    }
    
    func getStepByStep(id: String, name: String, imgUrl: String){
        APIHelper.getRecipeById(id: id, stepBreakdown: true, completion: { tempJson in
            if let json = tempJson{
                var instructionArray: [String] = []
                let steps = json[0]["steps"].array
                for step in steps! {
                    instructionArray.append(step["step"].string!)
                }
                if let delegate = self.infoDelegate {
                    delegate.recipeLoaded(instructionArray: instructionArray)
                }
            }})
    }
//    static func checkIngredientList(recipeId: String, completion: @escaping (_ bool: Bool?, _ ingredientList: [String]?) -> Void){
//        getRecipeById(id: recipeId, stepBreakdown: false, completion: { tempJson -> Void in
//            if let json = tempJson{
//                var result: Bool
//                var ingredientsList: [String] = []
//                let steps = json[0]["steps"].array
//                let ingredientsArray = steps?[0]["ingredients"].array
//                
//                for ingredient in ingredientsArray!{
//                    ingredientsList.append(ingredient["name"].string!)
//                }
//                
//                if ingredientsList.count <= 5 {
//                    result = true
//                } else {
//                    result = false
//                }
//                completion(result, ingredientsList)
//            }
//        })
//    }
    
//    static func checkEquipmentList(recipeId: String) -> (Bool, [String]?){
//        var result: Bool = true
//        var equipmentList: [String]
//        
//        getRecipeById(id: recipeId, stepBreakdown: false, completion: { tempJson -> Void in
//            if let json = tempJson{
//                let steps = json[0]["steps"].array
//                let equipmentArray = steps?[0]["equipment"].array
//                var equipmentList: [String] = []
//                
//                for equipment in equipmentArray!{
//                    equipmentList.append(equipment["name"].string!)
//                }
//            }})
//        return (result, equipmentList)
//    }
    
//    static func getInstructions(recipeId: String){
//        var instructionArray: [String] = []
//        getRecipeById(id: recipeId, stepBreakdown: true, completion: { tempJson -> Void in
//            if let json = tempJson{
//                let steps = json[0]["steps"].array
//                for step in steps! {
//                    instructionArray.append(step["step"].string!)
//                }
//            }})
//    }
    
    static func loadImage(path: String) -> UIImage{
        let url = URL(string: path)!
        var image = UIImage()
        let session = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                return
            }
            
            image = UIImage(data: data)!
        }
        session.resume()
        return image
    }
}

struct SearchResults{
    let recipeId: String
    let recipeName: String
    let imageUrl: String
    
    let baseImageUrl = "https://spoonacular.com/recipeImages/"
    
    init(id: String, name: String, imageUrl: String) {
        self.recipeId = id
        self.recipeName = name
        self.imageUrl = baseImageUrl + imageUrl
    }
}




