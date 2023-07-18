//
//  ActivityModel.swift
//  Tripo
//
//  Created by Amgad Salah on 18/07/2023.
//

import UIKit

struct ActivityModel {
    var id: String!
    var title = ""
    var subTitle = ""
    var activityType: ActivityType
    var photo: UIImage?
    
    init(title: String, subTitle: String, activityType: ActivityType, photo: UIImage? = nil) {
        id = UUID() .uuidString
        self.title = title
        self.subTitle = subTitle
        self.activityType = activityType
        self.photo = photo
    }
}


