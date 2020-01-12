//
//  StartMenuScenes.swift
//  Bridge_builder
//
//  Created by apple on 2019/12/14.
//  Copyright © 2019年 jmu. All rights reserved.
//

import SpriteKit

class StartMenuScene:SKScene {
    
    let StackWidth:CGFloat = 300.0
    let StackHeight:CGFloat = 400.0
    
    //MARK: - override
    override init(size: CGSize) {
        super.init(size: size)
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
    }
    
    // 可视范围
    lazy var playAbleRect:CGRect = {
        //let maxAspectRatio:CGFloat = 16.0/9.0   //高宽比
        let maxAspectRatio:CGFloat = 734/375
        let maxAspectRatioWidth = self.size.height / maxAspectRatio
        let playableMargin = (self.size.width - maxAspectRatioWidth) / 2.0
        return CGRect(x: playableMargin, y: 0, width: maxAspectRatioWidth, height: self.size.height)
    }()
    
    func start(){
        loadBackground()
        loadLabels()
        loadStartButton()
        loadStack()
        loadHero()
        loadSoundButton()
        loadLeaderBoardButton()
    }
    
    override func didMove(to view: SKView) {
        start()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let location = touches.first?.location(in: self)
        
        let button = self.atPoint(location!)
        if (button.name == StickHeroGameSceneChildName.StartButtonName.rawValue || button.parent?.name == StickHeroGameSceneChildName.StartButtonName.rawValue) {
            button.run(SKAction.sequence([SKAction.scale(to: 1.1, duration: 0.5), SKAction.scale(to: 1, duration: 0.5)]), completion: {[unowned self] () -> Void in
                let view = self.view!
                let scene = GameScene(size:CGSize(width: DefinedScreenWidth, height: DefinedScreenHeight))
                
                scene.scaleMode = .aspectFill
                view.presentScene(scene)
            })
        }else if (button.name == StickHeroGameSceneChildName.SoundButtonName.rawValue){
            if SoundStatus {
                button.run(SKAction.sequence([SKAction.scale(to: 1.2, duration: 0.3), SKAction.setTexture(SKTexture(imageNamed: "sound_off"), resize:false), SKAction.scale(to: 1, duration: 0.3)]), completion: {() -> Void in
                    SoundStatus = false
                    musicPlayer.pause()
                })
            }else {
                button.run(SKAction.sequence([SKAction.scale(to: 1.2, duration: 0.3), SKAction.setTexture(SKTexture(imageNamed: "sound_on"), resize:false), SKAction.scale(to: 1, duration: 0.3)]), completion: {() -> Void in
                    SoundStatus = true
                    musicPlayer.play()
                })
            }
        }else if(button.name == StickHeroGameSceneChildName.LeaderBoardButtonName.rawValue){
            button.run(SKAction.sequence([SKAction.scale(to: 1.2, duration: 0.3), SKAction.scale(to: 1, duration: 0.3)]), completion: {() -> Void in
                let view = self.view!
                let scene = LeaderBoardScene(size:CGSize(width: DefinedScreenWidth, height: DefinedScreenHeight))
                
                scene.scaleMode = .aspectFill
                view.presentScene(scene)
            })
        }
    }
    /*
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }*/
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
private extension StartMenuScene {
    
    func loadBackground() {
        guard let _ = childNode(withName: "background") as! SKSpriteNode? else {
            let texture = SKTexture(image: UIImage(named: "stick_background.jpg")!)
            let node = SKSpriteNode(texture: texture)
            node.size = texture.size()
            node.zPosition = StickHeroGameSceneZposition.backgroundZposition.rawValue
            
            addChild(node)
            return
        }
    }
    
