//
//  CharacterCell.swift
//  GameOfSwift-Correction
//
//  Created by Pierre-Yves Touzain on 20/05/2019.
//  Copyright © 2019 TYP Studio. All rights reserved.
//

import UIKit

class CharacterCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var actorLabel: UILabel!
    
    func configure(withCharacter character: Character) {
        nameLabel.text = character.name
        actorLabel.text = character.actor
    }

}
