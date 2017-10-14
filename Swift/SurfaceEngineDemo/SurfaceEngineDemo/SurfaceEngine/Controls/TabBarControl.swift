//
//  TabBarControl.swift
//  SurfaceEngineDemo
//
//  Created by Erick Sanchez on 13/10/17.
//  Copyright © 2017 App Builders. All rights reserved.
//

import UIKit

protocol TabBarControlDelagate {
    
    func onItemClick(position:Int, item:TabBarItem);
}

class TabBarControl: SfControl {
    
    private var tabDelegate:TabBarControlDelagate!;
    private var tabsNumber:Int! = 0;
    private var tabBarHeigth:Float! = 10.0;
    private var selectedHeight:Bool! = true;
    
    public var tabBar:SfPanel! = nil;
    internal var currentTabPosition:Int! = -1;
    internal var tabBarItems:NSMutableArray! = nil;
    
    /** For custom click **/
    private var currentClickPosition:Int!;
    private var currentClickItem:TabBarItem!;
 
    /** Variables for current tab **/
    internal var currentTabHeight:Float!;
    
    init(view:SurfaceControllerView, delegate:TabBarControlDelagate, position:Int) {
        
        super.init(view: view);
        self.tabDelegate = delegate;
        self.initialize(posiiton: position);
        self.create();
        
    }
    
    private func initialize(posiiton:Int) {
        
        self.currentTabHeight = self.tabBarHeigth;
        self.currentTabPosition = posiiton;
        self.setTabs();
    }
    
    public func setTabBarHeight(height:Float) {
        self.tabBarHeigth = height;
    }
    
    public func setSelectedHeight(state:Bool) {
        self.selectedHeight = state;
    }
    
    public func setCurrentTabPosition(position:Int) -> TabBarControl {
        
        self.currentTabPosition = position;
        return self;
    }
    
    public func setCurrentTabHeight(height:Float) {
        self.currentTabHeight = height;
    }
    
    public func getTabBar() -> SfPanel {
        return self.tabBar;
    }
    
    private func create() -> SfPanel {
        
        if (self.tabBarItems != nil) {
            
            self.tabsNumber = self.tabBarItems.count;
            self.tabBar = SfPanel().setSize(width: -100, height: -self.tabBarHeigth);
            let tabHeight:Float! = selectedHeight! ? 100 : 100;
            let tabMarginTop:Float! = selectedHeight! ? 0 : 0;
            
            if (self.view.body == nil) {
                self.view.body = SfPanel().setSize(width: -100, height: -(100-self.tabBarHeigth));
            }
            
            for i in 0 ..< tabsNumber {
                
                let item = self.tabBarItems.object(at: i) as! TabBarItem;
                var tab = SfPanel();
                let view = item.getView();
                let selected = item.getSelectedView();
                self.currentClickPosition = i;
                self.currentClickItem = item;
                
                if (item.getPanel() == nil) { // New panel
                    if (view != nil) {
                        
                        tab.setSize(width: -(100/Float(self.tabsNumber)), height: -tabHeight).setMargin(top: tabMarginTop, right: 0, bottom: 0, left: 0);
                        if (self.currentTabPosition == i) {
                            tab.setSize(width: -(100/Float(self.tabsNumber)), height: -100).setMargin(top: 0, right: 0, bottom: 0, left: 0);
                            if (selected != nil) {
                                tab.setView(view: selected);
                                self.view.addView(view: selected);
                            }
                        } else {
                            item.setPanel(panel: tab);
                            let tap = UITapGestureRecognizer(target: self, action: #selector(tapped(item:)));
                            view.tag = i;
                            view.addGestureRecognizer(tap);
                            tab.setView(view: view);
                            self.view.addView(view: view);
                        }
                        self.tabBar.append(object: tab);
                    }
                } else {
                    if (self.currentTabPosition == i) {
                        tab = (item.getSelectedPanel() != nil) ? item.getSelectedPanel() : item.getPanel()!;
                        tab.setSize(width: -(100/Float(self.tabsNumber)), height: -100).setMargin(top: 0, right: 0, bottom: 0, left: 0);
                        self.view.addView(view: tab.getView());
                    } else {
                        tab = item.getPanel()!;
                        tab.setSize(width: -(100/Float(self.tabsNumber)), height: -tabHeight).setMargin(top: tabMarginTop, right: 0, bottom: 0, left: 0);
                        let tap = UITapGestureRecognizer(target: self, action: #selector(tapped(item:)));
                        tab.getView().tag = i;
                        tab.getView().addGestureRecognizer(tap);
                        self.view.addView(view: tab.getView());
                    }
                    self.tabBar.append(object: tab);
                }
            }
            self.view.screen.append(object: self.view.body);
            self.view.screen.append(object: self.tabBar);
            self.view.screen.update();
        }
        return self.view.body;
    }
    
    @objc public func tapped(item : AnyObject) {
        
        let position = item.view!.tag;
        self.tabDelegate!.onItemClick(position: position, item: self.tabBarItems.object(at: position) as! TabBarItem);
    }
    
    /**
     * Abstract method simulation
     **/
    public func setTabs() {}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
