
import UIKit
import AVFoundation

class ConnectFourViewController: UIViewController {

    @IBOutlet weak var laberPlayer1: UILabel!
    @IBOutlet weak var laberPlayer2: UILabel!
    @IBOutlet weak var Button00: UIButton!
    @IBOutlet weak var Button10: UIButton!
    @IBOutlet weak var Button20: UIButton!
    @IBOutlet weak var Button30: UIButton!
    @IBOutlet weak var Button40: UIButton!
    @IBOutlet weak var Button50: UIButton!
    
    @IBOutlet weak var Button01: UIButton!
    @IBOutlet weak var Button11: UIButton!
    @IBOutlet weak var Button21: UIButton!
    @IBOutlet weak var Button31: UIButton!
    @IBOutlet weak var Button41: UIButton!
    @IBOutlet weak var Button51: UIButton!
    
    @IBOutlet weak var Button02: UIButton!
    @IBOutlet weak var Button12: UIButton!
    @IBOutlet weak var Button22: UIButton!
    @IBOutlet weak var Button32: UIButton!
    @IBOutlet weak var Button42: UIButton!
    @IBOutlet weak var Button52: UIButton!
    
    @IBOutlet weak var Button03: UIButton!
    @IBOutlet weak var Button13: UIButton!
    @IBOutlet weak var Button23: UIButton!
    @IBOutlet weak var Button33: UIButton!
    @IBOutlet weak var Button43: UIButton!
    @IBOutlet weak var Button53: UIButton!

    @IBOutlet weak var Button04: UIButton!
    @IBOutlet weak var Button14: UIButton!
    @IBOutlet weak var Button24: UIButton!
    @IBOutlet weak var Button34: UIButton!
    @IBOutlet weak var Button44: UIButton!
    @IBOutlet weak var Button54: UIButton!
 
    @IBOutlet weak var Button05: UIButton!
    @IBOutlet weak var Button15: UIButton!
    @IBOutlet weak var Button25: UIButton!
    @IBOutlet weak var Button35: UIButton!
    @IBOutlet weak var Button45: UIButton!
    @IBOutlet weak var Button55: UIButton!

    @IBOutlet weak var Button06: UIButton!
    @IBOutlet weak var Button16: UIButton!
    @IBOutlet weak var Button26: UIButton!
    @IBOutlet weak var Button36: UIButton!
    @IBOutlet weak var Button46: UIButton!
    @IBOutlet weak var Button56: UIButton!

    /*var collon0 : NSMutableArray = [];
    var collon1 : NSMutableArray = [];
    var collon2 : NSMutableArray = [];
    var collon3 : NSMutableArray = [];
    var collon4 : NSMutableArray = [];
    var collon5 : NSMutableArray = [];
    var collon6 : NSMutableArray = [];*/
    var mesCase : NSMutableArray = [];
 
    @IBOutlet weak var OutletBackground: UIImageView!
    @IBOutlet weak var labelErreur: UILabel!
    @IBOutlet weak var burronEnd: UIButton!
    @IBOutlet weak var labelVS: UILabel!
    var lebackground : Int = 3
    var colorBouton : Int = 3
    var audioPlayer : AVAudioPlayer = AVAudioPlayer()
    var sound : Bool = true
    var player1 = true
    var nomJoueur1 : String = ""
    var nomJoueur2 : String = ""
    var egaliter : Bool? = nil
    var player1Gagne : Bool? = nil
    var winner : Int = 0
    var piece : Int = 0
    var message = [true,true,true,true,true,true]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mesCase.add(Button00)
        mesCase.add(Button10)
        mesCase.add(Button20)
        mesCase.add(Button30)
        mesCase.add(Button40)
        mesCase.add(Button50)
        
        mesCase.add(Button01)
        mesCase.add(Button11)
        mesCase.add(Button21)
        mesCase.add(Button31)
        mesCase.add(Button41)
        mesCase.add(Button51)
        
        mesCase.add(Button02)
        mesCase.add(Button12)
        mesCase.add(Button22)
        mesCase.add(Button32)
        mesCase.add(Button42)
        mesCase.add(Button52)
        
        mesCase.add(Button03)
        mesCase.add(Button13)
        mesCase.add(Button23)
        mesCase.add(Button33)
        mesCase.add(Button43)
        mesCase.add(Button53)
        
