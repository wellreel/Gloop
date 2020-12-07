//
//  GameScene.swift
//  Gloop Shared
//
//  Created by Matthew Hundley on 12/5/20.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        //add background image

        let background = SKSpriteNode(imageNamed: "background_1")
        background.anchorPoint = CGPoint.zero
        background.zPosition = Layer.background.rawValue
        background.position = CGPoint.zero
        addChild(background)

        let foreground = SKSpriteNode(imageNamed: "foreground_1")
        foreground.anchorPoint = CGPoint.zero
        background.zPosition = Layer.foreground.rawValue
        foreground.position = CGPoint.zero
        addChild(foreground)

        let player = Player()
        player.position = CGPoint(x: size.width/2, y: foreground.frame.maxY)
        addChild(player)
    }
}

