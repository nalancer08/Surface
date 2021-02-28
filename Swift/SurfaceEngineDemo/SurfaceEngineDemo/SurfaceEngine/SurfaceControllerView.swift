//
//  SurfaceControllerView.swift
//  SurfaceEngineDemo
//
//  Created by Erick Sanchez on 12/10/17.
//  Copyright © 2017 App Builders. All rights reserved.
//

import UIKit

protocol SurfaceControllerViewDelegate {
    
    func onCreateView();
}

public class SurfaceControllerView {
    
    var delegate: SurfaceControllerViewDelegate! = nil;
    var controller: UIViewController!;
    var screen: SfPanel!;
    var body: SfPanel!;
    
    var tabBar: TabBarControl!;
    
    /** Handle scrolls **/
    var scrolls:NSMutableDictionary!;
    
    public init(controller:UIViewController, fullScreen:Bool = false) {
        
        self.controller = controller;
        //self.delegate = delegate;
        self.initalize(fullScreen: fullScreen);
    }
    
    func initalize(fullScreen:Bool = false) {
        
        // Make it full screen
        if (fullScreen) {}
        
        // Creating and sizing the root panel
        self.screen = SfPanel();
        self.screen.setSize(width: -100, height: -100);
        self.screen.setKey(key: "screen");
        self.onCreateView();
        
        self.scrolls = NSMutableDictionary();
    }
    
    func makeItScrollable(panel: SfPanel, key:String) -> SfPanel {
        
        let view: UIScrollView! = UIScrollView();
        panel.scrollHost = true;
        panel.fixScroll = true;
        panel.setKey(key: key);
        //panel.setView(view: UIScrollView);
        
        self.scrolls.setValue(view, forKey: key);
        self.addView(view: view);
        return panel;
    }
    
    public func addScroll(key:String, view:UIView) {
        
        let scroll:UIScrollView! =  self.scrolls.object(forKey: key) as! UIScrollView;
        scroll.addSubview(view);
    }
    
    public func addView(view:UIView) {
        self.controller.view.addSubview(view);
    }
    
    public func onCreateView() {}
    
    func BG(_ block: @escaping ()->Void) {
        DispatchQueue.global(qos: .default).async(execute: block)
    }
    
    func UI(_ block: @escaping ()->Void) {
        DispatchQueue.main.async(execute: block)
    }
}
