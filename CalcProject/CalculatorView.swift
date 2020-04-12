//
//  CalculatorView.swift
//  CalcProject
//
//  Created by Phoenix McKnight on 4/11/20.
//  Copyright © 2020 Phoenix McKnight. All rights reserved.
//

import UIKit

class CalculatorView: UIView {
    
    private enum ButtonType {
        case symbol
        case operation
        case number
    }
    
    //MARK: View Objects
    
    lazy var blackScreenView:UIView =
        {
            let screen = UIView()
            screen.backgroundColor = .black
            return screen
    }()
    
    lazy var displayNumberLabel:UILabel =
        {
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
    
    override init(frame:CGRect)
    {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    private func commonInit()
    {
        createButtons()
        configureStackViewss()
        addSubviews()
        addConstraintsToViewObjects()
        giveButtonsTags()
        
    }
    
    private func createButtons()
    {
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
    
    private func addConstraintsToViewObjects()
    {
        blankScreenViewConstraints()
        displayNumerLabelConstraints()
        firstRowStackViewConstraints()
        secondRowStackViewConstraints()
        thirdRowStackViewConstraints()
        fourthRowStackViewConstraints()
        fifthRowStackViewConstraints()
        buttonConstraints()
    }
    
    //MARK: Configure Buttons
    
    private func createNumberButtons()
    {
        let numberArray:[Int] = [9,8,7,6,5,4,3,2,1,0]
        
        numberArray.forEach({
            let uiButton = UIButton()
            configureButtons(button: uiButton, buttonType: .number, buttonName: String($0))
        })
        let uiButton = UIButton()
        
        configureButtons(button: uiButton, buttonType: .number, buttonName: ".")
    }
    private func createSymbolButtons()
    {
        let symbolsArray:[String] = ["AC","+/-","%"]
        
        symbolsArray.forEach({
            let uiButton = UIButton()
            configureButtons(button: uiButton, buttonType: .symbol, buttonName: $0)
        })
    }
    
    private func createOperationButtons()
    {
        let operationsArray:[String] = ["÷","x","-","+","="]
        
        operationsArray.forEach({
            let uiButton = UIButton()
            configureButtons(button: uiButton, buttonType: .operation, buttonName: $0)
        })
    }
    
    private func giveButtonsTags()
    {
        var count = 0
        let buttonArray = firstRowStackView.arrangedSubviews + secondRowStackView.arrangedSubviews + thirdRowStackView.arrangedSubviews + fourthRowStackView.arrangedSubviews + fifthRowStackView.arrangedSubviews
        
        for button in buttonArray {
            button.tag = count
            count += 1
        }
    }
    
    private func configureButtons(button:UIButton,buttonType:ButtonType,buttonName:String)
    {
        button.setTitle(buttonName, for: .normal)
        button.showsTouchWhenHighlighted = true
        button.layer.borderWidth = StyleGuide.ButtonStyle.borderWidth
        button.layer.borderColor = StyleGuide.ButtonStyle.borderColor
        button.titleLabel?.font = UIFont(name: StyleGuide.ButtonStyle.fontName, size: StyleGuide.ButtonStyle.fontSize)
        button.setTitleColor(StyleGuide.ButtonStyle.fontColor, for: .normal)
        
        
        switch buttonType {
            
        case .symbol:
            
            button.backgroundColor = StyleGuide.ButtonStyle.altBackgroundColor
            symbolButtonArray.append(button)
            
        case .operation:
            
            button.titleLabel?.font = UIFont(name: StyleGuide.ButtonStyle.fontName, size: StyleGuide.ButtonStyle.altFontSize)
            button.setTitleColor(StyleGuide.ButtonStyle.altFontColor, for: .normal)
            button.backgroundColor = StyleGuide.ButtonStyle.operationBackgroundColor
            operationsButtonArray.append(button)
            
        case .number:
            
            button.backgroundColor = StyleGuide.ButtonStyle.backgroundColor
            numberButtonArray.append(button)
            
        }
    }
    
    //MARK: Configure StackViews
    
    private func configureStackViewss()
    {
        let stackArray:[UIStackView] = [firstRowStackView,secondRowStackView,thirdRowStackView,fourthRowStackView,fifthRowStackView]
        
        for stack in stackArray {
            stack.alignment = .fill
            stack.distribution = .fillEqually
            stack.spacing = 0
            stack.axis = .horizontal
        }
        fifthRowStackView.distribution = .fill
    }
    
    private func addSubviewsToStackViews()
    {
        addSubviewsToFirstRowStackView()
        addSubviewsToSecondRowStackView()
        addSubviewsToThirdRowStackView()
        addSubviewsToFourthRowStackView()
        addSubviewsToFifthRowStackView()
    }
    
    private func addSubviewsToFirstRowStackView()
    {
        firstRowStackView.addArrangedSubview(symbolButtonArray[0])
        firstRowStackView.addArrangedSubview(symbolButtonArray[1])
        firstRowStackView.addArrangedSubview(symbolButtonArray[2])
        firstRowStackView.addArrangedSubview(operationsButtonArray[0])
    }
    
    private func addSubviewsToSecondRowStackView()
    {
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
    
    private func addSubviewsToFourthRowStackView()
    {
        fourthRowStackView.addArrangedSubview(numberButtonArray[8])
        fourthRowStackView.addArrangedSubview(numberButtonArray[7])
        fourthRowStackView.addArrangedSubview(numberButtonArray[6])
        fourthRowStackView.addArrangedSubview(operationsButtonArray[3])
    }
    
    private func addSubviewsToFifthRowStackView()
    {
        fifthRowStackView.addArrangedSubview(numberButtonArray[9])
        fifthRowStackView.addArrangedSubview(numberButtonArray[10])
        fifthRowStackView.addArrangedSubview(operationsButtonArray[4])
    }
    
    //MARK: View Constraints
    
    private func blankScreenViewConstraints()
    {
        blackScreenView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            blackScreenView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            blackScreenView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            blackScreenView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            blackScreenView.heightAnchor.constraint(equalTo: self.heightAnchor,multiplier: 0.20)
        ])
    }
    
    private func displayNumerLabelConstraints()
    {
        displayNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            displayNumberLabel.heightAnchor.constraint(equalTo: blackScreenView.heightAnchor,multiplier: 0.5),
            displayNumberLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant:-self.frame.height * 0.01 ),
            displayNumberLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            displayNumberLabel.bottomAnchor.constraint(equalTo: blackScreenView.bottomAnchor,constant: -self.frame.height * 0.01)
        ])
    }
    
    private func firstRowStackViewConstraints()
    {
        firstRowStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firstRowStackView.topAnchor.constraint(equalTo: blackScreenView.bottomAnchor),
            firstRowStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            firstRowStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            firstRowStackView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.14)
        ])
    }
    
    private func secondRowStackViewConstraints()
    {
        secondRowStackView.translatesAutoresizingMaskIntoConstraints = false
        
        genericStackViewConstraints(stackView: secondRowStackView, stackViewAboveCurrentStackView: firstRowStackView)
    }
    
    private func thirdRowStackViewConstraints()
    {
        thirdRowStackView.translatesAutoresizingMaskIntoConstraints = false
        
        genericStackViewConstraints(stackView: thirdRowStackView, stackViewAboveCurrentStackView: secondRowStackView)
    }
    
    private func fourthRowStackViewConstraints()
    {
        fourthRowStackView.translatesAutoresizingMaskIntoConstraints = false
        
        genericStackViewConstraints(stackView: fourthRowStackView, stackViewAboveCurrentStackView: thirdRowStackView)
    }
    
    private func fifthRowStackViewConstraints()
    {
        fifthRowStackView.translatesAutoresizingMaskIntoConstraints = false
        genericStackViewConstraints(stackView: fifthRowStackView, stackViewAboveCurrentStackView: fourthRowStackView)
    }
    
    private func genericStackViewConstraints(stackView:UIView,stackViewAboveCurrentStackView:UIView)
    {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: stackViewAboveCurrentStackView.bottomAnchor),
            stackView.centerXAnchor.constraint(equalTo: firstRowStackView.centerXAnchor),
            stackView.heightAnchor.constraint(equalTo: firstRowStackView.heightAnchor),
            stackView.widthAnchor.constraint(equalTo: firstRowStackView.widthAnchor)
        ])
    }
    
    private func buttonConstraints()
    {
        let buttonArray = symbolButtonArray + operationsButtonArray + numberButtonArray
        
        buttonArray.forEach({
            if $0.titleLabel?.text == "0" {
                $0.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
            } else {
                $0.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.25).isActive = true
            }
        })
    }
    required init?(coder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
}

