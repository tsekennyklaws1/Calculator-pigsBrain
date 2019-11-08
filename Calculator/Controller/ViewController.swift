//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    private var isLastCalcButtonClick: Bool = false
    
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a Double.")
            }
            return number
        }
        set {
            if newValue == Double(Int(newValue)){
                displayLabel.text = String(Int(newValue))
            }else{
                displayLabel.text = String(newValue)
            }
        }
    }
    
    private var calculator = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        
        isFinishedTypingNumber = true
        
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
            switch calcMethod {
            case "AC","+/-","%":
                if let result = calculator.handleOtherKey(symbol: calcMethod){
                    displayValue = result
                    
                }
                isLastCalcButtonClick = false
            default:

                
                if let result = calculator.calculate(symbol: calcMethod,isLastCalcButtonClick) {
                    displayValue = result
                }
                isLastCalcButtonClick = true
            }
        }
        
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        isLastCalcButtonClick = false
        if let numValue = sender.currentTitle {
            
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                
                if numValue == "." {
                    if displayLabel.text!.contains("."){

                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }

}

