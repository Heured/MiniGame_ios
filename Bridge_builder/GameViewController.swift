//
//  GameViewController.swift
//  Bridge_builder
//
//  Created by apple on 2019/12/12.
//  Copyright © 2019年 jmu. All rights reserved.
//

import UIKit
import SpriteKit
import AVFoundation

var musicPlayer:AVAudioPlayer!
var SoundStatus:Bool = true

class GameViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 创建视窗
        if let view = self.view as! SKView? {
        
            //let scene = GameScene(size:CGSize(width: DefinedScreenWidth, height: DefinedScreenHeight))
            
            let scene = StartMenuScene(size:CGSize(width: DefinedScreenWidth, height: DefinedScreenHeight))
            
            // 设置窗口大小模式为自适应
            scene.scaleMode = .aspectFill
                
            // 显示场景
            view.presentScene(scene)
            
            //忽视渲染顺序
            view.ignoresSiblingOrder = true
            
            //显示帧数，被渲染的对象个数
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    //创建音频播放器
    func setupAudioPlayerWithFile(_ file:NSString, type:NSString) -> AVAudioPlayer  {
        let url = Bundle.main.url(forResource: file as String, withExtension: type as String)
        var audioPlayer:AVAudioPlayer?
        
        do {
            try audioPlayer = AVAudioPlayer(contentsOf: url!)
        } catch {
            print("NO AUDIO PLAYER")
        }
        
        return audioPlayer!
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        musicPlayer = setupAudioPlayerWithFile("bg_country", type: "mp3")
        musicPlayer.numberOfLoops = -1
        musicPlayer.play()
    }
    
    override var shouldAutorotate: Bool {
        //return true
        return false
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        /*
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }*/
        return .portrait
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
