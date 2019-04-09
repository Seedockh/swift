//
//  SongCellTableViewCell.swift
//  tableview
//
//  Created by efrei on 09/04/2019.
//  Copyright © 2019 efrei. All rights reserved.
//

import UIKit

class SongCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var lengthLabel: UILabel!
    
    func configure(withSong song: Song) {
        titleLabel.text = song.title
        artistLabel.text = song.artist
        lengthLabel.text = song.length
    }
}
