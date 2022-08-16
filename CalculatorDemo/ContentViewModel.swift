//
//  ContentViewModel.swift
//  CalculatorDemo
//
//  Created by Sujit Baruwal on 8/16/22.
//

import Foundation
import Combine
import SwiftUI

extension ContentView {
    final class ViewModel: ObservableObject {
        @Published private var operation = Operation()
        
        var displayText: String {
            return operation.displayText
        }
        
        var imageArray: [[String]] = [
            ["one", "two", "three", "add"],
            ["four", "five", "six", "minus"],
            ["seven", "eight", "nine", "times"],
            ["zero", "equals", "divide"]
        ]
        
        let digitsDict: [String: String] = ["one": "1", "two": "2", "three": "3", "four": "4", "five": "5", "six": "6", "seven": "7", "eight": "8", "nine": "9", "zero": "0"]
        let operationArray: [String] = ["add", "minus", "times", "divide"]
        
        func buttonClicked(str: String) {
            let keyExists = digitsDict[str] != nil
            if keyExists {
                operation.setDigit(digit: digitsDict[str]!)
            } else if operationArray.contains(str){
                operation.setOperation(strOperation: str)
            } else {
                operation.evaluate()
            }
        }
    }
}
