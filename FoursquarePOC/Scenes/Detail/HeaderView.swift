//
//  HeaderView.swift
//  FoursquarePOC
//
//  Created by Onur Geneş on 17.05.2019.
//  Copyright © 2019 Onur Geneş. All rights reserved.
//

import UIKit
import MapKit
import TinyConstraints

class HeaderView: UIView {
    
    lazy var mapView: MKMapView = {
        let mkv = MKMapView()
        return mkv
    }()
    
    lazy var photoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.backgroundColor = UIColor(red: 0.29, green: 0.20, blue: 0.78, alpha: 1)
        return iv
    }()
    
    convenience init() {
        self.init(frame: .zero)
        
        addSubview(mapView)
        addSubview(photoImageView)
        
        mapView.top(to: self)
        mapView.left(to: self)
        mapView.right(to: self)
        mapView.height(120)
        
        photoImageView.topToBottom(of: mapView)
        photoImageView.left(to: self)
        photoImageView.right(to: self)
        photoImageView.bottom(to: self)
        
    }
}
