//
//  User.swift
//  test
//
//  Created by etudiant on 31/01/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

import Foundation
class User {
    private var surname : String = " "
    private var firstName : String = " "
    private var lastName : String = " "
    private var address : String = " "
    private var mail : String = " "
    private var phone : String = " "
    
    init (surname : String, firstName : String, lastName : String, address : String, mail : String, phone : String){
        self.surname = surname
        self.firstName = firstName
        self.lastName = lastName
        self.address = address
        self.mail = mail
        self.phone = phone
    }
}
