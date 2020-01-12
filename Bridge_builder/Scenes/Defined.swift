//
//  Defined.swift
//  Bridge_builder
//
//  Created by apple on 2019/12/13.
//  Copyright © 2019年 jmu. All rights reserved.
//

import Foundation
import CoreGraphics

// 窗口大小
let DefinedScreenWidth:CGFloat = 1536
let DefinedScreenHeight:CGFloat = 2048

// 一系列命名
enum StickHeroGameSceneChildName : String {
    case HeroName = "hero"
    case StickName = "stick"
    case StackName = "stack"
    case StackMidName = "stack_mid"
    case ScoreName = "score"
    case TopScoreName = "top_score"
    case TipName = "tip"
    case PerfectName = "perfect"
    case GameOverLayerName = "over"
    case RetryButtonName = "retry"
    case StartButtonName = "start"
    case SoundButtonName = "quiet"
    case LeaderBoardButtonName = "leaderboard"
    case BackButtonName = "back"
    case HighScoreName = "highscore"
}

enum StickHeroGameSceneActionKey: String {
    case WalkAction = "walk"
    case StickGrowAudioAction = "stick_grow_audio"
    case StickGrowAction = "stick_grow"
    case HeroScaleAction = "hero_scale"
}

//一系列音频命名
enum StickHeroGameSceneEffectAudioName: String {
    case DeadAudioName = "dead.wav"
    case StickGrowAudioName = "stick_grow_loop.wav"
    case StickGrowOverAudioName = "kick.wav"
    case StickFallAudioName = "fall.wav"
    case StickTouchMidAudioName = "touch_mid.wav"
    case VictoryAudioName = "victory.wav"
    case HighScoreAudioName = "highScore.wav"
    case QuietAudioName = "quiet.mp3"
}

//所有对象的z轴位置，数值越大越靠前
enum StickHeroGameSceneZposition: CGFloat {
    case backgroundZposition = 0
    case stackZposition = 30
    case stackMidZposition = 35
    case stickZposition = 40
    case scoreBackgroundZposition = 50
    case heroZposition, scoreZposition, tipZposition, perfectZposition = 100
    case emitterZposition
    case gameOverZposition
}
