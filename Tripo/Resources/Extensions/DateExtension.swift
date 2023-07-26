//
//  DateExtension.swift
//  Tripo
//
//  Created by Amgad Salah on 26/07/2023.
//

import Foundation
extension Date {
    func add(days: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: days, to: Date())!
    }
    func mediumDate() -> String  {
        let formatter = DateFormatter ( )
        formatter.dateStyle = .medium
        return formatter.string(from: self)
    }
}

