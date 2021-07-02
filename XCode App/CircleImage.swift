//
//  CircleImage.swift
//  FishingTracker
//
//  Created by T.J. Kolberg on 9/27/20.
//  Copyright © 2020 T.J. Kolberg. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("Fishing App Logo")
        .resizable()
            .frame(width: 200, height: 200, alignment: .leading)
            .cornerRadius(30.0)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white,
                        lineWidth: 2))
        .shadow(radius: 10)
        
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
