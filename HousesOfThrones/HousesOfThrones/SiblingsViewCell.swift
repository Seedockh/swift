//
//  SiblingsViewCell.swift
//  HousesOfThrones
//
//  Created by efrei on 21/05/2019.
//  Copyright © 2019 efrei. All rights reserved.
//

import UIKit
import SDWebImage

class SiblingsViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    
    func displayInfos(withChar sibling: String) {
        nameLabel.text = sibling
    }
}
