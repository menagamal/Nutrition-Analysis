//
//  NutritionViewModel.swift
//  Nutrition Analysis
//
//  Created by Mena Gamal on 20/05/2021.
//

import Foundation
import RxCocoa
import RxSwift
protocol NutritionViewRepresentation {
    // IF we are going to use Combine these two will be replaced with @Published variables
    typealias Input = (
        recpieName: Binder<String?>,
        ingredients: Driver<[String]>,
        coordinator: NutritionCoordinator,
        ()
    )
    typealias Output = ()
    typealias viewModelBuilder = (NutritionViewRepresentation.Input) -> NutritionViewModel
    
    var input: NutritionViewRepresentation.Input { get }
    var output: NutritionViewRepresentation.Output { get }
    
}

class NutritionViewModel: NutritionViewRepresentation {
    
    var input: NutritionViewRepresentation.Input
    var output: NutritionViewRepresentation.Output
    
    init(input: NutritionViewRepresentation.Input) {
        self.input = input
        self.output = NutritionViewModel.output(input: input)
    }
    
    static func output(input: NutritionViewRepresentation.Input) -> NutritionViewRepresentation.Output {
        return ()
    }
    
    func addNewRecipe()  {
        self.input.coordinator.present(to: .AddRecipe(recipeString: input.recpieName))
    }
    
}
