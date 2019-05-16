//
//  DetailVC.swift
//  FoursquarePOC
//
//  Created by Onur Geneş on 15.05.2019.
//  Copyright © 2019 Onur Geneş. All rights reserved.
//

import UIKit

class DetailVC: BaseVC<DetailVM, DetailView, DetailCoordinator> {
    
    convenience init() {
        self.init(nibName:nil, bundle:nil)
        
        modalPresentationStyle = .overFullScreen
        transitioningDelegate = self
    }
    
    // for image download: prefix + "500x300" + suffix
    override func viewDidLoad() {
        super.viewDidLoad()
        
        baseView.effectView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissDetail)))
    }
    
    @objc func dismissDetail() {
        dismiss(animated: true, completion: nil)
    }
}

extension DetailVC: DetailVMOutputProtocol {
    
}

extension DetailVC: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return FadeAnimationController(presenting: true)
    }
}
