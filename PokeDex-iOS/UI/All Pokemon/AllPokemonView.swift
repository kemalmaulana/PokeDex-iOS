//
//  AllPokemonView.swift
//  PokeDex-iOS
//
//  Created by Kemal Maulana on 28/04/22.
//

import Foundation
import SwiftUI

struct AllPokemonView: View {
    
    @StateObject var viewModel = AllPokemonViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    LazyVGrid(columns: viewModel.gridItemLayout, spacing: 20) {
                        ForEach(viewModel.allPokemon, id: \.url) { result in
                            NavigationLink(destination: DetailPokemonView()) {
                                AsyncImage(url: URL(string: getImageUrl(pokeId: String(result.url.subStringAfter(string: "/pokemon").replacingOccurrences(of: "/", with: ""))))) { image in
                                    image.resizable()
                                } placeholder: {
                                    Color.red
                                }
                                .font(.system(size: 30))
                                .frame(width: 100, height: 100)
                                .background(.yellow)
                                .cornerRadius(10)
                                
                            }
                            
                        }
                    }
                }
                .isPagingEnabled()
                .onAppear {
                    viewModel.offset += 20
                    viewModel.fetchAllPokemon(offset: viewModel.offset)
                    print(viewModel.offset)
                }
            }
            .navigationTitle(Text("PokeDex"))
        }
        
    }
}

struct ScrollViewPagingModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .onAppear {
                UIScrollView.appearance().isPagingEnabled = true
            }
            .onDisappear {
                UIScrollView.appearance().isPagingEnabled = false
            }
    }
}

extension ScrollView {
    func isPagingEnabled() -> some View {
        modifier(ScrollViewPagingModifier())
    }
}


struct AllPokemonView_Previews: PreviewProvider {
    static var previews: some View {
        AllPokemonView()
    }
}
