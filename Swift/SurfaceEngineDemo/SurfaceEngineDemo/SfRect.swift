//
//  SfRect.swift
//  SurfaceEngine
//
//  Created by Erick Sanchez on 11/10/17.
//  Copyright © 2017 App Builders. All rights reserved.
//

import Foundation

public class SfRect {
    
    var x: Float!;
    var y: Float!;
    var width: Float!;
    var height: Float!;
    
    init() {
        
        self.x = 0;
        self.y = 0;
        self.width = 0;
        self.height = 0;
    }
    
    convenience init(x:Float, y:Float, width:Float, height:Float) {
        
        self.init();
        self.setRect(x: x, y: y, width: width, height: height);
    }
    
    func setRect(x:Float, y:Float, width:Float, height:Float) -> Void {
        
        self.x = x;
        self.y = y;
        self.width = width;
        self.height = height;
    }
    
    func setRectEmpty() -> Void {
        
        self.x = 0;
        self.y = 0;
        self.width = 0;
        self.height = 0;
    }
    
    func moveRect(dx:Float, dy:Float) -> Void {
        
        self.x = self.x + dx;
        self.y = self.y + dy;
    }
    
    func offsetRect(_ dw:Float, dh:Float) ->  Void {
        
        self.width = dw;
        self.height = dh;
    }
    
    func isEmpty() -> Bool {
        
        if ( self.x == nil && self.y == nil && self.width == nil && self.height == nil ) {
            return true;
        }
        
        return false;
    }
    
    func unionRect(_ rect:SfRect!) {
        
        if ( rect != nil ) {
            
            let x2:Float! = rect.x + rect.width;
            let y2:Float! = rect.y + rect.height;
            
            self.width = self.x - x2;
            self.height = self.y - y2;
            
        }
    }
    
    func intersectRect(_ rect:SfRect!) {
        
        if ( rect != nil ) {
            
            let x:Float! = rect.x;
            let y:Float! = rect.y;
            
            let x2:Float! = ( self.x + self.width ) - x;
            let y2:Float! = ( self.y + self.height ) - y;
            
            self.setRect(x: x, y: y, width: x2, height: y2);
        }
    }
    
    func subtractRect(_ rect:SfRect!) {
        
        if ( rect != nil ) {
            
            self.width = rect.x - self.x;
            self.height = rect.y - self.y;
        }
    }
    
    func pointInRect(_ point:SfPoint!) -> Bool {
        
        var ret:Bool! = false;
        if ( point != nil ) {
            ret = ( point.x >= self.x && point.y >= self.y && point.x <= (self.x + self.width) && point.y <= (self.y + self.height) );
        }
        return ret;
    }
}
