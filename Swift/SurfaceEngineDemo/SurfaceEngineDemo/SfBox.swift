//
//  SfBox.swift
//  SurfaceEngine
//
//  Created by Erick Sanchez on 11/10/17.
//  Copyright © 2017 App Builders. All rights reserved.
//

import Foundation

public class SfBox {
    
    var top: Float!;
    var right: Float!;
    var bottom: Float!;
    var left: Float!;
    
    init() {
        
        self.top = 0.0;
        self.right = 0.0;
        self.bottom = 0.0;
        self.left = 0.0;
    }
    
    convenience init(top:Float, right:Float, bottom:Float, left:Float) {
        
        self.init();
        self.setBox(top: top, right: right, bottom: bottom, left: left);
    }
    
    func setBox(top:Float, right:Float, bottom:Float, left:Float) -> Void {
        
        self.top = top;
        self.right = right;
        self.bottom = bottom;
        self.left = left;
    }
    
    func getWidth() -> Float {
        
        return self.left + self.right;
    }
    
    func getHeight() -> Float {
        
        return self.top + self.bottom;
    }
    
    func isEmpty() -> Bool {
        
        return (self.top == 0 && self.right == 0 && self.bottom == 0 && self.left == 0);
    }
}
