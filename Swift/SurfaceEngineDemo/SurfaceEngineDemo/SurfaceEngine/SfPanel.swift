//
//  SfPanel.swift
//  SurfaceEngine
//
//  Created by Erick Sanchez on 11/10/17.
//  Copyright © 2017 App Builders. All rights reserved.
//

import Foundation
import UIKit

public class SfPanel {
    
    public static let SF_POSITION_RELATIVE: Int! = 0;
    public static let SF_POSITION_FIXED: Int! = 1;
    
    public static let SF_ALIGMENT_LEFT: Int! = 0;
    public static let SF_ALIGMENT_CENTER: Int! = 1;
    public static let SF_ALIGMENT_RIGHT: Int! = 2;
    
    public static let SF_UNSET: Float! = -9999;
    
    private var size: SfSize!;
    private var frame: SfRect!;
    private var origin: SfBox!;
    private var margin: SfBox!;
    private var padding: SfBox!;
    private var zIndex: Int!;
    private var postion: Int!;
    private var aligment: Int!;
    private var visible: Bool!;
    private var parent: SfPanel!;
    private var firstChild: SfPanel!;
    private var lastChild: SfPanel!;
    private var prev: SfPanel!;
    private var next: SfPanel!;
    private var view: UIView!;
    private var key: String!;
    private var scrollHeight: Float!;
    internal var scrollHost: Bool!;
    internal var fixScroll: Bool!;
    private var line: Int!;
    
    public init() {
        
        self.size = SfSize();
        self.frame = SfRect();
        self.origin = SfBox();
        self.margin = SfBox();
        self.padding = SfBox();
        self.postion = SfPanel.SF_POSITION_RELATIVE;
        self.aligment = SfPanel.SF_ALIGMENT_CENTER;
        self.visible = true;
        self.zIndex = 0;
        self.parent = nil;
        self.firstChild = nil;
        self.lastChild = nil;
        self.prev = nil;
        self.next = nil;
        self.view = nil;
        self.key = "";
        self.line = 0;
        self.scrollHeight = 0;
        self.scrollHost = false;
        self.fixScroll = false;
    }
    
    public func setSize(width:Float, height:Float) -> SfPanel {
        
        self.size.setSize(width: width, height: height);
        return self;
    }
    
    public func setPosition(position:Int) -> SfPanel {
        
        self.postion = position;
        return self;
    }
    
    public func setAligment(aligment:Int) -> SfPanel {
        
        self.aligment = aligment;
        return self;
    }
    
    public func setOrigin(top:Float, right:Float, bottom:Float, left:Float) -> SfPanel {
        
        self.origin.setBox(top: top, right: right, bottom: bottom, left: left);
        return self;
    }
    
    public func setMargin(top:Float, right:Float, bottom:Float, left:Float) -> SfPanel {
    
        self.margin.setBox(top: top, right: right, bottom: bottom, left: left);
        return self;
    }
    
    public func setPadding(top:Float, right:Float, bottom:Float, left:Float) -> SfPanel {
        
        self.padding.setBox(top: top, right: right, bottom: bottom, left: left);
        return self;
    }
    
    public func setParent(parent:SfPanel) -> Void {
        self.parent = parent;
    }
    
    public func getParent() -> SfPanel {
        return self.parent;
    }
    
    public func setView(view:UIView) -> SfPanel {
        
        self.view = view;
        return self;
    }
    
    public func getView() -> UIView {
        return self.view != nil ? self.view : UIView();
    }
    
    public func setKey(key:String) -> SfPanel {
        
        self.key = key;
        return self;
    }
    
    public func getKey() -> String {
        return self.key;
    }
    
    public func append(object:SfPanel) -> SfPanel {
        
        if (object != nil) {
            object.setParent(parent: self);
            // List logic
            if (self.lastChild == nil) {
                self.firstChild = object;
                self.lastChild = object;
            } else {
                object.prev = self.lastChild;
                self.lastChild.next = object;
                self.lastChild = object;
            }
        }
        return self;
    }
    
