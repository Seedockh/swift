//
//  PokemonController.swift
//  Pokedex
//
//  Created by efrei on 15/04/2019.
//  Copyright © 2019 efrei. All rights reserved.
//

import UIKit
import SDWebImage

//, UIPageViewControllerDataSource

class PokemonController: UIViewController {

    @IBOutlet var pokeDetailsView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var habitatLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var flavorTextEntriesLabel: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
    
    var pokemon: Pokemon?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fetchPokemon()
    }
    
    func fetchPokemon() {
        RequestManager.getPokemon(url: pokemon?.species.url ?? "no_url", success: { datas in
            let decoder = JSONDecoder()
            let pokemonDetails = try? decoder.decode(PokemonDetails.self, from: datas)
            // do > catch { print("Error while decoding") return }
            self.nameLabel.text = "Name : \(pokemonDetails?.name ?? "")"
            self.habitatLabel.text = "Habitat : \(pokemonDetails?.habitat.name ?? "")"
            self.colorLabel.text = "Color : \(pokemonDetails?.color.name ?? "")"
            self.flavorTextEntriesLabel.text = "Description : \(pokemonDetails?.flavorTextEntries[1].flavorText ?? "")"
            
            let imageURL = URL(string: "https://img.pokemondb.net/artwork/\(pokemonDetails?.name ?? "bulbasaur").jpg")!
            self.pokemonImage.sd_setImage(with: imageURL)
        }, failure: { error in
            print(error)
        })
    }
}
