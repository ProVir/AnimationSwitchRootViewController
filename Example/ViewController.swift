//
//  ViewController.swift
//  Example
//
//  Created by Короткий Виталий on 29.10.17.
//  Copyright © 2017 ProVir. All rights reserved.
//

import UIKit
import AnimationSwitchRootViewController


class ViewController: UIViewController {
    
    var indexVC = 0
    let colors = [UIColor.white, UIColor.green, UIColor.red, UIColor.cyan, UIColor.darkGray]
    
    var isSlow = false

    
    @IBOutlet weak var slowSwitch: UISwitch!
    @IBOutlet weak var inAnimationSwitch: UISwitch!
    @IBOutlet weak var outAnimationSwitch: UISwitch!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bgColor = colors[indexVC%colors.count]
        view.backgroundColor = bgColor
        
        slowSwitch.isOn = isSlow
    }


    
    @IBAction func actionSwitch(_ sender: UIButton) {
        guard let newVC = storyboard?.instantiateInitialViewController() as? ViewController else {
            return
        }
        
        isSlow = slowSwitch.isOn
        
        newVC.indexVC = indexVC+1
        newVC.isSlow = isSlow
        
        guard let window = UIApplication.sharedWindow() else {
            return
        }
        
        let tag = sender.tag
        let direction:UIWindow.TransitionDirection
        
        switch tag%10 {
        case 1: direction = .fromRight
        case 2: direction = .fromLeft
        case 3: direction = .fromTop
        case 4: direction = .fromBottom
        default: return
        }
        
        
        
        let duration:CGFloat = isSlow ? 0.8 : 0.4
        
        if tag < 10 {
            window.switchRootViewControllerPushTransition(to: newVC, direction: direction, duration: duration, backgroundColor: view.backgroundColor)
        } else {
            window.switchRootViewControllerManuallyMove(to: newVC,
                                                        direction: direction,
                                                        inAnimation: inAnimationSwitch.isOn,
                                                        outAnimation: outAnimationSwitch.isOn,
                                                        duration: duration)
        }
    }

}

