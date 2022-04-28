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
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Detail Here")
            }
            
            .navigationTitle(Text("Detail Pokemon"))
        }
    }
}

struct DetailPokemonView_Previews: PreviewProvider {
    static var previews: some View {
        DetailPokemonView()
    }
}
