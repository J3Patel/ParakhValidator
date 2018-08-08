//
//  PValidatorDelegate.swift
//  Nimble
//
//  Created by MP-11 on 08/08/18.
//

import UIKit

public protocol PValidatorDelegate: class {
    func failedWithError()
    func success()
}
