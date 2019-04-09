//
//  ViewController.swift
//  tableview
//
//  Created by efrei on 09/04/2019.
//  Copyright © 2019 efrei. All rights reserved.
//

import UIKit

class Song {
    let title: String
    let artist: String
    let length: String
    
    init(title: String, artist: String, length: String) {
        self.title = title
        self.artist = artist
        self.length = length
    }
}

class SongListViewController: UIViewController,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let songsTable: [Song] = [
        Song(title:"Reptile", artist: "Periphery", length: "16:21"),
        Song(title:"Muramasa", artist:"Periphery", length:"5:34"),
        Song(title:"Gods Must Be Crazy!", artist: "Periphery", length: "6:47"),
        Song(title:"Icarus Live", artist: "Periphery", length: "3:56"),
        Song(title:"Chvrch Bvrner", artist: "Periphery", length: "6:02"),
        Song(title:"The Bad Thing", artist: "Periphery", length: "4:50"),
        Song(title:"Racecar", artist: "Periphery", length: "15:39"),
        Song(title:"Omega", artist: "Periphery", length: "9:27"),
        Song(title:"Alpha", artist: "Periphery", length: "7:12"),
        Song(title:"Ragnarok", artist: "Periphery", length: "5:43"),
        Song(title:"Reprise", artist: "Periphery", length: "1:37")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        //tableView.register()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)-> Int {
        return songsTable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SongCellIdentifier", for:indexPath) as? SongCell {
            let song = songsTable[indexPath.row]
            cell.configure(withSong: song)
            return cell
        }
        return UITableViewCell()
    }
}

