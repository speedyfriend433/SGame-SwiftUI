//
//  GameScene+WorldBorders.swift
//  SGame
//
//  Created by speedy on 2024/12/21.
//

import SpriteKit

extension GameScene {
    func setupWorldBorders() {
        let worldWidth: CGFloat = 2000
        let worldHeight: CGFloat = 2000
        let borderWidth: CGFloat = 2.0
        let borderColor = UIColor.red
        
        worldBorder = SKNode()
        
        // Create borders
        let borders = [
            createBorder(size: CGSize(width: borderWidth, height: worldHeight),
                        position: CGPoint(x: -worldWidth/2, y: 0)),  // Left
            createBorder(size: CGSize(width: borderWidth, height: worldHeight),
                        position: CGPoint(x: worldWidth/2, y: 0)),   // Right
            createBorder(size: CGSize(width: worldWidth, height: borderWidth),
                        position: CGPoint(x: 0, y: -worldHeight/2)), // Bottom
            createBorder(size: CGSize(width: worldWidth, height: borderWidth),
                        position: CGPoint(x: 0, y: worldHeight/2))   // Top
        ]
        
        borders.forEach { border in
            border.fillColor = borderColor
            border.strokeColor = borderColor
            border.physicsBody?.categoryBitMask = deathZoneCategory
            worldBorder.addChild(border)
        }
        
        addChild(worldBorder)
    }
    
    private func createBorder(size: CGSize, position: CGPoint) -> SKShapeNode {
        let border = SKShapeNode(rectOf: size)
        border.position = position
        border.physicsBody = SKPhysicsBody(rectangleOf: size)
        border.physicsBody?.isDynamic = false
        return border
    }
}
