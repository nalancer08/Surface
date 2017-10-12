//
//  SfSize.swift
//  SurfaceEngine
//
//  Created by Erick Sanchez on 11/10/17.
//  Copyright © 2017 App Builders. All rights reserved.
//

import Foundation

public class SfSize {
    
    var width: Float!;
    var height: Float!;
    
    init() {
        
        self.width = 0.0;
        self.height = 0.0;
    }
    
    convenience init(width:Float, height:Float) {
        
        self.init()
        self.setSize(width: width, height: height);
    }
    
    func setSize(width:Float, height:Float) -> Void {
        
        self.width = width;
        self.height = height;
    }
    
    func isEmpty() -> Bool {
        
        return (self.width == 0 && self.height == 0);
    }
}
