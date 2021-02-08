//
//  AboutScreen.swift
//  NaturalHIghways2
//
//  Created by Noah Kim on 2/6/21.
//

import SwiftUI

struct AboutScreen: View {
    var body: some View {
        VStack{
            Text("Developed by Noah Kim for use by Natural Highways\n\nContact us at naturalhighways@gmail.com")
                .multilineTextAlignment(.center)
                .padding()
            Spacer()
        }
    }
}

struct AboutScreen_Previews: PreviewProvider {
    static var previews: some View {
        AboutScreen()
    }
}
