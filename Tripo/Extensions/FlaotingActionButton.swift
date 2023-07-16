//
//  FlaotingActionButton.swift
//  Tripo
//
//  Created by Amgad Salah on 16/07/2023.
//

import UIKit

class FlaotingActionButton: UIButton {

    
    override func draw(_ rect: CGRect) {
        layer.backgroundColor = Theme.tint?.cgColor
        tintColor = Theme.background
        layer.cornerRadius = frame.height / 2
        layer.shadowOpacity = 0.25
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 0, height: 10)
    }


}
