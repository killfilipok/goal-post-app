//
//  UIViewControllerExt.swift
//  goal-post-app
//
//  Created by Philip on 3/21/19.
//  Copyright © 2019 Philip. All rights reserved.
//

import UIKit

extension UIViewController{
    
    func getTransition() -> CATransition {
        let transition = CATransition()
        
        transition.duration = 0.3
        
        transition.type = .push
        transition.subtype = .fromRight
        return transition
    }
    
    func presentDetail(_ viewControllerToPresent: UIViewController){
        let transition = getTransition()
        
        self.view.window?.layer.add(transition, forKey: kCATransition)
        
        present(viewControllerToPresent, animated: false, completion: nil)
    }
    
    func presentSecondary(_ viewControllerToPresend: UIViewController){
        let transition = getTransition()
        
        guard let presentedVC = presentedViewController else {return}
        
        presentedVC.dismiss(animated: false) {
            self.view.window?.layer.add(transition, forKey: kCATransition)
            self.present(viewControllerToPresend, animated: false, completion: nil)
        }
    }
    
    func dismissDetail(){
        let transition = getTransition()
        
        transition.subtype = .fromLeft
        
        self.view.window?.layer.add(transition, forKey: kCATransition)
        
        dismiss(animated: false, completion: nil)
    }
}

