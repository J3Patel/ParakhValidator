//
//  PExtensions.swift
//  ParakhValidator
//
//  Created by J3Patel on 08/08/18.
//

import UIKit

extension UITextView: PValidationElement {
    public func stringToValidate() -> String {
        return text ?? ""
    }
}

extension UITextField: PValidationElement {
    public func stringToValidate() -> String {
        return text ?? ""
    }
}

extension UILabel: PValidationElement {
    public func stringToValidate() -> String {
        return text ?? ""
    }
}

