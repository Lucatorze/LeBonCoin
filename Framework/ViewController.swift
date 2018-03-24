//
//  ViewController.swift
//  Framework
//
//  Created by Admin on 29/01/2018.
//  Copyright © 2018 lucas_Roberts. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var tab = [
        [
            "image":"https://img.argentdubeurre.com/content/4018/illustration/canette-coca-100-4.jpg",
            "title":"Cannette de Coca Cola",
            "price":"1,80",
            "category":"Boisson",
            "adress":"Chauconin-Neufmontiers 77124",
            "date":"24/03/2018 à 14:02"
        ],
        [
            "image":"https://mycrazystuff.com/11038-thickbox_default/pate-a-prout.jpg",
            "title":"Pate à Prout",
            "price":"9,99",
            "category":"Divertissement",
            "adress":"Chauconin-Neufmontiers 77124",
            "date":"24/03/2018 à 14:02"
        ],
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addBtn(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "add", sender: "")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if(UserDefaults.standard.value(forKey: "image") != nil){
            let tab2 = [
                "image" : UserDefaults.standard.value(forKey: "image") as! String,
                "title" : UserDefaults.standard.value(forKey: "title") as! String,
                "price" : UserDefaults.standard.value(forKey: "price") as! String,
                "category" : UserDefaults.standard.value(forKey: "category") as! String,
                "adress": UserDefaults.standard.value(forKey: "adress") as! String,
                "date" : UserDefaults.standard.value(forKey: "date") as! String
            ]
            tab.append(tab2)
            tableView.reloadData()
            
            UserDefaults.standard.removeObject(forKey: "image")
            UserDefaults.standard.removeObject(forKey: "title")
            UserDefaults.standard.removeObject(forKey: "price")
            UserDefaults.standard.removeObject(forKey: "category")
            UserDefaults.standard.removeObject(forKey: "adress")
            UserDefaults.standard.removeObject(forKey: "date")
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tab.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! ItemCell
        cell.prepareView(data :tab[indexPath.row])
        return cell
    }
    
    override func prepare (for segue: UIStoryboardSegue, sender: Any?){
        if(segue.identifier == "detailShow"){
            let NavigationController = segue.destination as! UINavigationController
            let controller = NavigationController.topViewController as! DetailViewController
            
            let index = self.tableView.indexPathForSelectedRow?.row
            controller.product = tab[index!]
        }
    }
}


