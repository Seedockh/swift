//
//  TitleCell.swift
//  GameOfSwift-Correction
//
//  Created by Pierre-Yves Touzain on 21/05/2019.
//  Copyright © 2019 TYP Studio. All rights reserved.
//

import UIKit

class TitleCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    func configure(withTitle title: String) {
        titleLabel.text = title
    }

}
