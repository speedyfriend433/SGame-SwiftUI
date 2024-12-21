//
//  GameScene+Controls.swift
//  SGame
//
//  Created by speedy on 2024/12/21.
//

import SpriteKit

extension GameScene {
    // MARK: - Touch Handling
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            handleTouchBegan(touch)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            handleTouchEnded(touch)
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchesEnded(touches, with: event)
    }
    
    private func handleTouchBegan(_ touch: UITouch) {
        let location = touch.location(in: self)
        let touchedNodes = nodes(at: location)
        
        for node in touchedNodes {
            if let nodeName = node.name {
                touchLocations[touch] = nodeName
                updateControlState(nodeName: nodeName, isPressed: true)
            }
        }
    }
    
    private func handleTouchEnded(_ touch: UITouch) {
        if let nodeName = touchLocations[touch] {
            updateControlState(nodeName: nodeName, isPressed: false)
            touchLocations.removeValue(forKey: touch)
        }
    }
    
    private func updateControlState(nodeName: String, isPressed: Bool) {
        switch nodeName {
        case "leftButton":
            isMovingLeft = isPressed
        case "rightButton":
            isMovingRight = isPressed
        case "jumpButton":
            isJumpPressed = isPressed
            if isPressed { startJump() } else { endJump() }
        default:
            break
        }
    }
}
