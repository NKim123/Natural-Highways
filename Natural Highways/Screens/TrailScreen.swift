//
//  TrailScreen.swift
//  NaturalHIghways2
//
//  Created by Noah Kim on 2/5/21.
//

import Foundation
import SwiftUI

struct TrailScreen: View{
    @State var buttonText: String = "Add to visited?"
    var title: String
    var longDescription: String
    var body: some View {
        VStack{
            Image("Image")
            Text("Trail images coming soon!")
                .font(.caption)
                .italic()
            ScrollView{
                Text(longDescription)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            //button to allow the user to add to visited
            Button(buttonText){
                // Read/Get Array of Strings
                var strings: [String] = defaults.object(forKey: "visited") as? [String] ?? []
                
                if (strings.firstIndex(of: title) == nil){
                    //append to the temp array
                    strings.append(title)
                    //set the temp array to the defaults
                    defaults.set(strings, forKey: "visited")
                    //set button to Added
                    buttonText = "Added"
                } else {
                    buttonText = "Already added"
                }
            }
            Spacer()
        }
        .navigationBarTitle(title, displayMode: .inline)
    }
}

struct TrailScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TrailScreen(title: "Hello", longDescription: "YADDA YADDA")
            
        }
        
    }
}
