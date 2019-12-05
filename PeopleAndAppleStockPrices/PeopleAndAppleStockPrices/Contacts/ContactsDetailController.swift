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
    
        updateUI()
    }
    
    func updateUI() {
    
    guard let userInfo = user else {
        fatalError("no userinfo")
    }
        nameLabel.text = "\(userInfo.name.first) \(userInfo.name.last)".capitalized
        emailLabel.text = "email: \(userInfo.email)"
        cityLabel.text = "city: \(userInfo.location.city)".capitalized

        ImageClient.imageLoad(for: userInfo.picture.large) { [unowned self] (result) in
                
            switch result {
            case .failure(let error):
                print("error: \(error)")
            case .success(let image):
                DispatchQueue.main.async {
                    self.contactImage.image = image
                }
            }
                
                
            }
        }
    
    
    }
