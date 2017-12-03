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
    override func viewDidLoad() {
        super.viewDidLoad()
        //pickedColor.backgroundColor = UIColor(red: <#T##CGFloat#>, green: <#T##CGFloat#>, blue: <#T##CGFloat#>, alpha: <#T##CGFloat#>)
        // Do any additional setup after loading the view.
        
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
