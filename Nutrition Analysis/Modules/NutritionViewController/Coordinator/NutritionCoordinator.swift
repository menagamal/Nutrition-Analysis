//
//  NutritionCoordinator.swift
//  Nutrition Analysis
//
//  Created by Mena Gamal on 22/05/2021.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class NutritionCoordinator: BaseCoordinator {
    
    enum Destination {
        case openDetails(model:IngredientModel,state:NutritionDetailsState)
        case AddRecipe(recipeString: BehaviorRelay<String>)
        case AddIngredient(bindable: BehaviorRelay<IngredientModel>)
    }
    
    var rootViewController: UIViewController
    
    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }
    
    func makeViewController(for destination: Destination) -> UIViewController {
        switch destination {
        case .openDetails(let model , let state):
            return openDetails(model: model, state: state)
        case .AddRecipe(let recipeString):
            return AddRecipe(recipeString: recipeString)
        case .AddIngredient(let bindable):
            return AddIngredient(bindable: bindable)
        }
    }
    func navigate(to destination: NutritionCoordinator.Destination) {
        let viewController = makeViewController(for: destination)
        rootViewController.show(viewController, sender: rootViewController)
    }
    
    func present(to destination: NutritionCoordinator.Destination) {
        let viewController = makeViewController(for: destination)
        rootViewController.present(viewController, animated: true)
    }
    
}
private extension NutritionCoordinator {
    func AddRecipe(recipeString: BehaviorRelay<String>) -> UIViewController {
        let vc: NewRecipeViewController = UIViewController.instanceXib()
        vc.recipeString = recipeString
        let dialog = PopupDialog(viewController: vc, buttonAlignment: .horizontal, transitionStyle: .zoomIn, preferredWidth: 340, gestureDismissal: true, hideStatusBar: true, completion: nil)
        
        return dialog
    }
    func AddIngredient(bindable: BehaviorRelay<IngredientModel>) -> UIViewController {
        let vc: NewIngredientViewController = UIViewController.instanceXib()
        vc.ingredient = bindable
        let dialog = PopupDialog(viewController: vc, buttonAlignment: .horizontal, transitionStyle: .zoomIn, preferredWidth: 340, gestureDismissal: true, hideStatusBar: true, completion: nil)
        
        return dialog
    }
    func openDetails(model:IngredientModel,state:NutritionDetailsState)  -> UIViewController {
        let vc: AnalyzeDetailsViewController = UIViewController.instanceXib()
        vc.state = state
        vc.model = model
        return vc
    }
}
