//
//  RecipeViewController.swift
//  SimpleChef
//
//  Created by Thanasi Stratigakis on 10/18/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController, RecipeInfoProtocol {
    
    // delegate stuff
    var apiHelper = APIHelper()
    var smallRecipe: SmallRecipe?
    var recipe: Recipes?
    
    
    // var recipe: Recipe?
    var ingredients: [String] = []
    var instructions: [String] = []
    var time: String = "25"
    
    var ingredientsText: String = ""
    var instructionsText: String = ""
    
    
    // Recipe Image UIElements
    let recipeImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = UIColor.clear
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let timeLabel: UILabel = {
        let label  = UILabel()
        label.textColor = UIColor.black
        label.text = "30min"
        label.textAlignment = NSTextAlignment.right
        label.font = UIFont.italicSystemFont(ofSize: 20)
        return label
    }()
    
    // Recipe Information UIElements
    let informationView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let ingredientsView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let instructionsView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        return view
    }()
    
    let ingredientsLabel: UILabel = {
        let label = UILabel()
        label.text = "Ingredients"
        label.textColor = #colorLiteral(red: 0.8585246801, green: 0.3874579072, blue: 0.4668917656, alpha: 1)
        return label
    }()
    
    let ingredientsContentLabel: UILabel = {
        let label = UILabel()
        label.text = "Sample text"
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.clear
        label.lineBreakMode = .byWordWrapping // or NSLineBreakMode.ByWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let instructionsLabel: UILabel = {
        let label = UILabel()
        label.text = "Instructions"
        label.textColor = #colorLiteral(red: 0.8585246801, green: 0.3874579072, blue: 0.4668917656, alpha: 1)
        return label
    }()
    
    let instructionsContentLabel: UILabel = {
        let label = UILabel()
        label.text = "Lots and lots of text here \nand more and longer lines\nand more and longer lines"
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.clear
        label.lineBreakMode = .byWordWrapping // or NSLineBreakMode.ByWordWrapping
        label.numberOfLines = 0

        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Reference to all ingredient labels
    var ingredientLabelsArray: [UILabel] = []
    
    // Reference to all instruction textViews
    var instructionsTextViewArray: [UITextView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.8585246801, green: 0.3874579072, blue: 0.4668917656, alpha: 1)
        self.view.backgroundColor = UIColor.white
        addData()
        setupViews()
        apiHelper.infoDelegate = self
        // apiHelper.getStepByStep(id: searchResults[0].recipeId, name: searchResults[0].recipeName, imgUrl: searchResults[0].imageUrl)
    }
    
    func recipeLoaded(instructionArray: [String]) {
         recipe = Recipes(recipeId: (smallRecipe?.recipeId)!, recipeName: (smallRecipe?.recipeName)!, ingredientArray: (smallRecipe?.ingredientList)!, instructionArray: instructionArray, readyInMinutes: (smallRecipe?.readyInMinutes)!, recipeImageUrl: (smallRecipe?.imageUrl)!)
        // Reload view
    }
    
    func addData() {
        // Ingredients test data
        ingredients.append("Eggs")
        ingredients.append("Bacon")
        ingredients.append("Cheese")
        // Instructions test data
        instructions.append("Crack all the eggs")
        instructions.append("Fry the bacon")
        instructions.append("Set oven to 400° and then add eggs and then wash all of that")
        instructions.append("Mix all the dry ingredients then wet")
        
        
        for ingredient in ingredients {
            ingredientsText += ingredient + "\n"
        }
        for instruction in instructions {
            instructionsText += instruction + "\n"
        }
        
        timeLabel.text = time + "min"
        ingredientsContentLabel.text = ingredientsText
        instructionsContentLabel.text = instructionsText
        self.title = "Chicken"
        
    }
    
    func setupViews() {
        // Recipe Image
        self.view.addSubview(recipeImage)
        recipeImage.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp.top)
            make.left.equalTo(self.view.snp.left)
            make.right.equalTo(self.view.snp.right)
            make.height.equalTo(self.view.frame.width * CGFloat(0.7))
        }
        
        self.view.addSubview(self.timeLabel)
        timeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.recipeImage.snp.bottom).offset(-8)
            make.right.equalTo(self.view.snp.right).offset(-8)
        }
        
        // Information Container View
        self.view.addSubview(informationView)
        informationView.snp.makeConstraints { (make) in
            make.top.equalTo(self.recipeImage.snp.bottom)
            make.left.equalTo(self.view.snp.left)
            make.right.equalTo(self.view.snp.right)
            make.bottom.equalTo(self.view.snp.bottom)
        }
        
        // Ingredients View
        self.informationView.addSubview(ingredientsView)
        ingredientsView.snp.makeConstraints { (make) in
            make.top.equalTo(informationView.snp.top)
            make.left.equalTo(informationView.snp.left)
            make.right.equalTo(informationView.snp.right)
        }
        setupIngredientsView()
        

        // Instructions View
        self.informationView.addSubview(instructionsView)
        instructionsView.snp.makeConstraints { (make) in
            make.top.equalTo(ingredientsView.snp.bottom)
            make.left.equalTo(informationView.snp.left)
            make.right.equalTo(informationView.snp.right)
        }
        setupInstructionsView()
    }
    
    func setupIngredientsView() {
        self.ingredientsView.addSubview(ingredientsLabel)
        ingredientsLabel.snp.makeConstraints { (make) in
            make.top.equalTo(ingredientsView.snp.top).offset(8)
            make.left.equalTo(ingredientsView.snp.left).offset(14)
            make.right.equalTo(ingredientsView.snp.right)
        }
        
        self.ingredientsView.addSubview(ingredientsContentLabel)
        ingredientsContentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(ingredientsLabel.snp.bottom).offset(8)
            make.left.equalTo(ingredientsLabel.snp.left).offset(8)
            make.right.equalTo(ingredientsView.snp.right).offset(-8)
            make.bottom.equalTo(ingredientsView.snp.bottom).offset(-8)
        }
    }
    
    func setupInstructionsView() {
        self.instructionsView.addSubview(instructionsLabel)
        instructionsLabel.snp.makeConstraints { (make) in
            make.top.equalTo(instructionsView.snp.top).offset(8)
            make.left.equalTo(instructionsView.snp.left).offset(14)
            make.right.equalTo(instructionsView.snp.right)
        }

        self.instructionsView.addSubview(instructionsContentLabel)
        instructionsContentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(instructionsLabel.snp.bottom).offset(8)
            make.left.equalTo(instructionsLabel.snp.left).offset(8)
            make.right.equalTo(instructionsView.snp.right).offset(-8)
            make.bottom.equalTo(instructionsView.snp.bottom).offset(-8)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
