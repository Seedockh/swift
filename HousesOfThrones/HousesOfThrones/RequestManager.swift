//
//  RequestManager.swift
//  HousesOfThrones
//
//  Created by efrei on 20/05/2019.
//  Copyright © 2019 efrei. All rights reserved.
//

import Foundation
import Alamofire

struct RequestManager {
    static func getHouses(success: @escaping(Data)->(),failure: @escaping(Error)->()) {
        Alamofire.request("https://api.got.show/api/show/houses").responseData {
            (dataResponse) in
            switch dataResponse.result {
            case .success(let value):
                // send data to view controller
                success(value)
                break
            case .failure(let error):
                // send error to view controller
                failure(error)
                break
            }
        }
    }
    
    static func getCharacters(houseName: String, success: @escaping(Data)->(),failure: @escaping(Error)->()) {
        let name = houseName.addingPercentEncoding(withAllowedCharacters:.urlHostAllowed)
        Alamofire.request("https://api.got.show/api/show/characters/byhouse/\(name ?? "")").responseData {
            (dataResponse) in
            switch dataResponse.result {
            case .success(let value):
                success(value)
                break
            case .failure(let error):
                failure(error)
                break
            }
        }
    }
}
