//
//  CharacterViewController.swift
//  firstexo
//
//  Created by efrei on 12/02/2019.
//  Copyright © 2019 efrei. All rights reserved.
//

import UIKit

class CharacterViewController: UIViewController {
    var model: Character?
    var interrupt: Bool = false
    @IBOutlet var presentationLabel: UILabel!
    @IBOutlet var buttonLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.model = Character(name: "Jean-Louis", role: CharacterRole.healer)
        self.buttonLabel.setTitle("Display", for: .normal)
    }
    
    @IBAction func presentAction() {
        switch self.interrupt {
        case false: self.displayText()
        case true: self.remove()
        }
    }
    
    func displayText() {
        self.presentationLabel.numberOfLines = 5;
        self.presentationLabel.text = self.model?.introduce()
        self.buttonLabel.setTitle("Erase", for: .normal)
        self.interrupt = true
    }
    
    func remove() {
        self.presentationLabel.text = ""
        self.buttonLabel.setTitle("Display", for: .normal)
        self.interrupt = false
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
