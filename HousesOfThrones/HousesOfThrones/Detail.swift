//
//  Detail.swift
//  HousesOfThrones
//
//  Created by efrei on 21/05/2019.
//  Copyright © 2019 efrei. All rights reserved.
//
import Foundation

class Detail: Decodable {
    enum CodingKeys: String, CodingKey {
        case name
        case image
        case actor
    }
    
    var name: String
    var image: String
    var actor: String
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.actor = try container.decode(String.self, forKey: .actor)
        self.image = try container.decodeIfPresent(String.self, forKey: .image) ?? ""
    }
}
