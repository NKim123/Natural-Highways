//
//  mainScreen.swift
//  NaturalHIghways2
//
//  Created by Noah Kim on 2/2/21.
//

import SwiftUI

var developWarning: String = "The Natural Highways App is currently under development. Please enjoy our current features while new features are worked on. Notify us of any issues with the app at: naturalhighways@gmail.com"

var brain: Brain = Brain()

//getting stuff from database
//getting stuff from database
var trailselections: Locations = Locations()

struct mainScreen: View {
    //getting studd from database
    @State var trails = trailselections.getLocs()
    //first one is the saved value from defaults
    @State private var checkShow: Bool = defaults.bool(forKey: "showWarning")
    //second one is used to trigger the alert
    @State private var showTheWarning: Bool = false
    //This is going to be an array to store the items in the scroll
    @State var trailNames: [[String]] = [["","",""]]

    var body: some View {
            ZStack{
                //background image
                Image("Image-2")
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, minHeight: 0,maxHeight: .infinity, alignment: .center)
                    .ignoresSafeArea()
                    
                //these are the trails
                ScrollView {
                    ForEach(trailNames, id: \.self) { trail in
                        TrailSelection(trailName: trail[0], shortDesc: trail[1], longDesc: trail[2])
                    }
                }
            }
            //this is an alert to show the currently in development warning
            .alert(isPresented: $showTheWarning, content: {
                Alert(title: Text("Alert"), message: Text(developWarning), primaryButton: .cancel(Text("Don't show again")) {
                    brain.checkShowWarning(yesNo: true)
                    checkShow = true
                }, secondaryButton: .default(Text("Got it")))
            })
            .navigationBarTitle("Trails", displayMode: .inline)
            //this starts to load the trails and check if we need to show the user the warning
            .onAppear(perform: {
                trailNames.removeAll()
                trails = trailselections.getLocs()
                trailNames = trailselections.addToArray(trails: trails)
                if (!checkShow){
                    self.showTheWarning = true
                }
            })
    }
}

struct mainScreen_Previews: PreviewProvider {
    static var previews: some View {
        mainScreen()
            .previewDevice("iPhone 11 Pro Max")
    }
}
