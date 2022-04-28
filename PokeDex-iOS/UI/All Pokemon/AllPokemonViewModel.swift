//
//  AllPokemonViewModel.swift
//  PokeDex-iOS
//
//  Created by Kemal Maulana on 28/04/22.
//

import Foundation
import SwiftUI

class AllPokemonViewModel: ObservableObject {
    @Published var title: String = ""
    
    @Published var symbols = ["keyboard", "hifispeaker.fill", "printer.fill", "tv.fill", "desktopcomputer", "headphones", "tv.music.note", "mic", "plus.bubble", "video"]
    
    @Published var allPokemon: [Result] = []
    
    @Published var colors: [Color] = [.yellow, .purple, .green]
    
    @Published var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    @Published var offset = 0
    
    init() {
        fetchAllPokemon(offset: offset)
    }
    
    func loadMore() {
        offset += 20
        fetchAllPokemon(offset: offset)
        print(offset)
    }
    
    
    func fetchAllPokemon(offset: Int) {
        guard var urlComponent = URLComponents(string: "https://pokeapi.co/api/v2/pokemon") else { return }
        
        urlComponent.queryItems = [
            URLQueryItem(name: "limit", value: String(20)),
            URLQueryItem(name: "offset", value: String(offset)),
        ]
        
        let task = URLSession.shared.dataTask(with: urlComponent.url!) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            
            // Convert to Model
            do {
                let model = try JSONDecoder().decode(AllPokemonModel.self, from: data)
                DispatchQueue.main.async {
                    self.allPokemon += model.results
                }
            } catch {
                print("Failed All Pokemon Parsing \(error)")
            }
        }
        task.resume()
    }
}
