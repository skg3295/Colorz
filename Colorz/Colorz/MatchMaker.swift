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
        var hue2 = startHSL.hue + 180
        let endHSL = HSL()
        
        if hue2 > 360 {
            hue2 -= 360
        }
        endHSL.hue = hue2
        endHSL.saturation = startHSL.saturation
        endHSL.lightness = startHSL.lightness
        return endHSL
    }
}
