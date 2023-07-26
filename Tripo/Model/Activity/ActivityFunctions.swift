//
//  ActivityFunctions.swift
//  Tripo
//
//  Created by Amgad Salah on 26/07/2023.
//

import Foundation

class ActivityFunctions {
    static func createActivity(at tripIndex: Int, for dayIndex: Int, using activityModel:ActivityModel) {
        // Replace with real data store code
        Data.tripModels[tripIndex].dayModels[dayIndex].activityModels.append(activityModel)
    }
    
    static func deleteActivity(at tripIndex: Int, for dayIndex: Int, using activityModel: ActivityModel) {
        // Replace with real data store code
        let dayModel = Data.tripModels[tripIndex].dayModels [dayIndex]
        if let index = dayModel.activityModels.firstIndex(of: activityModel) {
            Data.tripModels[tripIndex].dayModels[dayIndex].activityModels.remove(at:index)
        }
    }
    
    static func updateActivity (at tripIndex: Int, oldDayIndex: Int, newDayIndex: Int, using activityModel:ActivityModel) {
        
        if oldDayIndex != newDayIndex {
            let lastIndex = Data.tripModels [tripIndex].dayModels [newDayIndex].activityModels.count
            reorderActivity(at: tripIndex, oldDayIndex: oldDayIndex, newDayIndex: newDayIndex,newActivityIndex: lastIndex, activityModel: activityModel)
        } else {
            let dayModel = Data.tripModels[tripIndex].dayModels[oldDayIndex]
            let activityIndex = (dayModel.activityModels.firstIndex(of: activityModel))!
            Data.tripModels[tripIndex].dayModels[newDayIndex].activityModels[activityIndex]=activityModel
        }
        
        
    }
    
    
    static func reorderActivity(at tripIndex: Int, oldDayIndex: Int, newDayIndex: Int, newActivityIndex:
                                Int, activityModel: ActivityModel) {
        // Replace with real data store code
        // 1. Remove activity from old location
        let oldDayModel = Data.tripModels [tripIndex].dayModels [oldDayIndex]
        let oldActivityIndex = (oldDayModel.activityModels.firstIndex(of: activityModel))!
        Data.tripModels[tripIndex].dayModels[oldDayIndex].activityModels.remove(at:oldActivityIndex)
        // 2. Insert activity into new location
        Data.tripModels[tripIndex].dayModels[newDayIndex].activityModels.insert(activityModel,at:newActivityIndex)
    }
    
    
}
