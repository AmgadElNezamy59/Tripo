//
//  TripModel.swift
//  Tripo
//
//  Created by Amgad Salah on 15/07/2023.
//

import UIKit

class TripModel {
    let id : UUID!
    var title : String
    var image : UIImage?
    var dayModels = [DayModel]()
    
    init(title: String ,image : UIImage? = nil ,dayModels:[DayModel]? = nil) {
        self.id = UUID()
        self.title = title
        self.image = image
        if let dayModels = dayModels{
            self.dayModels = dayModels
        }
    }
}


