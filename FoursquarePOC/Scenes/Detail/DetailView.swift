//
//  DetailView.swift
//  FoursquarePOC
//
//  Created by Onur Geneş on 15.05.2019.
//  Copyright © 2019 Onur Geneş. All rights reserved.
//

import UIKit
import MapKit

class DetailView: UIView {
    
    lazy var effectView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.black
        v.alpha = 0.6
        return v
    }()
    
    lazy var tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .grouped)
        tv.backgroundColor = .white
        tv.layer.cornerRadius = 12
        return tv
    }()
    
    convenience init() {
        self.init(frame: .zero)
        
        backgroundColor = .clear
        
        addSubview(effectView)
        addSubview(tableView)
        
        effectView.fillSuperView()
        
        tableView.top(to: self, offset: 100)
        tableView.bottom(to: self, offset: -120)
        tableView.right(to: self, offset: -20)
        tableView.left(to: self, offset: 20)
    }
}
