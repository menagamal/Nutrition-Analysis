//
//  NewIngredientViewController.swift
//  Nutrition Analysis
//
//  Created by Mena Gamal on 23/05/2021.
//

import UIKit
import RxSwift
import RxCocoa

class NewIngredientViewController: UIViewController {

    @IBOutlet weak var unitTextField: UITextField!
    @IBOutlet weak var quantityTextField: UITextField!
    @IBOutlet weak var foodNameTextfield: UITextField!
    
    @IBOutlet weak var addIngredientBtn: UIButton!
    
    private var disposeBag = DisposeBag()

    var ingredient: BehaviorRelay<IngredientModel>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addIngredientBtn.isEnabled = false
        addIngredientBtn.alpha = 0.5
        
        foodNameTextfield.rx.controlEvent([.editingChanged]).asObservable().subscribe { [weak self] (_) in
            self?.isIngredientsValid()
        }.disposed(by: disposeBag)
        
        quantityTextField.rx.controlEvent([.editingChanged]).asObservable().subscribe { [weak self] (_) in
            self?.isIngredientsValid()
        }.disposed(by: disposeBag)
        
        unitTextField.rx.controlEvent([.editingChanged]).asObservable().subscribe { [weak self] (_) in
            self?.isIngredientsValid()
        }.disposed(by: disposeBag)
        
    }
    
    @IBAction func addIngredientAction(_ sender: UIButton) {
        guard let foodName = foodNameTextfield.text, let quantity = Int(quantityTextField.text ?? "0"), let unit = unitTextField.text else {
            self.dismiss(animated: true, completion: nil)
            return
        }
        ingredient.accept(IngredientModel(title: foodName, quantity: quantity, unit: unit))
        self.dismiss(animated: true, completion: nil)
    }
    
    private func isIngredientsValid() {
        guard let foodName = foodNameTextfield.text, let quantity = quantityTextField.text, let unit = unitTextField.text else {
            return
        }
        if !foodName.isEmpty && !quantity.isEmpty && !unit.isEmpty {
            addIngredientBtn.isEnabled = true
            addIngredientBtn.alpha = 1.0
        } else {
            addIngredientBtn.isEnabled = false
            addIngredientBtn.alpha = 0.5
        }
    }
}
