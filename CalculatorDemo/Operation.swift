//
//  Operation.swift
//  CalculatorDemo
//
//  Created by Sujit Baruwal on 8/15/22.
//

import Foundation

struct Operation {
    
    private struct ArithmeticExpression: Equatable {
            var number: Decimal
            var operations: String
            
            func evaluate(with secondNumber: Decimal) -> Decimal {
                switch operations {
                case "add":
                    return number + secondNumber
                case "minus":
                    return number - secondNumber
                case "times":
                    return number * secondNumber
                case "divide":
                    return number / secondNumber
                default:
                    print("Nothing")
                    return number
            }
        }
    }
    
    private var newNumber: Decimal? {
        didSet {
            guard newNumber != nil else { return }
            carryingZeroCount = 0
        }
    }
    
    private var expression: ArithmeticExpression?
    private var result: Decimal?
    
    private var carryingZeroCount: Int = 0
    
    var displayText: String {
        return getNumberString(forNumber: number)
    }
    
    var number: Decimal? {
        return newNumber ?? expression?.number ?? result
    }
    
    // MARK: - OPERATIONS
    
    mutating func setDigit(digit: String) {
        if digit == "0" {
            carryingZeroCount += 1
        } else if canAddDigit(digit: digit) {
            let numString = getNumberString(forNumber: newNumber)
            newNumber = Decimal(string: numString.appending(digit))
        }
    }
    
    mutating func setOperation(strOperation: String) {
        guard var number = newNumber ?? result else { return }
        if let existingExpression = expression {
            number = existingExpression.evaluate(with: number)
        }
        expression = ArithmeticExpression(number: number, operations: strOperation)
        newNumber = nil
    }
    
    mutating func evaluate() {
        guard let number = newNumber, let expressionToEvaluate = expression else { return }
        result = expressionToEvaluate.evaluate(with: number)
        expression = nil
        newNumber = nil
    }
    
    func getNumberString(forNumber number: Decimal?) -> String {
        var numberString = (number.map(String.init)) ?? "0"

        if carryingZeroCount > 0 {
            numberString.append(String(repeating: "0", count: carryingZeroCount))
        }
        return numberString
    }
    
    func canAddDigit(digit: String) -> Bool {
        return number != nil || digit != "0"
    }
}
