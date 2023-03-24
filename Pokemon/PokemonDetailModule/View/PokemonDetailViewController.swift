//
//  PokemonDetailViewController.swift
//  Pokemon
//
//  Created by BusranurOK on 22.03.2023.
//

import UIKit
import Kingfisher

class PokemonDetailViewController: UIViewController {

    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var buttonPokemonName: CustomButton!
    @IBOutlet weak var pokemonAbilitiesTextField: UITextField!
    
    var pokemon:Pokemon?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let pokemon = pokemon {
            
            buttonPokemonName.setTitle(pokemon.name, for: .normal)
            /*if let attrFont = UIFont(name: "Helvetica", size: 40) {
                        let title = buttonPokemonName.titleLabel!.text!
                        let attrTitle = NSAttributedString(string: title, attributes: [NSAttributedString.Key.font: attrFont])
                        buttonToResize.setAttributedTitle(attrTitle, for: UIControl.State.normal)
                    }*/
            
            var abilitiesText = ""
            
            if let abilities = pokemon.abilities {
                
                for ability in  abilities {
                    
                    abilitiesText += "\(ability.ability?.name ?? "")  "
                    
                }
                
            }
            
            pokemonAbilitiesTextField.text = abilitiesText
            
            if let imageUrl = pokemon.sprites?.front_default {
                
                let url = URL(string: imageUrl)
                pokemonImageView.kf.setImage(with: url)
                
            }
            
        }
        
    }

}
