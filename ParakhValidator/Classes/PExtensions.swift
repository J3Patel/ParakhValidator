//
//  PExtensions.swift
//  Nimble
//
//  Created by MP-11 on 08/08/18.
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

