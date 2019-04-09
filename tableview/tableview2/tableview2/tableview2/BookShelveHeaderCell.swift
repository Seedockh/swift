//
//  BookShelveHeaderCell.swift
//  tableview2
//
//  Created by efrei on 09/04/2019.
//  Copyright © 2019 efrei. All rights reserved.
//
import UIKit

class BookShelveHeaderCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var countBooksLabel: UILabel!
    
    func displayInfos(withBookUser bookUser: BookUser) {
        nameLabel.text = bookUser.name
        surnameLabel.text = bookUser.surname
        ageLabel.text = "\(bookUser.age)"
        countBooksLabel.text = "\(bookUser.books.count)"
    }
}
