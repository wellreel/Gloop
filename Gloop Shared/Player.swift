//
//  Player.swift
//  Gloop
//
//  Created by Matthew Hundley on 12/6/20.
//

import Foundation
import SpriteKit

// This enum lets you easily switch between animations
enum PlayerAnimationType: String {
  case walk
}

class Player: SKSpriteNode {
    // MARK: - properties

    // Textures (Animation)
    private var walkTextures: [SKTexture]?

    // MARK: - init
    init() {

      // Set default texture
      let texture = SKTexture(imageNamed: "blob-walk_0")

      // Call to super.init
      super.init(texture: texture, color: .clear, size: texture.size())

      // Setup animation textures
      self.walkTextures = self.loadTextures(atlas: "blob", prefix: "blob-walk_",
                                            startsAt: 0, stopsAt: 2)

      /* The call to the `loadTextures` extension essentially does this:
      self.walkTextures = [SKTexture(imageNamed: "blob-walk_0"),
                           SKTexture(imageNamed: "blob-walk_1"),
                           SKTexture(imageNamed: "blob-walk_2")] */

      // Setup other properties after init
      self.name = "player"
      self.setScale(1.0)
      self.anchorPoint = CGPoint(x: 0.5, y: 0.0) // center-bottom
      self.zPosition = Layer.player.rawValue
    }

    required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
}
