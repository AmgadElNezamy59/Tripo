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
}
