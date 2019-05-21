//
//  CharactersViewController.swift
//  HousesOfThrones
//
//  Created by efrei on 20/05/2019.
//  Copyright © 2019 efrei. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, UITableViewDataSource {
    
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
            case 0: return 1
            case 1: return character?.titles.count ?? 0
            case 2: return character?.siblings.count ?? 0
            default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return ""
        case 1: return "Titles"
        case 2: return "Siblings"
        default: return ""
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            if let detailCell = tableView.dequeueReusableCell(withIdentifier: "DetailCell",for:indexPath) as? DetailViewCell {
                detailCell.displayInfos(withChar: character!)
                return detailCell
            }
        case 1:
            if let titleCell = tableView.dequeueReusableCell(withIdentifier: "TitleCell",for:indexPath) as? TitlesViewCell {
                titleCell.displayInfos(withChar: character!.titles[indexPath.row])
                return titleCell
            }
        case 2:
            if let siblingCell = tableView.dequeueReusableCell(withIdentifier: "SiblingCell",for:indexPath) as? SiblingsViewCell {
                siblingCell.displayInfos(withChar: character!.siblings[indexPath.row])
                return siblingCell
            }
        default:
            return UITableViewCell()
        }
        return UITableViewCell()
    }
}
