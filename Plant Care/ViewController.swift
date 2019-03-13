//
//  ViewController.swift
//  Plant Care
//
//  Created by Payton Binns on 3/13/19.
//  Copyright © 2019 Payton Binns. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    struct Plant {
        var isDead = Bool(false)
        //all 3 areas need to be at low/high end of range or 1 area needs to be over/under max/min
        var isDehydrated = Bool(false)
        var isOverwatered = Bool(false)
        var isTooHot = Bool(false)
        var isTooCold = Bool(false)
        var tooMuchSun = Bool(false)
        var notEnoughSun = Bool(false)
        var baseTemperature = Int(0)
        //min temp: max temp: acceptable temp range:
        var baseSunExposure = Int(0)
        //min sun: max sun: acceeptable sun range:
        var baseHydration = Int(0)
        //min hydration: max hydration: acceptable hydration range:
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