        mesCase.add(Button04)
        mesCase.add(Button14)
        mesCase.add(Button24)
        mesCase.add(Button34)
        mesCase.add(Button44)
        mesCase.add(Button54)
        
        mesCase.add(Button05)
        mesCase.add(Button15)
        mesCase.add(Button25)
        mesCase.add(Button35)
        mesCase.add(Button45)
        mesCase.add(Button55)
        
        mesCase.add(Button06)
        mesCase.add(Button16)
        mesCase.add(Button26)
        mesCase.add(Button36)
        mesCase.add(Button46)
        mesCase.add(Button56)
    
        /*mesCase.add(collon0)
        mesCase.add(collon1)
        mesCase.add(collon2)
        mesCase.add(collon3)
        mesCase.add(collon4)
        mesCase.add(collon5)
        mesCase.add(collon6)*/
        
        laberPlayer1.text=nomJoueur1
        laberPlayer2.text=nomJoueur2
        
        switch colorBouton{
        case 0:
            burronEnd.setBackgroundImage(UIImage(named: "CF_endBlack.png"), for: UIControlState.normal)
        case 1:
            burronEnd.setBackgroundImage(UIImage(named: "CF_BoutonEndGame.png"), for: UIControlState.normal)
        case 2:
            burronEnd.setBackgroundImage(UIImage(named: "CF_endBlue.png"), for: UIControlState.normal)
        case 3:
            burronEnd.setBackgroundImage(UIImage(named: "CF_end.png"), for: UIControlState.normal)
        default:
            break
        }
        switch lebackground {
        case 0:
            OutletBackground.image = UIImage(named: "CF_backgroundDark.PNG")
        case 1:
            OutletBackground.image = UIImage(named: "CF_backgroundLight.PNG")
        case 2:
            OutletBackground.image = UIImage(named: "CF_backgroundBlue.PNG")
        case 3:
            OutletBackground.image = UIImage(named: "CF_background.jpg")
        default:
            break
        }
        if (lebackground==0) {
            
            labelVS.textColor = UIColor.white
        }else{
            
            labelVS.textColor = UIColor.black
        }

