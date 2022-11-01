//
//  PokemonModel.swift
//  PokeApp
//
//  Created by angel.tejedore on 29/10/22.
//

import UIKit

struct PokemonPage: Codable {
    let count: Int
    let next: String
    let results: [Pokemon]
}

struct Pokemon: Codable {
    let name: String
    let url: String
}

struct PokemonDetails: Codable {
    let id: Int
    let name: String
    let height: Int
    let weight: Int
    
}




