//
//  TabBar.swift
//  SurfaceEngineDemo
//
//  Created by Erick Sanchez on 13/10/17.
//  Copyright © 2017 App Builders. All rights reserved.
//

import UIKit

class TabBar: TabBarControl {
    
    override init(view: SurfaceControllerView, delegate: TabBarControlDelagate, position: Int) {
        super.init(view: view, delegate: delegate, position: position);
    }
    
    override func setTabs() {
        
        self.tabBarItems = NSMutableArray();
        
        // Create elements
        self.tabBarItems.add(TabBarItem.createBasicItem(clazz: ViewController(), sequence: "Home", background: UIColor.cyan, backgroundSelected: UIColor.green));
        self.tabBarItems.add(TabBarItem.createBasicItem(clazz: SecondController(), sequence: "Add", background: UIColor.cyan, backgroundSelected: UIColor.green));
        self.tabBarItems.add(TabBarItem.createBasicItem(clazz: ThirdController(), sequence: "Game", background: UIColor.cyan, backgroundSelected: UIColor.green));
        self.tabBarItems.add(TabBarItem.createBasicItem(clazz: ThirdController(), sequence: "Game", background: UIColor.cyan, backgroundSelected: UIColor.green));
        //self.tabBarItems.add(TabBarItem.createBasicItem(clazz: ThirdController(), sequence: "Game", background: UIColor.cyan, backgroundSelected: UIColor.green));
        //self.tabBarItems.add(TabBarItem.createBasicItem(clazz: ViewController(), sequence: "Add", background: UIColor.cyan, backgroundSelected: UIColor.green));
    }

}
