//
//  NewShip.swift
//  Cube
//
//  Created by Calvin on 2017/7/19.
//  Copyright © 2017年 Calvin. All rights reserved.
//

import SceneKit
import ARKit

extension ARSCNView{
    
    func addShip(){
        
        let ship = Ship()
        
        let x = -0.2[0.2]
        let y = -0.2[0.2]
        
        ship.position = SCNVector3(x,y,-0.3)
        
        self.scene.rootNode.addChildNode(ship)
    }
}


extension Double
{
    subscript(_ end:Double) -> Float {
        // 随机数
        let factor = Double(arc4random()) / Double(UInt32.max)
        return Float(end - factor * (end - self))
    }
}
