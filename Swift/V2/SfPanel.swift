//
//  SfPanel.swift
//  Surface Swift
//
//  Created by Webchimp on 26/09/16.
//  Copyright © 2016 AppBuilders. All rights reserved.
//

import Foundation
import UIKit

let SF_POSITION_ABSOLUTE:Int! = 0;
let SF_POSITION_RELATIVE:Int! = 1;
let SF_POSITION_FIXED:Int! = 2;

let SF_ALIGNMENT_LEFT:Int! = 0;
let SF_ALIGNMENT_RIGHT:Int! = 1;
let SF_ALIGNMENT_CENTER:Int! = 2;

let SF_UNSET:Int! = -9999;

class SfPanel: NSObject {
    
    var point:SfPoint! = SfPoint();
    var size:SfSize! = SfSize();
    var frame:SfRect! = SfRect();
    var origin:SfBox! = SfBox();
    var zIndez:Int! = 10;
    var position:Int! = SF_POSITION_RELATIVE;
    var visible:Bool! = true;
    var margin:SfBox! = SfBox();
    var padding:SfBox! = SfBox();
    
    var parent:SfPanel! = nil;
    var next:SfPanel! = nil;
    var prev:SfPanel! = nil;
    var firstChild:SfPanel! = nil;
    var lastChild:SfPanel! = nil;
    
    var key:NSString!;
    var view:UIView! = UIView();
    
    var alignment:Int! = SF_ALIGNMENT_CENTER;
    var line:Int! = 0;
    
    // Scroll Fix
    var scrollHeight:Float! = 0;
    var scrollHost:Bool! = false;
    
    
    override init() {
        
        self.point = SfPoint();
        self.size = SfSize();
        self.frame = SfRect();
        self.origin = SfBox();
        self.margin = SfBox();
        self.padding = SfBox();
        self.view = UIView();
        self.parent = nil;
        
        self.next = nil;
        self.prev = nil;
        self.lastChild = nil;
        self.firstChild = nil;
        
        self.visible = true;
        
        self.position = SF_POSITION_RELATIVE;
        self.alignment = SF_ALIGNMENT_CENTER;
        self.line = 0;
        self.scrollHeight = 0;
        self.scrollHost = false;
        
    }
    
    func setSize(width:Float!, height:Float!) -> SfPanel {
        
        self.size.setSize(width, height: height);
        return self;
    }
    
    func setPosition(position:Int!) -> SfPanel {
        self.position = position;
        return self;
    }
    
    func setAlignment(alignment:Int!) -> SfPanel {
        self.alignment = alignment;
        return self;
    }
    
    func setOrigin(top:Float!, right:Float!, bottom:Float!, left:Float!) -> SfPanel {
        self.origin.setBox(top, right: right, bottom: bottom, left: left);
        return self;
    }
    
    func setMargin(top:Float!, right:Float!, bottom:Float!, left:Float!) -> SfPanel {
        self.margin.setBox(top, right: right, bottom: bottom, left: left);
        return self;
    }
    
    func setPadding(top:Float!, right:Float!, bottom:Float!, left:Float!) -> SfPanel {
        self.padding.setBox(top, right: right, bottom: bottom, left: left);
        return self;
    }
    
    @objc(methodNewSetterParent:)
    func setParent(parent:SfPanel!) -> SfPanel {
        
        if ( parent != nil ) {
            self.parent = parent;
        }
        
        return self;
    }
    
    func getParent() -> SfPanel {
        return self.parent;
    }
    
    @objc(methodNewSetterKey:)
    func setKey(key:NSString!) -> SfPanel {
        self.key = key;
        return self;
    }
    
    func getKey() -> NSString {
        return self.key;
    }
    
