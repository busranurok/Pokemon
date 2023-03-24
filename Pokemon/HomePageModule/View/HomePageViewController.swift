//
//  ViewController.swift
//  Pokemon
//
//  Created by BusranurOK on 22.03.2023.
//

import UIKit
import Kingfisher

class HomePageViewController: UIViewController {
    
    @IBOutlet weak var pokemonsTableView: UITableView!
    
    var pokemonsList = [Pokemon]()
    
    var homePagePresenter: ViewToPresenterHomePageProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemonsTableView.dataSource = self
        pokemonsTableView.delegate = self
        
        //Yetkilendirmeyi çözeriz.
        HomePageRouter.createModule(ref: self)
        
    }
    
    // Detail' dan listeye geri göndüğümde arayüz güncellenecektir.
    // Aynı zamanda sayfa açıldığında güncellenecektir.
    override func viewWillAppear(_ animated: Bool) {
        
        homePagePresenter?.loadAllPokemons()
        
    }
    
}

extension HomePageViewController: PresenterToViewHomePageProtocol {
    
    func sendDataToView(pokemonList: Array<Pokemon>) {
        
        self.pokemonsList = pokemonList
        
        DispatchQueue.main.async {
            
            self.pokemonsTableView.reloadData()
            
        }
        
    }
    
}

extension HomePageViewController:UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let pokemon = pokemonsList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell", for: indexPath) as! PokemonTableViewCell
        
        cell.labelPokemonName.text = pokemon.name
        
        if let imageUrl = pokemon.sprites?.front_default {
            
            let url = URL(string: imageUrl)
            cell.pokemonImageView.kf.setImage(with: url)
            
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return pokemonsList.count
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let pokemon = pokemonsList[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: pokemon)
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toDetail" {
            
            let pokemon = sender as? Pokemon
            let goViewController = segue.destination as! PokemonDetailViewController
            goViewController.pokemon = pokemon
            
        }
        
    }
    
}

