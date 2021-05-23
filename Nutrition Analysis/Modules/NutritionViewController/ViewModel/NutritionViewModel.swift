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
        coordinator: NutritionCoordinator,
        ()
    )
    typealias viewModelBuilder = (NutritionViewRepresentation.Input) -> NutritionViewModel
    
    var input: NutritionViewRepresentation.Input { get }
    
}

class NutritionViewModel: NutritionViewRepresentation {
    
    var input: NutritionViewRepresentation.Input
    
    private var currentIngredient = BehaviorRelay(value: "")

    private let disposeBag = DisposeBag()
    
    private var ingredients = BehaviorRelay(value: [String]())

    struct Output {
           let ingredients: Driver<[String]>
    }
    let output: Output


    init(input: NutritionViewRepresentation.Input) {
        self.input = input
        self.output = Output(ingredients: ingredients.asDriver())
        self.currentIngredient.subscribe { [weak self ](event) in
            guard let self = self else { return }
            if let ing = event.element , !ing.isEmpty {
                let filtered = self.ingredients.value.filter({ !$0.isEmpty})
                self.ingredients.accept( filtered + [ing])
                
            }
        }.disposed(by: disposeBag)
        
    }
    
    
    func addNewRecipe()  {
        self.input.coordinator.present(to: .AddRecipe(recipeString: input.recpieName))
    }
    
    func addIngredient()  {
        self.input.coordinator.present(to: .AddIngredient(bindable: currentIngredient))
    }
    
}
