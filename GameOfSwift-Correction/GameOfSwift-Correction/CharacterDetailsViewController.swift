//
//  CharacterDetailsViewController.swift
//  GameOfSwift-Correction
//
//  Created by Pierre-Yves Touzain on 21/05/2019.
//  Copyright © 2019 TYP Studio. All rights reserved.
//

import UIKit

class CharacterDetailsViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var character: Character?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return character?.titles.count ?? 0
        case 2:
            return character?.siblings.count ?? 0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterHeaderCell_ID", for: indexPath) as? CharacterHeaderCell {
                cell.configure(imageUrl: character?.image ?? "", name: character?.name ?? "", actor: character?.actor ?? "")
                return cell
            }
        case 1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "TitleCell_ID", for: indexPath) as? TitleCell {
                cell.configure(withTitle: character?.titles[indexPath.row] ?? "")
                return cell
            }
        case 2:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "SiblingCell_ID", for: indexPath) as? SiblingCell {
                cell.configure(withSibling: character?.siblings[indexPath.row] ?? "")
                return cell
            }
        default:
            return UITableViewCell()
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 1:
            return "Titles"
        case 2:
            return "Siblings"
        default:
            return nil
        }
    }
}
