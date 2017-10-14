//
//  TabBarItem.swift
//  SurfaceEngineDemo
//
//  Created by Erick Sanchez on 13/10/17.
//  Copyright © 2017 App Builders. All rights reserved.
//

import UIKit

public class TabBarItem {
    
    internal var view:UIView!;
    internal var selectedView:UIView!;
    internal var panel:SfPanel?;
    internal var selectedPanel:SfPanel!;
    internal var clazz:UIViewController!;
    
    public init() {
        
        self.view = nil;
        self.selectedView = nil;
        self.panel = nil;
        self.selectedPanel = nil;
        self.clazz = UIViewController();
    }
    
    public func setView(view:UIView) {
        self.view = view;
    }
    
    public func getView() -> UIView {
        return self.view!;
    }
    
    public func setSelectedView(view:UIView) {
        self.selectedView = view;
    }
    
    public func getSelectedView() -> UIView {
        return self.selectedView!;
    }
    
    public func setPanel(panel:SfPanel) {
        self.panel = panel;
    }
    
    public func getPanel() -> SfPanel? {
        return self.panel;
    }
    
    public func setSelectedPanel(panel:SfPanel) {
        self.selectedPanel = panel;
    }
    
    public func getSelectedPanel() -> SfPanel {
        return self.selectedPanel!;
    }
    
    public func setClazz(clazz:UIViewController) {
        self.clazz = clazz;
    }
    
    public func getClazz() -> UIViewController {
        return self.clazz;
    }
    
    public static func createCustomItem(clazz:UIViewController, panel:SfPanel, selectedPanel:SfPanel) -> TabBarItem {
    
        let item = TabBarItem();
        item.setClazz(clazz: clazz);
        item.setPanel(panel: panel);
        item.setSelectedPanel(panel: selectedPanel);
        return item;
    }
    
    public static func createBasicItem(clazz:UIViewController, sequence:String, background:UIColor, backgroundSelected:UIColor) -> TabBarItem {
        
        let item = TabBarItem();
        
        let button = UIButton();
        button.backgroundColor = background;
        button.setTitle(sequence, for: UIControlState.normal);
        button.setTitleColor(UIColor.black, for: UIControlState.normal);
        
        let buttonSelected = UIButton();
        buttonSelected.backgroundColor = backgroundSelected;
        buttonSelected.setTitle(sequence, for: UIControlState.normal);
        
        item.setView(view: button);
        item.setSelectedView(view: buttonSelected);
        item.setClazz(clazz: clazz);
        
        return item;
    }
    
    public static func createImageItem(clazz:UIViewController, imageId:UIImage, imageSelectedId:UIImage) -> TabBarItem {
        
        let item = TabBarItem();
        
        let image = UIImageView(image: imageId);
        let imageSelected = UIImageView(image: imageSelectedId);
        
        item.setView(view: image);
        item.setSelectedView(view: imageSelected);
        item.setClazz(clazz: clazz);
        return item;
    }
}
