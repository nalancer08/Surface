//
//  ViewController.swift
//  SurfaceEngineDemo
//
//  Created by Erick Sanchez on 12/10/17.
//  Copyright © 2017 App Builders. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white;
        
        let _: ViewControllerView! =  ViewControllerView(controller: self);
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

