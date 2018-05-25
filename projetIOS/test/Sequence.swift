//
//  Sequence.swift
//  test
//
//  Created by etudiant on 31/01/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

import Foundation
import UIKit

class Sequence {
    
    let tab = ["blue", "brown" , "red" , "green" , "gray", "yellow" , "purple" , "orange"]
    let tabB = ["MM_blueBall.png","MM_brownBall.png", "MM_redBall.png", "MM_greenBall.png", "MM_blackBall.png", "MM_yellowBall.png", "MM_purpleBall.png", "MM_orangeBall.png"]
    var x = -1
    var y = -1
    var u = -1
    var v = -1
    
    
    private var nbColor : Int = 4
    private var tabButton : [UIButton] = []
    private var tabCouleur : [String] = [" "," "," "," "]
    
    init (tabButton : [UIButton]){
        self.nbColor = tabButton.count
        self.tabButton = tabButton
        
    }
    func getColor(index : Int)-> String{
        return tabCouleur[index]
    }
    func getNbColor()->Int{
        return self.nbColor
    }
    
    func verifySequence(hisPlayer : Player, checker : [UIImageView]) -> Bool{
        var nbIm = 0
        var change = false
        var change2 = false
        var btn1 = false
        var btn2 = false
        var btn3 = false
        var btn4 = false
        var tab = [false,false,false,false]
        for selfColor in 0...self.nbColor-1{
            change2 = false
            for cColor in 0...hisPlayer.getCreatedSequence().getNbColor()-1{
                change = false
                if(self.getColor(index: selfColor)==hisPlayer.getCreatedSequence().getColor(index: cColor) && selfColor==cColor){
                    if(!change && cColor == 0 && !change2 ){
                        checker[nbIm].image = UIImage(named: "MM_whiteDot.png")
                        nbIm += 1
                        btn1 = true
                        change = true
                        change2 = true
                        tab[selfColor] = true
                    }
                    else if(!change && cColor == 1 && !change2  ){
                        checker[nbIm].image = UIImage(named: "MM_whiteDot.png")
                        nbIm += 1
                        btn2 = true
                        change = true
                        change2 = true
                        tab[selfColor] = true
                    }
                    else if(!change && cColor == 2 && !change2){
                        checker[nbIm].image = UIImage(named: "MM_whiteDot.png")
                        nbIm += 1
                        btn3 = true
                        change = true
                        change2 = true
                        tab[selfColor] = true
                    }
                    else if(!change && cColor == 3 && !change2){
                        checker[nbIm].image = UIImage(named: "MM_whiteDot.png")
                        nbIm += 1
                        btn4 = true
                        change = true
                        change2 = true
                        tab[selfColor] = true
                    }
                }
            }
        }
        for selfColor in 0...self.nbColor-1{
            change2 = false
            for cColor in 0...hisPlayer.getCreatedSequence().getNbColor()-1{
                change = false
                if(self.getColor(index: selfColor)==hisPlayer.getCreatedSequence().getColor(index: cColor) && selfColor != cColor && !tab[selfColor]){
                    if (!change && !btn1 && cColor == 0 && !change2){
                        change = true
                        checker[nbIm].image = UIImage(named: "MM_blackDot.png")
                        nbIm += 1
                        change2 = true
                        tab[selfColor] = true
                        
                    }
                    else if (!change && !btn2 && cColor == 1 && !change2){
                        change = true
                        checker[nbIm].image = UIImage(named: "MM_blackDot.png")
                        nbIm += 1
                        change2 = true
                        tab[selfColor] = true
                    }
                    else if (!change && !btn3 && cColor == 2 && !change2){
                        change = true
                        checker[nbIm].image = UIImage(named: "MM_blackDot.png")
                        nbIm += 1
                        change2 = true
                        tab[selfColor] = true
                    }
                    else if (!change && !btn4 && cColor == 3 && !change2){
                        change = true
                        checker[nbIm].image = UIImage(named: "MM_blackDot.png")
                        nbIm += 1
                        change2 = true
                        tab[selfColor] = true
                    }
                }
            }
        }
        var end = true
        if(nbIm != 0){
            for v in 0 ... nbIm-1{
                if(checker[v].image == UIImage(named: "MM_blackDot.png")){
                    end = false
                }
            }
        }
        
        if( nbIm > self.getNbColor()-1){
            return(end)
        }
        else{
            return(false)
        }
    }
    
    func Change(index : Int, btn : UIButton) {
        var temp = -1;
        switch index {
        case 0:
            temp = x
            break
        case 1 :
            temp = y
            break
        case 2 :
            temp = u
            break
        case 3 :
            temp = v
            break
        default:
            temp = x
            break
        }
        
        
        if (temp <= tab.count-1){
            temp = temp+1
            if (temp > tab.count-1){
                temp = 0
            }
            tabButton[index].backgroundColor = UIColor.white.withAlphaComponent(0)
            tabButton[index].setBackgroundImage(UIImage(named : tabB[temp]), for: UIControlState.normal)
            tabCouleur[index] = tab[temp]
            
        }
        switch index {
        case 0:
            x = temp
            break
        case 1 :
            y = temp
            break
        case 2 :
            u = temp
            break
        case 3 :
            v = temp
            break
        default:
            x = temp
            break
        }
        
        if(x>=0 && y>=0 && u>=0 && v>=0){
            btn.isEnabled = true
        }
        else{
            btn.isEnabled = false
        }
        
        
        
    }
    
    
}
