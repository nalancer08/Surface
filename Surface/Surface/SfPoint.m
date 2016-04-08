//
//  SfPoint.m
//  Surface
//
//  Created by Webchimp on 22/03/16.
//  Copyright © 2016 Webchimp. All rights reserved.
//

#import "SfPoint.h"

@implementation SfPoint

- (id) init
{
    self = [super init];
    if (self) {
        
        self.x = 0;
        self.y = 0;

        
    }
    return self;
}

- (void)setPoint:(float)x Y:(float)y {
    
    self.x = x;
    self.y = y;
}

- (BOOL)isEmpty {
    
    if ( !self.x && !self.y ) {
        return true;
    }
    return false;
}

@end
