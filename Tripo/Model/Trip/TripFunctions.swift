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
                Data.tripModels.append(TripModel(title: "Egypt",image: UIImage(named: "Pyramids"),dayModels: [day1,day2,day3,day1,day2,day3]))
        
            }
        }
        DispatchQueue.main.async {
            completion()
        }
    }
    
    
    
    static func readTrip(by id: UUID, completion: @escaping (TripModel?) -> ()) {
        // Replace with real data store code
        DispatchQueue.global(qos: .userInitiated).async {
            let trip = Data.tripModels.first(where: { $0.id == id })
            
            DispatchQueue.main.async {
                completion(trip)
            }
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
