//
//  ViewController.swift
//  test
//
//  Created by etudiant on 18/01/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

import UIKit

class MM_ViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func Exit(_ sender: Any) {
        let storyboard = UIStoryboard(name:"Main", bundle:nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "choiceGame") as UIViewController
        self.present(controller, animated: true, completion: nil)
    }
    
    
}

