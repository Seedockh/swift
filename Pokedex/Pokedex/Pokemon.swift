//
//  Pokemon.swift
//  Pokedex
//
//  Created by efrei on 15/04/2019.
//  Copyright © 2019 efrei. All rights reserved.
//

import Foundation

struct Pokemon: Decodable {
    enum CodingKeys: String, CodingKey {
        case entry = "entry_number"
        case species = "pokemon_species"
    }

    struct Species: Decodable {
        var name: String
        var url: String
    }
    
    var entry: Int
    var species: Species
}
