//
//  LeaderBoardScene.swift
//  Bridge_builder
//
//  Created by apple on 2019/12/16.
//  Copyright © 2019年 jmu. All rights reserved.
//

import SpriteKit

class LeaderBoardScene:SKScene {
    
    let StoreLeadersName = "com.stickHero.leaders"
    
    func start(){
        loadBackground()
        loadSign()
        loadBack()
        loadLeaders()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let location = touches.first?.location(in: self)
        
        let button = self.atPoint(location!)
        
        if(button.name == StickHeroGameSceneChildName.BackButtonName.rawValue){
            button.run(SKAction.sequence([SKAction.scale(to: 1.2, duration: 0.3), SKAction.scale(to: 1, duration: 0.3)]), completion: {[unowned self] () -> Void in
                let view = self.view!
                let scene = StartMenuScene(size:CGSize(width: DefinedScreenWidth, height: DefinedScreenHeight))
                
                scene.scaleMode = .aspectFill
                view.presentScene(scene)
            })
        }
    }
    
    override func didMove(to view: SKView) {
        start()
    }
    override init(size: CGSize) {
        super.init(size: size)
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
private extension LeaderBoardScene {
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
    
    func loadSign() {
        let sign = SKSpriteNode(imageNamed: "jiangbei")
        sign.zPosition = StickHeroGameSceneZposition.stackZposition.rawValue
        sign.position = CGPoint(x: 0, y: -DefinedScreenHeight / 4)
        self.addChild(sign)
        
        let signLabel = SKLabelNode(fontNamed: "BradleyHandITCTT-Bold")
        signLabel.text = "LeaderBoard"
        signLabel.fontColor = SKColor.yellow
        signLabel.fontSize = 180
        signLabel.position = CGPoint(x: 0, y: DefinedScreenHeight/4 - 200)
        signLabel.horizontalAlignmentMode = .center
        signLabel.zPosition = StickHeroGameSceneZposition.scoreZposition.rawValue
        self.addChild(signLabel)
    }
    
    func loadBack() {
        let back = SKSpriteNode(imageNamed: "house")
        back.name = StickHeroGameSceneChildName.BackButtonName.rawValue
        back.position = CGPoint(x: DefinedScreenWidth / 2 - 450, y: 200 - DefinedScreenHeight / 2)
        back.zPosition = StickHeroGameSceneZposition.stackZposition.rawValue
        self.addChild(back)
    }
    
    func loadLeaders() {
        var leaderScores = UserDefaults.standard.dictionary(forKey: StoreLeadersName) as? Dictionary<String,Int>
        if (leaderScores == nil) {
            leaderScores = Dictionary<String,Int>()
            leaderScores = ["first": 0,"second": 0,"third": 0]
        }

        let gold = SKLabelNode()
        gold.position = CGPoint(x: -300, y: -100)
        gold.text = "🥇"
        gold.fontSize = 100
        gold.horizontalAlignmentMode = .center
        gold.zPosition = StickHeroGameSceneZposition.scoreZposition.rawValue
        self.addChild(gold)
        
        let first = SKLabelNode()
        first.position = CGPoint(x: -300, y: -250)
        first.text = "\(leaderScores!["first"]!)"
        first.fontSize = 100
        first.fontColor = SKColor.white
        first.horizontalAlignmentMode = .center
        first.zPosition = StickHeroGameSceneZposition.scoreZposition.rawValue
        self.addChild(first)
        
        let silver = SKLabelNode()
        silver.position = CGPoint(x: 0, y: -100)
        silver.text = "🥈"
        silver.fontSize = 100
        silver.horizontalAlignmentMode = .center
        silver.zPosition = StickHeroGameSceneZposition.scoreZposition.rawValue
        self.addChild(silver)
        
        let second = SKLabelNode()
        second.position = CGPoint(x: 0, y: -250)
        second.text = "\(leaderScores!["second"]!)"
        second.fontSize = 100
        second.fontColor = SKColor.white
        second.horizontalAlignmentMode = .center
        second.zPosition = StickHeroGameSceneZposition.scoreZposition.rawValue
        self.addChild(second)
        
        let bronze = SKLabelNode()
        bronze.position = CGPoint(x: 300, y: -100)
        bronze.text = "🥉"
        bronze.fontSize = 100
        bronze.horizontalAlignmentMode = .center
        bronze.zPosition = StickHeroGameSceneZposition.scoreZposition.rawValue
        self.addChild(bronze)
        
        let third = SKLabelNode()
        third.position = CGPoint(x: 300, y: -250)
        third.text = "\(leaderScores!["third"]!)"
        third.fontSize = 100
        third.fontColor = SKColor.white
        third.horizontalAlignmentMode = .center
        third.zPosition = StickHeroGameSceneZposition.scoreZposition.rawValue
        self.addChild(third)
        
        let leadersBackground = SKShapeNode(rect: CGRect(x: -500, y:200 - DefinedScreenHeight / 4, width: 1000, height: 400), cornerRadius: 20)
        leadersBackground.zPosition = StickHeroGameSceneZposition.scoreBackgroundZposition.rawValue
        leadersBackground.fillColor = SKColor.black.withAlphaComponent(0.3)
        leadersBackground.strokeColor = SKColor.black.withAlphaComponent(0.3)
        self.addChild(leadersBackground)
        
        
        
        
    }
}
