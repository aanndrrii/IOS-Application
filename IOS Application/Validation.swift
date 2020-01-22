//
//  Validation.swift
//  IOS Application
//
//  Created by Andrii on 1/22/20.
//  Copyright © 2020 Andrii. All rights reserved.
//

import Foundation

class Validation {
    
    let numbers = "0123456789"
    let lower_case = "abcdefghijklmnopqrstuvwxyz"
    let upper_case = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    let special_characters = "!@#$%^&*()-+"
    
    let emailCharacter1 = Character("@")
    let emailCharacter2 = Character(".")
    
    public func validateEmail(email:String) -> Bool {
        if email.count < 5 {
            return false
        }
        var character1Exists = false
        var character2Exists = false
        var twoCharactersAfterDot = false
        
        let array = Array(email)
        for i in 0..<email.count {
            
            if array[i] == emailCharacter1 {
                character1Exists = true
            }
            
            if array[i] == emailCharacter2 {
                character2Exists = true
                
                if i+2<=email.count{
                    twoCharactersAfterDot = true
                }
            }
        }
        return (character1Exists && character2Exists && twoCharactersAfterDot)
    }
    
    public func validatePassword(password:String) -> Bool {
        
        if password.count < 5 {
            return false
        }
        
        var numberExists:Bool = false
        var lowerCaseExists:Bool = false
        var upperCaseExists:Bool = false
        var specialCharacterExists:Bool = false
        
        for c in password {
            if numbers.contains(c){
                numberExists = true
                continue
            }
            if lower_case.contains(c){
                lowerCaseExists = true
                continue
            }
            if upper_case.contains(c){
                upperCaseExists = true
                continue
            }
            if special_characters.contains(c){
                specialCharacterExists = true
                continue
            }
        }
        
        return (numberExists
                && lowerCaseExists
                && upperCaseExists
                && specialCharacterExists)
    }
}
