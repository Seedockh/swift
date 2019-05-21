//
//  CharacterHeaderCell.swift
//  GameOfSwift-Correction
//
//  Created by Pierre-Yves Touzain on 21/05/2019.
//  Copyright © 2019 TYP Studio. All rights reserved.
//

import UIKit
import SDWebImage

class CharacterHeaderCell: UITableViewCell {

    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var actorLabel: UILabel!
    
    func configure(imageUrl: String, name: String, actor: String) {
        characterImageView.sd_setImage(with: URL(string: imageUrl), completed: nil)
        nameLabel.text = name
        actorLabel.text = actor
    }
}
