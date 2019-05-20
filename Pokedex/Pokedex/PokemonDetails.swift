//
//  PokemonDetails.swift
//  Pokedex
//
//  Created by efrei on 15/04/2019.
//  Copyright © 2019 efrei. All rights reserved.
//

import Foundation

struct PokemonDetails: Decodable {
    enum CodingKeys: String, CodingKey {
        //case baseHappiness = "base_happiness"
        //case captureRate = "capture_rate"
        case color
        //case eggGroups = "egg_group"
        //case evolutionChain = "evolution_chain"
        //case evolvesFromSpecies = "evolves_from_species"
        case flavorTextEntries = "flavor_text_entries"
        //case formDescriptions = "form_descriptions"
        //case formsSwitchable = "forms_switchable"
        //case genderRate = "gender_rate"
        //case genera
        //case generation
        //case growthRate = "growth_rate"
        case habitat
        //case hasGenderDifferences = "has_gender_differences"
        //case hatchCounter = "hatch_counter"
        //case id
        //case isBaby = "is_baby"*/
        case name
        //case names
        //case order
        //case palParkEncounters = "pal_park_encounters"
        //case pokedexNumbers = "pokedex_numvers"
        //case shape
        //case varieties
    }
    
    struct StandardItem: Decodable {
        var name: String
        var url: String
    }
    
    struct Url: Decodable {
        var url: String
    }
    
    struct FlavorText: Decodable {
        enum CodingKeys: String, CodingKey {
            case flavorText = "flavor_text"
            case language
            case version
        }
        var flavorText: String
        var language: StandardItem
        var version: StandardItem
    }
    
    struct Genera: Decodable {
        var genus: String
        var language: StandardItem
    }
    
    struct Names: Decodable {
        var language: StandardItem
        var name: String
    }
    
    struct PalParkEncounter: Decodable {
        enum CodingKeys: String, CodingKey {
            case area
            case baseScore = "base_score"
            case rate
        }
        var area: StandardItem
        var baseScore: Int
        var rate: Int
    }
    
    struct PokedexNumber: Decodable {
        enum CodingKeys: String, CodingKey {
            case entryNumber = "entre_number"
            case pokedex
        }
        var entryNumber: Int
        var pokedex: StandardItem
    }
    
    struct Varieties: Decodable {
        enum CodingKeys: String, CodingKey {
            case isDefault = "is_default"
            case pokemon
        }
        var isDefault: Bool
        var pokemon: StandardItem
    }
    
    //var baseHappiness: Int
    //var captureRate: Int
    var color: StandardItem
    //var eggGroups: [StandardItem]
    //var evolutionChain: Url
    //var evolvesFromSpecies: StandardItem
    var flavorTextEntries: [FlavorText]
    //var formDescriptions: [String]
    //var formsSwitchable: Bool
    //var genderRate: Int
    //var genera: [Genera]
    //var generation: StandardItem
    //var growthRate: StandardItem
    var habitat: StandardItem
    //var hasGenderDifferences: Bool
    //var hatchCounter: Int
    //var id: Int
    //var isBaby: Bool
    var name: String
    //var names: [Names]
    //var order: Int
    //var palParkEncounters: [PalParkEncounter]
    //var pokedexNumbers: [PokedexNumber]
    //var shape: StandardItem
    //var varieties: [Varieties]
}
