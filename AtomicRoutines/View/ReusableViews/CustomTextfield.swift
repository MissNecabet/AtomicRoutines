//
//  CuatomTextfield.swift
//  AtomicRoutines
//
//  Created by Najabat Sofiyeva on 16.10.25.
//

import UIKit
func reusableTextFieldStructure(placeholder: String, isSecure: Bool = false) -> UITextField {
    let textfield = UITextField()
    textfield.placeholder = placeholder
    textfield.backgroundColor = UIColor(named: "textfieldColor")
    textfield.isSecureTextEntry = isSecure
    textfield.borderStyle = .none
    textfield.layer.cornerRadius = 10
    textfield.textColor = .black
    textfield.translatesAutoresizingMaskIntoConstraints = false

    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
    textfield.leftView = paddingView
    textfield.leftViewMode = .always

    let rightPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
    textfield.rightView = rightPaddingView
    textfield.rightViewMode = .always

    return textfield
}
