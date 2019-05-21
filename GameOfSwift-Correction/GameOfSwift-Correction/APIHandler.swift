//
//  APIHandler.swift
//  GameOfSwift-Correction
//
//  Created by Pierre-Yves Touzain on 20/05/2019.
//  Copyright © 2019 TYP Studio. All rights reserved.
//

import Foundation
import Alamofire

struct APIHandler {
    static func requestHouses(success: @escaping (Data)->(), failure: @escaping (Error)->()) {
        Alamofire.request("https://api.got.show/api/show/houses").responseData { (response) in
            switch response.result {
            case .success(let value):
                success(value)
            case .failure(let error):
                failure(error)
            }
        }
    }
    
    static func requestCharacters(houseName: String, success: @escaping (Data)->(), failure: @escaping (Error)->()) {
        let formattedHouseName = houseName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        Alamofire.request("https://api.got.show/api/show/characters/byHouse/\(formattedHouseName ?? "")").responseData { (response) in
            switch response.result {
            case .success(let value):
                success(value)
            case .failure(let error):
                failure(error)
            }
        }
    }
}
