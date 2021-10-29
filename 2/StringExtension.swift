//
//  StringExtension.swift
//  2
//
//  Created by Toshiyana on 2021/10/29.
//

import Foundation

extension String {
    var isNumber: Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
}
