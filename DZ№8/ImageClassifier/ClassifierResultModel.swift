//
//  ClassifierResultModel.swift
//  DZ№8
//
//  Created by Egor Malyshev on 27.12.2021.
//

import Foundation

struct ClassifierResultModel {
    let identifier: String
    let confidence: Int
    
    var description: String {
        return "\(identifier): \(confidence)%"
    }
}
