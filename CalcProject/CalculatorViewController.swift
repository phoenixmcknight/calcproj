//
//  ViewController.swift
//  CalcProject
//
//  Created by Phoenix McKnight on 4/11/20.
//  Copyright © 2020 Phoenix McKnight. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    private var calculatorIsInUse:Bool = false {
        didSet {
            if calculatorIsInUse == false {
                print("not in use")
            } else {
                print("in use")
            }
        }
    }
    

   private var calcModel = CalculationModel()
    
   private let calcView = CalculatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(calcView)
        addTargetsToButtons()
       
        // Do any additional setup after loading the view.
    }
    
    private func handleSymbolButtonPressed(symbol:EnumSymbols) {
        guard let number = calcView.displayNumberLabel.text else {return}
                   guard let displayedNumber = Double(number) else {return}
        
        switch symbol {
            
        case .percent:
            calcModel.updateDisplayedNumber(currentDisplayedNumber: displayedNumber/100)
             calcView.displayNumberLabel.text = String(calcModel.returnDisplayedNumber())
        case .negativePositive:
            displayedNumber > 0 ? calcModel.updateDisplayedNumber(currentDisplayedNumber: -displayedNumber) : calcModel.updateDisplayedNumber(currentDisplayedNumber: abs(displayedNumber))
             calcView.displayNumberLabel.text = String(calcModel.returnDisplayedNumber())
        case .clear:
           if calculatorIsInUse == true {
                           calcModel.setCurrentOperation = .none
            clearBackGroundColorOfOperatorButtons()
                       } else {
                           calcView.displayNumberLabel.text = ""
                       }
           calcView.symbolButtonArray[0].setTitle("AC", for: .normal)
          
        case .allClear:
            calcModel.clearAll()
            calcView.displayNumberLabel.text = ""
        }
        
         
   
    }
    
   

    @objc private func calculatorButtonFunctions(sender:UIButton) {
       
        switch sender.tag {
        case 0: // clear and allClear
            sender.titleLabel?.text == "AC" ?  handleSymbolButtonPressed(symbol: .allClear) :  handleSymbolButtonPressed(symbol: .clear)
       
        case 1:
 
            handleSymbolButtonPressed(symbol: .negativePositive)
        case 2: // find percent
      
            handleSymbolButtonPressed(symbol: .percent)
        case 3: // divide
            handleOperationButtons(operation: .division, button: sender)
           
        case 4: // 7
            
            handleNumberPressed(number: sender.titleLabel?.text)
            
           
        case 5: // 8
               handleNumberPressed(number: sender.titleLabel?.text)
        case 6: // 9
              handleNumberPressed(number: sender.titleLabel?.text)
        case 7: // multiply
            handleOperationButtons(operation: .multiplication, button: sender)
        case 8: // 6
            handleNumberPressed(number: sender.titleLabel?.text)
        case 9: // 5
              handleNumberPressed(number: sender.titleLabel?.text)
        case 10: // 4
            handleNumberPressed(number: sender.titleLabel?.text)
        case 11: // subtraction
            handleOperationButtons(operation: .subtraction, button: sender)
        case 12: // 3
            handleNumberPressed(number: sender.titleLabel?.text)
        case 13: // 2
             handleNumberPressed(number: sender.titleLabel?.text)
        case 14: // 1
             handleNumberPressed(number: sender.titleLabel?.text)
        case 15: // addition
            handleOperationButtons(operation: .addition, button: sender)
        case 16: // 0
             handleNumberPressed(number: sender.titleLabel?.text)
        case 17: // .
            if calculatorIsInUse != true {
            guard !(calcView.displayNumberLabel.text?.contains(".") ?? false) else {return}
            }
          handleNumberPressed(number: sender.titleLabel?.text)
        case 18:
            guard calcModel.returnCurrentOperation() != nil else {return}
            clearBackGroundColorOfOperatorButtons()
            calcModel.executeOperation(operation: calcModel.returnCurrentOperation()!)
            calcView.displayNumberLabel.text = String(calcModel.returnDisplayedNumber())
            calcModel.setCurrentOperation = .none
            calcModel.updatePreviousNumber(currentSelectedNumber: calcModel.returnDisplayedNumber())
    
        default:
             print("")
        }
    }
    
    private func handleNumberPressed(number:String?) {
       
         calcView.symbolButtonArray[0].setTitle("C", for: .normal)
        
        if calculatorIsInUse == false {
            calcView.displayNumberLabel.text = (calcView.displayNumberLabel.text ?? "") + number!
                  
            if number != "." { calcModel.updateDisplayedNumber(currentDisplayedNumber: Double(calcView.displayNumberLabel.text!)!)
            }
                   } else {
           
                       calcView.displayNumberLabel.text = number!
                       calculatorIsInUse = false
                      
            guard number!.count > 1 else {return}
            calcModel.updateDisplayedNumber(currentDisplayedNumber: Double(calcView.displayNumberLabel.text!)!)
                   }
    }
    
    private func handleOperationButtons(operation:EnumOperations,button:UIButton) {
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
    
    private func addTargetsToButtons() {
        let buttonArray = calcView.symbolButtonArray + calcView.numberButtonArray + calcView.operationsButtonArray
        
        buttonArray.forEach({$0.addTarget(self, action: #selector(calculatorButtonFunctions(sender:)), for: .touchUpInside)})
    }
    
    private func clearBackGroundColorOfOperatorButtons() {
        let buttonArray = calcView.operationsButtonArray
        buttonArray.forEach({$0.layer.borderColor = StyleGuide.ButtonStyle.borderColor})
    }
}

