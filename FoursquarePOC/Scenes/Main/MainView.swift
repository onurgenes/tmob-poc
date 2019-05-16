//
//  MainView.swift
//  FoursquarePOC
//
//  Created by Onur Geneş on 15.05.2019.
//  Copyright © 2019 Onur Geneş. All rights reserved.
//

import UIKit
import TinyConstraints

final class MainView: UIView {
    
    lazy var typeTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Cafe, Bar etc."
        tf.textAlignment = .center
        tf.borderStyle = .roundedRect
        return tf
    }()
    
    lazy var locationNameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter Location Name"
        tf.textAlignment = .center
        tf.borderStyle = .roundedRect
        return tf
    }()
    
    // 73, 51, 198
    lazy var searchButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Search", for: .normal)
        btn.backgroundColor = UIColor(red: 0.29, green: 0.20, blue: 0.78, alpha: 1)
        btn.layer.cornerRadius = 8
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()
    
    convenience init() {
        self.init(frame: .zero)
        
        backgroundColor = UIColor(white: 0.9, alpha: 1)
        
        // Using ''TinyConstraints''. I am a contributer of this project. Also it simplifies AutoLayout code.
        addSubview(typeTextField)
        addSubview(locationNameTextField)
        addSubview(searchButton)
        
        locationNameTextField.centerYToSuperview()
        locationNameTextField.height(50)
        
        typeTextField.bottomToTop(of: locationNameTextField, offset: -20)
        typeTextField.height(50)
        
        searchButton.topToBottom(of: locationNameTextField, offset: 20)
        searchButton.height(44)
        
        if #available(iOS 11.0, *) {
            locationNameTextField.leading(to: safeAreaLayoutGuide, offset: 20)
            locationNameTextField.trailing(to: safeAreaLayoutGuide, offset: -20)
            
            typeTextField.leading(to: safeAreaLayoutGuide, offset: 20)
            typeTextField.trailing(to: safeAreaLayoutGuide, offset: -20)
            
            searchButton.leading(to: safeAreaLayoutGuide, offset: 20)
            searchButton.trailing(to: safeAreaLayoutGuide, offset: -20)
        } else {
            locationNameTextField.leading(to: self)
            locationNameTextField.trailing(to: self)
            
            typeTextField.leading(to: self)
            typeTextField.trailing(to: self)
            
            searchButton.leading(to: self)
            searchButton.trailing(to: self)
        }
        
    }
}
