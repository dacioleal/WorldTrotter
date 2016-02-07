//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Dacio Leal Rodriguez on 6/2/16.
//  Copyright © 2016 Dacio Leal Rodriguez. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    var farenheitValue: Double? {
        
        didSet {
            updateCelsiusValue()
        }
    }
    
    var celsiusValue: Double? {
        
        if let value = farenheitValue {
            return (value - 32) * (5 / 9)
        } else {
            return nil
        }
    }
    
    let numberFormatter: NSNumberFormatter = {
        
       let nf = NSNumberFormatter()
        nf.numberStyle = .DecimalStyle
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func farenheitFieldEditingChanged(textField: UITextField) {
        
        if let text = textField.text, number = numberFormatter.numberFromString(text) {
            farenheitValue = number.doubleValue
        } else {
            farenheitValue = nil
        }
    }
    
    @IBAction func dismissKeyboard(sender: AnyObject) {
        textField.resignFirstResponder()
    }
    
    func updateCelsiusValue() {
        if let value = celsiusValue {
            celsiusLabel.text = numberFormatter.stringFromNumber(value)
        } else {
            celsiusLabel.text = "???"
        }
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        let currentLocale = NSLocale.currentLocale()
        let decimalSeparator = currentLocale.objectForKey(NSLocaleDecimalSeparator) as! String
        
        let existingTextHasDecimalSeparator = textField.text?.rangeOfString(decimalSeparator)
        let replacementTextHasDecimalSeparator = string.rangeOfString(decimalSeparator)
        
        
        
        if existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil  {
            return false
        } else {
            return true
        }
    }
}





















