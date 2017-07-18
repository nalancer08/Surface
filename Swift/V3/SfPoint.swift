//
//  SfPoint.swift
//  Surface Swift
//
//  Created by Webchimp on 26/09/16.
//  Copyright © 2016 AppBuilders. All rights reserved.
//

import Foundation

class SfPoint: NSObject {
    
    var x: Float! = 0.0;
    var y:Float! = 0.0;
    
    func setPoint(_ x:Float, y:Float) -> Void {
        
        self.x = x;
        self.y = y;
    }
    
    func isEmpty() -> Bool {
        
        if ( self.x == nil && self.y == nil ) {
            return true;
        }
        return false;
    }
    
    

}
