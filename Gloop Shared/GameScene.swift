//
//  GameScene.swift
//  Gloop Shared
//
//  Created by Matthew Hundley on 12/5/20.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {

  let player = Player()
  let playerSpeed: CGFloat = 1.5

  override func didMove(to view: SKView) {

    // Set up background
    let background = SKSpriteNode(imageNamed: "background_1")
    background.anchorPoint = CGPoint(x: 0, y: 0)
    background.zPosition = Layer.background.rawValue
    background.position = CGPoint(x: 0, y: 0)
    addChild(background)

    // Set up foreground
    let foreground = SKSpriteNode(imageNamed: "foreground_1")
    foreground.anchorPoint = CGPoint(x: 0, y: 0)
    foreground.zPosition = Layer.foreground.rawValue
    foreground.position = CGPoint(x: 0, y: 0)
    addChild(foreground)

    // Set up player
    player.position = CGPoint(x: size.width/2, y: foreground.frame.maxY)
    player.setupConstraints(floor: foreground.frame.maxY)
    addChild(player)
    player.walk()

    // Set up game
    spawnGloop()
  }

  // MARK: - Game Functions

    /* ############################################################ */
    /*                 Game Functions STARTS HERE                   */
    /* ############################################################ */

    func spawnGloop() {
        let collectible = Collectible(collectibleType: CollectibleType.gloop)
        collectible.position = CGPoint(x: player.position.x, y: player.position.y * 2.5)
        addChild(collectible)
    }

  // MARK: - TOUCH HANDLING

  /* ############################################################ */
  /*                 TOUCH HANDLERS STARTS HERE                   */
  /* ############################################################ */

  func touchDown(atPoint pos : CGPoint) {
    // Calculate the speed based on current position and tap location
    let distance = hypot(pos.x-player.position.x, pos.y-player.position.y)
    let calculatedSpeed = TimeInterval(distance / playerSpeed) / 255
    // print(" distance: \(distance) \n calculatedSpeed: \(calculatedSpeed)")

    if pos.x < player.position.x {
      player.moveToPosition(pos: pos, direction: "L", speed: calculatedSpeed)
    } else {
      player.moveToPosition(pos: pos, direction: "R", speed: calculatedSpeed)
    }
  }

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    for t in touches { self.touchDown(atPoint: t.location(in: self)) }
  }
}


