//
//  GameScene+Movement.swift
//  SGame
//
//  Created by speedy on 2024/12/21.
//

import SpriteKit

extension GameScene {
    // MARK: - Movement Updates
    func updatePlayerMovement() {
        var targetVelocityX: CGFloat = 0
        
        if isMovingLeft {
            targetVelocityX = -moveSpeed
        } else if isMovingRight {
            targetVelocityX = moveSpeed
        }
        
        let currentVelocityX = player.physicsBody?.velocity.dx ?? 0
        let newVelocityX = lerp(start: currentVelocityX,
                               end: targetVelocityX,
                               percentage: 0.2)
        
        player.physicsBody?.velocity.dx = newVelocityX
    }
    
    func startJump() {
        guard canJump else { return }
        
        isJumping = true
        jumpStartTime = CACurrentMediaTime()
        currentJumpTime = 0
        
        player.physicsBody?.velocity.dy = 0
        player.physicsBody?.applyImpulse(CGVector(dx: 0, dy: jumpForce))
    }
    
    func endJump() {
        isJumping = false
        if player.physicsBody?.velocity.dy ?? 0 > 0 {
            player.physicsBody?.velocity.dy *= 0.5
        }
    }
    
    func updateJump(_ currentTime: TimeInterval) {
        guard isJumping && isJumpPressed else { return }
        
        currentJumpTime = CACurrentMediaTime() - jumpStartTime
        
        if currentJumpTime <= maxJumpDuration {
            player.physicsBody?.applyForce(CGVector(dx: 0, dy: jumpHoldForce))
            
            if let velocity = player.physicsBody?.velocity {
                if velocity.dy > 500 {
                    player.physicsBody?.velocity.dy = 500
                }
            }
        } else {
            endJump()
        }
    }
    
    private func lerp(start: CGFloat, end: CGFloat, percentage: CGFloat) -> CGFloat {
        return start + (end - start) * percentage
    }
}
