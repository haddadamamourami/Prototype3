//
//  StructEnums.swift
//  Calculator
//
//  Created by Mohamed Ali BELHADJ on 2022-01-23.
//

import Foundation

enum Operator: String {
    case add = "+"
    case substract = "-"
    case times = "*"
    case divide = "/"
    case nothing = ""
}

enum Calculation: String {
    case enteringNum = "enteringNum"
    case newNumStarted = "newNumStarted"
}
