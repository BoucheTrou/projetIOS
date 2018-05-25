//
//  JoinOthersViewController.swift
//  test
//
//  Created by etudiant on 18/01/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

import UIKit

class JoinOthersViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myList: UILabel!

    @IBOutlet weak var myPicker: UIPickerView!
    var colors = ["Salon1", "Salon2", "Salon3", "Salon4" , "Salon5" , "Salon6"];
    override func viewDidLoad() {
        super.viewDidLoad()

        myPicker.delegate = self
        myPicker.dataSource = self
    
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colors.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colors[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
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
