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
        print("INSIDE findTriadic")
        print("startHLS.hue = \(String(startHSL.hue))")
        print("startHLS.saturation = \(String(startHSL.saturation))")
        print("startHLS.lightness = \(String(startHSL.lightness))")
        
        let hue1 = abs((startHSL.hue + (1.0/3.0)) - 1.0)
        let hue2 = abs((startHSL.hue + (2.0/3.0)) - 1.0)
        print("hue1 = \(String(hue1))")
    
        let endHSL1 = HSL()
        let endHSL2 = HSL()
        
        endHSL1.hue = hue1
        endHSL1.saturation = startHSL.saturation
        endHSL1.lightness = startHSL.lightness
        
        endHSL2.hue = hue2
        endHSL2.saturation = startHSL.saturation
        endHSL2.lightness = startHSL.lightness
        
        
        return (endHSL1, endHSL2)
    }
    
    func findSplitComplementary(startHSL: HSL) -> (matchColor1: HSL, matrchColor2: HSL) {
        print("INSIDE findSplitComplementary")
        print("startHSL.hue = \(String(startHSL.hue))")
        print("startHSL.saturation = \(String(startHSL.saturation))")
        print("startHSL.lightness = \(String(startHSL.lightness))")
        
        let hue1 = abs((startHSL.hue + (150.0/360.0)) - 1.0)
        let hue2 = abs((startHSL.hue + (210.0/360.0)) - 1.0)
        print("hue1 = \(String(hue1))")
        print("hue2 = \(String(hue2))")
        
        
        let endHSL1 = HSL()
        let endHSL2 = HSL()
        
        endHSL1.hue = hue1
        endHSL1.saturation = startHSL.saturation
        endHSL1.lightness = startHSL.lightness
        
        endHSL2.hue = hue2
        endHSL2.saturation = startHSL.saturation
        endHSL2.lightness = startHSL.lightness
        
        
        return (endHSL1, endHSL2)
    }
}
