//
//  ViewController.swift
//  TimeZones
//
//  Created by efrei on 16/04/2019.
//  Copyright © 2019 efrei. All rights reserved.
//
import Foundation
import UIKit

class TimeZonesViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    var cities: [City] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cityCell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for:indexPath) as? CityViewCell {
            //cityCell.displayInfos(withCities: cities)
            return cityCell
        }
    }
    
    func formatTimeZones () {
        let knownCities = TimeZone.knownTimeZoneIdentifiers
        self.cities.append(
            knownCities.map({ (cityIdentifier) -> City in
            let cityName = cityIdentifier.components(separatedBy: "/")[1]
            return City(name: cityName, identifier: cityIdentifier)
        }))
    }
    
}

