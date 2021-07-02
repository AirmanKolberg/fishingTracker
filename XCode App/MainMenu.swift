//
//  MainMenu.swift
//  FishingTracker
//
//  Created by T.J. Kolberg on 9/27/20.
//  Copyright © 2020 T.J. Kolberg. All rights reserved.
//

import SwiftUI

struct MainMenu: View {
    var body: some View {
        VStack {
            
            //Image
            CircleImage()
            
            //Text Views
            Text("iFish")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.gray)
                .multilineTextAlignment(.center)
            
            Text("A fishing tracker for iOS")
                .font(.subheadline)
                .foregroundColor(Color.gray)
        }
    }
}

struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu()
    }
}
