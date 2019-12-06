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

    var sections = [[StocksData]](){
        didSet {
            stocksTableView.reloadData()
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       sections = sectionedStocks()
        
        stocksTableView.dataSource = self  //1
        //2

        loadData()
        
    }

    func loadData() {
        stocks = StocksData.stocksData()
    }
    
    func sectionedStocks() -> [[StocksData]] {
        
        var stockMatrix = [[StocksData]]()
        
        let stocksData = StocksData.stocksData()
        
        let stocksSorted = stocksData.sorted { $0.date < $1.date }
        
        var arrayOfDates = [String]()
        
        let uniqueDates = Set(stocksSorted.map { $0.date})

        for date in uniqueDates {
            var dateInfo = date.components(separatedBy: "-")
            dateInfo.removeLast()
            arrayOfDates.append(dateInfo.joined(separator: " "))
        }
        
        let dateName = Set(arrayOfDates.sorted())
        let nameArray = Array(dateName).sorted()
        stockMatrix = Array(repeating: [StocksData](), count: nameArray.count)
        
        var currentIndex = 0
        var sectionIndex = 0
        var currentSectionIndex = nameArray[sectionIndex]
        
        //var firstDate = stocksSorted[currentIndex].date
        
        for date in stocksSorted {
            var stockDateName = date.date.components(separatedBy: "-")
            stockDateName.removeLast()
            let updatedDate = stockDateName.joined(separator: " ")
            
            if updatedDate == currentSectionIndex {
                stockMatrix[currentIndex].append(date)
            } else {
                //firstDate = updatedDate
                currentIndex += 1
                sectionIndex += 1
                currentSectionIndex = nameArray[sectionIndex]
                stockMatrix[currentIndex].append(date)
            }
        }
            return stockMatrix
    }
    
    
    func stocksAverage(_ section: [StocksData]) -> Double {
        var sum = 0.0
        
        for stock in section {
            sum += stock.uOpen
        }
        let avg = (sum / Double(section.count))
        
        return avg
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let stocksDetailVC = segue.destination as? StocksDetailController,
            let indexPath = stocksTableView.indexPathForSelectedRow else {
                fatalError("no segue found")
        }
        let selectedStock = stocks[indexPath.row]
        
        stocksDetailVC.stocks = selectedStock
    }
}

extension StocksViewController: UITableViewDataSource {
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "stocksCell", for: indexPath)
        
        let selectedStock = sections[indexPath.section][indexPath.row]
        
        cell.textLabel?.text = selectedStock.date
        cell.detailTextLabel?.text = selectedStock.open.description
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        guard let sectionsArray = sections[section].first?.label.components(separatedBy: " ") else {
            return ""
        }
        let stockAverage = stocksAverage(sections[section])

        let cleanNumber = String(format: "%.2f", stockAverage)

        let title = "\(sectionsArray[0]) \(sectionsArray[2]) \t\t\t\t\t\t\t\t\t \(cleanNumber)"

        return title
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

}
