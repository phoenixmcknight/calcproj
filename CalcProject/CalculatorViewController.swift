//
//  ViewController.swift
//  CalcProject
//
//  Created by Phoenix McKnight on 4/11/20.
//  Copyright © 2020 Phoenix McKnight. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    let calcView = CalculatorView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(calcView)
        // Do any additional setup after loading the view.
    }


}

