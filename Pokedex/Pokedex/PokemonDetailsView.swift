//
//  PokemonDetailsView.swift
//  Pokedex
//
//  Created by efrei on 16/04/2019.
//  Copyright © 2019 efrei. All rights reserved.
//

import UIKit

class PokemonDetailsView: UIView {
    @IBOutlet weak var nameLabel: UILabel!
    //@IBOutlet weak var speciesLabel: UILabel!
    //@IBOutlet weak var countPokemon: UILabel!
    
    func displayInfos(withPokemon pokemonDetails: PokemonDetails?) {
        nameLabel.text = pokemonDetails?.name
        //speciesLabel.text = pokemon?.species.name
        //countPokemon.text = "\(pokemon.count)"
    }
}
