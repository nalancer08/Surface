//
//  SfRect.swift
//  Surface Swift
//
//  Created by Webchimp on 26/09/16.
//  Copyright © 2016 AppBuilders. All rights reserved.
//

import Foundation

class SfRect: NSObject {
    
    var x: Float! = 0.0;
    var y: Float! = 0.0;
    var width: Float! = 0.0;
    var height: Float! = 0.0;
    
    func setRectEmpty() -> Void {
        
        self.x = 0;
        self.y = 0;
        self.width = 0;
        self.height = 0;
    }
    
    func setRect(x:Float, y:Float, width:Float, height:Float) -> Void {
        
        self.x = x;
        self.y = y;
        self.width = width;
        self.height = height;
    }
    
    func moveRect(dx:Float, dy:Float) -> Void {
        
        self.x = self.x + dx;
        self.y = self.y + dy;
    }
    
    func offsetRect(dw:Float, dh:Float) ->  Void {
        
        self.width = dw;
        self.height = dh;
    }
    
    func isEmpty() -> Bool {
        
        if ( self.x == nil && self.y == nil && self.width == nil && self.height == nil ) {
            return true;
        }
        
        return false;
    }
    
    func unionRect(rect:SfRect!) {
        
        if ( rect != nil ) {
            
            let x2:Float! = rect.x + rect.width;
            let y2:Float! = rect.y + rect.height;
            
            self.width = self.x - x2;
            self.height = self.y - y2;
            
        }
    }
    
    func intersectRect(rect:SfRect!) {
        
        if ( rect != nil ) {
            
            let x:Float! = rect.x;
            let y:Float! = rect.y;
            
            let x2:Float! = ( self.x + self.width ) - x;
            let y2:Float! = ( self.y + self.height ) - y;
            
            self.setRect(x, y: y, width: x2, height: y2);
        }
    }
    
    func subtractRect(rect:SfRect!) {
        
        if ( rect != nil ) {
            
            self.width = rect.x - self.x;
            self.height = rect.y - self.y;
        }
    }
    
    func pointInRect(point:SfPoint!) -> Bool {
        
        var ret:Bool! = false;
        
        if ( point != nil ) {
            ret = ( point.x >= self.x && point.y >= self.y && point.x <= (self.x + self.width) && point.y <= (self.y + self.height) );
        }
        return true;
    }

}
