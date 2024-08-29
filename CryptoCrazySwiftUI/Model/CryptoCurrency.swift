//
//  CryptoCurrency.swift
//  CryptoCrazySwiftUI
//
//  Created by Mark Santoro on 8/28/24.
//

import Foundation

struct CryptoCurrency : Hashable, Decodable, Identifiable {
    let id = UUID()
    let currency : String
    let price : String
    
    private enum CodingKeys : String, CodingKey {
        case currency = "currency"
        case price = "price"
        
    }
    
}
