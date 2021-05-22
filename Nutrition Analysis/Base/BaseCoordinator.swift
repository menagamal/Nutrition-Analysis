//
//  BaseCoordinator.swift
//  Nutrition Analysis
//
//  Created by Mena Gamal on 22/05/2021.
//

import Foundation
import UIKit
protocol BaseCoordinator {
    associatedtype Destination
    var rootViewController: UIViewController { get set }
    func makeViewController(for destination: Destination) -> UIViewController
}
