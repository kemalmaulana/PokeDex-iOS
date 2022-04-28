//
//  AppConstant.swift
//  PokeDex-iOS
//
//  Created by Kemal Maulana on 28/04/22.
//

import Foundation

let BASE_URL = "https://pokeapi.co/api/v2/"

func getImageUrl(pokeId: String) -> String {
    return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/\(pokeId).png"
}
