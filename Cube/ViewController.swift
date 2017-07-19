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

class ViewController: UIViewController,ARSCNViewDelegate {

    @IBOutlet var arscnView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let scene = SCNScene()
        
        arscnView.delegate = self
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func physicsWorld(_ world : SCNPhysicsWorld, didBegin contact: SCNPhysicsContact){
        
        print("击中")
        
        contact.nodeA.removeAllActions()
        contact.nodeB.removeAllActions()
        
        arscnView.addShip()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        arscnView.shootBullet()
    }
}

