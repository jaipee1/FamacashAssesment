//
//  NavigationController.swift
//  FamacashAssesment
//
//  Created by jaipee on 10/07/20.
//  Copyright © 2020 JaiPrakashYadav. All rights reserved.
//


import UIKit


class NavigationController: UINavigationController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        interactivePopGestureRecognizer?.delegate = nil // Enable default iOS back swipe gesture


        navigationBar.isTranslucent = false
        
        navigationBar.tintColor = .white
        

    }
}
