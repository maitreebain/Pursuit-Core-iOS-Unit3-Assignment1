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
