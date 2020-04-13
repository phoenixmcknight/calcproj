//
//  ViewController.swift
//  CalcProject
//
//  Created by Phoenix McKnight on 4/11/20.
//  Copyright © 2020 Phoenix McKnight. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    private var calculatorIsInUse:Bool = false
    
    private var calcModel = CalculationModel()
    
    private let calcView = CalculatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(calcView)
        addTargetsToButtons()
    }
    
    private func addTargetsToButtons() {
        let buttonArray = calcView.symbolButtonArray + calcView.numberButtonArray + calcView.operationsButtonArray
        
        buttonArray.forEach({$0.addTarget(self, action: #selector(calculatorButtonFunctions(sender:)), for: .touchUpInside)})
    }
    
    @objc private func calculatorButtonFunctions(sender:UIButton) {
        
        switch sender.tag {
        case 0: // clear and allClear
            sender.titleLabel?.text == "AC" ?  handleSymbolButtonPressed(symbol: .allClear) :  handleSymbolButtonPressed(symbol: .clear)
            
        case 1: // negative / positive
            
            handleSymbolButtonPressed(symbol: .negativePositive)
        case 2: // find percent
            handleSymbolButtonPressed(symbol: .percent)
        case 3: // divide
            handleOperationButtonPressed(operation: .division, button: sender)
        case 4: // 7
            handleNumberButtonPressed(number: sender.titleLabel?.text)
        case 5: // 8
            handleNumberButtonPressed(number: sender.titleLabel?.text)
        case 6: // 9
            handleNumberButtonPressed(number: sender.titleLabel?.text)
        case 7: // multiply
            handleOperationButtonPressed(operation: .multiplication, button: sender)
        case 8: // 4
            handleNumberButtonPressed(number: sender.titleLabel?.text)
        case 9: // 5
            handleNumberButtonPressed(number: sender.titleLabel?.text)
        case 10: // 6
            handleNumberButtonPressed(number: sender.titleLabel?.text)
        case 11: // subtraction
            handleOperationButtonPressed(operation: .subtraction, button: sender)
        case 12: // 1
            handleNumberButtonPressed(number: sender.titleLabel?.text)
        case 13: // 2
            handleNumberButtonPressed(number: sender.titleLabel?.text)
        case 14: // 3
            handleNumberButtonPressed(number: sender.titleLabel?.text)
        case 15: // addition
            handleOperationButtonPressed(operation: .addition, button: sender)
        case 16: // 0
            handleNumberButtonPressed(number: sender.titleLabel?.text)
        case 17: // .
            if calculatorIsInUse != true {
                guard !(calcView.displayNumberLabel.text?.contains(".") ?? false) else {return}
            }
            handleNumberButtonPressed(number: sender.titleLabel?.text)
        case 18: // equals
            handleEqualButtonPressed()
        default:
            break
        }
    }
    
    private func handleNumberButtonPressed(number:String?) {
        
        calcView.symbolButtonArray[0].setTitle("C", for: .normal)
        
        if calculatorIsInUse == false {
            calcView.displayNumberLabel.text = (calcView.displayNumberLabel.text ?? "") + number!
            
            if number != "." { calcModel.updateDisplayedNumber(currentDisplayedNumber: Double(calcView.displayNumberLabel.text!)!)
            }
        } else {
            
            calcView.displayNumberLabel.text = number!
            calculatorIsInUse = false
            
            guard Double(number ?? ".") != nil else {return}
            calcModel.updateDisplayedNumber(currentDisplayedNumber: Double(calcView.displayNumberLabel.text!)!)
        }
    }
    
    private func handleOperationButtonPressed(operation:EnumOperations,button:UIButton) {
        guard let number = calcView.displayNumberLabel.text else {return}
        guard Double(number) != nil else {return}
        clearBackGroundColorOfOperatorButtons()
        button.layer.borderColor = UIColor.white.cgColor
        
        if calcModel.setCurrentOperation != .none {
            calcModel.executeOperation(operation: calcModel.returnCurrentOperation()!)
            calcModel.setCurrentOperation = operation
            calcView.displayNumberLabel.text = String(calcModel.returnDisplayedNumber())
            calculatorIsInUse = true
        } else {
            calcModel.setCurrentOperation = operation
            calcModel.updatePreviousNumber(currentSelectedNumber: Double(calcView.displayNumberLabel.text!)!)
            calculatorIsInUse = true
        }
    }
    
    private func handleSymbolButtonPressed(symbol:EnumSymbols) {
        guard let number = calcView.displayNumberLabel.text else {return}
        guard Double(number) != nil else {return}
        
        switch symbol {
            
        case .percent:
            calcModel.clickedSymbol = .percent
            calcView.displayNumberLabel.text = String(calcModel.returnDisplayedNumber())
        case .negativePositive:
            calcModel.clickedSymbol = .negativePositive
            calcView.displayNumberLabel.text = String(calcModel.returnDisplayedNumber())
        case .clear:
            
            switch (calculatorIsInUse == true, calcModel.setCurrentOperation == .none) {
            case (true, false):
                clearBackGroundColorOfOperatorButtons()
                calcModel.setCurrentOperation = .none
            case (false, true):
                calcView.displayNumberLabel.text = ""
            case (true, true):
                calcView.displayNumberLabel.text = ""
            case (false, false):
                clearBackGroundColorOfOperatorButtons()
                calcModel.setCurrentOperation = .none
            }
            calcView.symbolButtonArray[0].setTitle("AC", for: .normal)
        case .allClear:
            calcView.displayNumberLabel.text = ""
            clearBackGroundColorOfOperatorButtons()
        case .none:
            break
        }
    }
    
    private func handleEqualButtonPressed() {
        guard calcModel.returnCurrentOperation() != nil else {return}
        clearBackGroundColorOfOperatorButtons()
        calcModel.executeOperation(operation: calcModel.returnCurrentOperation()!)
        calcView.displayNumberLabel.text = String(calcModel.returnDisplayedNumber())
        calcModel.setCurrentOperation = .none
        calcModel.updatePreviousNumber(currentSelectedNumber: calcModel.returnDisplayedNumber())
        calculatorIsInUse = true
    }
  
    private func clearBackGroundColorOfOperatorButtons() {
        let buttonArray = calcView.operationsButtonArray
        buttonArray.forEach({$0.layer.borderColor = StyleGuide.ButtonStyle.borderColor})
    }
}

