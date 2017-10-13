//
//  ViewControllerView.swift
//  SurfaceEngineDemo
//
//  Created by Erick Sanchez on 12/10/17.
//  Copyright © 2017 App Builders. All rights reserved.
//

import Foundation
import UIKit

class ViewControllerView : SurfaceControllerView {
    
    public init(controller:UIViewController) {
        super.init(controller: controller);
    }
    
    override public func onCreateView() {
        
        print("Lalitas locas, screen ::: ", self.screen.getKey());
        
        let vi: UIView! = UIView();
        vi.backgroundColor = UIColor.blue;
        
        self.screen.setView(view: vi);
        self.addView(view: vi);
        
        for i in 1 ..< 20 {
            
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
    
    /*public init(controller:UIViewController) {
        super.init(controller: controller, delegate: self);
    }
    
    func onCreateView() {
        //
        print("Hola since abstract");
        
        print("LLAVE LOCA :::", self.screen.getKey());
        
    }*/
}