    public func prepend(object:SfPanel) -> SfPanel {
        
        if (object != nil) {
            object.setParent(parent: self);
            // List logic
            if (self.firstChild == nil) {
                self.firstChild = object;
                self.lastChild = object;
            } else {
                object.next = self.firstChild;
                self.firstChild.prev = object;
                self.firstChild = object;
            }
        }
        return self;
    }
    
    public func find(key:String) -> SfPanel {
        
        var child: SfPanel! = self.firstChild;
        var ret: SfPanel! = nil;
        while (child != nil) {
            if (child.getKey() == key) {
                ret = child;
                break;
            } else {
                ret = child.find(key: key);
                if (ret != nil) {
                    break;
                }
            }
            child = child.next;
        }
        return self;
    }
    
    public func getNext() -> SfPanel {
        
        return self.next;
    }
    
    public func getPrev() -> SfPanel {
        
        return self.prev;
    }
    
    public func siblings() -> NSMutableArray {
        
        let siblings: NSMutableArray! = NSMutableArray();
        if (self.parent != nil) {
            var sibling: SfPanel! = self.parent.firstChild;
            while (sibling != nil) {
                if (sibling != nil) { continue; }
                siblings.add(sibling);
                sibling = sibling.next;
            }
        }
        return siblings;
    }
    
    public func closest(key:String) -> SfPanel {
        
        var ret: SfPanel! = nil;
        if (self.parent != nil) {
            if (self.parent.getKey() == key) {
                ret = self.parent;
            } else {
                ret = self.parent.closest(key: key);
            }
        }
        return ret;
    }
    
    public func remove() -> SfPanel {
        
        let prev: SfPanel! = self.prev;
        let next: SfPanel! = self.next;
        prev.next = next;
        next.prev = prev;
        return self;
    }
    
    public func getChildren() -> NSMutableArray {
        
        let children: NSMutableArray! = NSMutableArray();
        var child: SfPanel! = self.firstChild;
        while (child != nil) {
            children.add(child);
            child = child.next;
        }
        return children;
    }
    
    public func getLastChild() -> SfPanel {
        
        let children: NSMutableArray! = self.getChildren();
        //return SfPanel();
        return children.object(at: children.count - 1) as! SfPanel;
    }
    
    public func setZIndex(zIndex:Int) -> SfPanel {
        
        self.zIndex = zIndex;
        return self;
    }
    
    public func setVisible(visible:Bool) -> SfPanel {
        
        self.visible = visible;
        return self;
    }
    
    public func calcSize() -> Void {
        
        var parentWidth: Float! = 0;
        var parentHeigth: Float! = 0;
        
        if (self.visible) {
            
            let metrics: CGRect! = UIScreen.main.bounds;
            
            if (self.parent != nil) {
                parentWidth = self.parent.frame.width;
                parentHeigth = self.parent.frame.height;
            } else {
                let offset: Float! = Float(UIApplication.shared.statusBarFrame.height);
                parentWidth = Float(metrics.size.width);
                parentHeigth = Float(metrics.size.height) - offset;
            }
            
            self.frame.width = self.size.width >= 0 ? self.size.width : (parentWidth * -self.size.width) / 100;
            self.frame.height = self.size.height >= 0 ? self.size.height : (parentHeigth * -self.size.height) / 100;
            
            switch (self.postion) {
                
                case SfPanel.SF_POSITION_RELATIVE:
                    // Do nothing YAY!
                break;
                
                case SfPanel.SF_POSITION_FIXED:
                
                    if (self.origin.left != SfPanel.SF_UNSET && self.origin.right != SfPanel.SF_UNSET) {
                        self.frame.width = Float(metrics.size.width) - (self.origin.left + self.origin.right);
                    }
                    if (self.origin.top != SfPanel.SF_UNSET && self.origin.bottom != SfPanel.SF_UNSET) {
                        self.frame.height = Float(metrics.size.height) - (self.origin.top + self.origin.bottom);
                    }
                break;
                
                default: break;
            }

            // Size children panels
            var child: SfPanel! = self.firstChild;
            while(child != nil) {
                child.calcSize();
                child = child.next;
            }
        }
    }
    
