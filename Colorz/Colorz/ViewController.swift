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
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        neatColorPicker = ChromaColorPicker(frame: CGRect(x: 0, y: view.frame.height/2.5, width: view.frame.width, height: 300))
        
        view.addSubview(neatColorPicker)
        
        neatColorPicker.padding = 0
        neatColorPicker.hexLabel.isHidden = false
        
        neatColorPicker.layout()
        
        //let margins = view.layoutMarginsGuide
        
        // Pin the leading edge of myView to the margin's leading edge
        //neatColorPicker.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        
        // Pin the trailing edge of myView to the margin's trailing edge
        //neatColorPicker.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true

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

