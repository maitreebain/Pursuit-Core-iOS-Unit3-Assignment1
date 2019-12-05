//
//  ImageClient.swift
//  PeopleAndAppleStockPrices
//
//  Created by Maitree Bain on 12/5/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

struct ImageClient {
    
    static func imageLoad (for urlString: String, completion: @escaping (Result<UIImage?, Error>) -> ()) {
        
        guard let url = URL(string: urlString) else {
            print("url found \(urlString)")
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) {data, response, error  in
        
        if let error = error {
            fatalError("\(error)")
        }
        
            if let data = data {
                
                let image = UIImage(data: data)
                
                completion(.success(image))
            }
        
        
        }
        dataTask.resume()
    
    }
    
}
