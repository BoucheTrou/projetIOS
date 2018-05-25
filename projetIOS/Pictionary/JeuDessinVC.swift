//
//  JeuDessinVC.swift
//  Pictionary
//
//  Created by Benjamin Trotin on 23/02/2017.
//  Copyright © 2017 Benjamin Trotin. All rights reserved.
//

import UIKit

class JeuDessinVC: UIViewController, UITextFieldDelegate {
    
    
    
    
    @IBOutlet weak var ImageTheme: UIImageView!
    @IBOutlet weak var Theme: UILabel!
    @IBOutlet weak var Suite: UIButton!
    @IBOutlet weak var Reponse: UILabel!
    @IBOutlet weak var Mot: UITextField!
    @IBOutlet weak var valueSlide: UISlider!
    @IBOutlet weak var btnEraser: UIButton!
    @IBOutlet weak var btnClear: UIButton!
    @IBOutlet weak var btnPen: UIButton!
    @IBOutlet weak var drawImage: UIImageView!
    @IBOutlet weak var labTimer: UILabel!
    var partie : Partie = Partie();
    var isDrawing : Bool!
    var isEraser : Bool!
    var finalPoint : CGPoint!
    var lineWidth : CGFloat = 4.0
    var red: CGFloat = 0.0
    var green: CGFloat = 0.0
    var blue: CGFloat = 0.0
    var opacity: CGFloat = 1.0
    var timer = Timer()
    var counter = 60
    var rep : String = ""
    var trouve : Bool = false
    enum Tools : String {
        case Brush, Eraser
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        isEraser = false
        drawImage.backgroundColor = UIColor.white
        labTimer.text = String(counter)
        timer = Timer.scheduledTimer(timeInterval: 1, target:self, selector: #selector(JeuDessinVC.updateCounter), userInfo: nil, repeats: true)
        Reponse.text! = rep
        ImageTheme.image = UIImage(named: "Theme".localized(lang: ViewController.lang))
        Theme.text = JeuPlateauVC.themeActuel
        print(JeuPlateauVC.themeActuel)
    }
    
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func clear(_ sender: Any) {
        self.drawImage.image = nil
    }
    
    @IBAction func erase(_ sender: Any) {
        red = 255.0
        green = 255.0
        blue = 255.0
        lineWidth = CGFloat(valueSlide.value) + 15.0
        isEraser = true
    }
    
    @IBAction func draw(_ sender: Any) {
        red = 0.0
        green = 0.0
        blue = 0.0
        lineWidth = CGFloat(valueSlide.value)
        isEraser = false
    }
    
    @IBAction func changelineWidth(_ sender: Any) {
        if(isEraser == true){
            lineWidth = CGFloat(valueSlide.value) + 1.0
            print("Eraser : ", lineWidth)
        }else{
            lineWidth = CGFloat(valueSlide.value)
            print("Pen : ", lineWidth)
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        isDrawing = false
        //self.view.endEditing(true)
        if let touch = touches.first{
            if #available(iOS 9.1, *) {
                finalPoint = touch.preciseLocation(in: drawImage)
            } else {
                // Fallback on earlier versions
                finalPoint = touch.location(in: drawImage)
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        isDrawing = true
        if let touch =  touches.first{
            var currentCoordinate = touch.location(in: drawImage)
            if #available(iOS 9.1, *) {
                currentCoordinate = touch.preciseLocation(in: drawImage)
            } else {
                // Fallback on earlier versions
                currentCoordinate = touch.location(in: drawImage)
            }
           
            UIGraphicsBeginImageContext(drawImage.frame.size)
            self.drawImage.image?.draw(in: CGRect(x: 0,y: 0,width: self.drawImage.frame.size.width, height: self.drawImage.frame.size.height))
            
            UIGraphicsGetCurrentContext()!.move(to: CGPoint(x: finalPoint.x, y: finalPoint.y))
            UIGraphicsGetCurrentContext()!.addLine(to: CGPoint(x: currentCoordinate.x, y: currentCoordinate.y))
            UIGraphicsGetCurrentContext()!.setLineCap(CGLineCap.round)
            UIGraphicsGetCurrentContext()!.setLineWidth(lineWidth)
            UIGraphicsGetCurrentContext()!.setStrokeColor(red: red, green: green, blue: blue, alpha: opacity)
            UIGraphicsGetCurrentContext()!.strokePath()
            
            self.drawImage.image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            finalPoint = currentCoordinate
            
        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if(!isDrawing){
            UIGraphicsBeginImageContext(drawImage.frame.size)
            self.drawImage.image?.draw(in: CGRect(x: 0,y: 0,width: self.drawImage.frame.size.width, height: self.drawImage.frame.size.height))
            
            UIGraphicsGetCurrentContext()!.move(to: CGPoint(x: finalPoint.x, y: finalPoint.y))
            UIGraphicsGetCurrentContext()!.addLine(to: CGPoint(x: finalPoint.x, y: finalPoint.y))
            UIGraphicsGetCurrentContext()!.setLineCap(CGLineCap.round)
            UIGraphicsGetCurrentContext()!.setLineWidth(lineWidth)
            UIGraphicsGetCurrentContext()!.setStrokeColor(red: red, green: green, blue: blue, alpha: opacity)
            UIGraphicsGetCurrentContext()!.strokePath()
            self.drawImage.image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
        }
    }
    
    
    func updateCounter() {
        
        if(counter == 0){
            labTimer.text = String(counter)
            btnPen.isEnabled = false
            btnEraser.isEnabled = false
            btnClear.isEnabled = false
            labTimer.text = "Time out!"
            labTimer.textColor = UIColor.red
            //labS.text = ""
            lineWidth = 0.0
            //anserField.isEnabled = false
            valueSlide.isEnabled = false
            Mot.isEnabled = false
            
            if(trouve){
                Suite.setImage(UIImage(named: "MotTrouve".localized(lang: ViewController.lang)), for: UIControlState.normal)
                Suite.isHidden = false
            }
            else{
                Suite.setImage(UIImage(named: "Rate".localized(lang: ViewController.lang)), for: UIControlState.normal)
                Suite.isHidden = false
                Reponse.isHidden = false
            }
            
        }else if(counter <= 10 && counter != 0){
            counter = counter-1
            labTimer.text = String(counter)
            labTimer.textColor = UIColor.red
        }
        else{
            counter = counter-1
            labTimer.text = String(counter)
            
        }
    }
   
    
    @IBAction func ReponseJoueur(_ sender: Any) {
        var repJoueur = Mot.text!
        repJoueur = repJoueur.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        repJoueur = repJoueur.lowercased()
        repJoueur.formater()
        rep = rep.lowercased()
        rep.formater()
        if repJoueur == rep{
            trouve = true
            counter = 0
            updateCounter()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "seguePlateau"){
            if let destViewController = segue.destination as? JeuPlateauVC {
                destViewController.partie = self.partie;
                if(!trouve){
                    destViewController.passerAuSuivant = true;
                    destViewController.trouve = trouve
                }
                else{
                    destViewController.passerAuSuivant = false;
                    destViewController.trouve = trouve
                }
                
            }
        }
    }
    
    
}
