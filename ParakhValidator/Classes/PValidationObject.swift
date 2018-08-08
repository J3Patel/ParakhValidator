//
//  PValidationObject.swift
//  ParakhValidator
//
//  Created by J3Patel on 08/08/18.
//

import UIKit

public protocol PValidationObject {
    func stringToValidate() -> String?
    @discardableResult
    func addCondition(_ condition: PValidationCondition) -> PValidationObject
    @discardableResult
    func removeCondition(_ condition: PValidationCondition) -> PValidationObject
    @discardableResult
    func addConditions(_ conditions: [PValidationCondition]) -> PValidationObject
    @discardableResult
    func addConditions(_ conditions: PValidationCondition...) -> PValidationObject
}

public extension PValidationObject {

    var name: String {
        return String("\(self)".prefix(30))
    }

    @discardableResult
    public func addCondition(_ condition: PValidationCondition) -> PValidationObject {
        ParakhValidator.shared.add(condition: condition, for: self)
        return self
    }

    @discardableResult
    public func addConditions(_ conditions: [PValidationCondition]) -> PValidationObject {
        for condition in conditions {
            _ = addCondition(condition)
        }
        return self
    }

    @discardableResult
    public func addConditions(_ conditions: PValidationCondition...) -> PValidationObject{
        return addConditions(conditions)
    }

    @discardableResult
    public func removeCondition(_ condition: PValidationCondition) -> PValidationObject {
        ParakhValidator.shared.remove(condition: condition, from: self)
        return self
    }
}
