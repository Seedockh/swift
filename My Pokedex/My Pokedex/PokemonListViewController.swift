//
//  PokemonListViewController.swift
//  My Pokedex
//
//  Created by Pierre-Yves Touzain on 31/03/2018.
//  Copyright © 2018 TYP Studio. All rights reserved.
//

import UIKit

class PokemonListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    //var pokemons: [Pokemon] = []
    var pokedex: Pokedex?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPokemons()
    }
    
    func fetchPokemons() {
        RequestManager.getPokemons(success: { (data) in
            let decoder = JSONDecoder()
            self.pokedex = try? decoder.decode(Pokedex.self, from: data)
            self.tableView.reloadData()
        }) { (error) in
            print(error)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokedex?.pokemonEntries.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell", for: indexPath) as! PokemonCell
        if let pokemon = pokedex?.pokemonEntries[indexPath.row] {
            cell.configure(withPokemon: pokemon)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? PokemonDetailsViewController, let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.pokemon = pokedex?.pokemonEntries[indexPath.row]
        }
    }
}