    func loadLabels() {
        let labelUp = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        labelUp.text = "STICK"
        labelUp.fontColor = SKColor.black
        labelUp.fontSize = 250
        labelUp.position = CGPoint(x: 0, y: DefinedScreenHeight/2 - 400)
        labelUp.horizontalAlignmentMode = .center
        labelUp.zPosition = StickHeroGameSceneZposition.scoreZposition.rawValue
        
        let labelDown = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        labelDown.text = "HERO"
        labelDown.fontColor = SKColor.black
        labelDown.fontSize = 230
        labelDown.position = CGPoint(x: 0, y: DefinedScreenHeight / 2 - 600)
        labelDown.horizontalAlignmentMode = .center
        labelDown.zPosition = StickHeroGameSceneZposition.scoreZposition.rawValue
        
        self.addChild(labelUp)
        self.addChild(labelDown)
    }
    
    func loadStartButton() {
        let startButton = SKShapeNode(circleOfRadius: StackWidth / 2)
        startButton.zPosition = StickHeroGameSceneZposition.stackZposition.rawValue
        startButton.name = StickHeroGameSceneChildName.StartButtonName.rawValue
        startButton.fillColor = SKColor(red: 0.2, green: 0.82, blue: 0.6, alpha: 1)
        startButton.strokeColor = SKColor(red: 0.2, green: 0.82, blue: 0.6, alpha: 1)
        self.addChild(startButton)
        
        let buttonLabel = SKLabelNode(fontNamed: "AmericanTypewriter")
        buttonLabel.text = "开始"
        buttonLabel.fontColor = SKColor.white
        buttonLabel.fontSize = 100
        buttonLabel.position = CGPoint(x:0,y:-30)
        buttonLabel.horizontalAlignmentMode = .center
        startButton.addChild(buttonLabel)
        
        let moveUp = SKAction.moveTo(y: 30, duration: 2)
        let moveDown = SKAction.moveTo(y: -30, duration: 2)
        startButton.run(SKAction.repeatForever(SKAction.sequence([moveUp,moveDown])))
        
    }
    
    func loadSoundButton() {
        let soundButton = SoundStatus ? SKSpriteNode(imageNamed: "sound_on"):SKSpriteNode(imageNamed: "sound_off")
        soundButton.zPosition = StickHeroGameSceneZposition.stackZposition.rawValue
        soundButton.name = StickHeroGameSceneChildName.SoundButtonName.rawValue
        soundButton.position = CGPoint(x: DefinedScreenWidth / 2 - 450, y: 200 - DefinedScreenHeight / 2)
        self.addChild(soundButton)
        
    }
    
    func loadLeaderBoardButton() {
        let leaderboardButton = SKSpriteNode(imageNamed: "leaderboard_icon")
        leaderboardButton.zPosition = StickHeroGameSceneZposition.stackZposition.rawValue
        leaderboardButton.name = StickHeroGameSceneChildName.LeaderBoardButtonName.rawValue
        leaderboardButton.position = CGPoint(x: 450 - DefinedScreenWidth / 2, y: 200 - DefinedScreenHeight / 2)
        self.addChild(leaderboardButton)
    }
    
    func loadStack(){
        let stack = SKShapeNode(rectOf: CGSize(width: StackWidth, height: StackHeight))
        stack.fillColor = SKColor.black
        stack.strokeColor = SKColor.black
        stack.zPosition = StickHeroGameSceneZposition.stackZposition.rawValue
        stack.name = StickHeroGameSceneChildName.StackName.rawValue
        stack.position = CGPoint(x:0, y: -DefinedScreenHeight / 2 + StackHeight / 2)
        self.addChild(stack)
    }
    
    func loadHero(){
        
        let hero = SKSpriteNode(imageNamed: "human1")
        hero.name = StickHeroGameSceneChildName.HeroName.rawValue
        let x:CGFloat = 0
        let y:CGFloat = StackHeight + hero.size.height / 2 - DefinedScreenHeight / 2
        hero.position = CGPoint(x: x, y: y)
        hero.zPosition = StickHeroGameSceneZposition.heroZposition.rawValue
        
        self.addChild(hero)
    }
    
}
