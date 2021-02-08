//
//  NewAlert.swift
//  NaturalHIghways2
//
//  Created by Noah Kim on 2/3/21.
//

import SwiftUI

struct NewAlert: View {
    var title: String
    var contents: String
    var color: Color
    var body: some View {
        VStack{
            Text(title)
                .multilineTextAlignment(.center)
                .padding()
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .padding()
                .frame(maxHeight:30)
                .background(Color.white)
                .cornerRadius(10)
                .padding([.top, .leading, .trailing])
            Text(contents)
                .padding([.leading, .trailing])
                .font(.body)
                .foregroundColor(Color.black)
                .multilineTextAlignment(.center)
                .background(color)
                .cornerRadius(15)
                .padding([.leading, .trailing])
        }
    }
}

struct NewAlert_Previews: PreviewProvider {
    static var previews: some View {
        NewAlert(title: "Alert", contents: covidWarning, color: Color.white)
    }
}
