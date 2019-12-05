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
    
    var stocks = [StocksData]() {
        didSet {
            stocksTableView.reloadData()
        }
    }
    
//    var sections = [[StocksData]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stocksTableView.dataSource = self

        loadData()
        sectionedStocks()
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
        
        let dateName = Set(arrayOfDates.sorted())
        let nameArray = Array(dateName).sorted()
        var sections = Array(repeating: [StocksData](), count: dateName.count)
        
        var currentIndex = 0
        var sectionIndex = 0
        var currentSectionIndex = nameArray[sectionIndex]
        
        var firstDate = stocksData.first?.date
        
        for date in stocksData {
            var stockDateName = date.date.components(separatedBy: "-")
            stockDateName.removeLast()
            let updatedDate = stockDateName.joined(separator: " ")
            
            if updatedDate == firstDate {
                sections[currentIndex].append(date)
            } else {
                currentIndex += 1
                sectionIndex += 1
                currentSectionIndex = nameArray[sectionIndex]
                sections[currentIndex].append(date)
            }
        }
        
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
