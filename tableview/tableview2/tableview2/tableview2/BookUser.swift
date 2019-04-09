//
//  BookUser.swift
//  tableview2
//
//  Created by efrei on 09/04/2019.
//  Copyright © 2019 efrei. All rights reserved.
//
class BookUser {
    let name: String
    let surname: String
    let age: Int
    let books: [Book]
    
    init(name:String,surname:String,age:Int,books:[Book]) {
        self.name = name
        self.surname = surname
        self.age = age
        self.books = books
    }
}
