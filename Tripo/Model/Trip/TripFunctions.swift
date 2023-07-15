//
//  TripFunctions.swift
//  Tripo
//
//  Created by Amgad Salah on 15/07/2023.
//

import Foundation
class TripFunctions {
    static func createTrip(tripmodel : TripModel){
        
    }
    
    static func readTrips(completion : @escaping () -> ()){
        DispatchQueue.global(qos: .userInteractive).async {
            if Data.tripModels.count == 0 {
                Data.tripModels.append(TripModel(title: "Trip to Alexandria"))
                Data.tripModels.append(TripModel(title: "Mexico"))
                Data.tripModels.append(TripModel(title: "Russion Trip "))
            }
        }
        DispatchQueue.main.async {
            completion()
        }
        
        
    }
    
    
    static func updateTrip(tripmodel : TripModel){
        
    }
    
    static func deleteTrip(tripmodel : TripModel){
        
    }
    
}
