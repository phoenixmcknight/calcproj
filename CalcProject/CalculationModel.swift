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
    private var previousNumber:Double? = nil
    private var currentOperation:((Double,Double) -> Double)?
    public var clickedSymbol:EnumSymbols = .none {
        didSet {
            switch clickedSymbol {
                
            case .percent:
              displayedNumber =  displayedNumber/100
            case .negativePositive:
                if displayedNumber > 0 {
                    displayedNumber = -displayedNumber
                } else if displayedNumber < 0 {
                    displayedNumber = abs(displayedNumber)
                }
            case .clear:
               break
            case .allClear:
                clearAll()
            case .none:
                break
            }
        }
    }
    
    public var  setCurrentOperation:EnumOperations = .none {
        didSet {
            switch setCurrentOperation {
            case .addition:
                currentOperation = additionClosure
            case .multiplication:
                currentOperation = multiplicationClosure
            case .division:
                currentOperation = divisionClosure
            case .subtraction:
                currentOperation = subtractionClosure
                
            case .none:
                currentOperation = nil
            }
        }
    }
    
    private  var subtractionClosure = { (displayedNumberTwo:Double,previousNumber:Double) -> Double in
        return displayedNumberTwo - previousNumber
    }
    private  var additionClosure = { (displayedNumberTwo:Double,previousNumber:Double) -> Double in
        return displayedNumberTwo + previousNumber
    }
    private var divisionClosure = { (displayedNumberTwo:Double,previousNumber:Double) -> Double in
        return displayedNumberTwo / previousNumber
    }
    private  var multiplicationClosure = { (displayedNumberTwo:Double,previousNumber:Double) -> Double in
        return displayedNumberTwo * previousNumber
    }
    
    public mutating func updateDisplayedNumber(currentDisplayedNumber:Double) {
        displayedNumber = currentDisplayedNumber
    }
    
    public mutating func updatePreviousNumber(currentSelectedNumber:Double?) {
        previousNumber = currentSelectedNumber
    }
    
    
    public func returnDisplayedNumber() -> Double {
        return displayedNumber
    }
    
    public mutating func executeOperation(operation: (Double,Double) -> Double) {
        updateDisplayedNumber(currentDisplayedNumber: operation(previousNumber!, displayedNumber))
    }
    
    public func returnCurrentOperation() -> ((Double,Double) -> Double)? {
        return currentOperation
    }
    
    public mutating func clearAll() {
        displayedNumber = 0
        previousNumber = nil
        setCurrentOperation = .none
    }
    
}

enum EnumOperations:String {
    case addition
    case multiplication
    case division
    case subtraction
    case none
}

enum EnumSymbols:String {
    case percent
    case negativePositive
    case clear
    case allClear
    case none
}
