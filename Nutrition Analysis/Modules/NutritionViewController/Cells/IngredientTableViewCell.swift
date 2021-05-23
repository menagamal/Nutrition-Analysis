//
//  IngredientTableViewCell.swift
//  Nutrition Analysis
//
//  Created by Mena Gamal on 23/05/2021.
//

import UIKit

class IngredientTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelTitle: UILabel!
    
    func configure(with ingredient:String) {
        labelTitle.text = ingredient
    }
}