        labelErreur.isHidden = true
        startAudio()
    }
    
    func startAudio() {
        if(audioPlayer.isPlaying){
            audioPlayer.stop()
        }
        var name : String = ""
        switch lebackground{
        case 0:
            name = "DarkThemeSong"
        case 1:
            name = "LightThemeSong"
        case 2:
            name = "NormalThemeSong"
        case 3:
            name = "NormalThemeSong"
        default:
            name = "NormalThemeSong"
        }
        let filePath = Bundle.main.path(forResource: name, ofType: "mp3")
        let fileURL = NSURL.fileURL(withPath: filePath!)
        do {
            audioPlayer = try AVAudioPlayer.init(contentsOf: fileURL, fileTypeHint: AVFileTypeMPEGLayer3)
            audioPlayer.numberOfLoops = -1
            if(sound){
                audioPlayer.volume = 1
            }
            else{
                audioPlayer.volume = 0
            }
        } catch {
            self.present(UIAlertController.init(title: "Error", message: "Error Message", preferredStyle: .alert), animated: true, completion: nil)
        }
        audioPlayer.play()
    }
    
    func  player()->String{
        if(player1){
            player1=false
            return "CF_pionJaune.gif"
        }else{
            player1=true
            return "CF_pionRouge.gif"
        }
    }
    
    func gagner(){
        //let casePrincipale: NSData = UIImagePNGRepresentation(((mesCase.object(at: colone*6 + ligne))as! UIButton).backgroundImage(for: UIControlState.normal)!)! as NSData
        //Change music depending on theme
        var vicPlayer : String = ""
        if (player() == "CF_pionRouge.gif"){
            winner = 1
            vicPlayer = "\(nomJoueur1) wins"
        }
        else{
            winner = 2
            vicPlayer = "\(nomJoueur2) wins"
        }
        let alert = UIAlertController(title: vicPlayer,
                                      message: "You won the game",
                                      preferredStyle: .alert)
        let returnPlayer = UIAlertAction(title: "Ok", style: .cancel, handler: {
            action in self.performSegue(withIdentifier: "segueGameToPlayer", sender: self)
        })
        alert.addAction(returnPlayer)
        self.present(alert, animated: true, completion: nil)
    }
    
    func testFin(nbPiece: Int){
        if(nbPiece == 7*6){
            //Draw music
            let alert = UIAlertController(title: "Draw",
                                          message: "You both failed",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok",
                                          style: .default){ action in
                                            self.performSegue(withIdentifier: "segueGameToPlayer", sender: self)
            })
            alert.popoverPresentationController?.sourceView = self.view
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func testGagner(ligne: Int, colone: Int){
        let casePrincipale: NSData = UIImagePNGRepresentation(((mesCase.object(at: colone*6 + ligne))as! UIButton).backgroundImage(for: UIControlState.normal)!)! as NSData
        var nbBas : Int = 0
        var nbDroit : Int = 0
        var nbGauche : Int = 0
        var nbDiagoHautDroit : Int = 0
        var nbDiagoHautGauche : Int = 0
        var nbDiagoBasDroit : Int = 0
        var nbDiagoBasGauche : Int = 0
        var tmpLigne : Int = 0
        var tmpColone : Int = 0
        var encoreJeton : Bool = true
        
        //nb en bas
        tmpLigne = ligne - 1
        //print("ligne : \(ligne)  colone :\(colone)")
        
        while(encoreJeton && tmpLigne >= 0){
            let dataTest: NSData = UIImagePNGRepresentation(((mesCase.object(at: colone*6 + tmpLigne))as! UIButton).backgroundImage(for: UIControlState.normal)!)! as NSData
            if(dataTest.isEqual(casePrincipale)){
                nbBas += 1
                tmpLigne -= 1
            }else{
                encoreJeton = false
            }
        }
        //print("nb jeton égal en bas \(nbBas)")
        if(nbBas >= 3){
            gagner()
        }else{
            // nb a droit
            encoreJeton = true
            tmpColone = colone + 1
            while(encoreJeton && tmpColone < 7 ){
                let dataTest: NSData = UIImagePNGRepresentation(((mesCase.object(at: tmpColone*6 + ligne))as! UIButton).backgroundImage(for:UIControlState.normal)!)! as NSData
                if(dataTest.isEqual(casePrincipale)){
                    nbDroit += 1
                    tmpColone += 1
                }else{
                    encoreJeton = false
                }
            }
            //print("nb jeton a droit \(nbDroit)")
            // nb a gauche
            encoreJeton = true
            tmpColone = colone - 1
            while(encoreJeton && tmpColone >= 0){
                let dataTest: NSData = UIImagePNGRepresentation(((mesCase.object(at: tmpColone*6 + ligne))as! UIButton).backgroundImage(for: UIControlState.normal)!)! as NSData
                if(dataTest.isEqual(casePrincipale)){
                    nbGauche += 1
                    tmpColone -= 1
                }else{
                    encoreJeton = false
                }
            }
            if(nbDroit+nbGauche >= 3){
                gagner()
            }else{
                // nb diagonal haut droit
                encoreJeton = true
                tmpColone = colone + 1
                tmpLigne = ligne + 1
                while(encoreJeton && tmpLigne < 6 && tmpColone < 7){
                    let dataTest: NSData = UIImagePNGRepresentation(((mesCase.object(at: tmpColone*6 + tmpLigne))as! UIButton).backgroundImage(for: UIControlState.normal)!)! as NSData
                    if(dataTest.isEqual(casePrincipale)){
                        nbDiagoHautDroit += 1
                        tmpColone += 1
                        tmpLigne += 1
                    }else{
                        encoreJeton = false
                    }
                }
                //print("nb jeton a diagonalHautdroit \(nbDiagoHautDroit)")
                
                // nb diagonal bas gauche
                encoreJeton = true
                tmpColone = colone - 1
                tmpLigne = ligne - 1
                while(encoreJeton && tmpLigne >= 0 && tmpColone >= 0 ){
                    let dataTest: NSData = UIImagePNGRepresentation(((mesCase.object(at: tmpColone*6 + tmpLigne))as! UIButton).backgroundImage(for: UIControlState.normal)!)! as NSData
                    if(dataTest.isEqual(casePrincipale)){
                        nbDiagoBasGauche += 1
                        tmpColone -= 1
                        tmpLigne -= 1
                    }else{
                        encoreJeton = false
                    }
                }
                //print("nb jeton a diagonal Bas gauche \(nbDiagoBasGauche)")
                
                if(nbDiagoBasGauche+nbDiagoHautDroit >= 3){
                    gagner()
                }else{
                    // nb diagonal haut gauche
                    encoreJeton = true
                    tmpColone = colone - 1
                    tmpLigne = ligne + 1
                    while(encoreJeton && tmpLigne < 6 && tmpColone >= 0){
                        let dataTest: NSData = UIImagePNGRepresentation(((mesCase.object(at: tmpColone*6 + tmpLigne))as! UIButton).backgroundImage(for: UIControlState.normal)!)! as NSData
                        if(dataTest.isEqual(casePrincipale)){
                            nbDiagoHautGauche += 1
                            tmpColone -= 1
                            tmpLigne += 1
                        }else{
                            encoreJeton = false
                        }
                    }
                    //print("nb jeton a diagonal Haut Gauche \(nbDiagoHautGauche)")
                    
                    // nb diagonal bas droit
                    encoreJeton = true
                    tmpColone = colone + 1
                    tmpLigne = ligne - 1
                    while(encoreJeton && tmpLigne >= 0 && tmpColone < 7){
                        let dataTest: NSData = UIImagePNGRepresentation(((mesCase.object(at: tmpColone*6 + tmpLigne))as! UIButton).backgroundImage(for: UIControlState.normal)!)! as NSData
                        if(dataTest.isEqual(casePrincipale)){
                            nbDiagoBasDroit += 1
                            tmpColone += 1
                            tmpLigne -= 1
                        }else{
                            encoreJeton = false
                        }
                    }
                    //print("nb jeton a diagonal bas Droit \(nbDiagoBasDroit)")
                    if(nbDiagoHautGauche+nbDiagoBasDroit >= 3){
                        gagner()
                    }
                }
            }
        }
       // print("---------")
    }

    
    @IBAction func saisirColone(_ sender: AnyObject) {
        labelErreur.isHidden = true
        
        let ligne : Int = mesCase.index(of: sender)%6
        let colone : Int = (mesCase.index(of: sender)-ligne)/6
        var ligneCurrent : Int = 0;
        var pasEncoreExecuter : Bool = true;
        
        //NSLog("ma ligne : \(ligne) , ma colone : \(colone)")
        //sender.setBackgroundImage(UIImage(named: player()), for: UIControlState.normal)
        //(mesCase.object(at:colone*6) as AnyObject).setBackgroundImage(UIImage(named: player()), for: UIControlState.normal)
        //(mesCase.object(at: colone*6+ligneCurrent) as AnyObject).backgroundImage(for: UIControlState.normal))
        while(pasEncoreExecuter && ligneCurrent<6){
            let dataCase: NSData = UIImagePNGRepresentation(((mesCase.object(at: colone*6 + ligneCurrent))as! UIButton).backgroundImage(for: UIControlState.normal)!)! as NSData
            let dataVide: NSData = UIImagePNGRepresentation(UIImage(named: "CF_pionVide.gif")!)! as NSData
            if(dataCase.isEqual(dataVide)){
                (mesCase.object(at:colone*6+ligneCurrent) as AnyObject).setBackgroundImage(UIImage(named: player()), for: UIControlState.normal)
                pasEncoreExecuter = false
                piece += 1
                testFin(nbPiece: piece)
                testGagner(ligne: ligneCurrent, colone: colone)
            }
            ligneCurrent += 1
        }
        if ligneCurrent == 6 {
            if(message[ligne] == true){
                message[ligne] = false
            }
            else{
                labelErreur.isHidden = false
            }
        }
        /*
        while(pasEncoreExecuter){
            if ( (mesCase[ colone*6+ligneExectue] as AnyObject).currentImage.isEqual(UIImage(named: "CF_pionVide.gif"))){
                pasEncoreExecuter=false
            }else{
                if(ligneExectue<6){
                    ligneExectue=6
                    pasEncoreExecuter = false
                }else{

                    ligneExectue+=1
                }
            }
        }
        if(ligneExectue<6){
            (mesCase[colone*6+ligneExectue] as AnyObject).setImage(UIImage(named: player()), for: UIControlState.normal)
            }
         */
        //Button55.currentImage?.isEqual(UIImage(named: "CF_pionVide.gif"))
    }

}

