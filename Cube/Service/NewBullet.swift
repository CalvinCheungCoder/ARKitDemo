//
//  NewBullet.swift
//  Cube
//
//  Created by Calvin on 2017/7/19.
//  Copyright © 2017年 Calvin. All rights reserved.
//

import SceneKit
import ARKit

extension ARSCNView{
    
    func shootBullet() {
        
        let bullet = Bullet()
        
        let (dir,pos) = self.getUserVector()
        
        bullet.position = pos
        bullet.physicsBody?.applyForce(dir, asImpulse: true)
        
        self.scene.rootNode.addChildNode(bullet)
        
    }
    
    func getUserVector() -> (SCNVector3,SCNVector3) {
        
        if let currentFrame = self.session.currentFrame {
            
            let matrix = SCNMatrix4(currentFrame.camera.transform)
            // 摄像头方向
            let direction = SCNVector3(-matrix.m31,-matrix.m32,-matrix.m33)
            // 摄像头的位置
            let position = SCNVector3(matrix.m41,matrix.m42,matrix.m43)
            return(direction,position)
        }
        return (SCNVector3(0,0,-1),SCNVector3(0,0,-2))
    }
}
