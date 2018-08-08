//
//  PValidatorDelegate.swift
//  ParakhValidator
//
//  Created by J3Patel on 08/08/18.
//

import UIKit

public protocol PValidatorDelegate: class {
    func failedWithObject(_ object: PValidationObject)
    func success()
}
