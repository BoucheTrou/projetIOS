//
//  checker.swift
//  test
//
//  Created by etudiant on 31/01/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

import Foundation
import UIKit

class Checker{
    private var descrip: String = " "
    private var color : UIColor?
    
    init (descrip: String, color : UIColor){
        self.descrip = descrip
        self.color = color
    }
    init (descrip: String){
        self.descrip = descrip
    }
    
    func setDescrip(descrip: String){
        self.descrip = descrip
    }
    func setColor(color : UIColor){
        self.color = color
    }
    func getColor() -> UIColor{
        return self.color!
    }
    
    func getDescrip() -> String{
        return self.descrip
    }
}
