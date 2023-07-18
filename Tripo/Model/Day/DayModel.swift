//
//  DayModel.swift
//  Tripo
//
//  Created by Amgad Salah on 18/07/2023.
//

import Foundation

struct DayModel {
    var id:String
    var title = ""
    var subTitle = ""
    var activityModels = [ActivityModel]()
    
    init(title: String, subtitle: String, data: [ActivityModel]?) {
        id = UUID() .uuidString
        self.title = title
        self.subTitle = subtitle
        if let data = data {
            self.activityModels = data
        }
    }
}
