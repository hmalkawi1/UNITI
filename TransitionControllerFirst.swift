//
//  TransitionControllerFirst.swift
//  NewDraft1
//
//  Created by Joe Xu on 3/18/17.
//  Copyright © 2017 UNITI. All rights reserved.
//

import UIKit

class TransitionControllerFirst: NSObject, UIViewControllerAnimatedTransitioning {
    
    let duration = 1.0;
    let oresenting = true;
    let originFrame = CGRect.zero;
    

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        
        return duration;
    }
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let containerView = transitionContext.containerView;
        
        let toView = transitionContext.view(forKey: .to);
        
        containerView.addSubview(toView!);
        toView?.alpha = 0.0;
        UIView.animate(withDuration: duration, animations: {
            
            toView?.alpha = 1.0;
            
            }, completion: { _ in
                transitionContext.completeTransition(true);
        })
        
        
        
    }
    
    
    
}
