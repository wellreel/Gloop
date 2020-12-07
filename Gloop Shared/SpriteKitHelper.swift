//
//  SpriteKitHelper.swift
//  Gloop
//
//  Created by Matthew Hundley on 12/6/20.
//

import Foundation
import SpriteKit

// MARK:  - SpriteKit extensions

// Setup shared z-positions
enum Layer: CGFloat {
  case background
  case foreground
  case player
}

extension SKSpriteNode {
    //Used to load texture arrays for animations
    func loadTextures(atlas: String, prefix: String, startsAt: Int, stopsAt: Int) -> [SKTexture] {
        var textureArray = [SKTexture]()
        let textureAtlas = SKTextureAtlas(named: atlas)
        for i in startsAt...stopsAt {
            let textureName = "\(prefix)\(i)"
            let temp = textureAtlas.textureNamed(textureName)
            textureArray.append(temp)
        }
        return textureArray
    }


}
