//
//  UINavigationController+Extension.swift
//  LabOnClick
//
//  Created by Mustafa Ezzat on 8/31/19.
//  Copyright © 2019 Waqood. All rights reserved.
//

import UIKit
extension UINavigationController {
    func popToViewController(ofClass: AnyClass, animated: Bool = true) {
        if let vc = viewControllers.filter({$0.isKind(of: ofClass)}).last {
            popToViewController(vc, animated: animated)
        }
    }
    
    func popViewControllers(viewsToPop: Int, animated: Bool = true) {
        if viewControllers.count > viewsToPop {
            let vc = viewControllers[viewControllers.count - viewsToPop - 1]
            popToViewController(vc, animated: animated)
        }
    }
    
    func updateBackButton() {
         let image = UIImage(named: "back")?.withRenderingMode(.alwaysOriginal)
         // let button = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(back(_:)))
         navigationBar.backIndicatorImage = image
         navigationBar.backIndicatorTransitionMaskImage = image
      self.visibleViewController?.navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
     }
}

