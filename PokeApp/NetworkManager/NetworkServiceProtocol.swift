//
//  NetworkProtocol.swift
//  PokeApp
//
//  Created by angel.tejedore on 30/10/22.
//

import UIKit

protocol NetworkServiceProtocol {
    
    func fetchPokemonList(completion: @escaping ([Pokemon]?) -> Void)
    
    func fetchPokemonDetails(_ id: Int, completion: @escaping (PokemonDetails?) -> Void)
    
    func fetchPokemonImage(_ id: Int, completion: @escaping (UIImage?) -> Void)
}
