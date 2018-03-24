//
//  DetailViewController.swift
//  Framework
//
//  Created by Admin on 19/03/2018.
//  Copyright © 2018 lucas_Roberts. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class DetailViewController:UIViewController, UIScrollViewDelegate {
    var product: [String: String]?
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBAction func backBtn(_ sender: UIButton) {
        self.dismiss(animated:true) {}
    }

    func coordinates(forAddress address: String, completion: @escaping (CLLocationCoordinate2D?) -> Void) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) {
            (placemarks, error) in
            guard error == nil else {
                print("Geocoding error: \(error!)")
                completion(nil)
                return
            }
            completion(placemarks?.first?.location?.coordinate)
        }
    }
    
    override func viewDidLoad() {
        self.scrollView.delegate = self
        self.scrollView.isScrollEnabled = true
        self.scrollView.contentSize = CGSize(width: self.view.frame.size.width, height: 1024)
        
        let back = UIButton()
        back.setTitle("Back",for: .normal)
        self.scrollView.addSubviewGrid(view: back, grid:["x": 0.2, "y":0.2, "width":11.2, "height":3])
        
        let url = URL(string: self.product!["image"]!)
        let imageUrl = try? Data(contentsOf: url!)
        
        let imageView = UIImageView()
        imageView.image = UIImage(data: imageUrl!)
        imageView.contentMode = .scaleToFill
        self.scrollView.addSubviewGrid(view: imageView, grid:["x": 0.2, "y":0.2, "width":11.2, "height":3])
        
        let title = UILabel()
        title.text = self.product!["title"]!
        title.textAlignment = .left
        title.font = title.font.withSize(16)
        title.textColor = UIColor.black
        
        self.scrollView.addSubviewGrid(view: title, grid:["x": 1, "y":3.5, "width":8, "height":2])
        
        let priceText = UILabel()
        priceText.text = "Prix : "
        priceText.textAlignment = .left
        priceText.font = priceText.font.withSize(16)
        priceText.textColor = UIColor.black
        
        self.scrollView.addSubviewGrid(view: priceText, grid:["x": 1, "y":4, "width":8, "height":2])
        
        let price = UILabel()
        price.text = self.product!["price"]! + "€"
        price.textAlignment = .left
        price.font = price.font.withSize(16)
        price.textColor = UIColor.orange
        
        self.scrollView.addSubviewGrid(view: price, grid:["x": 2.2, "y":4, "width":8, "height":2])
        
        let date = UILabel()
        date.text = self.product!["date"]!
        date.textAlignment = .left
        date.font = date.font.withSize(12)
        date.textColor = UIColor.black
        
        self.scrollView.addSubviewGrid(view: date, grid:["x": 1, "y":4.6, "width":8, "height":2])
        
        let mapView = MKMapView()
        self.scrollView.addSubviewGrid(view: mapView, grid:["x": 0.2, "y":6, "width":12.8, "height":6])
        
        coordinates(forAddress: self.product!["adress"]!) {
            (location) in
            guard let location = location else {
                // Handle error here.
                return
            }
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
            let center = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            
            mapView.setRegion(region, animated: false)
            mapView.addAnnotation(annotation)
        }
    }
}

extension UIView{
    
    func addSubviewGrid(view: UIView, grid: Dictionary <String,CGFloat>){
        let width = self.frame.width / 12 * grid["width"]!
        let height = self.frame.height / 12 * grid["height"]!
        let x = self.frame.width /  12 * grid["x"]!
        let y = self.frame.height / 12 * grid["y"]!
        
        view.frame = CGRect(x: x, y: y, width: width, height: height)
        
        self.addSubview(view)
    }
}
