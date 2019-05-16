//
//  SplashView.swift
//  FoursquarePOC
//
//  Created by Onur Geneş on 15.05.2019.
//  Copyright © 2019 Onur Geneş. All rights reserved.
//

import UIKit

final class SplashView: UIView {
    
    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.backgroundColor = .red
        return iv
    }()
    
    convenience init() {
        self.init(frame: .zero)
        
        backgroundColor = .white
        
        addSubview(imageView)
        
        imageView.fillSuperView()
        
    }
}
