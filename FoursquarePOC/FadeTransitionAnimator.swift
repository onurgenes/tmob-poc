//
//  FadeTransitionAnimator.swift
//  FoursquarePOC
//
//  Created by Onur Geneş on 16.05.2019.
//  Copyright © 2019 Onur Geneş. All rights reserved.
//

import UIKit

class FadeAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    private let presenting: Bool
    
    init(presenting: Bool) {
        self.presenting = presenting
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toVC = transitionContext.viewController(forKey: .to) as? DetailVC else { return }
        
        transitionContext.containerView.backgroundColor = .clear
        transitionContext.containerView.addSubview(toVC.view)
        
        toVC.view.frame = UIScreen.main.bounds
        
        toVC.view.alpha = 0
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            toVC.view.alpha = 1
        }) { (_) in
            transitionContext.completeTransition(true)
        }
    }
}
