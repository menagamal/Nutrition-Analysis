//
//  NewRecipeViewController.swift
//  Nutrition Analysis
//
//  Created by Mena Gamal on 22/05/2021.
//

import UIKit
import RxSwift
import RxRelay
class NewRecipeViewController: UIViewController {

    var recipeString: BehaviorRelay<String>!
    
    @IBOutlet weak var addRecipeBtn: UIButton!
    @IBOutlet weak var receipeTextField: UITextField!
    
    private var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addRecipeBtn.isEnabled = false
        addRecipeBtn.alpha = 0.5
        receipeTextField.rx.controlEvent([.editingChanged]).asObservable().subscribe { [weak self] (_) in
            guard let self = self , let text = self.receipeTextField.text else { return }
            self.addRecipeBtn.isEnabled = (!text.isEmpty)
            self.addRecipeBtn.alpha = (text.isEmpty ? 0.5 : 1.0)
            self.recipeString.accept(text)
        }.disposed(by: disposeBag)
    }
    
    @IBAction func addRecipeAction(_ sender: UIButton) {
        if let text = receipeTextField.text {
            recipeString.accept(text)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
}
