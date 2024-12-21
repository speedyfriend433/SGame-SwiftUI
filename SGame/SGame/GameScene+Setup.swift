//
//  GameScene+Setup.swift
//  SGame
//
//  Created by speedy on 2024/12/21.
//

import SpriteKit

extension GameScene {
    func setupPhysicsWorld() {
        physicsWorld.gravity = CGVector(dx: 0, dy: -5.8)
        physicsWorld.contactDelegate = self
        setupWorldBorders()
    }
    
    func setupCamera() {
        cam = SKCameraNode()
        camera = cam
        addChild(cam)
    }
    
    func setupPlayer() {
        player = SKSpriteNode(color: .red, size: CGSize(width: 32, height: 32))
        player.position = CGPoint(x: 0, y: 100)
        
        player.physicsBody = SKPhysicsBody(rectangleOf: player.size)
        player.physicsBody?.isDynamic = true
        player.physicsBody?.allowsRotation = false
        player.physicsBody?.restitution = 0
        player.physicsBody?.friction = 0.2
        player.physicsBody?.mass = 1.0
        player.physicsBody?.linearDamping = 0.1
        player.physicsBody?.categoryBitMask = playerCategory
        player.physicsBody?.contactTestBitMask = platformCategory | collectibleCategory | deathZoneCategory
        player.physicsBody?.collisionBitMask = platformCategory
        
        spawnPoint = player.position
        addChild(player)
    }
    
    func setupPlatforms() {
        // Ground platform
        createPlatform(size: CGSize(width: 800, height: 40),
                      position: CGPoint(x: 0, y: -100),
                      color: .green)
        
        // Higher platforms
        createPlatform(size: CGSize(width: 120, height: 20),
                      position: CGPoint(x: 200, y: 150),
                      color: .green)
        
        createPlatform(size: CGSize(width: 120, height: 20),
                      position: CGPoint(x: -150, y: 300),
                      color: .green)
        
        createPlatform(size: CGSize(width: 120, height: 20),
                      position: CGPoint(x: 100, y: 450),
                      color: .green)
        
        createPlatform(size: CGSize(width: 120, height: 20),
                      position: CGPoint(x: -100, y: 600),
                      color: .green)
        
        createPlatform(size: CGSize(width: 120, height: 20),
                      position: CGPoint(x: 200, y: 750),
                      color: .green)
    }
    
    func setupControls() {
        let buttonSize = CGSize(width: 50, height: 50)
        
        // Left button
        let leftButton = createControlButton(name: "leftButton",
                                           position: CGPoint(x: -100, y: -200),
                                           size: buttonSize)
        
        // Right button
        let rightButton = createControlButton(name: "rightButton",
                                            position: CGPoint(x: 100, y: -200),
                                            size: buttonSize)
        
        // Jump button
        let jumpButton = createControlButton(name: "jumpButton",
                                           position: CGPoint(x: 0, y: -200),
                                           size: buttonSize)
        
        cam.addChild(leftButton)
        cam.addChild(rightButton)
        cam.addChild(jumpButton)
    }
    
    func createPlatform(size: CGSize, position: CGPoint, color: UIColor) {
        let platform = SKSpriteNode(color: color, size: size)
        platform.position = position
        
        platform.physicsBody = SKPhysicsBody(rectangleOf: size)
        platform.physicsBody?.isDynamic = false
        platform.physicsBody?.restitution = 0
        platform.physicsBody?.friction = 0.2
        platform.physicsBody?.categoryBitMask = platformCategory
        platform.physicsBody?.collisionBitMask = playerCategory
        
        addChild(platform)
    }
    
    func createControlButton(name: String, position: CGPoint, size: CGSize) -> SKSpriteNode {
        let button = SKSpriteNode(color: .gray, size: size)
        button.position = position
        button.name = name
        button.zPosition = 100
        return button
    }
}
