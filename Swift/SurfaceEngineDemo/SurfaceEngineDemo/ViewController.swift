//
//  ViewController.swift
//  SurfaceEngineDemo
//
//  Created by Erick Sanchez on 12/10/17.
//  Copyright © 2017 App Builders. All rights reserved.
//

import UIKit
import SurfaceEngine

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let panel: SfPanel! = SfPanel();
        panel.setSize(width: -100, height: -40);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

