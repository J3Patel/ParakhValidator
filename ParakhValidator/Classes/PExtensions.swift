//
//  PExtensions.swift
//  ParakhValidator
//
//  Created by J3Patel on 08/08/18.
//

import UIKit

extension UITextView: PValidationObject {
    public func stringToValidate() -> String? {
        return text
    }
}

extension UITextField: PValidationObject {
    public func stringToValidate() -> String? {
        return text
    }
}

extension UILabel: PValidationObject {
    public func stringToValidate() -> String? {
        return text
    }
}

