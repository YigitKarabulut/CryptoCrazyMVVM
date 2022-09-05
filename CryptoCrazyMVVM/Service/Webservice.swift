//
//  Webservice.swift
//  CryptoCrazyMVVM
//
//  Created by Yigit on 6.09.2022.
//

import Foundation


class Webservice {
    func downloadCurrencies(url: URL, completion: @escaping([CryptoCurrency]?)->()) {
     
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print(error?.localizedDescription ?? "Error")
                completion(nil)
            } else if let data = data {
                let jsonDecoder = JSONDecoder()
                
                
                let cryptoList = try? jsonDecoder.decode([CryptoCurrency].self, from: data)
                
                completion(cryptoList)
                
            }
        }.resume()
    }
}
