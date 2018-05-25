//
//  NavigationControllerExtension.swift
//  projetIOS
//
//  Created by Benjamin Trotin on 30/03/2017.
//  Copyright © 2017 Lilian Bellini. All rights reserved.
//

import Foundation

extension UIViewController {
    public override func shouldAutorotate() -> Bool {
        return true
    }
    
    public override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return (visibleViewController?.supportedInterfaceOrientations())!
    }
}
