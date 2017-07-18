//
//  SfBox.swift
//  Surface Swift
//
//  Created by Webchimp on 26/09/16.
//  Copyright © 2016 AppBuilders. All rights reserved.
//

import Foundation

class SfBox: NSObject {
    
    var top: Float! = 0.0;
    var right: Float! = 0.0;
    var bottom: Float! = 0.0;
    var left: Float! = 0.0;
    
    override init() {
        
        self.top = 0.0;
        self.right = 0.0;
        self.bottom = 0.0;
        self.left = 0.0;
    }
    
    func setBox(top:Float, right:Float, bottom:Float, left:Float) -> Void {
        
        self.top = top;
        self.right = right;
        self.bottom = bottom;
        self.left = left;
    }
    
    func getWidth() -> Float {
        
        return self.right + self.left;
    }
    
    func getHeight() -> Float {
        
        return self.top + self.bottom;
    }
    
    func isEmpty() -> Bool {
        
        if ( self.top == nil && self.right == nil && self.bottom == nil && self.left == nil ) {
            
            return true;
        }
        return false;
    }
    
}
