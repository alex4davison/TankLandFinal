//
//  RadarResult.swift
//  TankLandFinal
//
//  Created by Alex Davison on 5/4/18.
//  Copyright © 2018 Alex Davison & Kaiwen Zhou. All rights reserved.
//

import Foundation

struct RadarResult {
    var objectLocation: Position
    var objectID: String
    var objectEnergy: Int
    init (resultLocation: Position, resultID: String, resultEnergy: Int) {
        self.resultLocation = resultLocation
        self.resultID = resultID
        self.resultEnergy = resultEnergy
    }
}

