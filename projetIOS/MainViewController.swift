//
//  MainViewController.swift
//  projetIOS
//
//  Created by Haoxuan DONG on 27/03/2017.
//  Copyright © 2017 Haoxuan DONG. All rights reserved.
//
var idGlobal:Int = Int()

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var connexionPseudo: UITextField!
    
    
    @IBOutlet weak var connexionMdp: UITextField!
    
    
    @IBAction func connexion(_ sender: Any) {
        let pseudo = connexionPseudo.text
        let mdp = connexionMdp.text
        idGlobal =  connect(pseudo: pseudo as! NSString, motDePasse : mdp as! NSString)
        if (idGlobal > 0){
            self.performSegue(withIdentifier: "connexion", sender: self)
        }

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if (idGlobal > 0){
            self.performSegue(withIdentifier: "connexion", sender: self)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func connect(pseudo: NSString, motDePasse:NSString) -> Int{
        var id:Int = -9
        
        var post:NSString
        
        post = "pseudo=\(pseudo)&mdp=\(motDePasse)" as NSString
        
        
        //// FIN D ELEMENT A MODIFIER
        
        NSLog("PostData: %@",post);
        
        let url:URL = URL(string:"https://webdev.iut-orsay.fr/iosproject/connexion/connexion.php")!
        
        let postData:Data = post.data(using: String.Encoding.ascii.rawValue)!
        
        let postLength:NSString = String(postData.count) as NSString
        
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
            
            //NSLog("Response code: %ld", res?.statusCode);
            
            if ((res?.statusCode)! >= 200 && (res?.statusCode)! < 300)
            {
                let responseData:NSString?  = NSString(data:urlData!, encoding:String.Encoding.utf8.rawValue)
                
                NSLog("Response ==> %@", responseData ?? "");
                
                //   var error: NSError?
                
                var jsonData:NSDictionary = NSDictionary()
                do {
                    jsonData = try JSONSerialization.jsonObject(with: urlData!,options:JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                }catch {  // handle error
                    
                }
                
                if (responseData == "" || responseData == nil){
                    id = connect(pseudo: pseudo, motDePasse : motDePasse)
                }else{
                    
                    id = Int(jsonData.value(forKey: "id") as! String)!
                    
                }
                if (id == -1){
                    let alertView:UIAlertView = UIAlertView()
                    alertView.title = "Erreur"
                    alertView.message = "Mot de passe incorrect"
                    alertView.delegate = self
                    alertView.addButton(withTitle: "OK")
                    alertView.show()
                }else if (id == -2){
                    let alertView:UIAlertView = UIAlertView()
                    alertView.title = "Erreur"
                    alertView.message = "Identifiant incorrect"
                    alertView.delegate = self
                    alertView.addButton(withTitle: "OK")
                    alertView.show()
                }
            }
        }
        return id
    }


}

