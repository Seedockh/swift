//
//  SiblingCell.swift
//  GameOfSwift-Correction
//
//  Created by Pierre-Yves Touzain on 21/05/2019.
//  Copyright © 2019 TYP Studio. All rights reserved.
//

import UIKit

class SiblingCell: UITableViewCell {

    @IBOutlet weak var siblingLabel: UILabel!
    
    func configure(withSibling sibling: String) {
        siblingLabel.text = sibling
    }

}
