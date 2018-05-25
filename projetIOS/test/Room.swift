//
//  Room.swift
//  test
//
//  Created by etudiant on 31/01/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

import Foundation
class Room{
    private var nameRoom : String = " "
    private var nbTryMax : Int = 0
    private var user1 : User
    private var user2 : User?
    private var pwd : String?
    private var busy : Bool = false
    
    //Constructeur pour l'utilisateur qui invite un ami
    init (nameRoom : String, nbTryMax : Int, user1 : User, pwd : String){
        self.nameRoom = nameRoom
        self.nbTryMax = nbTryMax
        self.user1 = user1
        self.pwd = pwd
        self.busy = false
    }
    //Constructeur pour l'utilisateur qui attend qu'un utilisateur quelconque rejoigne la partie
    init (nameRoom : String, nbTryMax : Int, user1 : User){
        self.nameRoom = nameRoom
        self.nbTryMax = nbTryMax
        self.user1 = user1
        self.busy=false
    }
    
    
    //Retourne vrai si la partie n'est pas privée/ protégée par un mdp
    //A utiliser pour afficher un vérou devant chaque salon pour informer l'utilisateur du type de salon
    func free() -> Bool {
        return pwd == nil
    }
    //Getters and Setters
    //A utiliser quand l'utilisateur rejoins la partie
    func setUser2(user2: User){
        
        self.user2 = user2
        self.busy=true
    }
    
    func getBusy() -> Bool{
        return self.busy
    }
    
    func getNbTryMax() -> Int{
        return self.nbTryMax
    }
}
