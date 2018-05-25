//
//  GameViewController.swift
//  FlappyBird
//
//  Created by Nate Murray on 6/2/14.
//  Copyright (c) 2014 Fullstack.io. All rights reserved.
//

import UIKit
import SpriteKit

@available(iOS 9.0, *)



class MHPlayViewController: UIViewController {
    
    var colorPerso = Int()
    
        override func viewDidLoad() {
        super.viewDidLoad()
        let scene = MHJeu(size:CGSize(width: 2048, height: 1536))
        let skView = self.view as! SKView
        skView.showsFPS = false
        skView.showsNodeCount = false
        skView.showsPhysics = false
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .aspectFill
        scene.viewController = self
        
        skView.presentScene(scene)
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

}
