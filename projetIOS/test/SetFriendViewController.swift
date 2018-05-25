//
//  SetFriendViewController.swift
//  test
//
//  Created by etudiant on 24/01/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

import UIKit

class SetFriendViewController: UIViewController {

    @IBOutlet weak var myIndicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()

        myIndicator.startAnimating()
        // Do any additional setup after loading the view.
        let thirdViewController = (self.storyboard?.instantiateViewController(withIdentifier: "ScoreBoardViewController"))! as UIViewController
        present(thirdViewController, animated: true, completion: nil)
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
