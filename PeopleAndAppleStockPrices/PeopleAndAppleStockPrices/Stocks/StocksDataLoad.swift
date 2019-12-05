//
//  StocksDataLoad.swift
//  PeopleAndAppleStockPrices
//
//  Created by Maitree Bain on 12/5/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct StocksData: Codable {
    let date: String
    let uOpen: Double
    let open: Double
    let close: Double
    let label: String
    let changeOverTime: Double
    
    static func stocksData() -> [StocksData] {
        var stocksData = [StocksData]()
        
        guard let fileURL = Bundle.main.url(forResource: "applstockinfo", withExtension: "json") else {
            fatalError("file not found")
        }
        
        do {
            let data = try Data.init(contentsOf: fileURL)
            
            let stocksInfo = try JSONDecoder().decode([StocksData].self, from: data)
            stocksData = stocksInfo.sorted { $0.date < $1.date}
        }
        catch {
            fatalError("decoding error: \(error)")
        }
     
        return stocksData
    }
    
}

