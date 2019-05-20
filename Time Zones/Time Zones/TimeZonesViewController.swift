//
//  TimeZonesViewController.swift
//  Time Zones
//
//  Created by Pierre-Yves Touzain on 31/03/2018.
//  Copyright © 2018 TYP Studio. All rights reserved.
//

import UIKit

class TimeZonesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var sectionsName: [String] = []
    var cities: [City] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for identifier in TimeZone.knownTimeZoneIdentifiers {
            if let cityName = identifier.split(separator: "/").last {
                let cleanCityName = cityName.replacingOccurrences(of: "_", with: " ")
                cities.append(City(name: cleanCityName, identifier: identifier))
            }
        }
        sectionsName = (65...90).map({Character(UnicodeScalar($0))}).map { String($0) }
        cities.sort { $0.name < $1.name }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionsName.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subArrayForLetter(letter: sectionsName[section]).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimeZoneCell", for: indexPath)
        let subArray = subArrayForLetter(letter: sectionsName[indexPath.section])
        cell.textLabel?.text = subArray[indexPath.row].name //Something
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionsName[section]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func subArrayForLetter(letter: String) -> [City] {
        return cities.filter { $0.name.first == letter.first }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TimeSegueID" {
            if let destinationVC = segue.destination as? TimeViewController, let indexPath = tableView.indexPathForSelectedRow {
                destinationVC.city = subArrayForLetter(letter: sectionsName[indexPath.section])[indexPath.row]
            }
        }
    }
}

