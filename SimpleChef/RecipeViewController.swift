//
//  RecipeViewController.swift
//  SimpleChef
//
//  Created by Thanasi Stratigakis on 10/18/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController {
    
    // var recipe: Recipe?
    var ingredients: [String] = []
    var instructions: [String] = []
    
    
    // Recipe Image UIElements
    let recipeImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = UIColor.blue
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    // Recipe Information UIElements
    let informationView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.green
        return view
    }()
    let ingredientsView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.yellow
        return view
    }()
    let instructionsView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.purple
        return view
    }()
    
    let ingredientsLabel: UILabel = {
        let label = UILabel()
        label.text = "Ingredients"
        label.textColor = #colorLiteral(red: 0.8585246801, green: 0.3874579072, blue: 0.4668917656, alpha: 1)
        return label
    }()
    
    let instructionsLabel: UILabel = {
        let label = UILabel()
        label.text = "Instructions"
        label.textColor = #colorLiteral(red: 0.8585246801, green: 0.3874579072, blue: 0.4668917656, alpha: 1)
        return label
    }()
    
    // Reference to all ingredient labels
    var ingredientLabelsArray: [UILabel] = []
    
    // Reference to all instruction textViews
    var instructionsTextViewArray: [UITextView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addData()
        setupViews()
        var recipes = Recipes()
        print(recipes)
    }
    
    func addData() {
        // Ingredients test data
        ingredients.append("Eggs")
        ingredients.append("Bacon")
        ingredients.append("Cheese")
        // Instructions test data
        instructions.append("Crack all the eggs")
        instructions.append("Fry the bacon")
        instructions.append("Set oven to 400° and then add eggs")
        instructions.append("Mix all the dry ingredients then wet")
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
            make.height.equalTo(150)
        }
        setupIngredientsView()
        
        // udate size after adding every ingredient
        ingredientsView.snp.updateConstraints { (make) in
            make.height.equalTo((25 * 3) + 30)
        }
        
        // Instructions View
        self.informationView.addSubview(instructionsView)
        instructionsView.snp.makeConstraints { (make) in
            make.top.equalTo(ingredientsView.snp.bottom)
            make.left.equalTo(informationView.snp.left)
            make.right.equalTo(informationView.snp.right)
            make.height.equalTo(150)
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
        
        // Create a label for every ingredient in the ingredient array
        for ingredient in ingredients {
            createIngredientLabel(ingredient: ingredient)
        }
    }
    
    func createIngredientLabel(ingredient: String) {
        let label = UILabel()
        label.text = ingredient
        ingredientsView.addSubview(label)
        ingredientLabelsArray.append(label)
        if self.ingredientLabelsArray.count <= 1 {
            label.snp.makeConstraints({ (make) in
                make.top.equalTo(self.ingredientsLabel.snp.bottom).offset(0)
                make.left.equalTo(self.ingredientsLabel.snp.left)
                make.right.equalTo(self.ingredientsLabel.snp.right)
            })
        } else {
            label.snp.makeConstraints({ (make) in
                //make.top.equalTo(ingredientLabelsArray[ingredientLabelsArray.count - 1].snp.bottom).offset(4)
                
                make.top.equalTo(self.ingredientsLabel.snp.bottom).offset(25 * CGFloat(ingredientLabelsArray.count - 1))
                make.left.equalTo(self.ingredientsLabel.snp.left)
                make.right.equalTo(self.ingredientsLabel.snp.right)
            })
        }
    }
    
    
    func setupInstructionsView() {
        self.instructionsView.addSubview(instructionsLabel)
        instructionsLabel.snp.makeConstraints { (make) in
            make.top.equalTo(instructionsView.snp.top).offset(8)
            make.left.equalTo(instructionsView.snp.left).offset(14)
            make.right.equalTo(instructionsView.snp.right)
        }
        
        // Create a text view for every instruction in the instructions array
        for instruction in instructions {
            createInstructionsTextView(instruction: instruction)
        }
    }
    
    func createInstructionsTextView(instruction: String) {
        let textView = UITextView()
        textView.text = instruction
        textView.backgroundColor = UIColor.clear
        instructionsView.addSubview(textView)
        instructionsTextViewArray.append(textView)
        if self.instructionsTextViewArray.count <= 1 {
            textView.snp.makeConstraints({ (make) in
                make.top.equalTo(self.instructionsLabel.snp.bottom).offset(0)
                make.left.equalTo(self.instructionsLabel.snp.left)
                make.right.equalTo(self.instructionsLabel.snp.right)
                make.height.equalTo(30)
            })
        } else {
            textView.snp.makeConstraints({ (make) in
                make.top.equalTo(self.instructionsLabel.snp.bottom).offset(25 * CGFloat(instructionsTextViewArray.count - 1))
                make.left.equalTo(self.instructionsLabel.snp.left)
                make.right.equalTo(self.instructionsLabel.snp.right)
                make.height.equalTo(30)
            })
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
