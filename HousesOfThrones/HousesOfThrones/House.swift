//
//  BookUser.swift
//  tableview2
//
//  Created by efrei on 09/04/2019.
//  Copyright © 2019 efrei. All rights reserved.
//
import Foundation

class House: Decodable {
    enum CodingKeys: String, CodingKey {
        case name
        case logoURL
        case words
    }
    
    var name: String
    var logoURL: String
    var words: String
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.words = try container.decode(String.self, forKey: .words)
        self.logoURL = try container.decodeIfPresent(String.self, forKey: .logoURL) ?? ""
    }
}
