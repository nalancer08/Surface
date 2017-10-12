//
//  SfPoint.swift
//  SurfaceEngine
//
//  Created by Erick Sanchez on 11/10/17.
//  Copyright © 2017 App Builders. All rights reserved.
//

import Foundation

public class SfPoint {
    
    var x: Float!;
    var y: Float!;
    
    init() {
    
        self.x = 0.0;
        self.y = 0.0;
    }
    
    convenience init(x:Float, y:Float) {
        
        self.init();
        self.setPoint(x: x, y: y);
        
    }
    
    func setPoint(x:Float, y:Float) -> Void {
    
        self.x = x;
        self.y = y;
    }
    
    func isEmpty() -> Bool {
        
        return (self.x == 0 && self.y == 0);
    }
}
