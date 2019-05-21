//
//  CharactersViewController.swift
//  HousesOfThrones
//
//  Created by efrei on 20/05/2019.
//  Copyright © 2019 efrei. All rights reserved.
//

import UIKit

class CharactersViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var houseName: String?
    var houseChars: [Character] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        fetchCharacters()
    }
    
    func fetchCharacters() {
        RequestManager.getCharacters(houseName: houseName ?? "", success: { (data) in
            let decoder = JSONDecoder()
            self.houseChars = (try? decoder.decode([Character].self, from: data)) ?? []
            self.tableView.reloadData()
        }) { (error) in
            print(error)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return houseChars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let charCell = tableView.dequeueReusableCell(withIdentifier: "CharCell",for:indexPath) as? CharViewCell {
            charCell.displayInfos(withChar: houseChars[indexPath.row])
            return charCell
        }
        return UITableViewCell()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailsSegue" {
            if let detailsVC = segue.destination as? DetailsViewController, let indexPath = tableView.indexPathForSelectedRow {
                detailsVC.character = houseChars[indexPath.row]
            }
        }
    }
}
