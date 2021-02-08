//
//  TrailSelection.swift
//  NaturalHIghways2
//
//  Created by Noah Kim on 2/2/21.
//

import SwiftUI

struct TrailSelection: View {
    var trailName: String
    var shortDesc: String
    var longDesc: String
    var body: some View {
        ZStack {
            HStack(){
                Image("Image")
                    .resizable()
                    .frame(maxWidth: 75, maxHeight: 75)
                    .padding(.all, 5.0)
                VStack(alignment: .leading){
                    Text(trailName)
                        .multilineTextAlignment(.leading)
                        .font(.headline)
                    NavigationLink(shortDesc, destination: TrailScreen(title: trailName, longDescription: longDesc))
                        .foregroundColor(.black)
                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        .font(.footnote)
                        
                    Spacer()
                }
                Spacer()
            }
                
        }
        .background(Color.white.opacity(0.75))
        .cornerRadius(15)
        .padding([.top, .leading, .trailing])
    }
}

struct TrailSelection_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TrailSelection(trailName: "C&O canal", shortDesc: "Description", longDesc: "Long Description")
        }
        .previewDevice("iPhone SE (2nd generation)")
    }
}
