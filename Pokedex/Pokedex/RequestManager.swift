//
//  RequestManager.swift
//  Pokedex
//
//  Created by efrei on 15/04/2019.
//  Copyright © 2019 efrei. All rights reserved.
//

import Foundation
import Alamofire

struct RequestManager {
    static func getPokedex(success: @escaping(Data)->(),failure: @escaping(Error)->()) {
        Alamofire.request("https://pokeapi.co/api/v2/pokedex/2").responseData {
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
    
    static func getPokemon(url: String, success: @escaping(Data)->(),failure: @escaping(Error)->()) {
        Alamofire.request(url).responseData {
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

