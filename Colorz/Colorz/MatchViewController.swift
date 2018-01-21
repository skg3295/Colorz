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
    @IBOutlet weak var matchedColor1: UIImageView!
    @IBOutlet weak var matchedColor2: UIImageView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let conversionHelper = ConversionHelper()
        let matchMaker = MatchMaker()
        
        // Remove # from hexString
        hexString.removeFirst()
        print("\(hexString)")
        let pickedRGB = conversionHelper.convertHexToRGB(hexValue: hexString)
        pickedColor.backgroundColor = UIColor(red: CGFloat(pickedRGB.red)/255.0, green: CGFloat(pickedRGB.green)/255.0, blue: CGFloat(pickedRGB.blue)/255.0, alpha: 1.0)
        
        print("this is red \(pickedRGB.red)")
        print("this is green \(pickedRGB.green)")
        //print("this is )
        
        let pickedHSL1 = conversionHelper.convertRGBToHSL(rgbValue: pickedRGB)
        let matchedHSL1 = matchMaker.findComplementary(startHSL: pickedHSL1)
        let matchedRGB1 = conversionHelper.convertHSLToRGB(matchedHSL1)
        matchedColor1.backgroundColor = UIColor(red: CGFloat(matchedRGB1.red)/255.0, green: CGFloat(matchedRGB1.green)/255.0, blue: CGFloat(matchedRGB1.blue)/255.0, alpha: 1.0)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func snapIt(_ sender: UIButton) {
        
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, UIScreen.main.scale)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
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
