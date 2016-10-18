//
//  RecipeViewController.swift
//  SimpleChef
//
//  Created by Thanasi Stratigakis on 10/18/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController {
    
    
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
    let instuctionsView: UIView = {
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
    
    // Reference to all ingredient labels
    var ingredientLabelsArray: [UILabel] = []
    


    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()

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
        
        // Instructions View
        self.informationView.addSubview(instuctionsView)
        instuctionsView.snp.makeConstraints { (make) in
            make.top.equalTo(ingredientsView.snp.bottom)
            make.left.equalTo(informationView.snp.left)
            make.right.equalTo(informationView.snp.right)
            make.height.equalTo(150)
        }
    
    }
    
    func setupIngredientsView() {
        self.ingredientsView.addSubview(ingredientsLabel)
        ingredientsLabel.snp.makeConstraints { (make) in
            make.top.equalTo(ingredientsView.snp.top).offset(8)
            make.left.equalTo(ingredientsView.snp.left).offset(14)
            make.right.equalTo(ingredientsView.snp.right)
        }
        createIngredientLabel(ingredient: "Eggs")
        createIngredientLabel(ingredient: "Bacon")
        createIngredientLabel(ingredient: "Ham")
        print(ingredientLabelsArray)
        
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
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
