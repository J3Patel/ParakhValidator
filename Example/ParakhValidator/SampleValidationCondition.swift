//
//  SampleValidationCondition.swift
//  ParakhValidator_Example
//
//  Created by MP-11 on 09/08/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import ParakhValidator

enum SampleValidationCondition: PValidationCondition {

    func isValid(value: String) -> Bool {
        return false
    }

    func errorMessage() -> String {
        return "Sample error message"
    }

}
