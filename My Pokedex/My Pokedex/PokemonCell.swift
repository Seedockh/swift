//
//  PokemonCell.swift
//  My Pokedex
//
//  Created by Pierre-Yves Touzain on 04/04/2018.
//  Copyright © 2018 TYP Studio. All rights reserved.
//

import UIKit

class PokemonCell: UITableViewCell {

    @IBOutlet weak var pokedexEntryLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    public func configure(withPokemon pokemon: Pokemon) {
        pokedexEntryLabel.text = String(format: "%03d", pokemon.entry)
        nameLabel.text = pokemon.specie.name.capitalized
    }
}
