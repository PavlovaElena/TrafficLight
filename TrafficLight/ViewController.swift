//
//  ViewController.swift
//  TrafficLight
//
//  Created by Елена Павлова on 18.05.2022.
//

import UIKit

enum CurrentLight {
    case trafficLightOff, redLight, yellowLight, greenLight
}

class ViewController: UIViewController {

    @IBOutlet weak var redLight: UIView!
    @IBOutlet weak var yellowLight: UIView!
    @IBOutlet weak var greenLight: UIView!
    
    @IBOutlet weak var startButton: UIButton!
    
    private var currentLight = CurrentLight.trafficLightOff
    
    private let lightIsOn: CGFloat = 1
    private let lightIsOff: CGFloat = 0.4

    override func viewDidLoad() {
        super.viewDidLoad()
        
        redLight.alpha = lightIsOff
        yellowLight.alpha = lightIsOff
        greenLight.alpha = lightIsOff
        
        startButton.layer.cornerRadius = 10
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //In viewWillLayoutSubviews view sizes from the storyboard (IOS 15.5), so the rounding is here
        redLight.layer.cornerRadius = redLight.frame.width / 2
        yellowLight.layer.cornerRadius = yellowLight.frame.width / 2
        greenLight.layer.cornerRadius = greenLight.frame.width / 2
    }
    
    @IBAction func startButtonPressed() {
        switch currentLight {
        case .trafficLightOff:
            currentLight = .redLight
            redLight.alpha = lightIsOn
            startButton.setTitle("NEXT", for: .normal)
        case .redLight:
            currentLight = .yellowLight
            redLight.alpha = lightIsOff
            yellowLight.alpha = lightIsOn
        case .yellowLight:
            currentLight = .greenLight
            yellowLight.alpha = lightIsOff
            greenLight.alpha = lightIsOn
        case .greenLight:
            currentLight = .trafficLightOff
            greenLight.alpha = lightIsOff
            startButton.setTitle("START", for: .normal)
        }
    }
}
