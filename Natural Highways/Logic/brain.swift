//
//  Brain.swift
//  NaturalHIghways2
//
//  Created by Noah Kim on 2/2/21.
//

import Foundation
import Firebase

//var locations: [String:Location] = [:]

struct Brain {
    var placesVisited: Int = 0
    
 
    func checkShowWarning(yesNo: Bool){
        if (yesNo){
            defaults.setValue(true, forKey: "showWarning")
        } else {
            defaults.setValue(false, forKey: "showWarning")
        }
    }
    
    mutating func addLocationVisited(){
        placesVisited += 1
    }
    
    func numVisited() -> Int{
        return placesVisited
    }
    
    //This loads the json from the local file, this should be updated from firebase
    
    mutating func loadJson(){
        
    }
    /*
    func parse(json: Data) {
        let decoder = JSONDecoder()
        
        if let jsonLocations = try? decoder.decode(Locations.self, from: json){
            locations = jsonLocations.locations
        }
    }
    */
}

