//
//  BookCell.swift
//  tableview2
//
//  Created by efrei on 09/04/2019.
//  Copyright © 2019 efrei. All rights reserved.
//
import UIKit

class BookCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var nbOfPagesLabel: UILabel!
    
    func displayBook(withBook book: Book) {
        titleLabel.text = book.title
        authorLabel.text = book.author
        nbOfPagesLabel.text = "\(book.nbOfPages)"
    }
}
