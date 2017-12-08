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

}
