//
//  GameScene+Update.swift
//  SGame
//
//  Created by speedy on 2024/12/21.
//

import SpriteKit

extension GameScene {
    override func update(_ currentTime: TimeInterval) {
        updatePlayerMovement()
        updateJump(currentTime)
        updateCamera()
        updateVelocityLimits()
    }
    
    private func updateCamera() {
        let targetPosition = player.position
        let smoothing: CGFloat = 0.1
        let worldBoundary: CGFloat = 900
        
        let newX = min(worldBoundary, max(-worldBoundary,
                    cam.position.x + (targetPosition.x - cam.position.x) * smoothing))
        let newY = min(worldBoundary, max(-worldBoundary,
                    cam.position.y + (targetPosition.y - cam.position.y) * smoothing))
        
        cam.position = CGPoint(x: newX, y: newY)
    }
    
    private func updateVelocityLimits() {
        if let velocity = player.physicsBody?.velocity {
            let clampedX = min(maxSpeed, max(-maxSpeed, velocity.dx))
            let clampedY = min(500, max(-400, velocity.dy))
            player.physicsBody?.velocity = CGVector(dx: clampedX, dy: clampedY)
        }
    }
}
