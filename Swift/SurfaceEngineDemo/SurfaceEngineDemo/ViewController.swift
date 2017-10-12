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
        
        let vi: UIView! = UIView();
        vi.backgroundColor = UIColor.blue;
        
        let panel: SfPanel! = SfPanel();
        panel.setSize(width: -100, height: -100).setView(view: vi);
        
        self.view.addSubview(vi);
        
        for i in 1 ..< 20 {
            
            let pan = SfPanel();
            pan.setSize(width: -33.3333, height: -10);
            
            let vis = UIView();
            let red:CGFloat = CGFloat(drand48())
            let green:CGFloat = CGFloat(drand48())
            let blue:CGFloat = CGFloat(drand48())
            vis.backgroundColor = UIColor(red:red, green: green, blue: blue, alpha: 1.0);
            
            pan.setView(view: vis);
            panel.append(object: pan);
            
            self.view.addSubview(vis);
        }
        
        panel.update()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

