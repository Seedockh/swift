//
//  BookShelveHeaderCell.swift
//  tableview2
//
//  Created by efrei on 09/04/2019.
//  Copyright © 2019 efrei. All rights reserved.
//
import UIKit
import SDWebImage

class HouseViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var wordsLabel: UILabel!
    @IBOutlet weak var logoURLLabel: UIImageView!
    
    //imageView.sd_setImage(with: URL(string: "http://www.domain.com/path/to/image.jpg"), placeholderImage: UIImage(named: "placeholder.png"))

    
    func displayInfos(withHouse house: House) {
        nameLabel.text = house.name
        logoURLLabel.sd_setImage(with: URL(string: house.logoURL), placeholderImage: UIImage(named: "housePicture.png"))
        wordsLabel.text = house.words
    }
}
