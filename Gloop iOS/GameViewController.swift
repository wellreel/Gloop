//
//  GameViewController.swift
//  Gloop iOS
//
//  Created by Matthew Hundley on 12/5/20.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //create the view
        if let view = self.view as! SKView? {

        // create the scene
            let scene = GameScene(size: CGSize(width: 1336, height: 1024))

            scene.scaleMode = .aspectFill

            scene.backgroundColor = UIColor(red: 105/255, green: 157/255, blue: 181/255, alpha: 1.0)

            view.presentScene(scene)

            // View options
            view.ignoresSiblingOrder = false
            view.showsPhysics = false
            view.showsFPS = true
            view.showsNodeCount = true

        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
