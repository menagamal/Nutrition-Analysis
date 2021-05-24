//
//  DetailsAnalyzeView.swift
//  Nutrition Analysis
//
//  Created by Mena Gamal on 24/05/2021.
//

import UIKit

class DetailsAnalyzeView: UIView {

    @IBOutlet weak var labelValue: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    
    func configure(with title:String, value:String) {
        labelTitle.text = title
        labelValue.text = value
    }
}
