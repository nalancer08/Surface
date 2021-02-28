//
//  ThirdControllerView.swift
//  SurfaceEngineDemo
//
//  Created by Erick Sanchez on 13/10/17.
//  Copyright © 2017 App Builders. All rights reserved.
//

import UIKit

class ThirdControllerView: SurfaceControllerView, TabBarControlDelagate {

    public init(controller:UIViewController) {
        super.init(controller: controller);
    }
    
    override public func onCreateView() {
        
        /** TabBar **/
        self.tabBar = TabBar(view: self, delegate: self, position: 2);
        
        let vi: UIView! = UIView();
        vi.backgroundColor = UIColor.blue;
        
        self.body.setView(view: vi);
        self.addView(view: vi);
        
        for _ in 1 ..< 29 {
            
            let pan = SfPanel();
            pan.setSize(width: -33.3333, height: -10).setMargin(top: 10, right: 0, bottom: 0, left: 0);
            
            let vis = UIView();
            let red:CGFloat = CGFloat(drand48())
            let green:CGFloat = CGFloat(drand48())
            let blue:CGFloat = CGFloat(drand48())
            vis.backgroundColor = UIColor(red:red, green: green, blue: blue, alpha: 1.0);
            
            pan.setView(view: vis);
            self.body.append(object: pan);
            self.addView(view: vis);
        }
        self.screen.update()
    }
    
    func onItemClick(position: Int, item: TabBarItem) {
        self.controller.present(item.getClazz(), animated: true) {}
    }
}