    func append(object:SfPanel!) -> SfPanel {
        
        if ( object != nil ) {
            object.setParent(self);
            if ( self.lastChild == nil ) {
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
    
    func prepend(object:SfPanel!) -> SfPanel {
        
        if ( object != nil ) {
            
            object.setParent(self);
            if ( self.firstChild == nil ) {
                
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
    
    func getChildren() -> NSMutableArray {
        
        let children:NSMutableArray! = NSMutableArray();
        var child:SfPanel! = SfPanel();
        
        while ( child != nil ) {
            
            children.addObject(child);
            child = child.next;
        }
        
        return children;
    }
    
    func setZIndex(z:Int!) -> SfPanel {
        self.zIndez = z;
        return self;
    }
    
    func setVisible(vis:Bool!) -> SfPanel {
        self.visible = vis;
        return self;
    }
    
    func panelNext() -> SfPanel {
        return self.next;
    }
    
    func panelPrev() -> SfPanel {
        return self.prev;
    }
    
    func siblings() -> NSMutableArray {
        
        let siblings:NSMutableArray! = NSMutableArray();
        
        if ( self.parent != nil ) {
            
            var sibling:SfPanel! = self.parent.firstChild;
            
            while ( sibling != nil ) {
                
                if ( sibling == self ) { continue; }
                siblings.addObject(sibling);
                sibling = sibling.next;
            }
        }
        
        return siblings;
    }
    
    func find(key:NSString!) -> SfPanel {
        
        var child:SfPanel! = self.firstChild;
        var ret:SfPanel!;
        
        while ( child != nil ) {
            
            if ( child.getKey().isEqualToString(key as String) ) {
                ret = child;
                break;
            } else {
                ret = child.find(key);
                if ( ret != nil ) { break; }
            }
            child = child.next;
        }
        
        return ret;
    }
    
    func closest(key:NSString) -> SfPanel {
        
        var ret:SfPanel! = SfPanel();
        
        if ( self.parent != nil ) {
            
            if ( self.parent.getKey().isEqualToString(key as String) ) {
                ret = self.parent;
            } else {
                ret = self.parent.closest(key);
            }
        }
        
        return ret;
    }
    
    func remove() {
        
        let prev:SfPanel! = self.prev;
        let next:SfPanel! = self.next;
        
        prev.next = next;
        next.prev = prev;
    }
    
    func calcSize() {
        
        var parentW:Float! = 0;
        var parentH:Float! = 0;
        if ( self.visible != false ) {
            //CGRect screenRect = [[UIScreen mainScreen] bounds];
            let screenRect:CGRect! = UIScreen.mainScreen().bounds;
            
            let screenW:Float! = Float(screenRect.size.width);
            let screenH:Float! = Float(screenRect.size.height);
            
            
            if ( self.parent != nil ) {
                
                parentW = self.parent.frame.width - (self.position == SF_POSITION_ABSOLUTE ? self.parent.padding.getWidth() : 0);
                parentH = self.parent.frame.height - (self.position == SF_POSITION_ABSOLUTE ? self.parent.padding.getHeight() : 0);
                
            } else {
                
                parentW = screenW;
                parentH = screenH;
                
            }
            
            self.frame.width = self.size.width >= 0 ? self.size.width : (parentW * -self.size.width) / 100 ;
            self.frame.height = self.size.height >= 0 ? self.size.height : (parentH * -self.size.height) / 100 ;
            
            switch (self.position) {
            case SF_POSITION_RELATIVE:
                // Do nothing YAY!
                break;
                
            case SF_POSITION_ABSOLUTE:
                
                if ( self.origin.left != Float(SF_UNSET) && self.origin.right != Float(SF_UNSET) ) {
                    
                    self.frame.width = parentW - (self.origin.left + self.origin.right);
                }
                
                if ( self.origin.top != Float(SF_UNSET) && self.origin.bottom != Float(SF_UNSET) ) {
                    
                    self.frame.height = parentH - (self.origin.top + self.origin.bottom);
                }
                
                break;
                
            case SF_POSITION_FIXED:
                
                if ( self.origin.left != Float(SF_UNSET) && self.origin.right != Float(SF_UNSET) ) {
                    
                    self.frame.width = screenW - (self.origin.left + self.origin.right);
                }
                
                if ( self.origin.top != Float(SF_UNSET) && self.origin.bottom != Float(SF_UNSET) ) {
                    
                    self.frame.height = screenH - (self.origin.top + self.origin.bottom);
                }
                
                
                break;
                
            
            default:
                break;
            }
            
            
            var child:SfPanel! = self.firstChild;
            
            while ( child != nil ) {
                child.calcSize();
                child = child.next;
            }
        }
    }
    
    func calcPos() {
        
        let screenRect:CGRect! = UIScreen.mainScreen().bounds;
        
        let screenW:Float! = Float(screenRect.size.width);
        let screenH:Float! = Float(screenRect.size.height); //- statusBarSize.height;
        
        if ( self.parent == nil ) {
            
            self.frame.x = self.origin.left + self.margin.left;
            self.frame.y = self.origin.top +  self.margin.top;
        }
        
        var srcX:Float! = 0;
        var srcY:Float! = 0;
        let srcW:Float! = self.frame.width;
        //var srcH:Float! = self.frame.height;
        
        // Add to fix 29/06(2016
        var localSrcX:Float! = 0;
        var localSrcY:Float! = 0;
        //
        
        switch (self.alignment) {
            
        case SF_ALIGNMENT_RIGHT:
            
            srcX = self.frame.width - self.padding.left;
            srcY = (self.scrollHost == true ? 0 : self.frame.y) + self.padding.top;
            
            // Add to fix 29/06(2016
            localSrcX = self.frame.width - self.padding.left;
            localSrcY = self.padding.top;
            //
            
            break;
            
        case SF_ALIGNMENT_LEFT:
        
            srcX = (self.scrollHost == true ? 0 : self.frame.x) + self.padding.left;
            srcY = (self.scrollHost == true ? 0 : self.frame.y) + self.padding.top;
            
            // Add to fix 29/06(2016
            localSrcX = self.padding.left;
            localSrcY = self.padding.top;
            
            break
        
        case SF_ALIGNMENT_CENTER:
            
            srcX = (self.scrollHost == true ? 0 : self.frame.x) + self.padding.left;
            srcY = (self.scrollHost == true ? 0 : self.frame.y) + self.padding.top;
            
            // Add to fix 29/06(2016
            localSrcX = self.padding.left;
            localSrcY = self.padding.top;
            //
            
            break;
            
        default:
            break;
            
        }
        
        var curX:Float! = srcX;
        var curY:Float! = srcY;
        //var newLine:Bool! = true;
        
        // FIXED 15/04/16
        var lineHeight:Float! = 0;
        var line:Int! = 0;
        var parentRight:Float!;
        var parentBotton:Float!;
        ///////////////////
        
        // Add to fix 29/06(2016
        var localCurX:Float! = localSrcX;
        var localCurY:Float! = localSrcY;
        ////////////////////////
        
        // Iterate through children panels
        
        var panel:SfPanel! = self.firstChild;
        
        while ( panel != nil ) {
            
            let panelW:Float! = panel.frame.width + panel.margin.getWidth();
            let panelH:Float! = panel.frame.height + panel.margin.getHeight();
            var availableW:Double! = 0; // FIX 29/06/2016
            
            if ( panel.visible == false ) { continue; }
            
            switch (panel.position) {
            case SF_POSITION_RELATIVE:
                
                // Check horizontal aligment
                switch (self.alignment) {
                case SF_ALIGNMENT_LEFT:
                    
                    availableW = Double( Int(srcW) - Int(localCurX) );
                    if ( availableW < Double(panelW) ) {
                        // Is the panel bigger?
                        localCurX = localSrcX;
                        curX = srcX;
                        curY = curY + lineHeight;
                        lineHeight = 0;
                        line = line + 1;
                    }
                    
                    lineHeight = lineHeight < panelH ? panelH : lineHeight;
                    panel.line = line;
                    panel.frame.x = curX + panel.margin.left;
                    panel.frame.y = curY + panel.margin.top;
                    curX =  curX + panelW;
                    localCurX = localCurX + panelW;
                    
                    break;
                    
                case SF_ALIGNMENT_RIGHT:
                    
                    availableW = Double( Int(localCurX) - Int(panelW) );
                    if ( availableW <= 0 ) {
                        
                        // Is the panel bigger?
                        localCurX = localSrcX;
                        localCurY = localCurY + lineHeight;
                        curX = srcX;
                        curY = curY + lineHeight;
                        lineHeight = 0;
                        line = line + 1;
                    }
                    
                    lineHeight = lineHeight < panelH ? panelH : lineHeight;
                    panel.line = line;
                    panel.frame.x = curX - (panel.frame.width + panel.margin.left);
                    panel.frame.y = curY + panel.margin.top;
                    curX = curX - panelW;
                    localCurX = localCurX - panelW;
                    
                    break;
                    
                case SF_ALIGNMENT_CENTER:
                    
                    availableW = Double( Int(srcW) - Int(localCurX) );
                    if ( Double(panelW) > availableW ) {
                        
                        //Is the pabel bigger?
                        localCurX = localSrcX;
                        localCurY = localCurY + lineHeight;
                        curX = srcX;
                        curY = curY + lineHeight;
                        lineHeight = 0;
                        line = line + 1;
                    }
                    
                    lineHeight = lineHeight < panelH ? panelH : lineHeight;
                    panel.line = line;
                    panel.frame.x = curX + panel.margin.left;
                    panel.frame.y = curY + panel.margin.top;
                    curX = curX + panelW;
                    localCurX = localCurX + panelW;
                    
                    break;
                    
                default:
                    break;
                    
                }
                
                //
                break;
                
            case SF_POSITION_ABSOLUTE:
                
                //if ( panel.origin.left == SF_UNSET || panel.origin.right == SF_UNSET ) {
                
                parentRight = self.frame.x + self.frame.width - self.margin.right;
                panel.frame.x = (panel.origin.left != Float(SF_UNSET)) ? (self.frame.x + panel.origin.left + panel.margin.left) : (parentRight - (panelW + panel.origin.right));
                //}
                
                
                //if ( panel.origin.top == SF_UNSET || panel.origin.bottom == SF_UNSET ) {
                
                parentBotton = self.frame.y + self.frame.height - self.margin.bottom;
                panel.frame.y = (panel.origin.top != Float(SF_UNSET)) ? (self.frame.y + panel.origin.top + panel.margin.top) : (parentBotton - (panelH + panel.origin.bottom));
                //}
                
                break;
                
            case SF_POSITION_FIXED:
                
                //if ( panel.origin.left == SF_UNSET || panel.origin.right == SF_UNSET ) {
                panel.frame.x = (panel.origin.left != Float(SF_UNSET)) ? (panel.origin.left + panel.margin.left) : (screenW - (panelW + panel.origin.right));
                //}
                
                // if ( panel.origin.top == SF_UNSET || panel.origin.bottom == SF_UNSET ) {
                panel.frame.y = (panel.origin.top != Float(SF_UNSET)) ? (panel.origin.top + panel.margin.top) : (screenH - (panelH + panel.origin.bottom));
                // }
                
                break;
                
            default:
                break;
            }
            
            
            panel.calcPos();
            // Increment
            panel = panel.next;
            
        }
        
        if ( self.alignment == SF_ALIGNMENT_CENTER ) {
            
            var lineWidths = [NSInteger!](count: line+1, repeatedValue:nil);
            for (var i = 0; i < (line + 1); i++){
                lineWidths[i] = 0;
            }
            
            var lineHeights = [NSInteger!](count: line+1, repeatedValue:nil);
            for (var i = 0; i < (line + 1); i++){
                lineHeights[i] = 0;
            }
            
            panel = self.firstChild;
            while (panel != nil) {
                if ( panel.position == SF_POSITION_RELATIVE ) {
                    let panelW:Float! = panel.frame.width + panel.margin.getWidth();
                    let panelH:Float! = panel.frame.height + panel.margin.getHeight();
                    
                    lineWidths[panel.line] = lineWidths[panel.line] + NSInteger(panelW);
                    lineHeights[panel.line] = lineHeights[panel.line] >= NSInteger(panelH) ? lineHeights[panel.line] : NSInteger(panelH);
                }
                panel = panel.next;
            }
            
            self.scrollHeight = 0;
            for (var i = 0; i < (line + 1); i++ ) {
                lineWidths[i] = NSInteger(srcX) + (NSInteger(srcW) / 2) - (lineWidths[i] / 2);
                self.scrollHeight = self.scrollHeight + Float(lineHeights[i]);
            }
            
            panel = self.firstChild;
            while ( panel != nil ) {
                if ( panel.position == SF_POSITION_RELATIVE ) {
                    let panelW:Float! = panel.frame.width + panel.margin.getWidth();
                    panel.frame.x = Float(lineWidths[panel.line]);
                    lineWidths[panel.line] =  lineWidths[panel.line] + NSInteger(panelW);
                }
                
                panel = panel.next;
            }
        }
        
        if ( self.size.height == 0 && self.position == SF_POSITION_RELATIVE ) {
            self.frame.height = self.scrollHeight;
        }

    }
    
    func update() {
        
        self.calcSize();
        self.calcPos();
        
        let rect:CGRect! = CGRectMake(CGFloat(self.frame.x), CGFloat(self.frame.y), CGFloat(self.frame.width), CGFloat(self.frame.height));
        
        if ( self.view != nil ) {
            self.view.frame = rect;
        }
        
        var child:SfPanel! = self.firstChild;
        
        while ( child != nil ) {
            child.update();
            child = child.next;
        }
    }
    
    @objc(setterView:)
    func setView(view:UIView!) {
        self.view = view;
    }
    
    func gewtView() -> UIView {
        return self.view;
    }
    
    
    

    
    
    
    
    
    
    
    
    
    
    

}
