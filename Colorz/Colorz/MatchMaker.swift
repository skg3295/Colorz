//
//  MatchMaker.swift
//  Colorz
//
//  Created by user133536 on 12/3/17.
//  Copyright © 2017 Colorz. All rights reserved.
//

import Foundation
class MatchMaker {
    
    func findComplementary(startHSL: HSL) -> HSL {
        
        print("startHLS.hue = \(String(startHSL.hue))")
        
        var hue2 = startHSL.hue + 0.5
        let endHSL = HSL()
        
        if hue2 > 1 {
            hue2 -= 1
        }
        endHSL.hue = hue2
        endHSL.saturation = startHSL.saturation
        endHSL.lightness = startHSL.lightness
        
        print("after match endHSL.hue = \(String(endHSL.hue))")
        print("after match endHSL.saturation = \(String(endHSL.saturation))")
        print("after match endHSL.lightness = \(String(endHSL.lightness))")
        
        return endHSL
    }

    func findTriadic(startHSL: HSL) -> (matchColor1: HSL, matrchColor2: HSL) {
        
        print("startHLS.hue = \(String(startHSL.hue))")
        
        let hue1 = abs((startHSL.hue + (1/3)) - 1)
        let hue2 = abs((startHSL.hue + (2/3)) - 1)
        
        let endHSL1 = HSL()
        let endHSL2 = HSL()
        
        endHSL1.hue = hue1
        endHSL1.saturation = startHSL.saturation
        endHSL1.lightness = startHSL.saturation
        
        endHSL2.hue = hue2
        endHSL2.saturation = startHSL.saturation
        endHSL2.lightness = startHSL.saturation
        
        
        return (endHSL1, endHSL2)
    }
    
    func findSplitComplementary(startHSL: HSL) -> (matchColor1: HSL, matrchColor2: HSL) {
        
        print("startHLS.hue = \(String(startHSL.hue))")
        
        let hue1 = abs((startHSL.hue + (150/360)) - 1)
        let hue2 = abs((startHSL.hue + (210/360)) - 1)
        
        let endHSL1 = HSL()
        let endHSL2 = HSL()
        
        endHSL1.hue = hue1
        endHSL1.saturation = startHSL.saturation
        endHSL1.lightness = startHSL.saturation
        
        endHSL2.hue = hue2
        endHSL2.saturation = startHSL.saturation
        endHSL2.lightness = startHSL.saturation
        
        
        return (endHSL1, endHSL2)
    }
}
