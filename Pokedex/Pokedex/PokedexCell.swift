//
//  PokedexCell.swift
//  Pokedex
//
//  Created by efrei on 16/04/2019.
//  Copyright © 2019 efrei. All rights reserved.
//

import UIKit

class PokedexCell: UITableViewCell {
    @IBOutlet weak var entryLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    //@IBOutlet weak var countPokemon: UILabel!
    
    func displayInfos(withPokemon pokemon: Pokemon?) {
        entryLabel.text = String(format:"%03d",(pokemon?.entry ?? 0))
        speciesLabel.text = pokemon?.species.name
        //countPokemon.text = "\(pokemon.count)"
    }
}
