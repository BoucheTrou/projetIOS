//
//  AffichageMotVC.swift
//  Pictionary
//
//  Created by Benjamin Trotin on 23/02/2017.
//  Copyright © 2017 Benjamin Trotin. All rights reserved.
//

import UIKit

class AffichageMotVC: UIViewController {

    @IBOutlet weak var texte: UILabel!
    @IBOutlet weak var Ecran: UIButton!
    @IBOutlet weak var Mot: UILabel!
    @IBOutlet weak var suivant: UIButton!
    var partie : Partie = Partie();
    var appuie : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Mot.text = carte2(couleur: partie.quiJoue(ordre: JeuPlateauVC.ordre).getCaseActuelle()%5, langueFr: ViewController.lang)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    
    func carte2(couleur: Int, langueFr: String) -> String{
        let testCouleur = (couleur == 0) ? 5 : couleur;
        var carte : String = ""
        
        //// ELEMENT A MODIFIER
        var post:NSString
        
            post = "couleur=\(testCouleur)&langue=\(langueFr)" as NSString
        
        
        //// FIN D ELEMENT A MODIFIER
        
        NSLog("PostData: %@",post);
        
        let url:URL = URL(string:"https://webdev.iut-orsay.fr/iosproject/jeu/carte.php")!
        
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
                
                //// Recupération des donnée si donnée à récuperer
                
                //// donnée stocker dans une bibliothèque nommé jsonData, on récupère les donnée avec la forkey du JSON
                //// JSON exemple sur PHP : echo "{\"erreur\":\"".$erreur."\", \"id\":\"".$id."\"}";
                //// forme à afficher {"erreur" : "0" , "id" : "3"}
                
                //let success:Int = Int(jsonData.value(forKey: "erreur") as! String)!
                //NSLog("Success: %ld", success);
                
                if (responseData == "" || responseData == nil){
                    carte = carte2(couleur: couleur, langueFr: langueFr)
                }else{
                    carte = jsonData.value(forKey:"carte") as! String
                }
                
                
                ///// Fin de la "transaction"
                
                
            }
        }
        
        return carte
    }
    
    @IBAction func ToucherEcran(_ sender: Any) {
        if(self.appuie == 0){
            Mot.isHidden = false
            texte.text = "Veuillez passer l'Ipad au dessinateur Pour cacher le mot rappuyer sur l'écran"
            suivant.isHidden = false
        }
        else{
            if(appuie%2 == 0){
                Mot.isHidden = false
                texte.text = "Veuillez passer l'Ipad au dessinateur Pour cacher le mot rappuyer sur l'écran"
                suivant.isEnabled = false
            }
            else{
                Mot.isHidden = true
                texte.text = "Veuillez passer l'Ipad au dessinateur Pour afficher le mot appuyer sur l'écran"
                suivant.isEnabled = true
            }
        }
        
        appuie += 1
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "segueDessin"){
            if let destViewController = segue.destination as? JeuDessinVC {
                destViewController.partie = self.partie;
                destViewController.rep = self.Mot.text!
            }
            
        }
    }
    


}
