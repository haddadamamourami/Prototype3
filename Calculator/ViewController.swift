//
//  ViewController.swift
//  Calculator
//
//  Created by Mohamed Ali BELHADJ on 2022-01-23.
//

import UIKit

class ViewController: UIViewController {
    var currentOperation: Operator = Operator.nothing
    var calcState: Calculation = Calculation.enteringNum
    
    var firstValue: String = ""
    @IBOutlet weak var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
        // button actions
    @IBAction func numberClicked(_ sender: UIButton){
        updateDisplay (number: String(sender.tag))
            
        }
    func updateDisplay (number: String){
        if calcState == Calculation.newNumStarted {
            if let num = resultLabel.text {
                if num != "" {
                    firstValue = num
                }
            }
            calcState = Calculation.enteringNum
            resultLabel.text = number
        }
        else if calcState == Calculation.enteringNum {
            resultLabel.text = resultLabel.text! + number
        }
        
    }
    @IBAction func operatorClicked(_ sender: UIButton){
        calcState = Calculation.newNumStarted
        
        if let num = resultLabel.text {
            if num != "" {
                firstValue = num
                resultLabel.text = ""
            }
        }
        updateOperatorButton(tag: sender.tag)
        
        switch sender.tag {
        case 10:
            currentOperation = Operator.add
        case 11:
            currentOperation = Operator.substract
        case 12:
            currentOperation = Operator.times
        case 13:
            currentOperation = Operator.divide
            
        default:
            return
        }
        
    }
    @IBAction func equalsClicked(_ sender: UIButton){
        
        calculateSum()
        
    }
    func calculateSum (){
        if (firstValue.isEmpty){
            return
        }
        var result = ""
        
        if currentOperation == Operator.times {
            result = "\(Double(firstValue)! * Double(resultLabel.text!)!)"
        }
       else if currentOperation == Operator.divide {
           result = "\(Double(firstValue)! / Double(resultLabel.text!)!)"
        }
       else if currentOperation == Operator.add {
            result = "\(Double(firstValue)! + Double(resultLabel.text!)!)"
        }
       else if currentOperation == Operator.substract {
            result = "\(Double(firstValue)! - Double(resultLabel.text!)!)"
        }
        resultLabel.text = result
        calcState = Calculation.newNumStarted
    }
    func updateOperatorButton (tag: Int) {
        for var i in 10..<14 {
            if let button = self.view.viewWithTag(i) as? UIButton {
                button.backgroundColor = UIColor.clear
            }
        }
        if let button = self.view.viewWithTag(tag) as? UIButton {
            button.backgroundColor = UIColor.yellow
        }
    }
}

