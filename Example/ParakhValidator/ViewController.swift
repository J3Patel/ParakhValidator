//
//  ViewController.swift
//  ParakhValidator
//
//  Created by J3Patel on 08/08/2018.
//  Copyright (c) 2018 J3Patel. All rights reserved.
//

import UIKit
import ParakhValidator

class ViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var postalCodeTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var mobileTextField: UITextField!
    @IBOutlet weak var addressTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ParakhValidator.shared.delegate = self
        firstNameTextField.addConditions(ParakhCondition.email)
        userNameTextField.addCondition(ParakhCondition.email)
        postalCodeTextField.addCondition(ParakhCondition.email)
        passwordTextField.addCondition(ParakhCondition.email)
        emailTextField.addCondition(ParakhCondition.email)
    }

    @IBAction func validate(_ sender: Any) {
        ParakhValidator.shared.validate()
    }
}

extension ViewController: PValidatorDelegate {
    func failed(with element: PValidationElement, condition: PValidationCondition) {
                print(condition.errorMessage())
    }


    func validationSucceded() {
         print("Success")
    }

}

