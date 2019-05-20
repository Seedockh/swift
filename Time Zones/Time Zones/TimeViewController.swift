//
//  TimeViewController.swift
//  Time Zones
//
//  Created by Pierre-Yves Touzain on 31/03/2018.
//  Copyright © 2018 TYP Studio. All rights reserved.
//

import UIKit

class TimeViewController: UIViewController {

    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    public var city: City?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityName.text = city?.name
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        let timeZone = TimeZone(identifier: city?.identifier ?? "")
        dateFormatter.timeZone = timeZone
        
        let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.timeLabel.text = dateFormatter.string(from: Date())
        }
        timer.fire()
    }
}
