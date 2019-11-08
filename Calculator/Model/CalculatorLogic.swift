//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Angela Yu on 18/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation
protocol CalculationFomulas{
    func performTwoNumCalculation(n2: Double, symbol: String) -> Double
    
}
class CalculatorLogic : CalculationFomulas{
    
    var number: Double?
    
    var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    func setNumber(_ number: Double) {
        self.number = number
    }
    func handleOtherKey(symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "+/-":
                self.intermediateCalculation?.n1 = n * -1
                return n * -1
            case "AC":
                self.intermediateCalculation = nil
                return 0
            case "%":
                //return Double((round(100*n)/100)*0.01)
                self.intermediateCalculation?.n1 = n * 0.01
                return n*0.01
            default:
                fatalError("The operation passed in does not match any of the cases.")
            }
        }
        return nil
    }
    func calculate(symbol: String, _ lastClickCalcButton: Bool) -> Double? {
        
        if let n = number {
            if !lastClickCalcButton && (symbol == "=" || intermediateCalculation != nil ){
                    return performTwoNumCalculation(n2: n, symbol: symbol)
            } else{
                intermediateCalculation = (n1: n, calcMethod: symbol)
            }
            
        }
        return nil
    }
    internal func performTwoNumCalculation(n2: Double, symbol: String) -> Double {
            var calcResult: Double = 0
            if let n1 = intermediateCalculation?.n1,
               let operation = intermediateCalculation?.calcMethod {
                
                switch operation {
                case "+":
                    calcResult = n1 + n2
                    //calcResult = n1 + n2 + 1
                case "-":
                    calcResult = n1 - n2
                    //calcResult = n1 - n2 - 1
                case "×":
                    calcResult = n1 * n2
                    //calcResult = n1 * n2 * 2
                case "÷":
                    calcResult = n1 / n2
                    //calcResult = n1 / n2 * 2
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
