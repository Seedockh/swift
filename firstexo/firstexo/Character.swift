//
//  Character.swift
//  firstexo
//
//  Created by efrei on 12/02/2019.
//  Copyright © 2019 efrei. All rights reserved.
//
import Foundation

enum CharacterRole {
    case warrior
    case caster
    case melee
    case healer
    case none
    
    func getCharacterRoleString() {
        switch self {
            case .warrior: print("Warrior")
            case .caster: print("Caster")
            case .melee: print("Melee")
            case .healer: print("Healer")
            case .none: print("No Role")
        }
    }
}

class Character {
    var name: String?
    var role: CharacterRole?
    
    init (name: String, role: CharacterRole) {
        self.name = name
        self.role = role
    }
    
    func introduce() -> String {
        guard let roleUnwrapped: CharacterRole = self.role else { return "Model error" }
        return "Here is a new character, \(self.name ?? "(nil)") ! \nWill he become the best \(roleUnwrapped) ?"
    }
}
