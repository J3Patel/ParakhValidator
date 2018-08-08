//
//  ParakhValidator.swift
//  ParakhValidator
//
//  Created by J3Patel on 08/08/18.
//

import UIKit

open class ParakhValidator {

    open weak var delegate: PValidatorDelegate?

    private var validationObjectsWithConditions: [String: PValidationObjectForCondition] = [:]

    open static let shared = ParakhValidator()

    private init() { }

    open func validate() {
        var isSuccess = true
        var validationObject: PValidationObject?
        var validationCondition: PValidationCondition?
        for validationObjectWithConditions in validationObjectsWithConditions {
            validationObject = validationObjectWithConditions.value.validationObject

            for condition in validationObjectWithConditions.value.conditions {
                if !condition.isValid() {
                    isSuccess = false
                    validationCondition = condition
                    break
                }
            }
            if !isSuccess {
                break
            }
        }

        if isSuccess {
            delegate?.success()
        } else if let validationObject = validationObject {
            delegate?.failedWithObject(validationObject)
        }

    }
}

extension ParakhValidator {
    func add(condition: PValidationCondition, for validationObject: PValidationObject) {
        if var validationObject = validationObjectsWithConditions[validationObject.name] {
            validationObject.conditions.append(condition)
        } else {
            validationObjectsWithConditions = [validationObject.name:
                PValidationObjectForCondition(validationObject: validationObject, conditions: [condition])]
        }
    }

    func remove(condition: PValidationCondition, from validationObject: PValidationObject) {
        if var validationObject = validationObjectsWithConditions[validationObject.name] {
            validationObject.conditions.append(condition)
            var removeIndex: Int?
            for (index, cond) in validationObject.conditions.enumerated() {
                if cond.name == condition.name {
                    removeIndex = index
                }
            }
            if let removeIndex = removeIndex {
                validationObject.conditions.remove(at: removeIndex)
            }
        }
    }
}
