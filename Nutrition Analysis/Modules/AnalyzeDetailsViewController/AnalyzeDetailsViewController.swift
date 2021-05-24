//
//  AnalyzeDetailsViewController.swift
//  Nutrition Analysis
//
//  Created by Mena Gamal on 24/05/2021.
//

import UIKit

class AnalyzeDetailsViewController: UIViewController {

    @IBOutlet weak var detailsStackView: UIStackView!
    @IBOutlet weak var labelTitle: UILabel!
 
    var model: NutritionAnalyzeResponse!
    var state: NutritionDetailsState!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switch state {
        case .Recipe:
            recipeDetailsLayout()
            break
        case .Ingredient:
            ingredientDetailsLayout()
            break
        case .none:
           break
        }
    }

    @IBAction func backAction(_ sender: Any) {
        _ = self.navigationController?.navigationController?.popViewController(animated: true)
    }
    
    private func ingredientDetailsLayout() {
        
    }
    
    private func recipeDetailsLayout() {
        
    }
    
}

enum NutritionDetailsState {
    case Recipe, Ingredient
}

