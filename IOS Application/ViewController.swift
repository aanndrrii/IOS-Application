//
//  ViewController.swift
//  IOS Application
//
//  Created by Andrii on 1/22/20.
//  Copyright © 2020 Andrii. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    let validation = Validation()
    var correctEmail = false
    var correctPassword = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        loginButton.layer.cornerRadius = 5
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case emailTextField:
            emailTextField.layer.borderWidth = 0.5
            emailTextField.layer.borderColor = UIColor.blue.cgColor
            emailTextField.layer.cornerRadius = 5
        case passwordTextField:
            passwordTextField.layer.borderWidth = 0.5
            passwordTextField.layer.borderColor = UIColor.blue.cgColor
            passwordTextField.layer.cornerRadius = 5
        default:
            return
        }
        return
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        switch textField {
        case emailTextField:
            if (emailTextField.layer.borderColor == UIColor.blue.cgColor){
                emailTextField.layer.borderColor = UIColor.white.cgColor
            }
        case passwordTextField:
            if (passwordTextField.layer.borderColor == UIColor.blue.cgColor){
                passwordTextField.layer.borderColor = UIColor.white.cgColor
            }
        default:
            return
        }
        return
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField {
        case emailTextField:
            if validation.validateEmail(email: emailTextField.text ?? "") {
                correctEmail = true
                emailTextField.layer.borderWidth = 0.5
                emailTextField.layer.borderColor = UIColor.green.cgColor
                emailTextField.layer.cornerRadius = 5
                passwordTextField.becomeFirstResponder()
            }
            else {
                correctEmail = false
                emailTextField.layer.borderWidth = 0.5
                emailTextField.layer.borderColor = UIColor.red.cgColor
                emailTextField.layer.cornerRadius = 5
            }
        case passwordTextField:
            if validation.validatePassword(password: passwordTextField.text ?? "") {
                correctPassword = true
                passwordTextField.layer.borderWidth = 0.5
                passwordTextField.layer.borderColor = UIColor.green.cgColor
                passwordTextField.layer.cornerRadius = 5
                passwordTextField.resignFirstResponder()
            }
            else {
                correctPassword = false
                passwordTextField.layer.borderWidth = 0.5
                passwordTextField.layer.borderColor = UIColor.red.cgColor
                passwordTextField.layer.cornerRadius = 5
            }
        default:
            passwordTextField.resignFirstResponder()
        }
        if correctEmail && correctPassword {
            loginButton.isEnabled = true
        }
        
        return true
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        
    }
    

}

