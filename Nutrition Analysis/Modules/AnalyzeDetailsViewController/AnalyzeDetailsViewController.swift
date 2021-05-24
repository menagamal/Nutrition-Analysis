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
 
    var model: IngredientModel!
    var state: NutritionDetailsState!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageHeightConstraints: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
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
        _ = navigationController?.popViewController(animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    

    private func ingredientDetailsLayout() {
        labelTitle.text = model.title
        if let view = DetailsAnalyzeView.loadFromNib(named: "DetailsAnalyzeView") as? DetailsAnalyzeView {
            view.configure(with: "Quantity", value: "\(model.quantity)")
            detailsStackView.addArrangedSubview(view)
        }
        if let view = DetailsAnalyzeView.loadFromNib(named: "DetailsAnalyzeView") as? DetailsAnalyzeView {
            view.configure(with: "Unit", value: model.unit)
            detailsStackView.addArrangedSubview(view)
        }
        if let view = DetailsAnalyzeView.loadFromNib(named: "DetailsAnalyzeView") as? DetailsAnalyzeView {
            view.configure(with: "Calories", value:"\(model.response?.calories ?? 0)")
            detailsStackView.addArrangedSubview(view)
        }
        if let view = DetailsAnalyzeView.loadFromNib(named: "DetailsAnalyzeView") as? DetailsAnalyzeView {
            view.configure(with: "Weight", value: "\(model.response?.totalWeight ?? 0.0)")
            detailsStackView.addArrangedSubview(view)
        }
    }
    
    private func recipeDetailsLayout() {
        labelTitle.text = model.title
        
        if let view = DetailsAnalyzeView.loadFromNib(named: "DetailsAnalyzeView") as? DetailsAnalyzeView {
            view.configure(with: "Calories", value:"\(model.response?.calories ?? 0)")
            detailsStackView.addArrangedSubview(view)
        }
        if let view = DetailsAnalyzeView.loadFromNib(named: "DetailsAnalyzeView") as? DetailsAnalyzeView {
            view.configure(with: "Weight", value: "\(model.response?.totalWeight ?? 0.0)")
            detailsStackView.addArrangedSubview(view)
        }
        
        if let view = DetailsAnalyzeView.loadFromNib(named: "DetailsAnalyzeView") as? DetailsAnalyzeView , let model = model.response?.totalNutrients?.fAT {
            view.configure(with: model.label ?? "", value: "\( model.quantity ?? 0.0)")
            detailsStackView.addArrangedSubview(view)
        }
        
        if let view = DetailsAnalyzeView.loadFromNib(named: "DetailsAnalyzeView") as? DetailsAnalyzeView , let model = model.response?.totalNutrients?.cHOLE {
            view.configure(with: model.label ?? "", value: "\( model.quantity ?? 0.0)")
            detailsStackView.addArrangedSubview(view)
        }
        
        if let view = DetailsAnalyzeView.loadFromNib(named: "DetailsAnalyzeView") as? DetailsAnalyzeView , let model = model.response?.totalNutrients?.nA {
            view.configure(with: model.label ?? "", value: "\( model.quantity ?? 0.0)")
            detailsStackView.addArrangedSubview(view)
        }
        
        if let view = DetailsAnalyzeView.loadFromNib(named: "DetailsAnalyzeView") as? DetailsAnalyzeView , let model = model.response?.totalNutrients?.pROCNT {
            view.configure(with: model.label ?? "", value: "\( model.quantity ?? 0.0)")
            detailsStackView.addArrangedSubview(view)
        }
        
        if let view = DetailsAnalyzeView.loadFromNib(named: "DetailsAnalyzeView") as? DetailsAnalyzeView , let model = model.response?.totalNutrients?.cA {
            view.configure(with: model.label ?? "", value: "\( model.quantity ?? 0.0)")
            detailsStackView.addArrangedSubview(view)
        }
        
        
        
    }
    
}

enum NutritionDetailsState {
    case Recipe, Ingredient
}

extension AnalyzeDetailsViewController: UIScrollViewDelegate {
    
}
