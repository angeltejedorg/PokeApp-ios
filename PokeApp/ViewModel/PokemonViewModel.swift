//
//  PokemonViewModel.swift
//  PokeApp
//
//  Created by angel.tejedore on 30/10/22.
//

import UIKit

final class PokemonViewModel {
    
    var pokemonList: ObservableObject<[Pokemon]?> = ObservableObject(nil)
    var pokemonDetails: ObservableObject<PokemonDetails?> = ObservableObject(nil)
    var pokemonImage: ObservableObject<UIImage?> = ObservableObject(nil)
    
    private var networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol = NetworkServiceImpl()) {
        self.networkService = networkService
    }

    func loadPokemonList() {
        networkService.fetchPokemonList { [weak self] pokemon in
            self?.pokemonList.value = pokemon
        }
    }
    
    func getPokemonDetails(with id: Int) {
        networkService.fetchPokemonDetails(id) { [weak self] details in
            self?.pokemonDetails.value = details
        }
    }
    
    func getPokemonImage(with id: Int) {
        networkService.fetchPokemonImage(id) { [weak self] image in
            self?.pokemonImage.value = image
        }
    }
    
}
