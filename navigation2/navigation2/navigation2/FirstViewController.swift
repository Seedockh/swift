//
//  ViewController.swift
//  navigation2
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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextViewController = segue.destination as? NextViewController {
                
                nextViewController.name = segue.identifier
        }
    }
    
}

