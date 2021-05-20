//
//  UIScrollView+Extension.swift
//  Azayem
//
//  Created by Trufla on 12/6/19.
//  Copyright © 2019 Mustafa Ezzat. All rights reserved.
//

import UIKit

extension UIScrollView {
    func scrollToTop() {
        let desiredOffset = CGPoint(x: 0, y: -contentInset.top)
        setContentOffset(desiredOffset, animated: true)
    }
    func scrollDown() {
        let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.size.height)
        setContentOffset(bottomOffset, animated: true)
    }
}
