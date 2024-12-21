//
//  GameScene+Physics.swift
//  SGame
//
//  Created by speedy on 2024/12/21.
//

import SpriteKit

extension GameScene {
    func didBegin(_ contact: SKPhysicsContact) {
        let collision = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        if collision == playerCategory | platformCategory {
            handlePlatformCollision(contact)
        }
        else if collision == playerCategory | deathZoneCategory {
            respawnPlayer()
        }
    }
    
    private func handlePlatformCollision(_ contact: SKPhysicsContact) {
        let playerBody = (contact.bodyA.categoryBitMask == playerCategory) ? contact.bodyA : contact.bodyB
        let platformBody = (contact.bodyA.categoryBitMask == platformCategory) ? contact.bodyA : contact.bodyB
        
        if playerBody.node?.position.y ?? 0 > platformBody.node?.position.y ?? 0 {
            canJump = true
        }
    }
    
    func respawnPlayer() {
        player.position = spawnPoint
        player.physicsBody?.velocity = .zero
        isJumping = false
        isJumpPressed = false
    }
}
