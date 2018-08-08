//
//  PValidationCondition.swift
//  ParakhValidator
//
//  Created by J3Patel on 08/08/18.
//

import UIKit

public protocol PValidationCondition {
    func isValid() -> Bool
}

extension PValidationCondition {
    var name: String {
        return String("\(self)".prefix(30))
    }

}
