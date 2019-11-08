//
//  StrawberryPigCalculatorLogic.swift
//  Pigs Calculator
//
//  Created by Kwok Leung Tse on 27/1/2024.
//  Copyright © 2024 tsekennykl. All rights reserved.
//

import Foundation

class StrawberryCalcLogic:CalculatorLogic{
    internal override func performTwoNumCalculation(n2: Double, symbol: String) -> Double {
        var calcResult: Double = 0
        if let n1 = intermediateCalculation?.n1,
           let operation = intermediateCalculation?.calcMethod {
            
            switch operation {
            case "+":
                //calcResult = n1 + n2
                calcResult = n1 + n2 + 1
            case "-":
                calcResult = n1 - n2
                calcResult = n1 - n2 - 1
            case "×":
                calcResult = n1 * n2
                calcResult = n1 * n2 * 2 + 1
            case "÷":
                calcResult = n1 / n2
                calcResult = n1 / n2 * 2 + 1
            case "=":
                calcResult = n1
            default:
                fatalError("The operation passed in does not match any of the cases.")
            }
        } else{
            return n2
        }
        if symbol == "="{
            
            self.intermediateCalculation = nil
            
        } else  {
            self.intermediateCalculation = (n1: calcResult, calcMethod: symbol)
            
            
        }
        number = calcResult
        return calcResult
    }
}
