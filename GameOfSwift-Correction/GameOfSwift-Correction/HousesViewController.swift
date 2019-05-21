//
//  HousesViewController.swift
//  GameOfSwift-Correction
//
//  Created by Pierre-Yves Touzain on 20/05/2019.
//  Copyright © 2019 TYP Studio. All rights reserved.
//

import UIKit
import Alamofire

class HousesViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var houses: [House] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        requestHouses()
    }
    
    func requestHouses() {
        APIHandler.requestHouses(success: { (data) in
            let decoder = JSONDecoder()
            self.houses = (try? decoder.decode([House].self, from: data)) ?? []
            self.tableView.reloadData()
            print(self.houses)
        }) { (error) in
            print(error)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return houses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "HouseCell_ID", for: indexPath) as? HouseCell {
            cell.configure(withHouse: houses[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CharactersSegue" {
            if let charactersVC = segue.destination as? CharactersViewController, let indexPath = tableView.indexPathForSelectedRow {
                charactersVC.houseName = houses[indexPath.row].name
            }
        }
    }
}
