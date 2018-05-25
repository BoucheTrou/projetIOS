//
//  LoadingViewController.swift
//  test
//
//  Created by JiayuanXIONG on 17/1/18.
//  Copyright © 2017年 etudiant. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {

    @IBOutlet weak var LoadLabel: UILabel!
    @IBOutlet weak var LoadIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var myTimer: UILabel!
    var seconds = 0
    var timer = Timer()
    var timerIsOn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        LoadIndicator.startAnimating()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(LoadingViewController.updateTimer)), userInfo: nil, repeats: true)
        //transition(from: self, to: MainGameViewController, duration: 5, animations: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
        
        let secondViewController = (self.storyboard?.instantiateViewController(withIdentifier: "SelectColorViewController"))! as UIViewController
        present(secondViewController, animated: true, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func updateTimer(){
        seconds = seconds+1
        myTimer.text = "\(seconds)"
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
