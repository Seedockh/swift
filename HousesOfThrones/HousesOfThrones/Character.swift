//
//  Character.swift
//  HousesOfThrones
//
//  Created by efrei on 20/05/2019.
//  Copyright © 2019 efrei. All rights reserved.
//

import Foundation

class Character: Decodable {
    enum CodingKeys: String, CodingKey {
        case name
        case actor
        case image
        case titles
        case siblings
    }
    
    var name: String
    var actor: String
    var image: String
    var titles: [String]
    var siblings: [String]
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.actor = try container.decode(String.self, forKey: .actor)
        self.image = try container.decodeIfPresent(String.self, forKey: .image) ?? ""
        self.titles = try container.decodeIfPresent([String].self, forKey: .titles) ?? [""]
        self.siblings = try container.decodeIfPresent([String].self, forKey: .siblings) ?? [""]
    }
}
