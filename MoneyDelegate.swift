//
//  MoneyDelegate.swift
//  TextFieldsChallengeApp
//
//  Created by Katherine Gonzales on 10/12/17.
//  Copyright © 2017 KG. All rights reserved.
//

import Foundation
import UIKit

class MoneyDelegate: NSObject, UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let oldText = textField.text! as NSString
        var newText = oldText.replacingCharacters(in: range, with: string)
        var newTextString = String(newText)
        
        let digits = CharacterSet.decimalDigits
        var digitText = ""
        for c  in (newTextString?.unicodeScalars)! {
            if digits.contains(UnicodeScalar(c.value)!) {
                digitText.append("\(c)")
                }
        }
        
            if let numOfPennies = Int(digitText){
                newText = "$" + self.dollarStringFromInt(numOfPennies) + "." + self.centsStringFromInt(numOfPennies)
            } else {
                newText = "0.00"
            }
            
            textField.text = newText
            
            return false
        }
        
        func textFieldDidBeginEditing(_ textField: UITextField) {
            if textField.text!.isEmpty {
                textField.text = "$0.00"
            }
        }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true;
    }
        
        func dollarStringFromInt(_ value:Int) -> String {
            return String(value / 100)
        }
        
    func centsStringFromInt(_ value: Int) -> String {
        
        let cents = value % 100
        var centsString = String(cents)
        
        if cents < 10 {
            centsString = "0" + centsString
        }
        
        return centsString
    }
}
