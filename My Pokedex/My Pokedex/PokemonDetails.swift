//
//  PokemonDetails.swift
//  My Pokedex
//
//  Created by Pierre-Yves Touzain on 08/04/2019.
//  Copyright © 2019 TYP Studio. All rights reserved.
//

import Foundation

struct PokemonDetails: Decodable {
    
    struct Habitat: Decodable {
        var name: String
    }
    
    struct Color: Decodable {
        var name: String
    }
    
    struct Shape: Decodable {
        var name: String
    }
    
    struct Language: Decodable {
        var name: String
    }
    
    struct Version: Decodable {
        var name: String
    }
    
    struct FlavorText: Decodable {
        enum CodingKeys: String, CodingKey {
            case text = "flavor_text"
            case language
            case version
        }
        
        var text: String
        var language: Language
        var version: Version
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case habitat
        case color
        case shape
        case flavorTexts = "flavor_text_entries"
    }
    
    var name: String
    var habitat: Habitat
    var color: Color
    var shape: Shape
    var flavorTexts: [FlavorText]
    
    func getFlavorText(inLanguage language: String, fromVersion version: String) -> FlavorText? {
        for text in flavorTexts {
            if text.language.name == language && text.version.name == version {
                return text
            }
        }
        return nil
    }
}
