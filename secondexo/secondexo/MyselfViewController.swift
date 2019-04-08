//
//  MyselfViewController.swift
//  secondexo
//
//  Created by efrei on 13/02/2019.
//  Copyright © 2019 efrei. All rights reserved.
//

import UIKit

class MyselfViewController: UIViewController {
    @IBOutlet var presentationLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func presentAction() {
        presentationLabel.text = "Complètement bonsoir Natachatte, moi c'est Jean-Guillaume."
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
