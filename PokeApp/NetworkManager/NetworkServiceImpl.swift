//
//  Network.swift
//  PokeApp
//
//  Created by angel.tejedore on 30/10/22.
//

import UIKit
import Alamofire

class NetworkServiceImpl: NetworkServiceProtocol {
    
    func fetchPokemonList(completion: @escaping ([Pokemon]?) -> Void) {
      
        let url = "https://pokeapi.co/api/v2/pokemon?limit=200"
        let request = AF.request(url)
        
        request.responseDecodable(of: PokemonPage.self) { response in
            if let pokemons = response.value?.results {
                completion(pokemons)
            }
        }
    }
    
    func fetchPokemonDetails(_ id: Int, completion: @escaping (PokemonDetails?) -> Void) {
        let url = "https://pokeapi.co/api/v2/pokemon/\(id)"
        let request = AF.request(url)
        
        request.responseDecodable(of: PokemonDetails.self) { response in
            if let pokemon = response.value {
                completion(pokemon)
            }
        }
    }
    
    func fetchPokemonImage(_ id: Int, completion: @escaping (UIImage?) -> Void) {
        
        let url = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/\(id).png"
        AF.download(url).responseURL { response in
            if response.error == nil, let imagePath = response.fileURL?.path {
                let image = UIImage(contentsOfFile: imagePath)
                completion(image)
            }
        }
    }
}
