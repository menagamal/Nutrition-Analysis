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
    private var lastContentOffset: CGFloat?
    
    private var maxImageHeight:CGFloat  = 500
    private var minImageHeight:CGFloat  = 150
    @IBOutlet weak var imageHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NutritionBuilder().instance(viewController: self)
        
        
        viewModel = viewModelBuilder((recpieName: labelRecipeTitle.rx.text, coordinator: coordinator, ()))
        
        registerCell()
        bindUI()
    }

    @IBAction func addRecipe(_ sender: UIButton) {
        viewModel?.addNewRecipe()
    }

    @IBAction func addIngredient(_ sender: UIButton) {
        viewModel?.addIngredient()
    }
    
    private func registerCell() {
        tableViewIngredient.register(UINib(nibName: "IngredientTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    private func bindUI(){
        
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
        
        labelRecipeTitle.rx.observe(String.self, "text").subscribe(onNext: { [weak self] text in
            if let text = text, !text.isEmpty {
                self?.state.asObserver().on(.next(.AddIngredients))
            } else {
                self?.state.asObserver().on(.next(.AddRecipe))
            }
        }).disposed(by: disposeBag)
        
        viewModel?.output.ingredients
            .drive(tableViewIngredient.rx.items(cellIdentifier: "cell", cellType: IngredientTableViewCell.self)) { (_, ingredient, cell) in
                cell.configure(with: ingredient)
            }
            .disposed(by: disposeBag)
        
        tableViewIngredient.rx.contentOffset.subscribe { [weak self] (event) in
            guard let self = self else { return }
            if let scrollOffset = event.element?.y {
                if let lastContentOffset = self.lastContentOffset {
                    if (lastContentOffset > scrollOffset) {
                        if self.imageHeightConstraint.constant < self.maxImageHeight {
                            self.imageHeightConstraint.constant += 40
                            self.imageHeightConstraint.isActive = true
                        }
                    }
                    else if (lastContentOffset < scrollOffset) {
                        if self.imageHeightConstraint.constant > self.minImageHeight {
                            self.imageHeightConstraint.constant -= 40
                            self.imageHeightConstraint.isActive = true
                        }
                    }
                } else {
                    self.lastContentOffset = scrollOffset
                }
            }
        }.disposed(by: disposeBag)
    }
}

enum HomePageState {
    case AddRecipe, AddIngredients
}
