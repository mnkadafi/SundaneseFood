//
//  DetailViewController.swift
//  SundaneseFood
//
//  Created by Mochamad Nurkhayal Kadafi on 24/04/20.
//  Copyright © 2020 Dicoding Indonesia. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageFood: UIImageView!
    @IBOutlet weak var nameFood: UILabel!
    @IBOutlet weak var priceFood: UILabel!
    @IBOutlet weak var descFood: UILabel!
    
    var sundaneseFood : SundaneseFood?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title    = "Detail"
        
        imageFood.layer.cornerRadius = imageFood.frame.height / 2
        imageFood.clipsToBounds      = true
        
        if let result = sundaneseFood {
            imageFood.image = result.image
            nameFood.text   = result.name
            priceFood.text  = "Rp"+result.price
            descFood.text   = result.description
        }
    }

}
