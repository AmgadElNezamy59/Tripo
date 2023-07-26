//
//  DayModel.swift
//  Tripo
//
//  Created by Amgad Salah on 18/07/2023.
//

import Foundation

struct DayModel {
    var id : String
    var title = Date()
    var subTitle = ""
    var activityModels = [ActivityModel]()
    
    init(title: Date, subtitle: String, data: [ActivityModel]?) {
        id = UUID() .uuidString
        self.title = title
        self.subTitle = subtitle
        if let data = data {
            self.activityModels = data
        }
    }
}


extension DayModel: Comparable {
    static func < (lhs: DayModel, rhs: DayModel) -> Bool {
        return lhs.title < rhs.title
    }
    static func == (lhs: DayModel, rhs: DayModel) -> Bool {
        return lhs.id == rhs.id
    }
}
