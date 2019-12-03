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
    
    var users = [UserInfo]() {
        didSet {
            tableView.reloadData()
        }
    }
    
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.dataSource = self
    loadData()
    tableView.delegate = self
  }
    
    func loadData() {
        users = UserData.getUsers()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let contactsDetailController = segue.destination as? ContactsDetailController,
            let indexPath = tableView.indexPathForSelectedRow else {
                fatalError("no segue found")
        }
        let selectedContact = users[indexPath.row]
        
        contactsDetailController.user = selectedContact
    }
}

extension ContactsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
        
        let contactSelected = users[indexPath.row]
        cell.textLabel?.text = "\(contactSelected.name.first.capitalized) \(contactSelected.name.last.capitalized)"
        cell.detailTextLabel?.text = contactSelected.location.city.capitalized
        
        return cell
    }
}

extension ContactsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
