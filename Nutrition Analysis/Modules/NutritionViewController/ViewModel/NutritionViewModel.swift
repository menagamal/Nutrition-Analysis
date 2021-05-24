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
    
    private var currentIngredient = BehaviorRelay(value: IngredientModel())

    private let disposeBag = DisposeBag()
    
    private var ingredients = BehaviorRelay(value: [IngredientModel]())
    
    struct Output {
           let ingredients: Driver<[IngredientModel]>
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
            if let ing = event.element , !ing.title.isEmpty {
                let filtered = self.ingredients.value.filter({ !$0.title.isEmpty})
                self.ingredients.accept( filtered + [ing])
                
            }
        }.disposed(by: disposeBag)
        
    }
    
    private func stringMapper(objects:[IngredientModel]) -> [String] {
        return objects.map({
            "\($0.title) with \($0.quantity) quantity, \($0.unit)"
        })
    }
    
    func openDetailsWithIndexPath(index:Int) {
        output.showLoading.accept(true)
        var model = ingredients.value[index]
        let ingredient = ["\(model.title) with \(model.quantity) quantity, \(model.unit)"]
        nutritionService.analyzeRecipe(receipeName: model.title, recipeIngredients: ingredient)
            .subscribe(onNext: {[weak self] (response) in
                // MOVE TO DETAILS
                model.response = response
                DispatchQueue.main.async {
                    self?.input.coordinator.navigate(to: .openDetails(model: model, state: NutritionDetailsState.Ingredient))
                    self?.output.showLoading.accept(false)
                }
            },onError: { [weak self]( error) in
                //SHOW ERROR
                self?.output.showLoading.accept(false)
            }).disposed(by: disposeBag)
    }
    
    func addNewRecipe()  {
        self.input.coordinator.present(to: .AddRecipe(recipeString: input.recpieName))
    }
    
    func addIngredient()  {
        self.input.coordinator.present(to: .AddIngredient(bindable: currentIngredient))
    }
    func analyzeIngredients()  {
        output.showLoading.accept(true)
        nutritionService.analyzeRecipe(receipeName: input.recpieName.value, recipeIngredients: stringMapper(objects: ingredients.value))
            .subscribe(onNext: {[weak self] (response) in
                // MOVE TO DETAILS
                var model = IngredientModel()
                model.response = response
                DispatchQueue.main.async {
                    self?.input.coordinator.navigate(to: .openDetails(model: model , state: NutritionDetailsState.Recipe))
                    self?.output.showLoading.accept(false)
                }
            },onError: { [weak self]( error) in
                //SHOW ERROR
                self?.output.showLoading.accept(false)
            }).disposed(by: disposeBag)
    }
    
}
