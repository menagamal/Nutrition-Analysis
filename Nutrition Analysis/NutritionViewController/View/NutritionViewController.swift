//
//  ViewController.swift
//  Nutrition Analysis
//
//  Created by Mena Gamal on 19/05/2021.
//

import UIKit
import RxCocoa
class NutritionViewController: UIViewController {

    @IBOutlet weak var addRecipeView: UIView!
    @IBOutlet weak var ingredientsView: UIView!
    
    @IBOutlet weak var labelRecipeTitle: UILabel!
    
    @IBOutlet weak var tableViewIngredient: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addRecipe(_ sender: UIButton) {
    }
    
    @IBAction func addIngredient(_ sender: UIButton) {
    }
}

