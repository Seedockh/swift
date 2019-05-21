//
//  Character.swift
//  GameOfSwift-Correction
//
//  Created by Pierre-Yves Touzain on 20/05/2019.
//  Copyright © 2019 TYP Studio. All rights reserved.
//

import Foundation

struct Character: Decodable {
    var name: String
    var image: String
    var actor: String
    var titles: [String]
    var siblings: [String]
}
