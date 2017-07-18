//
//  SfSize.swift
//  Surface Swift
//
//  Created by Webchimp on 26/09/16.
//  Copyright © 2016 AppBuilders. All rights reserved.
//

import Foundation

class SfSize: NSObject {
    
    var width:Float! = 0;
    var height:Float! = 0;
    
    func setSize(width:Float!, height:Float!) {
        
        self.width = width;
        self.height = height;
    }
    
    func isEmpty() -> Bool {
        
        if ( self.width == nil && self.height == nil ) {
            return true;
        }
        
        return false;
    }

}
