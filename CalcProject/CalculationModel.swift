//
//  CalculationModel.swift
//  CalcProject
//
//  Created by Phoenix McKnight on 4/11/20.
//  Copyright © 2020 Phoenix McKnight. All rights reserved.
//

import Foundation

struct CalculationModel {
    private var displayedNumber:Double = 0
    private var selectedNumber:Double?
    private var currentOperation:(Double,Double) -> Double
    var subtractionClosure = { (displayedNumberTwo:Double,selectedNumberTwo:Double) -> Double in
        return displayedNumberTwo - selectedNumberTwo
    }
    var additionClosure = { (displayedNumberTwo:Double,selectedNumberTwo:Double) -> Double in
           return displayedNumberTwo + selectedNumberTwo
       }
    var divisionClosure = { (displayedNumberTwo:Double,selectedNumberTwo:Double) -> Double in
           return displayedNumberTwo / selectedNumberTwo
       }
    var multiplicationClosure = { (displayedNumberTwo:Double,selectedNumberTwo:Double) -> Double in
           return displayedNumberTwo * selectedNumberTwo
       }

    public mutating func updateDisplayedNumber(currentDisplayedNumber:Double) {
        displayedNumber = currentDisplayedNumber
    }

    public mutating func updateSelectedNumber(currentSelectedNumber:Double?) {
        selectedNumber = currentSelectedNumber
    }

    public mutating func returnDisplayedNumber() -> Double {
        return displayedNumber
    }

    public mutating func returnSelectedNumber() -> Double? {
        return selectedNumber
    }

    public mutating func clearAll() {
        displayedNumber = 0
        selectedNumber = nil
    }
    
    public mutating func executeOperation(currentClosure:@escaping (Double,Double) -> Double) {
        currentOperation = currentClosure
    }

}
//class CalculationModel {
//    private var displayedNumber:Double = 0
//    private var selectedNumber:Double?
//    private var currentOperation:() -> Double
//
//    var subtractionClosure = { (displayedNumberTwo:Double,selectedNumberTwo:Double) -> Double in
//        return displayedNumberTwo - selectedNumberTwo
//    }
//    var additionClosure = { (displayedNumberTwo:Double,selectedNumberTwo:Double) -> Double in
//           return displayedNumberTwo + selectedNumberTwo
//       }
//    var divisionClosure = { (displayedNumberTwo:Double,selectedNumberTwo:Double) -> Double in
//           return displayedNumberTwo / selectedNumberTwo
//       }
//    var multiplicationClosure = { (displayedNumberTwo:Double,selectedNumberTwo:Double) -> Double in
//           return displayedNumberTwo * selectedNumberTwo
//       }
//
//    public func updateDisplayedNumber(currentDisplayedNumber:Double) {
//        displayedNumber = currentDisplayedNumber
//    }
//
//    public func updateSelectedNumber(currentSelectedNumber:Double?) {
//        selectedNumber = currentSelectedNumber
//    }
//
//    public func returnDisplayedNumber() -> Double {
//        return displayedNumber
//    }
//
//    public func returnSelectedNumber() -> Double? {
//        return selectedNumber
//    }
//
//    public func clearAll() {
//        displayedNumber = 0
//        selectedNumber = nil
//    }
//
//    public func executeOperation() {
//        currentOperation = additionClosure
//    }
//
//}
