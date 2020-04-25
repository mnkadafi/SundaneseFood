//
//  ViewController.swift
//  SundaneseFood
//
//  Created by Mochamad Nurkhayal Kadafi on 24/04/20.
//  Copyright © 2020 Dicoding Indonesia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var foodTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title    = "List"
        
        foodTableView.dataSource    = self
        foodTableView.delegate      = self
        foodTableView.register(UINib(nibName: "FoodTableViewCell", bundle: nil), forCellReuseIdentifier : "ListFoodCell")
    }
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listFood.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListFoodCell", for: indexPath) as! FoodTableViewCell
        
        let food = listFood[indexPath.row]
        cell.imageFood.image = food.image
        cell.nameFood.text   = food.name
        cell.descFood.text   = food.description
        
        cell.imageFood.layer.cornerRadius   = cell.imageFood.frame.height / 2
        cell.imageFood.clipsToBounds        = true
        return cell
    }
}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail = DetailViewController(nibName: "DetailViewController", bundle: nil)
        
        detail.sundaneseFood    = listFood[indexPath.row]
        self.navigationController?.pushViewController(detail, animated: true)
    }
}
