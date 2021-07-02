//
//  UserSettings.swift
//  FishingTracker
//
//  Created by T.J. Kolberg on 10/12/20.
//  Copyright © 2020 T.J. Kolberg. All rights reserved.
//

import Foundation

class UserSettings: ObservableObject{
    @Published var location: String = ""
    @Published var timeDate: String = ""
    @Published var bait: String = ""
    @Published var fish: String = "None"
    @Published var caught: String = "No"
    @Published var bite: String = "None"
    @Published var position: String = ""
    @Published var hook: String = ""
    @Published var bobber: String = ""
    @Published var rod: String = ""
    @Published var line: String = ""
}
