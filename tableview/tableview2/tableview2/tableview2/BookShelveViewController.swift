//
//  ViewController.swift
//  tableview2
//
//  Created by efrei on 09/04/2019.
//  Copyright © 2019 efrei. All rights reserved.
//

import UIKit

class BookShelveViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    let booksList: [Book] = [
        Book(title: "L'Origine des Espèces", author: "Charles Darwin", nbOfPages: 652),
        Book(title: "Les Chroniques du Girku", author: "Anton Parks", nbOfPages: 432),
        Book(title: "Les Voies d'Anubis", author: "Tim Powers", nbOfPages: 547)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(UINib(nibName: "BookShelveHeaderCell", bundle: nil),forceCellReuseIdentifier: "BookShelveHeaderCell_ID")
        tableView.register(UINib(nibName: "BookCell", bundle: nil),forceCellReuseIdentifier: "BookCell_ID")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let userCell = tableView.dequeueReusableCell(withIdentifier: "UserCell",for:indexPath) as? BookShelveHeaderCell {
            let bookUser: BookUser = BookUser(name: "Anderson", surname: "Neo", age: 34, books: booksList)
            userCell.displayInfos(withBookUser: bookUser)
            return userCell
        }
        return UITableViewCell()
    }


}

