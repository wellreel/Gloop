//
//  Collectible.swift
//  Gloop
//
//  Created by Matthew Hundley on 12/10/20.
//

import Foundation
import SpriteKit

// enum to add different types of collectibles

enum CollectibleType: String {
    case none
    case gloop
}

class Collectible: SKSpriteNode {

    // MARK: - Properties
    private var collectibleType: CollectibleType = .none

    // MARK: - INIT
    init(collectibleType: CollectibleType) {
        var texture: SKTexture!
        self.collectibleType = collectibleType

        // set the texture based on the type
        switch self.collectibleType {
        case .gloop:
            texture = SKTexture(imageNamed: "gloop")
        case .none:
            break
        }
        // call to super.init
        super.init(texture: texture, color: SKColor.clear, size: texture.size())

        // Set up collectible
        self.name = "co_\(collectibleType)"
        self.anchorPoint = CGPoint(x: 0.5, y: 1.0)
        self.zPosition = Layer.collectible.rawValue
      }

      // Required init
      required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
      }

}
