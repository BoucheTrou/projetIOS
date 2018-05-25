//
//  ViewInscription.swift
//  projetIOS
//
//  Created by Haoxuan DONG on 27/03/2017.
//  Copyright © 2017 Haoxuan DONG. All rights reserved.
//


import UIKit

class ViewInscription: UIViewController {
    
    @IBOutlet weak var pseudo: UITextField!
    @IBOutlet weak var mdp: UITextField!
    @IBOutlet weak var confirmation: UITextField!
    @IBOutlet weak var nom: UITextField!
    @IBOutlet weak var prenom: UITextField!
    @IBOutlet weak var mail: UITextField!
    
        override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func inscription(_ sender: Any) {
        let pseudo:NSString = self.pseudo.text! as NSString
        let motDePasse:NSString = self.mdp.text! as NSString
        let nom:NSString = self.nom.text! as NSString
        let prenom:NSString = self.prenom.text! as NSString
        let mail:NSString = self.mail.text! as NSString
        let confirmation:NSString = self.confirmation.text! as NSString
        
        
        let post:NSString = "pseudo=\(pseudo)&mdp=\(motDePasse)&confirmation=\(confirmation)&nom=\(nom)&prenom=\(prenom)&mail=\(mail)" as NSString
        
        NSLog("PostData: %@",post);
        
        let url:URL = URL(string:"https://webdev.iut-orsay.fr/iosproject/connexion/inscription.php")!
        
        let postData:Data? = post.data(using: String.Encoding.ascii.rawValue)
        
        let postLength:NSString? = String(describing: postData?.count ) as NSString
        
        let request:NSMutableURLRequest = NSMutableURLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = postData
        request.setValue(postLength as! String, forHTTPHeaderField: "Content-Length")
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
                let responseData:NSString  = NSString(data:urlData!, encoding:String.Encoding.utf8.rawValue)!
                
                NSLog("Response ==> %@", responseData);
                
                //   var error: NSError?
                
                var jsonData:NSDictionary = NSDictionary()
                do {
                    jsonData = try JSONSerialization.jsonObject(with: urlData!,options:JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                }catch {  // handle error
                    
                }
                
                
                let id:Int = Int(jsonData.value(forKey: "id") as! String)!
                
                
                if(id > 0){
                    
                    let alertView:UIAlertView = UIAlertView()
                    alertView.title = "Inscription réussi"
                    alertView.delegate = self
                    alertView.addButton(withTitle: "OK")
                    alertView.show()
                    
                    
                }else if (id == -1){
                    
                    let alertView:UIAlertView = UIAlertView()
                    alertView.title = "Inscription échoué"
                    alertView.message = "Pseudo déjà existant"
                    alertView.delegate = self
                    alertView.addButton(withTitle: "OK")
                    alertView.show()
                    
                }else if (id == -2){
                    let alertView:UIAlertView = UIAlertView()
                    alertView.title = "Inscription échoué"
                    alertView.message = "Mot de passe différent"
                    alertView.delegate = self
                    alertView.addButton(withTitle: "OK")
                    alertView.show()
                    
                }else {
                    let alertView:UIAlertView = UIAlertView()
                    alertView.title = "Inscription échoué"
                    alertView.message = "Pseudo déjà existant"
                    alertView.delegate = self
                    alertView.addButton(withTitle: "OK")
                    alertView.show()
                    
                }
                
            } else {
                
                let alertView:UIAlertView = UIAlertView()
                alertView.title = "Erreur"
                alertView.message = "Contacter le support"
                alertView.delegate = self
                alertView.addButton(withTitle: "OK")
                alertView.show()
            }
        } else {
            
            let alertView:UIAlertView = UIAlertView()
            alertView.title = "Erreur"
            alertView.message = "Veuillez vous connecter à internet"
            alertView.delegate = self
            alertView.addButton(withTitle: "OK")
            alertView.show()
            
        }
        
    }//fin du SI champs vides
}
