//
//  CharactersViewController.swift
//  GameOfSwift-Correction
//
//  Created by Pierre-Yves Touzain on 20/05/2019.
//  Copyright © 2019 TYP Studio. All rights reserved.
//

import UIKit

class CharactersViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var houseName: String?
    var characters: [Character] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        requestCharacters()
    }
    
    func requestCharacters() {
        APIHandler.requestCharacters(houseName: houseName ?? "", success: { (data) in
            let decoder = JSONDecoder()
            self.characters = (try? decoder.decode([Character].self, from: data)) ?? []
            self.tableView.reloadData()
        }) { (error) in
            print(error)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell_ID", for: indexPath) as? CharacterCell {
            cell.configure(withCharacter: characters[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailsSegue" {
            if let characterDetailsVC = segue.destination as? CharacterDetailsViewController,
                let indexPath = tableView.indexPathForSelectedRow {
                characterDetailsVC.character = characters[indexPath.row]
            }
        }
    }
}
