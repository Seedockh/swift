//
//  CityViewCell.swift
//  TimeZones
//
//  Created by efrei on 16/04/2019.
//  Copyright © 2019 efrei. All rights reserved.
//

import UIKit

class CityViewCell: UITableViewCell {
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var cityIdentifier: UILabel!
    
    func displayInfos(withCities city: City?) {
        self.cityName.text = "Paris"
        self.cityIdentifier.text = "Europe/Paris"
    }
}
