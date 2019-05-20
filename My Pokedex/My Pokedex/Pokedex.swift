//
//  Pokedex.swift
//  My Pokedex
//
//  Created by Pierre-Yves Touzain on 07/04/2019.
//  Copyright © 2019 TYP Studio. All rights reserved.
//

import Foundation

struct Pokedex: Decodable {
    enum CodingKeys: String, CodingKey {
        case pokemonEntries = "pokemon_entries"
    }
    
    var pokemonEntries: [Pokemon]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.pokemonEntries = try container.decode([Pokemon].self, forKey: .pokemonEntries)
    }
}
