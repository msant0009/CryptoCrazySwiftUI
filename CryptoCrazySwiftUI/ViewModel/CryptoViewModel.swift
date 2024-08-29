//
//  CryptoViewModel.swift
//  CryptoCrazySwiftUI
//
//  Created by Mark Santoro on 8/28/24.
//

import Foundation

class CryptoListViewModel : ObservableObject {
    
    @Published var cryptoList = [CryptoViewModel]()
    
    let webservice = WebService()
    
        func downloadCryptos(url : URL) {
            webservice.downloadCurrencies(url: url) { result in
                switch result {
                 
                case .failure(let error) :
                    print(error)
                    
                case .success(let cryptos) :
                    if let cryptos = cryptos {
                        self.cryptoList = cryptos.map(CryptoViewModel.init)
                        
                    }
            }
        }
    }
}


struct CryptoViewModel {
    let crypto : CryptoCurrency
    
    var id : UUID? {
        crypto.id
    }
    
    var currency : String {
        crypto.currency
    }
    
    var price : String {
        crypto.price
    }
    
    
}
