//
//  Book.swift
//  tableview2
//
//  Created by efrei on 09/04/2019.
//  Copyright © 2019 efrei. All rights reserved.
//

class Book {
    let title: String
    let author: String
    let nbOfPages: Int
    
    init(title:String, author:String, nbOfPages:Int) {
        self.title = title
        self.author = author
        self.nbOfPages = nbOfPages
    }
}
