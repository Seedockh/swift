//
//  Pokemon.swift
//  My Pokedex
//
//  Created by Pierre-Yves Touzain on 31/03/2018.
//  Copyright © 2018 TYP Studio. All rights reserved.
//

import SwiftyJSON

struct Pokemon: Decodable {
    
    struct Specie: Decodable {
        var name: String
        var url: URL
    }
    
    enum CodingKeys: String, CodingKey {
        case specie = "pokemon_species"
        case entry = "entry_number"
    }
    
    var specie: Specie
    var entry: Int
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.specie = try container.decode(Specie.self, forKey: .specie)
        self.entry =  try container.decode(Int.self, forKey: .entry)
    }
}

//class Pokemon: NSObject {
//    var name: String
//    var detailsUrl: String
//    var entry: Int
//    var habitat: String = ""
//    var color: String = ""
//    var shape: String = ""
//    var flavorText: String = ""
//
//    init(json: JSON) {
//        self.name = json["pokemon_species"]["name"].stringValue
//        self.detailsUrl = json["pokemon_species"]["url"].stringValue
//        self.entry = json["entry_number"].intValue
//    }
//
//    public func update(json: JSON) {
//        self.habitat = json["habitat"]["name"].stringValue
//        self.color = json["color"]["name"].stringValue
//        self.shape = json["shape"]["name"].stringValue
//        for flavorJson in json["flavor_text_entries"].arrayValue {
//            if flavorJson["language"]["name"].stringValue == "en", flavorJson["version"]["name"].stringValue == "red" {
//                self.flavorText = flavorJson["flavor_text"].stringValue.lowercased()
//            }
//        }
//    }
//}
