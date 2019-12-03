//
//  ContactsDetailController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Maitree Bain on 12/3/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class ContactsDetailController: UIViewController {

    @IBOutlet weak var contactImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    var user: UserInfo!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

}
