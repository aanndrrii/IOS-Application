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
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var showHideButton: UIButton!
    
    let validation = Validation()
    var correctEmail = false
    var correctPassword = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        loginButton.layer.cornerRadius = 5
        forgotPasswordButton.layer.cornerRadius = 5
        showHideButton.layer.cornerRadius = 5
        
        emailTextField.layer.borderWidth = 0.5
        emailTextField.layer.cornerRadius = 5
        emailTextField.layer.borderColor = UIColor.white.cgColor
        passwordTextField.layer.borderWidth = 0.5
        passwordTextField.layer.cornerRadius = 5
        passwordTextField.layer.borderColor = UIColor.white.cgColor
        
        loginButton.isHidden = true
        forgotPasswordButton.isHidden = true
        showHideButton.isHidden = true
        passwordTextField.isHidden = true
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case emailTextField:
            emailTextField.layer.borderColor = UIColor.blue.cgColor
        case passwordTextField:
            passwordTextField.layer.borderColor = UIColor.blue.cgColor
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
                emailTextField.layer.borderColor = UIColor.green.cgColor
                passwordTextField.becomeFirstResponder()
            }
            else {
                correctEmail = false
                emailTextField.layer.borderColor = UIColor.red.cgColor
            }
        case passwordTextField:
            if validation.validatePassword(password: passwordTextField.text ?? "") {
                correctPassword = true
                passwordTextField.layer.borderColor = UIColor.green.cgColor
                passwordTextField.resignFirstResponder()
            }
            else {
                correctPassword = false
                passwordTextField.layer.borderColor = UIColor.red.cgColor
            }
        default:
            passwordTextField.resignFirstResponder()
        }
        
        return true
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func showHideButtonDidTap(_ sender: UIButton) {
        if passwordTextField.isSecureTextEntry {
            showHideButton.setTitle("Hide", for: .normal)
            passwordTextField.isSecureTextEntry = false
        } else {
            showHideButton.setTitle("Show", for: .normal)
            passwordTextField.isSecureTextEntry = true
        }
    }
    
    
    @IBAction func textFieldEditingDidChange(_ sender: UITextField) {
        
        if (sender.text ?? "").count < 5 {
            return
        }
        
        switch sender {
        case emailTextField:
            if validation.validateEmail(email: emailTextField.text ?? "") {
                correctEmail = true
                emailTextField.layer.borderColor = UIColor.green.cgColor
                passwordTextField.isHidden = false
                forgotPasswordButton.isHidden = false
                showHideButton.isHidden = false
                loginButton.isHidden = false
            }
            else {
                correctEmail = false
                emailTextField.layer.borderColor = UIColor.red.cgColor
                passwordTextField.isHidden = true
                forgotPasswordButton.isHidden = true
                showHideButton.isHidden = true
                loginButton.isHidden = true
            }
        case passwordTextField:
            if validation.validatePassword(password: passwordTextField.text ?? "") {
                correctPassword = true
                passwordTextField.layer.borderColor = UIColor.green.cgColor
            }
            else {
                correctPassword = false
                passwordTextField.layer.borderColor = UIColor.red.cgColor
            }
        default:
            return
        }
        
        if correctEmail && correctPassword {
            loginButton.isEnabled = true
        } else {
            loginButton.isEnabled = false
        }
    }
}

