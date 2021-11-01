//
//  ViewController.swift
//  2
//
//  Created by Toshiyana on 2021/10/29.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var numTextField1: UITextField!
    @IBOutlet private weak var numTextField2: UITextField!
    @IBOutlet private weak var resultLabel: UILabel!
    @IBOutlet private weak var operationSegmentedControl: UISegmentedControl!

    enum Operation {
        case add, subtract, multiply, divide
    }

    var currentOperation: Operation {
        // 計算時にのみSegmentedControlのoperationは意味を持つので、Action関数を定義する必要ない）
        switch operationSegmentedControl.selectedSegmentIndex {
        case 0:
            return .add
        case 1:
            return .subtract
        case 2:
            return .multiply
        case 3:
            return .divide
        default:
            return .add // これはあんまり良くない気がする
        }
    }

    @IBAction private func calcButtonPressed(_ sender: UIButton) {
        // guard文より、num1, num2は数字のみを受け付ける
        guard let num1 = Double(numTextField1.text ?? "") else {
            resultLabel.text = "数字を入力してください"
            return
        }
        guard let num2 = Double(numTextField2.text ?? "") else {
            resultLabel.text = "数字を入力してください"
            return
        }

        switch currentOperation {
        case .add:
            resultLabel.text = String(num1 + num2)
        case .subtract:
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
    }
}
