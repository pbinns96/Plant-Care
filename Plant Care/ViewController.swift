//
//  ViewController.swift
//  Plant Care
//
//  Created by Payton Binns on 3/13/19.
//  Copyright © 2019 Payton Binns. All rights reserved.
//

import UIKit
import AVFoundation
import SafariServices
class ViewController: UIViewController {

    struct Plant {
        
        var baseTemperature = Int(50)
        //min temp:45 max temp: 80 acceptable temp range: 55-70
        var baseSunExposure = Int(50)
        //min sun: 30 max sun: 95 acceeptable sun range: 70-85
        var baseHydration = Int(50)
        //min hydration: <40 max hydration: >90 acceptable hydration range:60-80
       }
    var plantHealth = Plant ()
    var audioPlayer = AVAudioPlayer()
    @IBOutlet weak var heatButton: UIButton!
    @IBOutlet weak var acButton: UIButton!
    @IBOutlet weak var shadeButton: UIButton!
    @IBOutlet weak var sunButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let sound = Bundle.main.path(forResource: "waterSound", ofType: "mp3")
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }
        catch {
            print("error")
        }
    }

    @IBAction func waterButtonPressed(_ sender: Any) {
        plantHealth.baseHydration += 5
        print (plantHealth.baseHydration)
        heatButton.alpha = 0.0
        acButton.alpha = 0.0
        shadeButton.alpha = 0.0
        sunButton.alpha = 0.0
        dangerNotification ()
        plantDeath ()
        audioPlayer.play()
    }
    @IBAction func temperatureButtonPressed(_ sender: Any) {
        heatButton.alpha = 1.0
        acButton.alpha = 1.0
       
    }
    @IBAction func heatButtonPressed(_ sender: Any) {
        plantHealth.baseTemperature += 5
        heatButton.alpha = 0.0
        acButton.alpha = 0.0
        shadeButton.alpha = 0.0
        sunButton.alpha = 0.0
        dangerNotification()
        plantDeath()
         print (plantHealth.baseTemperature)
    }
    @IBAction func acButtonPressed(_ sender: Any) {
        plantHealth.baseTemperature -= 5
        heatButton.alpha = 0.0
        acButton.alpha = 0.0
        shadeButton.alpha = 0.0
        sunButton.alpha = 0.0
        dangerNotification()
        plantDeath()
    }
    @IBAction func sunlightButtonPressed(_ sender: Any) {
        shadeButton.alpha = 1.0
        sunButton.alpha = 1.0

    }
    @IBAction func shadeButtonPressed(_ sender: Any) {
        plantHealth.baseSunExposure -= 5
        plantHealth.baseTemperature -= 2
        heatButton.alpha = 0.0
        acButton.alpha = 0.0
        shadeButton.alpha = 0.0
        sunButton.alpha = 0.0
        dangerNotification()
        plantDeath()
    }
    @IBAction func sunButtonPressed(_ sender: Any) {
        plantHealth.baseSunExposure += 5
        plantHealth.baseTemperature += 2
        heatButton.alpha = 0.0
        acButton.alpha = 0.0
        shadeButton.alpha = 0.0
        sunButton.alpha = 0.0
        dangerNotification()
        plantDeath()
    }
    func alert () {
        let alertDanger = UIAlertController (title:"ALERT" , message: "This action may be harmful to the plant.", preferredStyle: UIAlertController.Style.alert)
        alertDanger.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: nil))
        present (alertDanger, animated: true, completion: nil)}
    func dangerNotification () {
    if plantHealth.baseHydration >= 80 {
            alert ()
        }
        if plantHealth.baseHydration <= 45 {
            alert()
        }
        if plantHealth.baseSunExposure >= 85 {
            alert ()
        }
        if plantHealth.baseSunExposure <= 45 {
            alert()
        }
        if plantHealth.baseTemperature >= 75 {
            alert ()
        }
        if plantHealth.baseTemperature <= 48 {
            alert()
        }
    }
    func plantDeath () {
        if plantHealth.baseHydration >= 90 {
            performSegue(withIdentifier: "gameOverSegue", sender: nil)
        }
        if plantHealth.baseHydration <= 40 {
           performSegue(withIdentifier: "gameOverSegue", sender: nil)
        }
        if plantHealth.baseSunExposure >= 95 {
            performSegue(withIdentifier: "gameOverSegue", sender: nil)
        }
        if plantHealth.baseSunExposure <= 30 {
           performSegue(withIdentifier: "gameOverSegue", sender: nil)
        }
        if plantHealth.baseTemperature >= 80 {
            performSegue(withIdentifier: "gameOverSegue", sender: nil)
        }
        if plantHealth.baseTemperature <= 45 {
            performSegue(withIdentifier: "gameOverSegue", sender: nil)
        }
        
    }
var urlLink = "https://www.ftd.com/blog/share/orchid-care"
    
    @IBAction func learnMorePressed(_ sender: Any) {
        let myUrl = URL (string: urlLink)
        let searchView = SFSafariViewController(url: myUrl!)
        present(searchView, animated: true)
    }
}
class ViewControllerTwo: ViewController {
    @IBAction func startOverPressed(_ sender: Any) {
         plantHealth.baseTemperature = 50
         plantHealth.baseSunExposure = 50
         plantHealth.baseHydration = 50
    }
    
}

