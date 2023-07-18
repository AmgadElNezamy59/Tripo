//
//  MockData.swift
//  Tripo
//
//  Created by Amgad Salah on 18/07/2023.
//

import Foundation

let activity1  : ActivityModel = ActivityModel(title: "Sand Skating", subTitle: "Ride Camel", activityType: ActivityType.flight)

let activity2  : ActivityModel = ActivityModel(title: "swim", subTitle: "Ride hourse", activityType: ActivityType.flight)

let activity3  : ActivityModel = ActivityModel(title: "fly", subTitle: "eat", activityType: ActivityType.flight)


let day1 : DayModel = DayModel(title: "18 Apr", subtitle: "Checking in", data: [activity1,activity3,activity2])
let day2 : DayModel = DayModel(title: "15 Apr", subtitle: "Departure", data: [activity2,activity1,activity3])
let day3 : DayModel = DayModel(title: "18 Aug", subtitle: "Exploring", data: [activity3,activity2,activity1])

