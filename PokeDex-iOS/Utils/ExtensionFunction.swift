//
//  ExtensionFunction.swift
//  PokeDex-iOS
//
//  Created by Kemal Maulana on 29/04/22.
//

import Foundation

extension String {
    var subStringAfterLastComma : String {
        guard let subrange = self.range(of: ",\\s?", options: [.regularExpression, .backwards]) else { return self }
        return String(self[subrange.upperBound...])
    }
    
    var subStringAfterLastSlash : String {
        guard let subrange = self.range(of: "/\\s?", options: [.regularExpression, .backwards]) else { return self }
        return String(self[subrange.upperBound...])
    }
    
    var subStringAfterLastDot : String {
        guard let subrange = self.range(of: ".\\s?", options: [.regularExpression, .backwards]) else { return self }
        return String(self[subrange.upperBound...])
    }
    
    func subStringAfter(string: String) -> String {
        guard let subrange = self.range(of: "\(string)\\s?", options: [.regularExpression, .backwards]) else { return self }
        return String(self[subrange.upperBound...])
    }
}
