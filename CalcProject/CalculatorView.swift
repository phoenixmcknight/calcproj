//
//  CalculatorView.swift
//  CalcProject
//
//  Created by Phoenix McKnight on 4/11/20.
//  Copyright © 2020 Phoenix McKnight. All rights reserved.
//

import UIKit

class CalculatorView: UIView {

    lazy var blackScreenView:UIView =
        {
            let screen = UIView()
            screen.backgroundColor = .black
           return screen
    }()
    
    lazy var displayNumberLabel:UILabel = {
      let label = UILabel()
       
     label.adjustsFontSizeToFitWidth = true
     label.numberOfLines = 1
        label.font = UIFont(name: StyleGuide.FontStyle.fontName, size: StyleGuide.FontStyle.fontSize)
        
        label.adjustsFontForContentSizeCategory = true
    label.textColor = StyleGuide.FontStyle.fontColor
        label.textAlignment = .right
               return label
    }()
    
    lazy var firstRowStackView:UIStackView =
        {
        return UIStackView()
    }()
    
    lazy var secondRowStackView:UIStackView =
          {
          return UIStackView()
      }()
    
    lazy var thirdRowStackView:UIStackView =
          {
          return UIStackView()
      }()
    
    lazy var fourthRowStackView:UIStackView =
          {
          return UIStackView()
      }()
    
    lazy var fifthRowStackView:UIStackView =
        {
            return UIStackView()
    }()
    
    lazy var numberButtonArray:[UIButton] = []
    
    lazy var symbolButtonArray:[UIButton] = []
    
    lazy var operationsButtonArray:[UIButton] = []
    
