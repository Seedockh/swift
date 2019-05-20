//
//  PokemonDetailsViewController.swift
//  My Pokedex
//
//  Created by Pierre-Yves Touzain on 31/03/2018.
//  Copyright © 2018 TYP Studio. All rights reserved.
//

import UIKit
import SDWebImage

class PokemonDetailsViewController: UIViewController {

    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var habitatLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var shapeLabel: UILabel!
    @IBOutlet weak var flavorTextLabel: UILabel!
    
    var pokemon: Pokemon?
    var pokemonDetails: PokemonDetails?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDetails()
        pokemonImageView.sd_setImage(with: URL(string: "https://img.pokemondb.net/artwork/\(pokemon?.specie.name ?? "").jpg"), completed: nil)
    }
    
    func fetchDetails() {
        if let url = pokemon?.specie.url {
            RequestManager.getPokemonDetails(url: url, success: { (data) in
                let decoder = JSONDecoder()
                self.pokemonDetails = try? decoder.decode(PokemonDetails.self, from: data)
                self.updateUI()
            }) { (error) in
                print(error)
            }
        }
    }
    
    @IBAction func backAction() {
        navigationController?.popViewController(animated: true)
    }
    
    func updateUI() {
        nameLabel.text = pokemonDetails?.name.capitalized
        habitatLabel.text = "Habitat: \(pokemonDetails?.habitat.name.capitalized ?? "")"
        colorLabel.text = "Color: \(pokemonDetails?.color.name.capitalized ?? "")"
        shapeLabel.text = "Shape: \(pokemonDetails?.shape.name.capitalized ?? "")"
        let formattedFlavorText = pokemonDetails?
            .getFlavorText(inLanguage: "en", fromVersion: "red")?
            .text.replacingOccurrences(of: "\n", with: " ")
        flavorTextLabel.text = "Description: \(formattedFlavorText ?? "")"
    }
}
