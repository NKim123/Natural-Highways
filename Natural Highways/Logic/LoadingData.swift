//
//  LoadingData.swift
//  NaturalHIghways2
//
//  Created by Noah Kim on 2/4/21.
//

import Foundation
import Firebase

class Locations: ObservableObject{
    //temporary while the app is loading
    var locations: NSDictionary = [
        "trail1":["desc_short":"hello","desc_long":"hello"]
    ]
    //reference to the firebase realtime database
    var ref: DatabaseReference = Database.database().reference()
    
    //this returns a dictionary with all the information
    func getLocs() -> NSDictionary{
        getData { (theThing) in
            self.locations = theThing
        }
        return locations
    }
    
    //adds the items to an array and returns the array
    func addToArray(trails: NSDictionary) -> [[String]]{
        var end: [[String]] = []
        for (key, value) in trails{
            let dict = value as! NSDictionary
            end.append([key as! String, dict["desc_short"] as! String, dict["desc_long"] as! String])
        }
        return end
    }
    
    //this actually retrieves the information from the server
    func getData(completionHandler: @escaping (NSDictionary) -> Void) {
        self.ref.child("locations").observe(.value, with: { (snapshot) in
            let thing = snapshot.value as? NSDictionary
            completionHandler(thing!)
        })
    }
}


struct Location{
    let desc_short: String
    let desc_long: String
}

struct Name: Codable {
    
}
