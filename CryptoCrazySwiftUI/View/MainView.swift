//
//  ContentView.swift
//  CryptoCrazySwiftUI
//
//  Created by Mark Santoro on 8/28/24.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var cryptoListViewModel : CryptoListViewModel
    
    init() {
        self.cryptoListViewModel = CryptoListViewModel()
    }
    
    
    var body: some View {
        NavigationView {
            List(cryptoListViewModel.cryptoList,id:\.id) {crypto in
                VStack{
                    Text(crypto.currency)
                        .font(.title3)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                    Text(crypto.price)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
            }.navigationTitle("Crypto Crazy")
            
        }.task {
            await cryptoListViewModel.downloadCryptosAsync(url: URL(string:
            "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)
        }
        
        
 //         .onAppear {
//            crypotoListViewModel.downloadCryptos(url:
//            URL(string:"https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)
//        }



    }
}

#Preview {
    MainView()
}
