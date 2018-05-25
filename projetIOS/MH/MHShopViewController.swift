//
//  SettingsViewController.swift
//  Mountain Hunt
//
//  Created by Haoxuan DONG on 23/02/2017.
//  Copyright © 2017 Haoxuan DONG. All rights reserved.
//

import UIKit
var colorPerso = Int()
let variable:UserDefaults = UserDefaults.standard

class MHShopViewController: UIViewController {
    @IBOutlet weak var imagePersonnage: UIImageView!
    @IBOutlet weak var segmentedColor: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switch(segmentedColor.selectedSegmentIndex){
        case 0 :
            let image = UIImage(named: "MHred1")
            imagePersonnage.image = image
            break;
        case 1 :
            let image = UIImage(named: "MHperso1")
            imagePersonnage.image = image
            break;
        case 2 :
            let image = UIImage(named: "MHwhite1")
            imagePersonnage.image = image
            break;
        default :
            self.view.backgroundColor = UIColor.black
        }

    }
    
    @IBAction func ColorSelection(_ sender: Any) {
        switch(segmentedColor.selectedSegmentIndex){
        case 0 :
            let image = UIImage(named: "MHred1")
            imagePersonnage.image = image
            break;
        case 1 :
            let image = UIImage(named: "MHperso1")
            imagePersonnage.image = image
            break;
        case 2 :
            let image = UIImage(named: "MHwhite1")
            imagePersonnage.image = image
            break;
        default :
            self.view.backgroundColor = UIColor.black
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "MHSegueBackColor"{
            let toViewController = segue.destination as! MHGameViewController
            toViewController.colorChar = segmentedColor.selectedSegmentIndex
            print(toViewController.colorChar)
            variable.set(segmentedColor.selectedSegmentIndex, forKey :"color")

        }
    }
}
