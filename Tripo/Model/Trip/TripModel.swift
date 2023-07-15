//
//  TripModel.swift
//  Tripo
//
//  Created by Amgad Salah on 15/07/2023.
//

import Foundation
class TripModel {
    var id : String
    var title : String
    
    init(title: String) {
        self.id = UUID().uuidString
        self.title = title
    }
}
