//
//  ParakhValidator.swift
//  ParakhValidator
//
//  Created by J3Patel on 08/08/18.
//

import UIKit

open class ParakhValidator {

    open weak var delegate: PValidatorDelegate?

    private var validationElementsWithConditions: [String: PValidationElementWithConditions] = [:]

    open static let shared = ParakhValidator()

    private init() { }

    open func validate() {
        var isSuccess = true
        var validationElement: PValidationElement?
        var validationCondition: PValidationCondition?
        for validationElementWithConditions in validationElementsWithConditions {
            validationElement = validationElementWithConditions.value.validationElement
            for condition in validationElementWithConditions.value.conditions {
                if let validationElement = validationElement, !condition.isValid(value: validationElement.stringToValidate()) {
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
            delegate?.validationSucceded()
        } else if let validationElement = validationElement, let validationCondition = validationCondition {
            delegate?.failed(with: validationElement, condition: validationCondition)
        }

    }
}

extension ParakhValidator {
    func add(condition: PValidationCondition, for validationElement: PValidationElement) {
        if var validationElement = validationElementsWithConditions[validationElement.name] {
            validationElement.conditions.append(condition)
        } else {
            validationElementsWithConditions[validationElement.name] =
                PValidationElementWithConditions(validationElement: validationElement, conditions: [condition])
        }
    }

    func remove(condition: PValidationCondition, from validationElement: PValidationElement) {
        if var validationElement = validationElementsWithConditions[validationElement.name] {
            validationElement.conditions.append(condition)
            var removeIndex: Int?
            for (index, cond) in validationElement.conditions.enumerated() {
                if cond.name == condition.name {
                    removeIndex = index
                }
            }
            if let removeIndex = removeIndex {
                validationElement.conditions.remove(at: removeIndex)
            }
        }
    }
}
