//
//  UIView+Activate.swift
//  FoursquarePOC
//
//  Created by Onur Geneş on 16.05.2019.
//  Copyright © 2019 Onur Geneş. All rights reserved.
//

import UIKit

extension UIView {
    func activate(constraints: NSLayoutConstraint...) {
        for constraint in constraints {
            constraint.isActive = true
        }
    }
    
    func fillSuperView() {
        guard let superview = superview else { return }
        self.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            activate(constraints: self.topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor),
                     self.leadingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.leadingAnchor),
                     self.trailingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.trailingAnchor),
                     self.bottomAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.bottomAnchor))
        } else {
            activate(constraints: self.topAnchor.constraint(equalTo: superview.topAnchor),
                     self.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
                     self.trailingAnchor.constraint(equalTo: superview.trailingAnchor),
                     self.bottomAnchor.constraint(equalTo: superview.bottomAnchor))
        }
    }
}
