//
//  SettingsViewController.swift
//  Mountain Hunt
//
//  Created by Haoxuan DONG on 23/02/2017.
//  Copyright © 2017 Haoxuan DONG. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import AVFoundation


class MHHighscoreViewController: UIViewController {
    @IBOutlet weak var score: UILabel!
    
    var tabScore : [Int] = []
    var personne = String()
    var scoreX = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let info = sortirScore(jeu: "scoreMontain")
        
        let premierePersonne = info.value(forKey: "joueur0") as! String
        let premierScore = info.value(forKey: "score0")as! String
        print(premierePersonne)
        score.text = premierScore
 
        //personne = info.value(forKey: "joueur") as! String
    }
    
    func sortirScore(jeu:NSString)->NSDictionary{
        
        var jsonData:NSDictionary = NSDictionary()
        //// ELEMENT A MODIFIER
        let post:NSString = "jeu=\(jeu)" as NSString
        
        //// FIN D ELEMENT A MODIFIER
        
        NSLog("PostData: %@",post);
        
        let url:URL = URL(string:"https://webdev.iut-orsay.fr/iosproject/score/sortirScore.php")!
        
        let postData:Data = post.data(using: String.Encoding.ascii.rawValue)!
        
        let postLength:NSString = String( postData.count ) as NSString
        
        let request:NSMutableURLRequest = NSMutableURLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = postData
        request.setValue(postLength as String, forHTTPHeaderField: "Content-Length")
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        var response: URLResponse?
        
        var urlData: Data?
        do {
            urlData = try NSURLConnection.sendSynchronousRequest(request as URLRequest, returning:&response)
        } catch _ as NSError {
            urlData = nil
        } catch {
            fatalError()
        }
        
        if ( urlData != nil ) {
            let res = response as! HTTPURLResponse!;
            if ((res?.statusCode)! >= 200 && (res?.statusCode)! < 300)
            {
                let responseData:NSString  = NSString(data:urlData!, encoding:String.Encoding.utf8.rawValue)!
                
                NSLog("Response ==> %@", responseData);
                do {
                    jsonData = try JSONSerialization.jsonObject(with: urlData!,options:JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                }catch {
                    print ("erreur création dictionnaire")
                }
            }
        }
        
        return jsonData
    }
}
