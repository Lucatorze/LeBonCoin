//
//  AddViewController.swift
//  Framework
//
//  Created by Admin on 19/03/2018.
//  Copyright © 2018 lucas_Roberts. All rights reserved.
//

import Foundation
import UIKit

class AddViewController:UIViewController {

    @IBAction func exit(_ sender: UIBarButtonItem) {
        self.dismiss(animated:true) {}
    }

    let image = UITextField()
    let titleTf = UITextField()
    let price = UITextField()
    let category = UITextField()
    let adress = UITextField()
    let addBtn = UIButton()

    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.orange
        
        image.placeholder = "imageUrl"
        image.textColor = UIColor.black
        image.backgroundColor = UIColor(white: 1, alpha: 0.5)
        image.layer.cornerRadius = 5
        
        self.view.addSubviewGrid(view: image, grid:["x": 0.2, "y":1.2, "width": 11.6, "height":0.5])
        
        titleTf.placeholder = "title"
        titleTf.textColor = UIColor.black
        titleTf.backgroundColor = UIColor(white: 1, alpha: 0.5)
        titleTf.layer.cornerRadius = 5
        
        self.view.addSubviewGrid(view: titleTf, grid:["x": 0.2, "y":2, "width": 11.6, "height":0.5])
        
        price.placeholder = "price"
        price.textColor = UIColor.black
        price.backgroundColor = UIColor(white: 1, alpha: 0.5)
        price.layer.cornerRadius = 5
        
        self.view.addSubviewGrid(view: price, grid:["x": 0.2, "y":2.8, "width": 11.6, "height":0.5])

        category.placeholder = "category"
        category.textColor = UIColor.black
        category.backgroundColor = UIColor(white: 1, alpha: 0.5)
        category.layer.cornerRadius = 5
        
        self.view.addSubviewGrid(view: category, grid:["x": 0.2, "y":3.6, "width":11.6, "height":0.5])
        
        adress.placeholder = "adress"
        adress.textColor = UIColor.black
        adress.backgroundColor = UIColor(white: 1, alpha: 0.5)
        adress.layer.cornerRadius = 5
        
        self.view.addSubviewGrid(view: adress, grid:["x": 0.2, "y":4.4, "width":11.6, "height":0.5])
        
        addBtn.setTitle("Ajouter l'annonce", for: .normal)
        addBtn.backgroundColor = UIColor(white: 0, alpha: 0.5)
        addBtn.titleLabel!.textColor = UIColor.white
        addBtn.layer.cornerRadius = 5
        
        self.view.addSubviewGrid(view: addBtn, grid:["x": 0.2, "y":6, "width": 11.6, "height":0.5])
        addBtn.addGestureRecognizer(UITapGestureRecognizer(target:self, action:#selector(add)))

    }
    
    
    @objc func add(){
        if(image.text! != "" || titleTf.text! != "" || price.text! != "" || category.text! != "" || adress.text! != "" ){
            let date = Date()
            let formatter = DateFormatter()
            formatter.locale =  Locale(identifier: "fr")
            formatter.dateFormat = "dd MMMM yyyy à HH:mm"
            UserDefaults.standard.setValue(image.text!, forKey: "image")
            UserDefaults.standard.setValue(titleTf.text!, forKey: "title")
            UserDefaults.standard.setValue(price.text!, forKey: "price")
            UserDefaults.standard.setValue(category.text!, forKey: "category")
            UserDefaults.standard.setValue(adress.text!, forKey: "adress")
            UserDefaults.standard.setValue(formatter.string(from: date), forKey: "date")
            self.dismiss(animated:true) {}
        }
    }
    
}


