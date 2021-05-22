//
//  NutritionCoordinator.swift
//  Nutrition Analysis
//
//  Created by Mena Gamal on 22/05/2021.
//

import Foundation
import UIKit
import RxSwift
class NutritionCoordinator: BaseCoordinator {
    
    enum Destination {
        case AddRecipe(recipeString: Binder<String?>)
    }
    
    var rootViewController: UIViewController
    
    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }
    
    func makeViewController(for destination: Destination) -> UIViewController {
        switch destination {
        case .AddRecipe(let recipeString):
            return AddRecipe(recipeString: recipeString)
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
    func AddRecipe(recipeString: Binder<String?>) -> UIViewController {
        let vc: NewRecipeViewController = UIViewController.instanceXib()
        vc.recipeString = recipeString
        let dialog = PopupDialog(viewController: vc, buttonAlignment: .horizontal, transitionStyle: .zoomIn, preferredWidth: 340, gestureDismissal: true, hideStatusBar: true, completion: nil)
        
        return dialog
    }
}
