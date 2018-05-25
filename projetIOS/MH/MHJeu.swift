
//  Created by Nate Murray on 6/2/14.
//  Copyright (c) 2014 Fullstack.io. All rights reserved.
//

import SpriteKit


struct BodyType{
    static let personnage:UInt32 = 1
    static let pipe:UInt32 = 2
}

@available(iOS 9.0, *)
class MHJeu: SKScene, SKPhysicsContactDelegate{
    let worldNode = SKNode()
    
    var score = Int()
    var timerScore = Timer()
    
    var pause = Bool()
    var isover = false
    var personnage = SKSpriteNode()
    var fond = SKSpriteNode()
    var moving = SKNode()
    var skyColor:SKColor!
    var canRestart = Bool()
    var timer1:Timer! = nil
    var cameraNode:SKCameraNode!
    let label = SKLabelNode()
    var pipe = SKSpriteNode()
    
    var pauseButton = SKNode()
    var playButton = SKNode()
    
    var pauseMenu = SKNode()
    var pauseColor = SKColor()
    
    var resumeButton = SKSpriteNode()
    var mainMenuButton = SKSpriteNode()
    var restartButton = SKSpriteNode()
    
    var viewController: UIViewController?
    
    var gameover:UIImageView!
    
    
    override func didMove(to view: SKView) {
       start()
    }
    
    func start(){
        addChild(worldNode)
        
        timerScore.invalidate()
        score = 0
        label.text = String(score)
        timerScore = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(MHJeu.demarrageScore), userInfo: nil, repeats: true)
        
        
        pauseButton = SKSpriteNode(imageNamed: "MHpause.png")
        pauseButton.position = CGPoint(x: self.frame.width - 300, y: self.frame.height - 100)
        pauseButton.setScale(2.5)
        pauseButton.name = "pauseButton"
        pauseButton.isHidden = false
        pauseButton.zPosition = 12
        
        playButton = SKSpriteNode(imageNamed: "MHplay.png")
        playButton.position = CGPoint(x: self.frame.width - 300, y: self.frame.height - 100)
        playButton.setScale(2.5)
        playButton.name = "playButton"
        playButton.isHidden = true
        playButton.zPosition = 12
        
        
        worldNode.addChild(pauseButton)
        worldNode.addChild(playButton)
        
       
        label.fontColor = UIColor.black
        label.fontName = "AvenirNext-Bold"
        label.fontSize = 45
        label.position = CGPoint(x: self.frame.width/2, y: self.frame.height - 100)
        label.zPosition = 70
        worldNode.addChild(label)
        
        //Gravité du monde
        self.physicsWorld.gravity = CGVector(dx: 0, dy: -9)
        self.physicsWorld.contactDelegate = self
        
