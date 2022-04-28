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
                            NavigationLink(destination: DetailPokemonView(result.name.capitalized)) {
                                VStack {
                                    AsyncImage(url: URL(string: getImageUrl(pokeId: String(result.url.subStringAfter(string: "/pokemon").replacingOccurrences(of: "/", with: ""))))
                                    ) { image in
                                        image.resizable()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    
                                    Text(result.name.capitalized)
                                        .font(.system(size: 14))
                                        .foregroundColor(.white)
                                        .frame(width: 100, height: 20)
                                        .background(.green)
                                }
                                .frame(width: 100, height: 120)
                                .background(.yellow)
                                .cornerRadius(10)
                                .onAppear {
                                    if((Int(result.url.subStringAfter(string: "/pokemon").replacingOccurrences(of: "/", with: "")) ?? 0) % 20 == 0) {
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                            viewModel.loadMore()
                                        }
                                    }
                                    
                                }
                                
                            }
                            
                        }
                    }
                }
                //                .isPagingEnabled()
            }
            .navigationTitle(Text("PokeDex"))
        }
        .ignoresSafeArea()
        
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
