//
//  itemCell.swift
//  Framework
//
//  Created by Admin on 29/01/2018.
//  Copyright © 2018 lucas_Roberts. All rights reserved.
//

import Foundation
import UIKit

class ItemCell: UITableViewCell{
    
    override func awakeFromNib() {
        self.contentView.backgroundColor = .white
    }
    
    func prepareView(data:[String:String]){
        
        let url = URL(string: data["image"]!)
        let imageUrl = try? Data(contentsOf: url!)
        
        let imageView = UIImageView()
        imageView.image = UIImage(data: imageUrl!)
        imageView.contentMode = .scaleAspectFill
        
        self.contentView.addSubviewGrid(view: imageView, grid:["x": 0, "y":0, "width":5, "height":12])
        
        let title = UILabel()
        title.text = data["title"]!
        title.textAlignment = .left
        title.font = title.font.withSize(14)
        title.textColor = UIColor.blue
        
        self.contentView.addSubviewGrid(view: title, grid:["x": 6, "y":0, "width":5, "height":2])
        
        let price = UILabel()
        price.text = data["price"]!
        price.textAlignment = .left
        price.font = price.font.withSize(12)
        price.textColor = UIColor.orange
        
        self.contentView.addSubviewGrid(view: price, grid:["x": 6, "y":4, "width":5, "height":2])
        
        let category = UILabel()
        category.text = data["category"]!
        category.textAlignment = .left
        category.font = category.font.withSize(10)
        category.textColor = UIColor.blue
        
        self.contentView.addSubviewGrid(view: category, grid:["x": 6, "y":6, "width":5, "height":2])
        
        let adress = UILabel()
        adress.text = data["adress"]!
        adress.textAlignment = .left
        adress.font = adress.font.withSize(10)
        adress.textColor = UIColor.blue
        
        self.contentView.addSubviewGrid(view: adress, grid:["x": 6, "y":8, "width":5, "height":2])
        
        let date = UILabel()
        date.text = data["date"]!
        date.textAlignment = .left
        date.font = date.font.withSize(8)
        date.textColor = UIColor.black
        
        self.contentView.addSubviewGrid(view: date, grid:["x": 6, "y":10, "width":5, "height":2])

    }
}
