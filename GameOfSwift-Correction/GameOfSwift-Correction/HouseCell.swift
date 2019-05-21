//
//  HouseCell.swift
//  GameOfSwift-Correction
//
//  Created by Pierre-Yves Touzain on 20/05/2019.
//  Copyright © 2019 TYP Studio. All rights reserved.
//

import UIKit
import SDWebImage

class HouseCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var wordsLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    
    func configure(withHouse house: House) {
        nameLabel.text = house.name
        wordsLabel.text = house.words
        logoImageView.sd_setImage(with: URL(string: house.logoURL), completed: nil)
    }

}
