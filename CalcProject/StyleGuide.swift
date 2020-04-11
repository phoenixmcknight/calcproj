//
//  StyleGuide.swift
//  Eat_At_Home
//
//  Created by Phoenix McKnight on 3/28/20.
//  Copyright © 2020 Phoenix McKnight. All rights reserved.
//


import UIKit

enum StyleGuide {
    
    // MARK: - For Headers: App Name
    enum TitleFontStyle{
        static let fontName = "CopperPlate"
        static let fontColor: UIColor = #colorLiteral(red: 0.9164920449, green: 0.7743749022, blue: 0.9852260947, alpha: 1)
        static let fontSize:CGFloat = 50
        static let altFontSize: CGFloat = 25
    }
    
    // MARK: -  For Labels
    enum FontStyle {
        static let fontName = "Helvetica-Neue"
        static let fontSize: CGFloat = 14
        static let altFontSize: CGFloat = 25
        static let fontColor: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    // MARK: - For All App Colors
    enum AppColors{
        static let primaryColor: UIColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
        static let accentColor: UIColor =  #colorLiteral(red: 0.4716594219, green: 0.01316980645, blue: 0, alpha: 1)
        static let disabledColor: UIColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        static let backgroundColor: UIColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        
    }
    
    // MARK: -  For Placeholder Images
    enum ImageStrings {
        static let placeHolder = "photo"
    }
    
    //  MARK: - For All Buttons
    enum ButtonStyle {
        static let fontName = "CopperPlate"
        static let borderColor: CGColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        static let fontColor: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        static let altFontColor:UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        static let disabledColor: UIColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        static let backgroundColor: UIColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        static let operationBackgroundColor: UIColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        static let altBackgroundColor:UIColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        static let fontSize: CGFloat = 25
        static let altFontSize: CGFloat = 50
        static let cornerRadius: CGFloat = 5
        static let borderWidth: CGFloat = 1.5
        
        
    }
    //For All Textfields
    enum TextFieldStyle {
        static let backgroundColor: UIColor = #colorLiteral(red: 0.9164920449, green: 0.7743749022, blue: 0.9852260947, alpha: 1)
        static let fontName = "Helvetica-Neue"
        static let fontSize: CGFloat = 14
    }
}
