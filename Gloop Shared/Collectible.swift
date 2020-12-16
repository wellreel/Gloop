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
    // MARK: - Functions
    func drop(dropSpeed: TimeInterval, floorLevel: CGFloat) {
        let pos = CGPoint(x: position.x, y: floorLevel)

        let scaleX = SKAction.scaleX(to: 1.0, duration: 1.0)
        let scaleY = SKAction.scaleY(to: 1.3, duration: 1.0)
        let scale = SKAction.group([scaleX, scaleY])
        
        let appear = SKAction.fadeAlpha(to: 1.0, duration: 0.25)
        let moveAction = SKAction.move(to: pos, duration: dropSpeed)
        let actionSequence = SKAction.sequence([appear, scale, moveAction])

        // Shrink first, then run fall action
        self.scale(to: CGSize(width: 0.25, height: 1.0))
        self.run(actionSequence, withKey: "drop")
    }
}
