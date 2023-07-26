//
//  MockData.swift
//  Tripo
//
//  Created by Amgad Salah on 18/07/2023.
//

import Foundation

let activity1  : ActivityModel = ActivityModel(title: "DPS", subTitle: "Ride Camel", activityType: ActivityType.flight)

let activity2  : ActivityModel = ActivityModel(title: "Pick up rental", subTitle: "Confirmation: 996464", activityType: ActivityType.auto)

let activity3  : ActivityModel = ActivityModel(title: "Konrad Hotel checkin", subTitle: "eat", activityType: ActivityType.hotel)

let activity4  : ActivityModel = ActivityModel(title: "City Excusion", subTitle: "Dicscovering the city", activityType: ActivityType.excursion)

let activity5  : ActivityModel = ActivityModel(title: "Dinner", subTitle: "eating Koushari from abu tarek", activityType: ActivityType.food)


let day1 : DayModel = DayModel(title: Calendar.current.date(bySetting: .day, value: 1, of: Date())!, subtitle: "Checking in", data: [activity1,activity3,activity2,activity4,activity5])

let day2 : DayModel = DayModel(title: Calendar.current.date(bySetting: .day, value: 2, of: Date())!, subtitle: "Departure", data: [activity2,activity1,activity3,activity4,activity5])

let day3 : DayModel = DayModel(title: Calendar.current.date(bySetting: .day, value: 3, of: Date())!, subtitle: "Exploring", data: [activity3,activity2,activity1,activity4,activity5])

