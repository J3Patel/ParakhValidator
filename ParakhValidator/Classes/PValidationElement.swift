//
//  PValidationElement.swift
//  ParakhValidator
//
//  Created by J3Patel on 08/08/18.
//

import UIKit

public protocol PValidationElement {
    
    func stringToValidate() -> String
    @discardableResult
    func addCondition(_ condition: PValidationCondition) -> PValidationElement
    @discardableResult
    func removeCondition(_ condition: PValidationCondition) -> PValidationElement
    @discardableResult
    func addConditions(_ conditions: [PValidationCondition]) -> PValidationElement
    @discardableResult
    func addConditions(_ conditions: PValidationCondition...) -> PValidationElement
}

public extension PValidationElement {

    var name: String {
        return String("\(self)".prefix(30))
    }

    @discardableResult
    public func addCondition(_ condition: PValidationCondition) -> PValidationElement {
        ParakhValidator.shared.add(condition: condition, for: self)
        return self
    }

    @discardableResult
    public func addConditions(_ conditions: [PValidationCondition]) -> PValidationElement {
        for condition in conditions {
            _ = addCondition(condition)
        }
        return self
    }

    @discardableResult
    public func addConditions(_ conditions: PValidationCondition...) -> PValidationElement{
        return addConditions(conditions)
    }

    @discardableResult
    public func removeCondition(_ condition: PValidationCondition) -> PValidationElement {
        ParakhValidator.shared.remove(condition: condition, from: self)
        return self
    }
}