        skyColor = SKColor(red: 254.0/255.0, green: 197.0/255.0, blue: 160.0/255.0, alpha: 1.0)
        pauseColor = SKColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 0.5)
        
        self.backgroundColor = skyColor
        worldNode.addChild(moving)
        
        // ground
        let groundTexture = SKTexture(imageNamed: "MHSolTest")
        groundTexture.filteringMode = .nearest // shorter form for SKTextureFilteringMode.Nearest
        
        let moveGroundSprite = SKAction.moveBy(x: -groundTexture.size().width * 2.0, y: 0, duration: 2)
        let resetGroundSprite = SKAction.moveBy(x: 0, y: 0, duration: 0.0)
        let moveGroundSpritesForever = SKAction.repeatForever(SKAction.sequence([moveGroundSprite,resetGroundSprite]))
        
        for i in 0 ..< 200 + Int(self.frame.size.width / ( groundTexture.size().width * 2 )) {
            let i = CGFloat(i)
            let sprite = SKSpriteNode(texture: groundTexture)
            sprite.setScale(2.5)
            sprite.position = CGPoint(x: i * sprite.size.width, y: sprite.size.height / 2.0)
            sprite.run(moveGroundSpritesForever)
            moving.addChild(sprite)
        }
        
        
        let mountTexture = SKTexture(imageNamed: "MHbackground")
        mountTexture.filteringMode = .nearest
        
        let moveMountSprite = SKAction.moveBy(x : -mountTexture.size().width*2.0, y:0, duration: TimeInterval(0.01*mountTexture.size().width*2.0))
        
        let resetMountSprite = SKAction.moveBy(x: 0, y: 0, duration: 0)
        
        let moveMountSpritesForever = SKAction.repeatForever(SKAction.sequence([moveMountSprite, resetMountSprite]))
        
        for i in 0 ..< 1000 + Int(self.frame.size.width / ( mountTexture.size().width * 2 )) {
            let i = CGFloat(i)
            fond = SKSpriteNode(texture: mountTexture)
            fond.setScale(1.0)
            fond.zPosition = -40
            fond.position = CGPoint(x: i * fond.size.width, y: fond.size.height/2 + groundTexture.size().height)
            fond.run(moveMountSpritesForever)
            moving.addChild(fond)
        }
        let color = variable.value(forKey: "color") as! Int
       
        // setup our character
        if(color == 0){
            let personnageTexture1 = SKTexture(imageNamed: "MHred1")
            personnageTexture1.filteringMode = .nearest
            
            let personnageTexture2 = SKTexture(imageNamed: "MHred2")
            personnageTexture2.filteringMode = .nearest
            
            let personnageTexture3 = SKTexture(imageNamed: "MHred3")
            personnageTexture2.filteringMode = .nearest
            
            let personnageTexture4 = SKTexture(imageNamed: "MHred4")
            personnageTexture2.filteringMode = .nearest
            
            let anim = SKAction.animate(with: [personnageTexture1, personnageTexture2, personnageTexture3, personnageTexture4], timePerFrame: 0.1)
            let flap = SKAction.repeatForever(anim)
            
            personnage = SKSpriteNode(texture: personnageTexture1)
            personnage.setScale(0.6)
            personnage.position = CGPoint(x: self.frame.size.width * 0.35, y:groundTexture.size().width*2)
            personnage.run(flap)
            
            
            personnage.physicsBody = SKPhysicsBody(rectangleOf:CGSize(width: personnage.size.width/2, height: personnage.size.height))
            personnage.physicsBody?.isDynamic = true
            personnage.physicsBody?.allowsRotation = false
            personnage.name = "personnage"
            personnage.physicsBody?.categoryBitMask = BodyType.personnage
            personnage.physicsBody?.contactTestBitMask = BodyType.pipe
            personnage.physicsBody?.collisionBitMask = BodyType.pipe
            
            worldNode.addChild(personnage)
        } else if (color == 2) {
            let personnageTexture1 = SKTexture(imageNamed: "MHwhite1")
            personnageTexture1.filteringMode = .nearest
            
            let personnageTexture2 = SKTexture(imageNamed: "MHwhite2")
            personnageTexture2.filteringMode = .nearest
            
            let personnageTexture3 = SKTexture(imageNamed: "MHwhite3")
            personnageTexture2.filteringMode = .nearest
            
            let personnageTexture4 = SKTexture(imageNamed: "MHwhite4")
            personnageTexture2.filteringMode = .nearest
            
            let anim = SKAction.animate(with: [personnageTexture1, personnageTexture2, personnageTexture3, personnageTexture4], timePerFrame: 0.1)
            let flap = SKAction.repeatForever(anim)
            
            personnage = SKSpriteNode(texture: personnageTexture1)
            personnage.setScale(0.6)
            personnage.position = CGPoint(x: self.frame.size.width * 0.35, y:groundTexture.size().width*2)
            personnage.run(flap)
            
            
            personnage.physicsBody = SKPhysicsBody(rectangleOf:CGSize(width: personnage.size.width/2, height: personnage.size.height))
            personnage.physicsBody?.isDynamic = true
            personnage.physicsBody?.allowsRotation = false
            personnage.name = "personnage"
            personnage.physicsBody?.categoryBitMask = BodyType.personnage
            personnage.physicsBody?.contactTestBitMask = BodyType.pipe
            personnage.physicsBody?.collisionBitMask = BodyType.pipe
            
            worldNode.addChild(personnage)
        } else {
            let personnageTexture1 = SKTexture(imageNamed: "MHperso1")
            personnageTexture1.filteringMode = .nearest
            
            let personnageTexture2 = SKTexture(imageNamed: "MHperso2")
            personnageTexture2.filteringMode = .nearest
            
            let personnageTexture3 = SKTexture(imageNamed: "MHperso3")
            personnageTexture2.filteringMode = .nearest
            
            let personnageTexture4 = SKTexture(imageNamed: "MHperso4")
            personnageTexture2.filteringMode = .nearest
            
            let anim = SKAction.animate(with: [personnageTexture1, personnageTexture2, personnageTexture3, personnageTexture4], timePerFrame: 0.1)
            let flap = SKAction.repeatForever(anim)
            
            personnage = SKSpriteNode(texture: personnageTexture1)
            personnage.setScale(0.6)
            personnage.position = CGPoint(x: self.frame.size.width * 0.35, y:groundTexture.size().width*2)
            personnage.run(flap)
            
            
            personnage.physicsBody = SKPhysicsBody(rectangleOf:CGSize(width: personnage.size.width/2, height: personnage.size.height))
            personnage.physicsBody?.isDynamic = true
            personnage.physicsBody?.allowsRotation = false
            personnage.name = "personnage"
            personnage.physicsBody?.categoryBitMask = BodyType.personnage
            personnage.physicsBody?.contactTestBitMask = BodyType.pipe
            personnage.physicsBody?.collisionBitMask = BodyType.pipe
            
            worldNode.addChild(personnage)
        }
        
        // create the ground
        let ground = SKNode()
        ground.position = CGPoint(x: 0, y: groundTexture.size().height)
        ground.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.frame.size.width, height:groundTexture.size().width))
        ground.physicsBody?.isDynamic = false
        self.addChild(ground)
        
        worldNode.addChild(pauseMenu)
        
        timer1 = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.movePipe), userInfo: nil, repeats: true)
        
        self.physicsWorld.contactDelegate = self
        
        //create the buttons
        resumeButton = SKSpriteNode(imageNamed: "MHresume.png")
        resumeButton.position = CGPoint(x: self.frame.width - 1024, y: self.frame.height - 500)
        resumeButton.setScale(2.5)
        resumeButton.name = "ResumeButton"
        resumeButton.isHidden = true
        resumeButton.zPosition = 12
        worldNode.addChild(resumeButton)
        
        
        mainMenuButton = SKSpriteNode(imageNamed: "MHmainMenu.png")
        mainMenuButton.position = CGPoint(x: self.frame.width - 1024, y: self.frame.height - 1100)
        mainMenuButton.setScale(2.5)
        mainMenuButton.name = "mainMenuButton"
        mainMenuButton.isHidden = true
        mainMenuButton.zPosition = 12
        worldNode.addChild(mainMenuButton)
        
        
        
        restartButton = SKSpriteNode(imageNamed: "MHrestart.png")
        restartButton.position = CGPoint(x: self.frame.width - 1024, y: self.frame.height - 800)
        restartButton.setScale(2.5)
        restartButton.name = "RestartButton"
        restartButton.isHidden = true
        restartButton.zPosition = 12
        worldNode.addChild(restartButton)
        
        
        let pauseNode = SKSpriteNode()
        pauseNode.color = UIColor.black
        pauseNode.alpha = 0.5
        pauseNode.size = CGSize(width: self.frame.width*2 , height: self.frame.height*2)
        pauseNode.position = CGPoint(x:0,y:0)
        pauseNode.zPosition = 10
        pauseMenu.addChild(pauseNode)
        pauseMenu.isHidden = true

    }
    
    
    func movePipe(){
        let random = createRandom(start: 0,end: 1000)
        let rand = Int(random())
        if rand > 500 {
            let pipeTexture = SKTexture(imageNamed : "MHpipe")
            pipeTexture.filteringMode = .nearest
            let groundTexture = SKTexture(imageNamed: "MHSolTest")
            pipe = SKSpriteNode(texture: pipeTexture)
            pipe.setScale(1.0)
            let nbRange = self.frame.size.width
            let yPosition = pipe.size.height + groundTexture.size().height
            pipe.position = CGPoint(x: nbRange*0.95, y:yPosition)
            
            let movePipeSprite = SKAction.moveBy(x : -(self.frame.size.width+pipe.size.width), y:0, duration: TimeInterval(0.005*pipeTexture.size().width*2.0))
            pipe.run(movePipeSprite)
            
            pipe.physicsBody = SKPhysicsBody(rectangleOf:CGSize(width: pipe.size.width-50, height: pipe.size.height-30))
            pipe.physicsBody?.isDynamic = false
            pipe.physicsBody?.allowsRotation = false
            pipe.name = "pipe"
            pipe.physicsBody?.categoryBitMask = BodyType.pipe
            worldNode.addChild(pipe)
        }
    }
    func createRandom(start: Int, end: Int) ->() ->Int! {
        var nums = [Int]();
        for i in start...end{
            nums.append(i)
        }
        
        func random() -> Int! {
            if !nums.isEmpty {
                let index = Int(arc4random_uniform(UInt32(nums.count)))
                return nums.remove(at: index)
            }else {
                return nil
            }
        }
        
        return random
    }
    
    
    func didBegin(_ contact: SKPhysicsContact){
        var body1 = SKPhysicsBody()
        var body2 = SKPhysicsBody()
        
        if contact.bodyA.node?.name == "personnage"{
            body1 = contact.bodyA
            body2 = contact.bodyB
        } else {
            body1 = contact.bodyB
            body2 = contact.bodyA
        }
        if (body1.node?.name == "personnage" && body2.node?.name == "pipe"){
            timer1.invalidate()
            self.isPaused = true
            pause = true
            gameover = UIImageView(image:UIImage(named:"MHgameOver"))
            gameover.frame = CGRect(x:self.size.height/9, y:self.size.width/13, width:700, height:100)
            self.view?.addSubview(gameover)
            
            physicsWorld.speed = 0
            resumeButton.isHidden = true
            mainMenuButton.isHidden = false
            restartButton.isHidden = false
            pauseButton.isHidden = true
            isover = true
            entrerScore(jeu:"scoreMontain", score:self.score, idJoueur:20)
        }
    }

    func demarrageScore(){
        if(pause == false){
            label.text = String(score)
            score = score + 3
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches{
            let location = touch.location(in: self)
            if (moving.speed > 0){
                if(personnage.position.y < 400) {
                    for _ in touches {
                        personnage.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
                        personnage.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 650))
                        print(personnage.position)
                    }
                }
            }

            if pauseButton.contains(location){
                if(pause == false && isover == false){
                    pauseMenu.isHidden = false
                    playButton.isHidden = false
                    pauseButton.isHidden = true
                    worldNode.isPaused = true
                    physicsWorld.speed = 0
                    resumeButton.isHidden = false
                    mainMenuButton.isHidden = false
                    restartButton.isHidden = false
                    timer1.invalidate()
                    pause = true
                } else if(pause == true && isover == false){
                    pauseMenu.isHidden = true
                    playButton.isHidden = true
                    pauseButton.isHidden = false
                    worldNode.isPaused = false
                    physicsWorld.speed = 1
                    pause = false
                    resumeButton.isHidden = true
                    mainMenuButton.isHidden = true
                    restartButton.isHidden = true
                    timer1 = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.movePipe), userInfo: nil, repeats: true)
                    
                }
            }else if (restartButton.contains(location)&&(isover == true || pause == true)){
                self.removeFromParent()
                let scene = MHJeu(size:CGSize(width: 2048, height: 1536))
                scene.viewController = self.viewController
                self.view?.presentScene(scene)
                if isover {
                    gameover.isHidden = true
                }
                print("Restart button")
            }
            
            else if mainMenuButton.contains(location){
                if(isover == true || pause == true){
                    self.viewController?.performSegue(withIdentifier: "MainMenu", sender: viewController)
                    print("MainMenu Buttn")
                }
            }
    
            else if resumeButton.contains(location) {
                if(isover == false && pause == true){
                    pauseMenu.isHidden = true
                    playButton.isHidden = true
                    pauseButton.isHidden = false
                    worldNode.isPaused = false
                    physicsWorld.speed = 1
                    pause = false
                    resumeButton.isHidden = true
                    mainMenuButton.isHidden = true
                    restartButton.isHidden = true
                    timer1 = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.movePipe), userInfo: nil, repeats: true)
                }
            }
        }
    }
    
    func entrerScore(jeu:NSString, score:Int, idJoueur:Int){
        
        //// ELEMENT A MODIFIER
        let post:NSString = "jeu=\(jeu)&score=\(score)&idJoueur=\(idJoueur)" as NSString
        
        //// FIN D ELEMENT A MODIFIER
        
        NSLog("PostData: %@",post);
        //print(post)
        
        let url:URL = URL(string:"https://webdev.iut-orsay.fr/iosproject/score/entrerScore.php")!
        
        let postData:Data = post.data(using: String.Encoding.ascii.rawValue)!
        
        let postLength:NSString = String( postData.count ) as NSString
        
        let request:NSMutableURLRequest = NSMutableURLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = postData
        request.setValue(postLength as String, forHTTPHeaderField: "Content-Length")
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        var response:URLResponse?
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
                let responseData:NSString = NSString(data:urlData!, encoding:String.Encoding.utf8.rawValue)!
                NSLog("Response ==> %@", responseData);
                do {
                }catch {
                    print ("erreur création dictionnaire")
                }
            }
        }
    }

    
}
