//
//  GameScene.swift
//  SGame
//
//  Created by speedy on 2024/12/21.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    // MARK: - Properties
    var player: SKSpriteNode!
    var cam: SKCameraNode!
    var worldBorder: SKNode!
    
    // Physics Categories
    let playerCategory: UInt32 = 0x1 << 0
    let platformCategory: UInt32 = 0x1 << 1
    let collectibleCategory: UInt32 = 0x1 << 2
    let deathZoneCategory: UInt32 = 0x1 << 3
    
    // Game State
    var spawnPoint: CGPoint = CGPoint(x: 0, y: 100)
    var touchLocations: [UITouch: String] = [:]
    
    // Movement Properties
    var isMovingLeft = false
    var isMovingRight = false
    var moveSpeed: CGFloat = 200
    var maxSpeed: CGFloat = 300
    var acceleration: CGFloat = 20
    
    // Jump Properties
    var isJumpPressed = false
    var canJump = true
    var jumpForce: CGFloat = 400
    var jumpHoldForce: CGFloat = 150
    var maxJumpDuration: TimeInterval = 0.6
    var jumpStartTime: TimeInterval = 0
    var currentJumpTime: TimeInterval = 0
    var isJumping = false
    
    // MARK: - Scene Setup
    override func didMove(to view: SKView) {
        setupPhysicsWorld()
        setupCamera()
        setupPlayer()
        setupPlatforms()
        setupControls()
    }
}
