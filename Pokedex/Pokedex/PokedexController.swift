//
//  ViewController.swift
//  Pokedex
//
//  Created by efrei on 15/04/2019.
//  Copyright © 2019 efrei. All rights reserved.
//

import UIKit

class PokedexController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var pokedex: Pokedex?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.register(UINib(nibName: "PokedexCell", bundle: nil), forCellReuseIdentifier: "PokeCell")
        tableView.dataSource = self
        tableView.delegate = self
        fetchPokedex()
    }
    
    func fetchPokedex() {
        RequestManager.getPokedex(success: { datas in
            let decoder = JSONDecoder()
            self.pokedex = try? decoder.decode(Pokedex.self, from: datas)
            // do > catch { print("Error while decoding") return }
            self.tableView.reloadData()
        }) { error in
            print(error)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokedex?.pokemonEntries.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let pokeCell = tableView.dequeueReusableCell(withIdentifier: "PokeCell",for:indexPath) as? PokedexCell {
            pokeCell.displayInfos(withPokemon: pokedex?.pokemonEntries[indexPath.row])
            return pokeCell
        }
        return UITableViewCell()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PokemonDetailsSegue" {
            if let pokemonController = segue.destination as? PokemonController, let indexPathSelected = tableView.indexPathForSelectedRow {
                pokemonController.pokemon = pokedex?.pokemonEntries[indexPathSelected.row]
                tableView.deselectRow(at: indexPathSelected, animated: false)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "PokemonDetailsSegue", sender: self)
    }
}
