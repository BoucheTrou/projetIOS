//
//  StringExtension.swift
//  Pictionary
//
//  Created by Benjamin Trotin on 22/02/2017.
//  Copyright © 2017 Benjamin Trotin. All rights reserved.
//

import Foundation

extension String {
    
    func localized(lang:String) -> String {
        let path = Bundle.main.path(forResource: lang, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")

    }
    
    mutating func formater() {
        self = self.replacingOccurrences(of: "é", with: "e")
        self = self.replacingOccurrences(of: "è", with: "e")
        self = self.replacingOccurrences(of: "ê", with: "e")
        self = self.replacingOccurrences(of: "ë", with: "e")
        self = self.replacingOccurrences(of: "à", with: "a")
        self = self.replacingOccurrences(of: "â", with: "a")
        self = self.replacingOccurrences(of: "ä", with: "a")
        self = self.replacingOccurrences(of: "î", with: "i")
        self = self.replacingOccurrences(of: "ï", with: "i")
        self = self.replacingOccurrences(of: "ô", with: "o")
        self = self.replacingOccurrences(of: "ö", with: "o")
        self = self.replacingOccurrences(of: "û", with: "u")
        self = self.replacingOccurrences(of: "ù", with: "u")
        self = self.replacingOccurrences(of: "ü", with: "u")
    }
    
}
