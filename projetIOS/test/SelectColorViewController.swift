//
//  SelectColorViewController.swift
//  test
//
//  Created by JiayuanXIONG on 17/1/18.
//  Copyright © 2017年 etudiant. All rights reserved.
//

import UIKit

class SelectColorViewController: UIViewController {

    @IBOutlet weak var start: UIButton!
    @IBOutlet weak var Color1: UIButton!
    @IBOutlet weak var Color2: UIButton!
    @IBOutlet weak var Color3: UIButton!
    @IBOutlet weak var Color4: UIButton!
    var s1: Sequence!

   
    @IBAction func c1(_ sender: UIButton) {
        s1.Change(index: 0, btn: start)
    }
    @IBAction func c2(_ sender: UIButton) {
        s1.Change(index: 1, btn: start)
    }
    @IBAction func c3(_ sender: UIButton) {
        s1.Change(index: 2, btn: start)
    }
    @IBAction func c4(_ sender: UIButton) {
        s1.Change(index: 3, btn: start)
    }
    
    
    @IBAction func StartButton(_ sender: UIButton) {
        let p = Player(hisRoom: Room(nameRoom: " ", nbTryMax: 1, user1: User(surname: "warmcy", firstName: "Cylia", lastName: "Harbane", address: "21 rue andré maginot", mail: "hcylia@hotmail.fr", phone: "0781450729")), user: User(surname: "warmcy", firstName: "Cylia", lastName: "Harbane", address: "21 rue andré maginot", mail: "hcylia@hotmail.fr", phone: "0781450729"))
        p.setCreatedSequence(createdSequence: s1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        start.isEnabled = false
        let tab1 = [Color1!, Color2!, Color3!, Color4!]
         s1 = Sequence(tabButton: tab1)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
