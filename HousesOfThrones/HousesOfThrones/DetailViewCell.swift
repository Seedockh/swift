//
//  DetailViewCell.swift
//  HousesOfThrones
//
//  Created by efrei on 21/05/2019.
//  Copyright © 2019 efrei. All rights reserved.
//

import UIKit
import SDWebImage

class DetailViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var actorLabel: UILabel!
    @IBOutlet weak var imageLabel: UIImageView!
    
    func displayInfos(withChar character: Character) {
        nameLabel.text = character.name
        actorLabel.text = character.actor
        imageLabel.sd_setImage(with: URL(string: character.image), placeholderImage: UIImage(named: "charPicture.png"))
    }
}
