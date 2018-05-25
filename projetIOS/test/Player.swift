//
//  Player.swift
//  test
//
//  Created by etudiant on 31/01/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

import Foundation
class Player {
    private var user : User
    private var win : Bool = false
    private var nbTry : Int = 0
    private var time : Int = 0
    private var score : Int = 0
    private var hisRoom :  Room
    private var createdSequence : Sequence? //La séquence qu'il a décider de faire deviner à son ami
    
    init (hisRoom : Room, user : User){
        self.hisRoom = hisRoom
        self.user = user
        self.win = false
        self.nbTry = 0
        self.time = 0
        self.score = 0
    }
    
    //Incrementer le nombre d'essai du joueur
    func incrementNbTry(){
        self.nbTry+=1
    }
    
    //Getter and Setter
    func setWin(win : Bool){
        self.win = win
    }
    func setTime(time : Int){
        self.time=time
    }
    func setCreatedSequence(createdSequence : Sequence){
        self.createdSequence = createdSequence
    }
    func getScore () -> Int{
        return score
    }
    func computingScore(){
        if(win){
            score = 500+nbTry*(-50)+500
        }
        else{
            score = 500+nbTry*(-50)
        }
    }
    func getCreatedSequence() ->Sequence{
        return self.createdSequence!
    }
    func getNbTry() -> Int {
        return self.nbTry
    }
    func setNbTry(nbTry : Int){
        self.nbTry = nbTry
    }
    
}
