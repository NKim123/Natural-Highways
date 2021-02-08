//
//  dashboard.swift
//  NaturalHIghways2
//
//  Created by Noah Kim on 2/2/21.
//

import SwiftUI

var covidWarning: String = "Due to the ongoing covid-19 pandemic, please take proper precautions as outlined by the CDC. Remember to wear a mask in public spaces as well as socially distance!"

struct dashboard: View {
    @State var listVisited: [String]? = defaults.array(forKey: "visited") as? [String]
    @State var showAlert: Bool = false
    var body: some View {
        NavigationView{
            ZStack{
                Image("Image-2")
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0,maxHeight: .infinity, alignment: .center)
                    .ignoresSafeArea()
                ScrollView {
                    NavigationLink(" Go to trails ", destination: mainScreen())
                        .font(.largeTitle)
                        .background(Color.white)
                        .cornerRadius(15)
                        .padding(.top)
                    NewAlert(title: "Important alert", contents: covidWarning, color: Color.yellow)
                    NewAlert(title: "Places Visited", contents: String(listVisited?.count ?? 0), color: Color.white)
                    //resets the visited list in defaults
                    Button("Reset", action: {
                        showAlert = true
                    })
                    NewAlert(title: "Social", contents: "Keep up with our latest:", color: Color.white)
                    Link(" Linktree ", destination: URL(string: "https://linktr.ee/NaturalHighways")!)
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding()
                    Link(" Lol ", destination: URL(string: "https://www.youtube.com/watch?v=dQw4w9WgXcQ")!)
                        .background(Color.white)
                        .cornerRadius(10)
                    NavigationLink(" About ", destination: AboutScreen())
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(.init(50))
                        
                }
                .background(Color.white.opacity(0.5))
                .cornerRadius(15)
                .padding()
                .onAppear {
                    listVisited = defaults.array(forKey: "visited") as? [String]
                }
                .alert(isPresented: $showAlert, content: {
                    Alert(title: Text("Alert"), message: Text("Are you sure you want to reset? This cannot be undone"), primaryButton: .cancel(Text("Cancel")), secondaryButton: .default(Text("Reset")){
                        defaults.setValue([], forKey: "visited")
                        listVisited = defaults.array(forKey: "visited") as? [String]
                    })
                })
            }
            .navigationBarTitle("Dashboard", displayMode: .large)
        }
    }
}

struct dashboard_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            dashboard()
                .previewDevice("iPhone 11 Pro Max")
        }
        
    }
}
