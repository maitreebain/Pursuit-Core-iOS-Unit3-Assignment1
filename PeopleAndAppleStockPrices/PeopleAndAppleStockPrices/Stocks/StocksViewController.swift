//
//  StocksViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Maitree Bain on 12/5/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class StocksViewController: UIViewController {

    @IBOutlet weak var stocksTableView: UITableView!
    
    var stocks = [StocksData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stocksTableView.dataSource = self

        loadData()
    }

    func loadData() {
        stocks = StocksData.stocksData()
    }

    func sectionedStocks() {
        let stocksData = StocksData.stocksData()

        var arrayOfDates = [String]()
        
        let uniqueDates = Set(stocksData.map { $0.date})

        for date in uniqueDates {
            var dateInfo = date.components(separatedBy: "-")
            dateInfo.removeLast()
            arrayOfDates.append(dateInfo.joined(separator: " "))
        }
        
        var sections = Array(repeating: [StocksData](), count: uniqueDates.count)
        
        
        
        var currentIndex = 0
        
        
        
    }
}

extension StocksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stocks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stocksCell", for: indexPath)
        
        let selectedStock = stocks[indexPath.row]
        
        cell.textLabel?.text = selectedStock.date
        cell.detailTextLabel?.text = selectedStock.uOpen.description
        
        return cell
    }
}
