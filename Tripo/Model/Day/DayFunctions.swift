//
//  DayFunctions.swift
//  Tripo
//
//  Created by Amgad Salah on 26/07/2023.
//

import Foundation
class DayFunctions {
    static func createDays (at tripIndex: Int, using  dayModel: DayModel) {
        Data.tripModels[tripIndex].dayModels.append(dayModel)
    }
}

