//
//  ViewController.swift
//  projetIOS
//
//  Created by Haoxuan DONG on 27/03/2017.
//  Copyright © 2017 Haoxuan DONG. All rights reserved.
//

import UIKit

class GameChoiceViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func masterMindGame(_ sender: Any) {
        let storyboard = UIStoryboard(name:"Mastermind", bundle:nil)
        let controller = storyboard.instantiateInitialViewController()! as UIViewController
        self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction func mountainHuntGame(_ sender: Any) {
        let storyboard = UIStoryboard(name:"MH", bundle:nil)
        let controller = storyboard.instantiateInitialViewController()! as UIViewController
        self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction func pictionaryGame(_ sender: Any) {
        let storyboard = UIStoryboard(name:"Pictionary", bundle:nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "PictionaryVC") as UIViewController
        controller.setValue(1, forKey: "test")
        self.present(controller, animated: true, completion: nil)
    }
    @IBAction func connectFourGame(_ sender: Any) {
        let storyboard = UIStoryboard(name:"ConnectFour", bundle:nil)
        let controller = storyboard.instantiateInitialViewController()! as UIViewController
        self.present(controller, animated: true, completion: nil)
    }
    
}
