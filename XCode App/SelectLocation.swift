//
//  SelectLocation.swift
//  FishingTracker
//
//  Created by T.J. Kolberg on 9/27/20.
//  Copyright © 2020 T.J. Kolberg. All rights reserved.
//

import SwiftUI

struct SelectLocation: View {
    var body: some View {
        VStack {
            VStack {
                Text("Select Fishing Location")
                    .font(.title)
                    .multilineTextAlignment(.center)
                List {
                    /*@START_MENU_TOKEN@*/ /*@PLACEHOLDER=Content@*/Text("Content")/*@END_MENU_TOKEN@*/
                }
            }
            
            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Add New Location")
                    Spacer()
            
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Text("Use Current Location")
                    }
                }.padding()
            }
        }
        
    }
}

struct SelectLocation_Previews: PreviewProvider {
    static var previews: some View {
        SelectLocation()
    }
}
