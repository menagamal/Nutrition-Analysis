//
//  ViewController.swift
//  Nutrition Analysis
//
//  Created by Mena Gamal on 19/05/2021.
//

import UIKit
import RxCocoa
import RxSwift

class NutritionViewController: UIViewController {

    @IBOutlet weak var addRecipeView: UIView!
    @IBOutlet weak var ingredientsView: UIView!
    @IBOutlet weak var labelRecipeTitle: UILabel!
    @IBOutlet weak var tableViewIngredient: UITableView!

    private var state:BehaviorSubject<HomePageState> = BehaviorSubject(value: .AddRecipe)
    private var viewModel: NutritionViewModel?
    var viewModelBuilder: NutritionViewModel.viewModelBuilder!
    var coordinator: NutritionCoordinator!
    
    private let disposeBag = DisposeBag()
    var ingredients: Driver<[String]> = Driver.just([""])

    override func viewDidLoad() {
        super.viewDidLoad()
        NutritionBuilder().instance(viewController: self)
        state.subscribe { [weak self] (event) in
            if let state = event.element {
                switch state {
                case .AddRecipe:
                    self?.addRecipeView.isHidden = false
                    self?.ingredientsView.isHidden = true
                case .AddIngredients:
                    self?.ingredientsView.isHidden = false
                    self?.addRecipeView.isHidden = true
                }
            }
            
        }.disposed(by: disposeBag)
        
        viewModel = viewModelBuilder((recpieName: labelRecipeTitle.rx.text, ingredients: ingredients, coordinator: coordinator, ()))
        labelRecipeTitle.rx.observe(String.self, "text").subscribe(onNext: { [weak self] text in
            if let text = text, !text.isEmpty {
                self?.state.asObserver().on(.next(.AddIngredients))
            } else {
                self?.state.asObserver().on(.next(.AddRecipe))
            }
        }).disposed(by: disposeBag)
    }

    @IBAction func addRecipe(_ sender: UIButton) {
        viewModel?.addNewRecipe()
    }

    @IBAction func addIngredient(_ sender: UIButton) {
    }
}

enum HomePageState {
    case AddRecipe, AddIngredients
}
