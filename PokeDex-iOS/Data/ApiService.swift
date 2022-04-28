//
//  ApiService.swift
//  PokeDex-iOS
//
//  Created by Kemal Maulana on 28/04/22.
//

import Alamofire

class ApiService {
    var statusCode = Int.zero
    
    func handleResponse<T: Decodable>(_ response: DataResponse<T>) -> Any? {
        switch response.result {
            case .success: return response.value
            case .failure: return nil
        }
    }
}
