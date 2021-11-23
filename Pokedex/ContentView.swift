//
//  ContentView.swift
//  Pokedex
//
//  Created by Arkasha Zuev on 23.11.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var pokemons = Pokemon.allPolemons
    @State private var query = ""
    
    var filteredPokemons: [Pokemon] {
        if query == "" { return pokemons }
        return pokemons.filter{ $0.name.lowercased().contains(query.lowercased()) }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filteredPokemons.prefix(2)) { pokemon in
                    PokemonRow(pokemon: pokemon)
                        .swipeActions(edge: .leading, allowsFullSwipe: false) {
                            Button {
                                addToFavorites(pokemon: pokemon)
                            } label: {
                                Image(systemName: "star")
                            }
                            .tint(.yellow)
                        }
                }
            }
            .searchable(text: $query) {
                ForEach(pokemons) { pokemon in
                    Text(pokemon.name).searchCompletion(pokemon.name)
                }
            }
            .refreshable { pokemons.shuffle() }
            .navigationTitle("Pokedex")
        }
    }
    
    func addToFavorites(pokemon: Pokemon) {
        if let index = pokemons.firstIndex(where: { $0.id == pokemon.id }) {
            pokemons[index].isFavorite.toggle()
        }
    }
}

struct PokemonRow: View {
    let pokemon: Pokemon
    
    var body: some View {
        HStack(spacing: 20) {
            AsyncImage(url: URL(string: pokemon.imgURL)) { loadedImg in
                loadedImg.resizable()
                    .background(groundView)
            } placeholder: {
                ZStack {
                    groundView
                    ProgressView()
                }
            }
            .frame(width: 90, height: 90)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(pokemon.name)
                    .font(.title3.bold())
                
                HStack(spacing: 5) {
                    ForEach(pokemon.types, id: \.self) { type in
                        Text(type)
                            .font(.system(size: 14, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .padding(.vertical, 3)
                            .padding(.horizontal, 10)
                            .background(pokemon.color)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                }
                
                if pokemon.isFavorite {
                    HStack(spacing: 5) {
                        Image(systemName: "star.fill")
                        Text("Favorite")
                    }
                    .font(.system(size: 14, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .padding(.vertical, 3)
                    .padding(.horizontal, 10)
                    .background(Capsule().foregroundColor(.yellow))
                }
            }
        }
    }
    
    var groundView: some View {
        Circle()
            .foregroundColor(pokemon.color)
            .blur(radius: 4)
            .scaleEffect(y: 0.15, anchor: .bottom)
            .scaleEffect(x: 1.2, anchor: .bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
