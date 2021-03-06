//
//  Ship.swift
//  Cube
//
//  Created by Calvin on 2017/7/19.
//  Copyright © 2017年 Calvin. All rights reserved.
//

import UIKit
import SceneKit

class Ship: SCNNode {

    override init() {
        super.init()
        
        let box = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)
        
        self.geometry = box
        
        let shape = SCNPhysicsShape(geometry:box)
        self.physicsBody = SCNPhysicsBody(type: .dynamic,shape:shape)
        self.physicsBody?.isAffectedByGravity = false
        
        self.physicsBody?.categoryBitMask = Masks.ship.rawValue
        self.physicsBody?.contactTestBitMask = Masks.bullet.rawValue
        
        let material = SCNMaterial()
        material.diffuse.contents = #imageLiteral(resourceName: "122.png")
        self.geometry?.materials = [material,material,material,material,material,material];
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
