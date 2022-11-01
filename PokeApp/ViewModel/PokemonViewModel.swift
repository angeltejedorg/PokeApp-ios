//
//  PokemonViewModel.swift
//  PokeApp
//
//  Created by angel.tejedore on 30/10/22.
//

import UIKit

final class PokemonViewModel {
    
    var pokemonList: ObservableObject<[Pokemon]?> = ObservableObject(nil)
    
    private let networkService = NetworkServiceImpl()

    func loadPokemonList() {
        networkService.fetchPokemonList { pokemon in
            self.pokemonList.value = pokemon
        }
    }
    
}
