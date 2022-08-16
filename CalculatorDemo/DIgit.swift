//
//  DIgit.swift
//  Calculator
//
//  Created by Sujit Baruwal on 8/15/22.
//

import Foundation

enum Digit: Int, CaseIterable, CustomStringConvertible {
    case zero, one, two, three, four, five, six, seven, eight, nine
    
    var description: String {
    "\(rawValue)"
    }
}
