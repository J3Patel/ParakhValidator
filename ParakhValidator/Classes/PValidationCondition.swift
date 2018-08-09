//
//  PValidationCondition.swift
//  ParakhValidator
//
//  Created by J3Patel on 08/08/18.
//

import UIKit

public protocol PValidationCondition {
    func isValid(value: String) -> Bool
    func errorMessage() -> String
}

extension PValidationCondition {
    var name: String {
        return String("\(self)".prefix(30))
    }
}


public enum ParakhCondition: PValidationCondition {

    case email
    case phone
    case password

    var regEx: String {
        switch self {
        case .password:
            return "^(?=.*[A-Z].*[A-Z])(?=.*[!@#$&*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8}$"
        case .phone:
            return "^((\\+)|(00))[0-9]{6,14}$"
        case .email:
            return "(?:[a-zA-Z0-9!#$%\\&‘*+/=?\\^_`{|}~-]+(?:\\.[a-zA-Z0-9!#$%\\&'*+/=?\\^_`{|}" +
                "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" +
                "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-" +
                "z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5" +
                "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" +
                "9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" +
            "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        }
    }

    public func isValid(value: String) -> Bool {
        let emailTest = NSPredicate(format:"SELF MATCHES[c] %@", regEx)
        return emailTest.evaluate(with: value)
    }

    public func errorMessage() -> String {
        switch self {
        case.password:
            return "Please enter valid password"
        case .phone:
            return "Please enter valid phone number"
        case .email:
            return "Please enter valid email."
        }
    }
}

