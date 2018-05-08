//
//  GameObject.swift
//  TankLandFinal
//
//  Created by Alex Davison on 5/4/18.
//  Copyright © 2018 Alex Davison & Kaiwen Zhou. All rights reserved.
//

import Foundation

enum GameObjectType{
    case Tank, Mine, Rover
}


class GameObject: CustomStringConvertible{
    let objectType: GameObjectType
    let name: String
    private (set) var energy: Int
    let id: String
    private (set) var position: NSPositionalSpecifier
    
    init(row: Int, col: Int, objectType: GameObjectType, name: String, energy: Int, id: String){
        self.objectType = objectType
        self.name = name
        self.energy = energy
        self.id = id
        self.position = Position(row: row, col: col)
    }
    
    final func addEnergy(amount: Int){
        energy += amount
    }
    
    final func useEnergy(amount: Int){
        energy = (amount > energy) ? 0 : energy - amount
    }
    
    final func setPosition(newPosition: Position){
        position = newPosition
    }
    
    var description: String{
        return "\(objectType) \(name) \(energy) \(id) \(position)"
    }
}
