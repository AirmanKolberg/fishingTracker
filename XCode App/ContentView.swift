//
//  ContentView.swift
//  FishingTracker
//
//  Created by T.J. Kolberg on 9/27/20.
//  Copyright © 2020 T.J. Kolberg. All rights reserved.
//

import SwiftUI
import UniformTypeIdentifiers

struct ContentView: View {

    
    var body: some View {
        NavigationView{
            VStack {
                NavigationLink(destination: GoFishing()){
                    Text("Go Fishing with New Setup")
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color.green)
                        .cornerRadius(150)
                        .padding()

                }
                NavigationLink(destination: LoadRig()){
                    Text("Load Custom Setup")
                        .foregroundColor(.black)
                        .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color.blue)
                        .cornerRadius(150)
                        .padding()
                }

                    Spacer()
                Text("Add EXPORT Button Here")
                }
            }.navigationBarTitle(Text("Main Menu"),
                                 displayMode: .inline
            )
        }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
