//
//  Pokemon.swift
//  Pokedex
//
//  Created by Arkasha Zuev on 23.11.2021.
//

import SwiftUI

struct Pokemon: Identifiable {
    var id: String { name }
    let name: String
    let imgURL: String
    let color: Color
    let types: [String]
    var isFavorite = false
}

extension Pokemon {
    
    static var allPolemons = [
        Pokemon(name: "Bulbasaur", imgURL: "https://www.serebii.net/pokemongo/001.png", color: Color.green, types: ["Grass", "Poison"]),
        Pokemon(name: "Ivysaur", imgURL: "https://www.serebii.net/pokemongo/002.png", color: Color.green, types: ["Grass", "Poison"]),
        Pokemon(name: "Venusaur", imgURL: "https://www.serebii.net/pokemongo/003.png", color: Color.green, types: ["Fire"]),
        Pokemon(name: "Wartortle", imgURL: "https://www.serebii.net/pokemongo/008.png", color: Color.green, types: ["Water"]),
        Pokemon(name: "Metapod", imgURL: "https://www.serebii.net/pokemongo/0011.png", color: Color(hue: 0.187, saturation: 0.615, brightness: 0.427), types: ["Bug"]),
        Pokemon(name: "Butterfree", imgURL: "https://www.serebii.net/pokemongo/002.png", color: Color(hue: 0.187, saturation: 0.615, brightness: 0.427), types: ["Bug", "Flying"])
    ]
    
}
