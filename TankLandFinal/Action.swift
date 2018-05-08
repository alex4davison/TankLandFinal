//
//  Action.swift
//  TankLandFinal
//
//  Created by Alex Davison on 5/4/18.
//  Copyright © 2018 Alex Davison & Kaiwen Zhou. All rights reserved.
//

import Foundation

enum PreAcitons{
    case SetShield, SendMessage, RecieveMessage, RunRadar
}

enum Actions{
    case DropMine, DropRover, FireMissle, Move
}

protocol Action: CustomStringConvertible {
    var action: Actions {get}
    var description: String {get}
}

protocol PreAction: Action {
    <#requirements#>
}

protocol PostAction: Action {
    <#requirements#>
}

struct MoveAction: PostAction {
    let action: Actions
    let distance: Int
    let direction: Direction
    var description: String{
        return "\(action) \(distance) \(direction)"
    }
    
    init(distance: Int, direction: Direction) {
        action = .Move
        self.distance = distance
        self.direction = direction
    }
}
