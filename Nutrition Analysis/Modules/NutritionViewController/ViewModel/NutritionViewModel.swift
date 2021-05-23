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
        recpieName: BehaviorRelay<String>,
        coordinator: NutritionCoordinator
    )
    typealias viewModelBuilder = (NutritionViewRepresentation.Input) -> NutritionViewModel
    
    var input: NutritionViewRepresentation.Input { get }
    
    var output: NutritionViewModel.Output { get }
}

class NutritionViewModel: NutritionViewRepresentation {
    
    var input: NutritionViewRepresentation.Input
    
    private var currentIngredient = BehaviorRelay(value: "")

    private let disposeBag = DisposeBag()
    
    private var ingredients = BehaviorRelay(value: [String]())
    
    struct Output {
           let ingredients: Driver<[String]>
            let showLoading = BehaviorRelay<Bool>(value: false)
    }
    
    let output: Output

    private var nutritionService: NutritionAPIs
    
    init(input: NutritionViewRepresentation.Input,nutritionService: NutritionAPIs) {
        self.nutritionService = nutritionService
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
    func analyzeIngredients()  {
        output.showLoading.accept(true)
        nutritionService.analyzeRecipe(receipeName: input.recpieName.value, recipeIngredients: ingredients.value)
            .subscribe(onNext: {[weak self] (response) in
                // MOVE TO DETAILS
                self?.output.showLoading.accept(false)
            },onError: { [weak self]( error) in
                //SHOW ERROR
                self?.output.showLoading.accept(false)
            }).disposed(by: disposeBag)

    }
    
}
