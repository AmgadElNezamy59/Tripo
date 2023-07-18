//
//  TripModel.swift
//  Tripo
//
//  Created by Amgad Salah on 15/07/2023.
//

import UIKit

class TripModel {
    let id : String
    var title : String
    var image : UIImage?
    var dayModels = [DayModel]()
    
    init(title: String ,image : UIImage? = nil) {
        self.id = UUID().uuidString
        self.title = title
        self.image = image
    }
}
