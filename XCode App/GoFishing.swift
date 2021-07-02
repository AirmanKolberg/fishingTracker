//
//  GoFishing.swift
//  FishingTracker
//
//  Created by T.J. Kolberg on 9/27/20.
//  Copyright © 2020 T.J. Kolberg. All rights reserved.
//

import SwiftUI

struct GoFishing: View {
    
    @EnvironmentObject var userSettings: UserSettings
    
    var body: some View {
        NavigationView{
            VStack {
                Text("Location:")
                TextField("Enter Location Here", text: $userSettings.location)
                    .multilineTextAlignment(.center)
                Text("Your location is")
                Text("\(userSettings.location)")
            }.navigationBarTitle(Text("Going Fishing with New Setup"),
                                 displayMode: .inline)
            
        }
    }
}

struct GoFishing_Previews: PreviewProvider {
    static var previews: some View {
        GoFishing()
    }
}
