//
//  ColourFadeScreenSaverView.swift
//  ColourFadeScreenSaver
//
//  Created by Hecetor on 6/11/2023.
//

import ScreenSaver

class ColourFadeView: ScreenSaverView {


        private var gradient: NSGradient?
        private var currentAngle: CGFloat = 0.0
        private let angleStep: CGFloat = 0.8
        
        override init?(frame: NSRect, isPreview: Bool) {
            super.init(frame: frame, isPreview: isPreview)
            let colors = [NSColor.systemRed, NSColor.systemBlue]
            gradient = NSGradient(colors: colors)
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            let colors = [NSColor.systemRed, NSColor.systemBlue]
            gradient = NSGradient(colors: colors)
        }
        
        override func draw(_ rect: NSRect) {
            super.draw(rect)
            
            // gradient at current angle
            gradient?.draw(in: rect, angle: currentAngle)
        }
        
        override func animateOneFrame() {
            super.animateOneFrame()
            
            // angle stuff
            currentAngle += angleStep
            if currentAngle > 360 {
                currentAngle -= 360
            }
            
            self.needsDisplay = true
        }
    
    }
