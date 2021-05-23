//
//  NutritionTarget.swift
//  Nutrition Analysis
//
//  Created by Mena Gamal on 23/05/2021.
//

import Moya
import Foundation
import UIKit
import Alamofire
typealias MoyaMethod = Moya.Method

enum NutritionTarget {
    case analyze(receipeName:String,recipeIngredients:[String])
}

extension NutritionTarget: TargetType {
    
    
    var baseURL: URL {
        return URL(string: "https://api.edamam.com/api/")!
    }
    
    var path: String {
        switch self {
        case .analyze:
            return "nutrition-details"
        }
    }
    
    var method: MoyaMethod {
        switch self {
        case .analyze:
            return .post
        }
    }
    
    var sampleData: Data {
        return  Data()
    }
    
    
    var task: Task {
        switch self {
        case .analyze(let receipeName, let recipeIngredients):
            var parameters = [String:Any]()
            parameters = [
                "title":receipeName,
                "ingr":recipeIngredients
            ]
            var urlParams =  [String:Any]()
            urlParams = [
                "app_id":"2fb62be8",
                "app_key":"be91372375ea1cb5c76529e5b90a2a4a"
                
            ]
            return .requestCompositeParameters(bodyParameters: parameters, bodyEncoding: JSONEncoding.default, urlParameters: urlParams)
        }
    }
    
    public var headers: [String: String]? {
        return nil
    }
    
    
    public var validationType: ValidationType {
        return .successCodes
    }
    
}
