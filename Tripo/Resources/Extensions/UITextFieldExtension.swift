//
//  UITextFieldExtension.swift
//  Tripo
//
//  Created by Amgad Salah on 26/07/2023.
//

import UIKit
extension UITextField {
    var hasValue: Bool {
        guard text == "" else {return true}
        
        layer.borderColor = Theme.tint?.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 5
        placeholder = "Required"
        
        
        
        return false
    }
}
