//
//  ConversionHelper.swift
//  Colorz
//
//  Created by user133536 on 11/26/17.
//  Copyright © 2017 Colorz. All rights reserved.
//

import Foundation
class ConversionHelper {
    //Properties
    
    //Methods
    func convertHexToRGB(hexValue: String) -> RGB {
        let endingRGB = RGB()
        
        print("this is the FIRST hexValue to come into the function: \(hexValue)")
        let red1 = hexValue[hexValue.startIndex]
        print("red1 = \(red1)")
        let red2 = hexValue[hexValue.index(after: hexValue.startIndex)]
        print("red2 = \(red2)")
        var index = hexValue.index(hexValue.startIndex, offsetBy: 2)
        let green1 = hexValue[index]
        print("green1 = \(green1)")
        index = hexValue.index(hexValue.startIndex, offsetBy: 3)
        let green2 = hexValue[index]
        print("green2 = \(green2)")
        index = hexValue.index(hexValue.startIndex, offsetBy: 4)
        let blue1 = hexValue[index]
        print("blue1 = \(blue1)")
        index = hexValue.index(hexValue.startIndex, offsetBy: 5)
        let blue2 = hexValue[index]
        print("blue2 = \(blue2)")
        
        let red = String(red1) + String(red2)
        let green = String(green1) + String(green2)
        let blue = String(blue1) + String(blue2)
        
        print("red = \(red)")
        print("green = \(green)")
        print("blue = \(blue)")
        
        endingRGB.red = Int(red, radix: 16)!
        endingRGB.green = Int(green, radix: 16)!
        endingRGB.blue = Int(blue, radix: 16)!
        
        print("red RGB = \(String(endingRGB.red))")
        print("green RGB = \(String(endingRGB.green))")
        print("blue = \(String(endingRGB.blue))")
        
        return endingRGB
    }
    
    func convertRGBToHSL(rgbValue: RGB) -> HSL {
        let startingRGB = rgbValue
        let endingHSL = HSL()
        
        let varR = (Float(startingRGB.red) / Float(255))
        let varG = (Float(startingRGB.green) / Float(255))
        let varB = (Float(startingRGB.blue) / Float(255))
        
        print("this is varR, and it's correct = \(String(varR))")
        print("this is varG, and it's correct = \(String(varG))")
        print("this is varB, and it's correct = \(String(varB))")
        
        let varMin = min(varR, varG, varB)
        let varMax = max(varR, varG, varB)
        let delMax = varMax - varMin
        
        print("this is varMin, correct = \(String(varMin))")
        print("this is varMax, correct = \(String(varMax))")
        print("this is delMax, correct = \(String(delMax))")
        
        endingHSL.lightness = (varMax + varMin) / Float(2)
        
        print("this is endingHSL.lightness, correct = \(String(endingHSL.lightness))")
        
        if endingHSL.lightness < 0.5 {
            endingHSL.saturation = delMax / (varMax + varMin)
            print("point 1: endingHSL.saturation = \(String(endingHSL.saturation))")
            
        }
        else {
            endingHSL.saturation = (Float(2) - varMax - varMin)
            print("point 2: endingHSL.saturation, correct = \(String(endingHSL.saturation))")
            
        }
        
        
        let delR = (((varMax - varR) / Float(6)) + (delMax / Float(2)) / delMax)
        let delG = (((varMax - varG) / Float(6)) + (delMax / Float(2)) / delMax)
        let delB = (((varMax - varB) / Float(6)) + (delMax / Float(2)) / delMax)
        
        print("this is delB = \(String(delB))")
        print("this is delG = \(String(delG))")
        print("this is delR = \(String(delR))")
        
        if varR == varMax {
            endingHSL.hue = delB - delG
            print("point1: endingHSL.hue = \(String(endingHSL.hue))")
        }
        else if varG == varMax {
            endingHSL.hue = 1.0/3.0 + delR - delB
            print("point2: endingHSL.hue = \(String(endingHSL.hue))")
        }
        else if varB == varMax {
            endingHSL.hue = 2.0/3.0 + delG - delR
            print("point3: endingHSL.hue = \(String(endingHSL.hue))")
        }
        
        if endingHSL.hue < 0 {endingHSL.hue += 1.0}
        if endingHSL.hue > 1 {endingHSL.hue -= 1.0}
        
        print("hue after conversion from RGB = \(String(endingHSL.hue))")
        print("saturation after conversion from RGB = \(String(endingHSL.saturation))")
        print("lightness after conversion from RGB = \(String(endingHSL.lightness))")
        
        return endingHSL
    }
    func convertHSLToRGB(_ hSLValue: HSL) -> RGB {
        let startingHSL = hSLValue
        let endingRGB = RGB()
        var var2: Float
        var var1: Float
        
        if (startingHSL.saturation == 0) {
            endingRGB.red = Int(startingHSL.lightness * 255.0)
            endingRGB.green = Int(startingHSL.lightness * 255.0)
            endingRGB.blue = Int(startingHSL.lightness * 255.0)
            
            print("I think I must be the color white!")
        }
        else {
            if (startingHSL.lightness < 0.5) { var2 = startingHSL.lightness * ( 1.0 + startingHSL.saturation) }
            else { var2 = ( startingHSL.lightness + startingHSL.saturation) - ( startingHSL.saturation * startingHSL.lightness) }
            
            var1 = 2.0 * startingHSL.lightness - var2
            
            endingRGB.red = Int(255.0 * hue2RGB( var1: var1, var2: var2, varH: Float(startingHSL.hue + (1.0/3.0)) ))
            endingRGB.green = Int(255.0 * hue2RGB( var1: var1, var2: var2, varH: Float(startingHSL.hue) ))
            endingRGB.blue = Int(255.0 * hue2RGB( var1: var1, var2: var2, varH: Float(startingHSL.hue - (1.0/3.0)) ))
        }
        
        
        
    return endingRGB
        
    }
    
    func hue2RGB(var1: Float, var2: Float, varH: Float) -> Float {
        var tempH: Float = varH
        if (varH < 0.0) { tempH = varH + 1.0
        }
        if (varH > 1.0) { tempH = varH - 1.0
        }
        if ( (6.0 * tempH) < 1.0 ) {return (var1 + (var2 - var1) * 6.0 * tempH)
        }
        if ( (2.0 * tempH) < 1.0) {return var2
        }
        if ( (3.0 * tempH) < 2.0) {return (var1 + (var2 - var1) * ( (2.0/3.0) - tempH) * 6.0)
        }
        return var1
    }
    
    
    
    func convertRGBToHex(rgbValue: RGB) -> String {
        let startingRGB = rgbValue
        var endingHex = String()
        
        let red = String(startingRGB.red, radix: 16)
        let green = String(startingRGB.green, radix: 16)
        let blue = String(startingRGB.blue, radix: 16)
        
        endingHex = red + green + blue
    return endingHex
    }
}
