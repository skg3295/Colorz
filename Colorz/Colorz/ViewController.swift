//
//  ViewController.swift
//  Colorz
//
//  Created by Madhu Gohil on 11/19/17.
//  Copyright © 2017 Colorz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Properties
    var neatColorPicker: ChromaColorPicker = ChromaColorPicker()
    
    override func viewDidLoad() {
        
        let conversionItem = ConversionHelper()
        let matcher = MatchMaker()
        let startHex = "79ff5b"
        
        let startRGB = conversionItem.convertHexToRGB(hexValue: startHex)
        let startHSL = conversionItem.convertRGBToHSL(rgbValue: startRGB)
        
        let complementaryHSL = matcher.findComplementary(startHSL: startHSL)
        
        let complmentaryRGB = conversionItem.convertHSLToRGB(complementaryHSL)
        let finalHex = conversionItem.convertRGBToHex(rgbValue: complmentaryRGB)
        
        print("complementary hex value = \(finalHex)")
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        neatColorPicker = ChromaColorPicker(frame: CGRect(x: view.frame.width/9, y: view.frame.height/3, width: 300, height: 300))
        view.addSubview(neatColorPicker)
        
        neatColorPicker.padding = 0
        neatColorPicker.hexLabel.isHidden = false
        
        neatColorPicker.layout()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonFindMatchesClicked(_ sender: Any) {
        let matchVC = storyboard?.instantiateViewController(withIdentifier: "Matcher") as! MatchViewController
        matchVC.hexString = neatColorPicker.hexLabel.text!
        navigationController?.pushViewController(matchVC, animated: true)
    }
    
}