    private func calcPos() -> Void {
        
        let metrics: CGRect! = UIScreen.main.bounds;
        let screenW:Float! = Float(metrics.size.height);
        let screenH: Float! = Float(metrics.size.height) - Float(UIApplication.shared.statusBarFrame.height);
        
        if (self.parent == nil) {
            // Root panel
            self.frame.x = self.origin.left + self.margin.left;
            self.frame.y = self.origin.top + self.margin.top + Float(UIApplication.shared.statusBarFrame.height) as Float!;
        }
        // Position children
        var srcX: Float! = 0;
        var srcY: Float! = 0;
        let srcW: Float! = self.frame.width;
        //let srcH: Float! = self.frame.height;
        
        switch (self.aligment) {
            
            case SfPanel.SF_ALIGMENT_LEFT:
                srcX = (self.scrollHost == true ? 0 : self.frame.x) + self.padding.left;
                srcY = (self.scrollHost == true ? 0 : self.frame.y) + self.padding.top;
            break;
            
            case SfPanel.SF_ALIGMENT_CENTER:
                srcX = (self.scrollHost == true ? 0 : self.frame.x) + self.padding.left;
                srcY = (self.scrollHost == true ? 0 : self.frame.y) + self.padding.top;
            break;
            
            case SfPanel.SF_ALIGMENT_RIGHT:
                srcX = self.frame.width - self.padding.left;
                srcY = (self.scrollHost == true ? 0 : self.frame.y) + self.padding.top;
            break;
            
            default: break;
        }
        
        var curX: Float! = srcX;
        var curY: Float! = srcY;
        //var newLine: Bool! = true;
        var lineHeight: Float! = 0;
        var line: Int! = 0;
        // Iterate throw children panles
        var panel: SfPanel! = self.firstChild;
        while (panel != nil) {
            let panelW: Float! = panel.frame.width + panel.margin.getHeight();
            let panelH: Float! = panel.frame.height + panel.margin.getHeight();
            if (!panel.visible) { continue; }
            switch (panel.postion) {
                
                case SfPanel.SF_POSITION_RELATIVE:
                    // Check horizonatl aligment
                    switch(self.aligment) {
                        
                        case SfPanel.SF_ALIGMENT_LEFT:
                        
                            if (srcW - curX < panelW) {
                                // Is the panel bigger?
                                curX = srcX;
                                curY = curY + lineHeight;
                                lineHeight = 0;
                                line = line + 1;
                            }
                            lineHeight = lineHeight < panelH ? panelH : lineHeight;
                            panel.line = line;
                            panel.frame.x = curX + panel.margin.left;
                            panel.frame.y = curY + panel.margin.top;
                            // Offset current X
                            curX = curX + panelW;
                        break;
                        
                        case SfPanel.SF_ALIGMENT_RIGHT:
                        
                            if (curX - panelW <= 0) {
                                // Is the panel bigger?
                                curX = srcX;
                                curY = curY + lineHeight;
                                lineHeight = 0;
                                line = line + 1;
                            }
                            lineHeight = lineHeight < panelH ? panelH : lineHeight;
                            panel.line = line;
                            panel.frame.x = curX - (panel.frame.width + panel.margin.left);
                            panel.frame.y = curY + panel.margin.top;
                            // Offset the current X
                            curX = curX - panelW;
                        break;
                        
                        case SfPanel.SF_ALIGMENT_CENTER:
                        
                            if (panelW > srcW - curX) {
                                // Is teh bigger panel?
                                curX = srcX;
                                curY = curY + lineHeight;
                                lineHeight = 0;
                                line = line + 1;
                            }
                            lineHeight = lineHeight < panelH ? panelH : lineHeight;
                            panel.line = line;
                            panel.frame.x = curX + panel.margin.left;
                            panel.frame.y = curY + panel.margin.top;
                            // Offset the curren X
                            curX = curX + panelW;
                        break;
                        
                        default: break;
                    }
                break;
                
                case SfPanel.SF_POSITION_FIXED:
                
                    panel.frame.x = (panel.origin.left != SfPanel.SF_UNSET) ? (panel.origin.left + panel.margin.left) : (screenW - (panelW + panel.origin.right));
                    panel.frame.y = (panel.origin.top != SfPanel.SF_UNSET) ? (panel.origin.top + panel.margin.top) : (screenH - (panelH + panel.origin.bottom));
                break;
                
                default: break;
            }
            // Layout it's children too
            panel.calcPos();
            // Increment iterator
            panel = panel.next;
        }
        // Second pass to center children
        if (self.aligment == SfPanel.SF_ALIGMENT_CENTER) {
            
            var lineWidths = [Float!](repeating: nil, count: line+1);
            for i in 0 ..< (line+1) {
                lineWidths[i] = 0;
            }
         
            var lineHeights = [Float!](repeating: nil, count: line+1);
            for i in 0 ..< (line + 1) {
                lineHeights[i] = 0;
            }
            
            panel = self.firstChild;
            // Measure
            while(panel != nil) {
                if (panel.postion == SfPanel.SF_POSITION_RELATIVE) {
                    let panelW: Float! = panel.frame.width + panel.margin.getWidth();
                    let panelH: Float! = panel.frame.height + panel.margin.getHeight();
                    // Add to the line width
                    lineWidths[panel.line] = lineWidths[panel.line] + panelW;
                    lineHeights[panel.line] = lineHeights[panel.line] >= panelH ? lineHeights[panel.line] : panelH;
                }
                // Increment iterator
                panel = panel.next;
            }
            
            // Iterate the lines
            self.scrollHeight = 1000;
            for i in 0 ..< (lineWidths.count) {
                lineWidths[i] = (srcW/2) - (lineWidths[i] / 2);
                self.scrollHeight = self.scrollHeight + lineHeights[i];
            }
            
            // Now move the panels
            panel = self.firstChild;
            while(panel != nil) {
                if (panel.postion == SfPanel.SF_POSITION_RELATIVE) {
                    let panelW: Float! = panel.frame.width + panel.margin.getWidth();
                    // Get the line we're working on
                    panel.frame.x = lineWidths[panel.line];
                    lineWidths[panel.line] = lineWidths[panel.line] + panelW;
                }
                // Next panel
                panel = panel.next;
            }
        }
        if (self.size.height == 0 && self.postion == SfPanel.SF_POSITION_RELATIVE) {
            self.frame.height = self.scrollHeight + 2000;
        }
    }
    
    public func update() -> Void {
        
        var rect:CGRect!
        self.calcSize();
        self.calcPos();
        
        if (self.scrollHost && self.fixScroll) {
            let fix :Int! = 100;
            rect = CGRect(x: CGFloat(self.frame.x), y: CGFloat(self.frame.y), width: CGFloat(self.frame.width), height: CGFloat(self.frame.height) - CGFloat(fix));
        } else {
            rect = CGRect(x: CGFloat(self.frame.x), y: CGFloat(self.frame.y), width: CGFloat(self.frame.width), height: CGFloat(self.frame.height));
        }
        
        // Setting size to the view
        if ( self.view != nil ) {
            self.view.frame = rect;
        }
        
        // Size children panles
        var child:SfPanel! = self.firstChild;
        while ( child != nil ) {
            child.update();
            child = child.next;
        }
    }
}
