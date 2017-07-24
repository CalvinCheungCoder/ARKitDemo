//
//  ViewController.swift
//  Cube
//
//  Created by Calvin on 2017/7/19.
//  Copyright © 2017年 Calvin. All rights reserved.
//

import UIKit
import ARKit
import SceneKit

class ViewController: UIViewController,SCNPhysicsContactDelegate {

    @IBOutlet var arscnView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let scene = SCNScene()
        
//        arscnView.delegate = self
        arscnView.showsStatistics = true
        arscnView.scene = scene
        // 启动后添加飞船
        arscnView.addShip()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        
        let config = ARWorldTrackingSessionConfiguration()
        
        config.planeDetection = .horizontal
        config.isLightEstimationEnabled = true
        
        arscnView.session.run(config)
    }
    
    func physicsWorld(_ world : SCNPhysicsWorld, didBegin contact: SCNPhysicsContact){
        
        print("击中")
        
        contact.nodeA.removeFromParentNode()
        contact.nodeB.removeFromParentNode()
        
        
        removeNodeDynamic(node: contact.nodeB, isExplode: false)
        
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5){
            self.removeNodeDynamic(node: contact.nodeA, isExplode: true)
            self.arscnView.addShip()
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        playSound(of: .torpedo) // 音效
        arscnView.shootBullet()
    }
    
    func removeNodeDynamic(node: SCNNode, isExplode: Bool) {
        playSound(of: .collision)
        
        if isExplode {
            playSound(of: .explosion)
            
            let ps = SCNParticleSystem(named: "explosion", inDirectory: nil)
            let psnode = SCNNode()
            psnode.addParticleSystem(ps!)
            
            psnode.position = node.position
            arscnView.scene.rootNode.addChildNode(psnode)
        }
        node.removeFromParentNode()
    }
}

