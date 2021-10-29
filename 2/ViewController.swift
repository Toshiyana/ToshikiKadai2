//
//  ViewController.swift
//  2
//
//  Created by Toshiyana on 2021/10/29.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private var numTextField1: UITextField!
    @IBOutlet private var numTextField2: UITextField!
    @IBOutlet private var resultLabel: UILabel!

    var currentOperation: Operation = .add

    enum Operation {
        case add, subtract, multiply, divide
    }

    @IBAction private func didChangeSegment(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            currentOperation = .add
        case 1:
            currentOperation = .subtract
        case 2:
            currentOperation = .multiply
        case 3:
            currentOperation = .divide
        default:
            break
        }
    }

    @IBAction private func calcButtonPressed(_ sender: UIButton) {
        if numTextField1.text!.isNumber && numTextField2.text!.isNumber {
            let num1 = Double(numTextField1.text!)!
            let num2 = Double(numTextField2.text!)!

            switch currentOperation {
            case .add:
                resultLabel.text = String(num1 + num2)
            case.subtract:
                resultLabel.text = String(num1 - num2)
            case .multiply:
                resultLabel.text = String(num1 * num2)
            case .divide:
                if num2 == 0.0 {
                    resultLabel.text = "割る数には0以外を入力してください"
                } else {
                    resultLabel.text = String(num1 / num2)
                }
            }
        } else {
            resultLabel.text = "数字を入力してください"
        }
    }
}
