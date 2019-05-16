//
//  PlacesView.swift
//  FoursquarePOC
//
//  Created by Onur Geneş on 15.05.2019.
//  Copyright © 2019 Onur Geneş. All rights reserved.
//

import UIKit

class PlacesView: UIView {
    
    lazy var tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .plain)
        return tv
    }()
    
    convenience init() {
        self.init(frame: .zero)
        
        backgroundColor = .white
        
        addSubview(tableView)
        
        // Using ''TinyConstraints''. I am a contributer of this project. Also it simplifies AutoLayout code.
        if #available(iOS 10.0, *) {
            tableView.edgesToSuperview(usingSafeArea: true)
        } else {
            tableView.leading(to: self)
            tableView.trailing(to: self)
            tableView.top(to: self)
            tableView.bottom(to: self)
        }
    }
}
