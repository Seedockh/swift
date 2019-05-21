//
//  BookShelveHeaderCell.swift
//  tableview2
//
//  Created by efrei on 09/04/2019.
//  Copyright © 2019 efrei. All rights reserved.
//
import UIKit
import SDWebImage

class CharViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var actorLabel: UILabel!
    //@IBOutlet weak var imageLabel: UIImageView!
    
    func displayInfos(withChar character: Character) {
        nameLabel.text = character.name
        actorLabel.text = character.actor
        //imageLabel.sd_setImage(with: URL(string: character.image), placeholderImage: UIImage(named: "charPicture.png"))
    }
}
