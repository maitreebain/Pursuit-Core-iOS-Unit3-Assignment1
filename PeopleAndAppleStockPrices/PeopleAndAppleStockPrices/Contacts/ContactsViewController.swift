//
//  ViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Alex Paul on 12/7/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.dataSource = self
  }
    

}

extension ContactsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return
    }
}
