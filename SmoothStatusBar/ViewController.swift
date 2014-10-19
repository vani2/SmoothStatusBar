//
//  ViewController.swift
//  SmoothStatusBar
//
//  Created by Ivan Vavilov on 19/10/14.
//  Copyright (c) 2014 Ivan Vavilov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var xSwitch: UISwitch!
    @IBOutlet weak var ySwitch: UISwitch!
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if let statusBarWindow = UIApplication.sharedApplication().statusBarWindow() {
            var frame = statusBarWindow.frame
            
            if ySwitch.on {
                let yOffset = scrollView.contentOffset.y
                frame.origin.y = yOffset > 0 ? 0 : yOffset
            }
            
            if xSwitch.on {
                let xOffset = scrollView.contentOffset.x
                frame.origin.x = xOffset > 0 ? 0 : -xOffset
            }
            
            statusBarWindow.frame = frame
        }
    }
}

