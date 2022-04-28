//
//  AllPokemonView.swift
//  PokeDex-iOS
//
//  Created by Kemal Maulana on 28/04/22.
//

import Foundation
import SwiftUI

struct DetailPokemonView: View {
    
    @StateObject var viewModel = AllPokemonViewModel()
    var pokemonName: String
    
    init(_ pokemonName: String) {
        self.pokemonName = pokemonName
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Detail Here")
            }
        }
        
        
        .navigationTitle(Text(pokemonName))
    }
}

struct DetailPokemonView_Previews: PreviewProvider {
    static var previews: some View {
        DetailPokemonView("Bulbasaur")
    }
}
