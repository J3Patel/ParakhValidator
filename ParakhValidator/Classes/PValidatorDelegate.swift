//
//  PValidatorDelegate.swift
//  ParakhValidator
//
//  Created by J3Patel on 08/08/18.
//

import UIKit

public protocol PValidatorDelegate: class {
    func failed(with element: PValidationElement, condition: PValidationCondition)
    func validationSucceded()
}

