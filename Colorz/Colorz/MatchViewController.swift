//
//  MatchViewController.swift
//  Colorz
//
//  Created by Leela I on 12/2/17.
//  Copyright © 2017 Colorz. All rights reserved.
//

import UIKit

class MatchViewController: UIViewController {
    //Mark: Properties
    var hexString: String = ""
    @IBOutlet weak var pickedColor: UIImageView!
    @IBOutlet weak var pickedColor2: UIImageView!
    @IBOutlet weak var pickedColor3: UIImageView!
    @IBOutlet weak var pickedColor4: UIImageView!
    @IBOutlet weak var matchedColor1: UIImageView!
    @IBOutlet weak var matchedColor2: UIImageView!
    @IBOutlet weak var matchedColor3: UIImageView!
    @IBOutlet weak var matchedColor4: UIImageView!
    @IBOutlet weak var matchedColor5: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let conversionHelper = ConversionHelper()
        let matchMaker = MatchMaker()
        
        // Remove # from hexString
        hexString.removeFirst()
        print("\(hexString)")
        let pickedRGB = conversionHelper.convertHexToRGB(hexValue: hexString)
        let color = UIColor(red: CGFloat(pickedRGB.red)/255.0, green: CGFloat(pickedRGB.green)/255.0, blue: CGFloat(pickedRGB.blue)/255.0, alpha: 1.0)
        
        pickedColor.backgroundColor = color
        pickedColor2.backgroundColor = color
        pickedColor3.backgroundColor = color
        pickedColor4.backgroundColor = color
       
        print("this is red \(pickedRGB.red)")
        print("this is green \(pickedRGB.green)")
        //print("this is )
        
        // complementary
        let pickedHSL = conversionHelper.convertRGBToHSL(rgbValue: pickedRGB)
        let matchedHSL1 = matchMaker.findComplementary(startHSL: pickedHSL)
        let matchedRGB1 = conversionHelper.convertHSLToRGB(matchedHSL1)
        matchedColor1.backgroundColor = UIColor(red: CGFloat(matchedRGB1.red)/255.0, green: CGFloat(matchedRGB1.green)/255.0, blue: CGFloat(matchedRGB1.blue)/255.0, alpha: 1.0)
        
        // split complementary
        let (matchedHSL2, matchedHSL3) = matchMaker.findSplitComplementary(startHSL: pickedHSL)
        let matchedRGB2 = conversionHelper.convertHSLToRGB(matchedHSL2)
        let matchedRGB3 = conversionHelper.convertHSLToRGB(matchedHSL3)
        matchedColor2.backgroundColor = UIColor(red: CGFloat(matchedRGB2.red)/255.0, green: CGFloat(matchedRGB2.green)/255.0, blue: CGFloat(matchedRGB2.blue)/255.0, alpha: 1.0)
        matchedColor3.backgroundColor = UIColor(red: CGFloat(matchedRGB3.red)/255.0, green: CGFloat(matchedRGB3.green)/255.0, blue: CGFloat(matchedRGB3.blue)/255.0, alpha: 1.0)
        
        // triadic
        let (matchedHSL4, matchedHSL5) = matchMaker.findTriadic(startHSL: pickedHSL)
        let matchedRGB4 = conversionHelper.convertHSLToRGB(matchedHSL4)
        let matchedRGB5 = conversionHelper.convertHSLToRGB(matchedHSL5)
        matchedColor4.backgroundColor = UIColor(red: CGFloat(matchedRGB4.red)/255.0, green: CGFloat(matchedRGB4.green)/255.0, blue: CGFloat(matchedRGB4.blue)/255.0, alpha: 1.0)
        matchedColor5.backgroundColor = UIColor(red: CGFloat(matchedRGB5.red)/255.0, green: CGFloat(matchedRGB5.green)/255.0, blue: CGFloat(matchedRGB5.blue)/255.0, alpha: 1.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
