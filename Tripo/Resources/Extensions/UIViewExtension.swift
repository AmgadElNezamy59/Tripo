//
//  UIViewExtension.swift
//  Tripo
//
//  Created by Amgad Salah on 15/07/2023.
//

import UIKit

extension UIView {

    func addShadow(){
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 0, height: 10)
        layer.shadowColor = UIColor.darkGray.cgColor
        
    }
    
    func addRoundedCorner(){
        layer.cornerRadius = 15

    }
}

