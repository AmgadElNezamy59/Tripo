//
//  TripFunctions.swift
//  Tripo
//
//  Created by Amgad Salah on 15/07/2023.
//

import UIKit

class TripFunctions {
    static func createTrip(tripmodel : TripModel){
        
        Data.tripModels.append(tripmodel)
        
    }
    
    static func readTrips(completion : @escaping () -> ()){
        DispatchQueue.global(qos: .userInteractive).async {
            if Data.tripModels.count == 0 {
                Data.tripModels.append(TripModel(title: "Trip to    "))
                Data.tripModels.append(TripModel(title: "Mexico"))
                Data.tripModels.append(TripModel(title: "Russion Trip "))
                Data.tripModels.append(TripModel(title: "Egypt"))
            }
        }
        DispatchQueue.main.async {
            completion()
        }
    }
    
    
    static func updateTrip(at index : Int,title:String,image:UIImage?){
        Data.tripModels[index].title = title
        Data.tripModels[index].image = image

    }
    
    
    static func deleteTrip(index : Int){
        Data.tripModels.remove(at: index)
        
    }
    
}
