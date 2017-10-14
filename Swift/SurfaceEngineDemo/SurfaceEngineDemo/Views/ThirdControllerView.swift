//
//  ThirdControllerView.swift
//  SurfaceEngineDemo
//
//  Created by Erick Sanchez on 13/10/17.
//  Copyright © 2017 App Builders. All rights reserved.
//

import UIKit

class ThirdControllerView: SurfaceControllerView {

    public init(controller:UIViewController) {
        super.init(controller: controller);
    }
    
    override public func onCreateView() {
        
        let vi: UIView! = UIView();
        vi.backgroundColor = UIColor.darkGray;
        
        self.screen.setView(view: vi);
        self.addView(view: vi);
        
        for i in 1 ..< 31 {
            
            let pan = SfPanel();
            pan.setSize(width: -33.3333, height: -10);
            
            let vis = UIView();
            let red:CGFloat = CGFloat(drand48())
            let green:CGFloat = CGFloat(drand48())
            let blue:CGFloat = CGFloat(drand48())
            vis.backgroundColor = UIColor(red:red, green: green, blue: blue, alpha: 1.0);
            
            pan.setView(view: vis);
            self.screen.append(object: pan);
            self.addView(view: vis);
        }
        self.screen.update()
    }
}