    override init(frame:CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit(){
    createButtons()
    configureStackViewss()
    addSubviews()
    addConstraintsToViews()
    giveButtonsTags()
        
    }
    
    private func createButtons() {
        createNumberButtons()
        createSymbolButtons()
        createOperationButtons()
    }
    
    private func addSubviews()
    {
        self.addSubview(blackScreenView)
        blackScreenView.addSubview(displayNumberLabel)
        self.addSubview(firstRowStackView)
        self.addSubview(secondRowStackView)
        self.addSubview(thirdRowStackView)
        self.addSubview(fourthRowStackView)
        self.addSubview(fifthRowStackView)
        addSubviewsToFirstRowStackView()
        addSubviewsToSecondRowStackView()
        addSubviewsToThirdRowStackView()
        addSubviewsToFourthRowStackView()
        addSubviewsToFifthRowStackView()
    }
    
    private func addConstraintsToViews() {
                blankScreenViewConstraints()
                displayNumerLabelConstraints()
                firstRowStackViewConstraints()
                secondRowStackViewConstraints()
                thirdRowStackViewConstraints()
                fourthRowStackViewConstraints()
                fifthRowStackViewConstraints()
        buttonConstraints()
       }

    private func createNumberButtons() {
        let numberArray:[Int] = [9,8,7,6,5,4,3,2,1,0]
        
        for num in numberArray {
            let uiButton = UIButton()
            uiButton.setTitle("\(num)", for: .normal)
            uiButton.setTitleColor(StyleGuide.ButtonStyle.fontColor, for: .normal)
            uiButton.titleLabel?.font = UIFont(name: StyleGuide.ButtonStyle.fontName, size: StyleGuide.ButtonStyle.fontSize)
            uiButton.showsTouchWhenHighlighted = true
            uiButton.layer.borderWidth = StyleGuide.ButtonStyle.borderWidth
            uiButton.layer.borderColor = StyleGuide.ButtonStyle.borderColor
            uiButton.backgroundColor = StyleGuide.ButtonStyle.backgroundColor
            numberButtonArray.append(uiButton)
        }
        let uiButton = UIButton()
        uiButton.setTitle(".", for: .normal)
    uiButton.setTitleColor(StyleGuide.ButtonStyle.fontColor, for: .normal)
        uiButton.titleLabel?.font = UIFont(name: StyleGuide.ButtonStyle.fontName, size: StyleGuide.ButtonStyle.altFontSize)
        uiButton.showsTouchWhenHighlighted = true

        uiButton.layer.borderWidth = StyleGuide.ButtonStyle.borderWidth
                  uiButton.layer.borderColor = StyleGuide.ButtonStyle.borderColor
                  uiButton.backgroundColor = StyleGuide.ButtonStyle.backgroundColor
        numberButtonArray.append(uiButton)
    }
    private func createSymbolButtons() {
        let symbolsArray:[String] = ["AC","+/-","%"]
        for symbol in symbolsArray {
                  let uiButton = UIButton()
                  uiButton.setTitle(symbol, for: .normal)
                  uiButton.setTitleColor(StyleGuide.ButtonStyle.fontColor, for: .normal)
                  uiButton.titleLabel?.font = UIFont(name: StyleGuide.ButtonStyle.fontName, size: StyleGuide.ButtonStyle.fontSize)
         
            uiButton.showsTouchWhenHighlighted = true

            uiButton.layer.borderWidth = StyleGuide.ButtonStyle.borderWidth
                             uiButton.layer.borderColor = StyleGuide.ButtonStyle.borderColor
                             uiButton.backgroundColor = StyleGuide.ButtonStyle.altBackgroundColor
            symbolButtonArray.append(uiButton)
              }
    }
    
    private func createOperationButtons() {
        let operationsArray:[String] = ["÷","x","-","+","="]
        
        for operation in operationsArray {
           let uiButton = UIButton()
                             uiButton.setTitle(operation, for: .normal)
                             uiButton.setTitleColor(StyleGuide.ButtonStyle.altFontColor, for: .normal)
            
            

            
                             uiButton.titleLabel?.font = UIFont(name: StyleGuide.ButtonStyle.fontName, size: StyleGuide.ButtonStyle.altFontSize)
            uiButton.showsTouchWhenHighlighted = true

            uiButton.layer.borderWidth = StyleGuide.ButtonStyle.borderWidth
                             uiButton.layer.borderColor = StyleGuide.ButtonStyle.borderColor
                             uiButton.backgroundColor = StyleGuide.ButtonStyle.operationBackgroundColor
                       operationsButtonArray.append(uiButton)
        }
    }
    
    private func giveButtonsTags() {
        var count = 0
        
        let buttonArray = firstRowStackView.arrangedSubviews + secondRowStackView.arrangedSubviews + thirdRowStackView.arrangedSubviews + fourthRowStackView.arrangedSubviews + fifthRowStackView.arrangedSubviews
        
        for button in buttonArray {
            print(button)
            button.tag = count
            count += 1
        }
    }
    
    private func configureStackViewss() {
          let stackArray:[UIStackView] = [firstRowStackView,secondRowStackView,thirdRowStackView,fourthRowStackView,fifthRowStackView]
          
          for stack in stackArray {
                   stack.alignment = .fill
              stack.distribution = .fillEqually
                     stack.spacing = 0
                     stack.axis = .horizontal
          }
          fifthRowStackView.distribution = .fill
      }
    
    
    
    private func addSubviewsToStackViews() {
    addSubviewsToFirstRowStackView()
    addSubviewsToSecondRowStackView()
    addSubviewsToThirdRowStackView()
    addSubviewsToFourthRowStackView()
    addSubviewsToFifthRowStackView()
    }
    
    private func addSubviewsToFirstRowStackView() {
        firstRowStackView.addArrangedSubview(symbolButtonArray[0])
        firstRowStackView.addArrangedSubview(symbolButtonArray[1])
        firstRowStackView.addArrangedSubview(symbolButtonArray[2])
        firstRowStackView.addArrangedSubview(operationsButtonArray[0])
    }
    
    private func addSubviewsToSecondRowStackView() {
        secondRowStackView.addArrangedSubview(numberButtonArray[2])
        secondRowStackView.addArrangedSubview(numberButtonArray[1])
        secondRowStackView.addArrangedSubview(numberButtonArray[0])
        secondRowStackView.addArrangedSubview(operationsButtonArray[1])
    }
    
    private func addSubviewsToThirdRowStackView()
    {
        thirdRowStackView.addArrangedSubview(numberButtonArray[5])
        thirdRowStackView.addArrangedSubview(numberButtonArray[4])
        thirdRowStackView.addArrangedSubview(numberButtonArray[3])
        thirdRowStackView.addArrangedSubview(operationsButtonArray[2])
    }
    
    private func addSubviewsToFourthRowStackView() {
        fourthRowStackView.addArrangedSubview(numberButtonArray[8])
        fourthRowStackView.addArrangedSubview(numberButtonArray[7])
        fourthRowStackView.addArrangedSubview(numberButtonArray[6])
        fourthRowStackView.addArrangedSubview(operationsButtonArray[3])
    }
    
    private func addSubviewsToFifthRowStackView() {
        fifthRowStackView.addArrangedSubview(numberButtonArray[9])
        fifthRowStackView.addArrangedSubview(numberButtonArray[10])
        
        fifthRowStackView.addArrangedSubview(operationsButtonArray[4])
    }
    
  
    
    private func blankScreenViewConstraints() {
        blackScreenView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            blackScreenView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            blackScreenView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            blackScreenView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            blackScreenView.heightAnchor.constraint(equalTo: self.heightAnchor,multiplier: 0.20)
            
        ])
    }
    
    private func displayNumerLabelConstraints() {
        displayNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            displayNumberLabel.heightAnchor.constraint(equalTo: blackScreenView.heightAnchor,multiplier: 0.5),
            displayNumberLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant:-self.frame.height * 0.01 ),
            displayNumberLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            displayNumberLabel.bottomAnchor.constraint(equalTo: blackScreenView.bottomAnchor,constant: -self.frame.height * 0.01)
        ])
    }
    
    private func firstRowStackViewConstraints() {
        firstRowStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        firstRowStackView.topAnchor.constraint(equalTo: blackScreenView.bottomAnchor),
        firstRowStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        firstRowStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        firstRowStackView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.14)
        ])
    }
    
    private func secondRowStackViewConstraints() {
        secondRowStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            secondRowStackView.topAnchor.constraint(equalTo: firstRowStackView.bottomAnchor),
            secondRowStackView.centerXAnchor.constraint(equalTo: firstRowStackView.centerXAnchor),
            secondRowStackView.heightAnchor.constraint(equalTo: firstRowStackView.heightAnchor),
            
            secondRowStackView.widthAnchor.constraint(equalTo: firstRowStackView.widthAnchor)
        ])
    }
    
    private func thirdRowStackViewConstraints() {
        thirdRowStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            thirdRowStackView.topAnchor.constraint(equalTo: secondRowStackView.bottomAnchor),
            thirdRowStackView.centerXAnchor.constraint(equalTo: firstRowStackView.centerXAnchor),
            thirdRowStackView.heightAnchor.constraint(equalTo: firstRowStackView.heightAnchor),
            
            thirdRowStackView.widthAnchor.constraint(equalTo: firstRowStackView.widthAnchor)
        ])
    }
    
    private func fourthRowStackViewConstraints() {
        fourthRowStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            fourthRowStackView.topAnchor.constraint(equalTo: thirdRowStackView.bottomAnchor),
            fourthRowStackView.centerXAnchor.constraint(equalTo: firstRowStackView.centerXAnchor),
            fourthRowStackView.heightAnchor.constraint(equalTo: firstRowStackView.heightAnchor),
            fourthRowStackView.widthAnchor.constraint(equalTo: firstRowStackView.widthAnchor)
        ])
    }
    
    private func fifthRowStackViewConstraints() {
        fifthRowStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            fifthRowStackView.topAnchor.constraint(equalTo: fourthRowStackView.bottomAnchor),
            fifthRowStackView.centerXAnchor.constraint(equalTo: firstRowStackView.centerXAnchor),
            fifthRowStackView.heightAnchor.constraint(equalTo: firstRowStackView.heightAnchor),
            fifthRowStackView.widthAnchor.constraint(equalTo: firstRowStackView.widthAnchor)
        ])
    }
    
    private func buttonConstraints() {
        for button in numberButtonArray {
          
            if button.titleLabel?.text == "0" {
                button.widthAnchor.constraint(equalTo: firstRowStackView.widthAnchor, multiplier: 0.5).isActive = true
            } else {
                  button.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.25).isActive = true
            }
        }
        
        for button in symbolButtonArray {
              button.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.25).isActive = true
        }
        
        for button in operationsButtonArray {
              button.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.25).isActive = true
        }
    }
    
}
