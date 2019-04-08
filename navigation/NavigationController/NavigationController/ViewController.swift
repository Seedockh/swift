//
//  ViewController.swift
//  NavigationController
//
//  Created by efrei on 08/04/2019.
//  Copyright © 2019 efrei. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func pushNextController() {
        print("Coucou")
        // Instantiate new view controller
        let secondViewController = UIStoryboard(name:"Main",bundle:nil).instantiateViewController(withIdentifier: "2")
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }

}

