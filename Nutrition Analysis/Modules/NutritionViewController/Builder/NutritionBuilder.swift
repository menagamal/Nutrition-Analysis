//
//  NutritionBuilder.swift
//  Nutrition Analysis
//
//  Created by Mena Gamal on 22/05/2021.
//

import Foundation
import UIKit

class NutritionBuilder {
    
    func instance(viewController:NutritionViewController){
        viewController.viewModelBuilder = {
            NutritionViewModel(input: (recpieName: $0.recpieName, ingredients: $0.ingredients, $0.coordinator,$0.3))
        }
        viewController.coordinator = NutritionCoordinator(rootViewController: viewController)
    }
}
