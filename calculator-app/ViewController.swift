//
//  ViewController.swift
//  calculator-app
//
//  Created by hutuunoniito on 2022/05/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var displayLabel: UILabel!
    @IBOutlet var labelPlus: UILabel!
    @IBOutlet var labelMinus: UILabel!
    @IBOutlet var labelMultiply: UILabel!
    @IBOutlet var labelDivide: UILabel!

    
    @IBOutlet var btn0: UIButton!
    @IBOutlet var btn1: UIButton!
    @IBOutlet var btn2: UIButton!
    @IBOutlet var btn3: UIButton!
    @IBOutlet var btn4: UIButton!
    @IBOutlet var btn5: UIButton!
    @IBOutlet var btn6: UIButton!
    @IBOutlet var btn7: UIButton!
    @IBOutlet var btn8: UIButton!
    @IBOutlet var btn9: UIButton!
    @IBOutlet var btnPlus: UIButton!
    @IBOutlet var btnMinus: UIButton!
    @IBOutlet var btnMultiply: UIButton!
    @IBOutlet var btnDivide: UIButton!
    @IBOutlet var btnEqual: UIButton!
    @IBOutlet var btnReset: UIButton!
    
    var firstNum = 0
    var lastNum = 0
    var operatorName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func tap(_ sender: UIButton) {
        switch sender.titleLabel?.text {
        case "0":
            NumNum(value: 0)
        case "1":
            NumNum(value: 1)
        case "2":
            NumNum(value: 2)
        case "3":
            NumNum(value: 3)
        case "4":
            NumNum(value: 4)
        case "5":
            NumNum(value: 5)
        case "6":
            NumNum(value: 6)
        case "7":
            NumNum(value: 7)
        case "8":
            NumNum(value: 8)
        case "9":
            NumNum(value: 9)
        case "+":
            Operator(value: "plus")
        case "-":
            Operator(value: "minus")
        case "×":
            Operator(value: "multiply")
        case "÷":
            Operator(value: "divide")
        case "=":
            Calculation()
        case "Reset":
            Reset()
        default:
            print("ようこそ! いらっしゃいませ")
        }
    }
    
    func NumNum(value: Int) {
        print(value)
        var num = ""
        if operatorName.isEmpty {
            if firstNum != 0 {
                num = String(firstNum) + String(value)
                firstNum = Int(num)!
            } else {
                num = String(value)
                firstNum = Int(num)!
            }
        } else {
            if lastNum != 0 {
                num = String(lastNum) + String(value)
                lastNum = Int(num)!
            } else {
                num = String(value)
                lastNum = value
            }
        }
        displayLabel.text = num
    }
    
    func Calculation() {
        var resultValue = 0
        switch operatorName {
        case "plus":
            resultValue = firstNum + lastNum
            print(resultValue)
        case "minus":
            resultValue = firstNum - lastNum
            print(resultValue)
        case "multiply":
            resultValue = firstNum * lastNum
            print(resultValue)
        case "divide":
            resultValue = firstNum / lastNum
            print(resultValue)
        default:
            print("何してんの？")
        }
        displayLabel.text = String(resultValue)
    }
    
    func Reset() {
        print("Reset")
        firstNum = 0
        lastNum = 0
        operatorName = ""
        displayLabel.text = "0"
        OperatorColor(value: "default")
    }
    
    func Operator(value: String) {
        print(value)
        operatorName = value
        OperatorColor(value: value)
    }
    
    
    func OperatorColor(value: String) {
        switch value {
        case "plus":
            labelPlus.textColor = UIColor.black
            labelMinus.textColor = UIColor.systemGray2
            labelMultiply.textColor = UIColor.systemGray2
            labelDivide.textColor = UIColor.systemGray2
        case "minus":
            labelPlus.textColor = UIColor.systemGray2
            labelMinus.textColor = UIColor.black
            labelMultiply.textColor = UIColor.systemGray2
            labelDivide.textColor = UIColor.systemGray2
        case "multiply":
            labelPlus.textColor = UIColor.systemGray2
            labelMinus.textColor = UIColor.systemGray2
            labelMultiply.textColor = UIColor.black
            labelDivide.textColor = UIColor.systemGray2
        case "divide":
            labelPlus.textColor = UIColor.systemGray2
            labelMinus.textColor = UIColor.systemGray2
            labelMultiply.textColor = UIColor.systemGray2
            labelDivide.textColor = UIColor.black
        default:
            labelPlus.textColor = UIColor.systemGray2
            labelMinus.textColor = UIColor.systemGray2
            labelMultiply.textColor = UIColor.systemGray2
            labelDivide.textColor = UIColor.systemGray2
        }
    
    }
 
}

