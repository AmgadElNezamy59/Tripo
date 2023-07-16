//
//  AppUiButton.swift
//  Tripo
//
//  Created by Amgad Salah on 16/07/2023.
//

import UIKit

class AppUIButton: UIButton {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        
        layer.backgroundColor = Theme.tint?.cgColor
        tintColor = Theme.backgroundColor
        layer.cornerRadius = frame.height / 2
       
        
    }
    
}
