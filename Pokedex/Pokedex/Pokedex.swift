//
//  Pokedex.swift
//  Pokedex
//
//  Created by efrei on 15/04/2019.
//  Copyright © 2019 efrei. All rights reserved.
//

import Foundation

struct Pokedex: Decodable {
    enum CodingKeys: String, CodingKey {
        case descriptions
        case id
        case isMainSeries = "is_main_series"
        case name
        case names
        case pokemonEntries = "pokemon_entries"
        case region
        case versionGroups = "version_groups"
    }
    
    struct StandardItem: Decodable {
        var name: String
        var url: String
    }
    
    struct Description: Decodable {
        var description: String
        var language: StandardItem
    }
    
    struct Name: Decodable {
        var language: StandardItem
        var name: String
    }
    
    var descriptions: [Description]
    var id: Int
    var isMainSeries: Bool
    var name: String
    var names: [Name]
    var pokemonEntries: [Pokemon]
    var region: StandardItem
    var versionGroups: [StandardItem]
}
