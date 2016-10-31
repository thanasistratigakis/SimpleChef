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
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let ingredientsView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.yellow
        view.translatesAutoresizingMaskIntoConstraints = false
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
    
    let ingredientsContentLabel: UILabel = {
        let label = UILabel()
        label.text = "Lots and lots of texat here"
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.orange
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
        label.backgroundColor = UIColor.green
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
        addData()
        //setupViews()
        setupViewsNew()
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
    }
    
    func setupViewsNew() {
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
        }
        setupIngredientsViewNew()
        

        // Instructions View
        self.informationView.addSubview(instructionsView)
        instructionsView.snp.makeConstraints { (make) in
            make.top.equalTo(ingredientsView.snp.bottom)
            make.left.equalTo(informationView.snp.left)
            make.right.equalTo(informationView.snp.right)
        }
        setupInstructionsViewNew()
    }
    
    func setupIngredientsViewNew() {
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
    
    func setupInstructionsViewNew() {
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
