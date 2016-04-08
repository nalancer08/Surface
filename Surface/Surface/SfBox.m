//
//  SfBox.m
//  Surface
//
//  Created by Webchimp on 22/03/16.
//  Copyright © 2016 Webchimp. All rights reserved.
//

#import "SfBox.h"

@implementation SfBox


- (id) init
{
    self = [super init];
    if (self) {
        
        self.top = 0;
        self.right = 0;
        self.bottom = 0;
        self.left = 0;
        
    }
    return self;
}

- (void)setBox:(float)top Right:(float)right Bottom:(float)bottom Left:(float)left {
    
    self.top = top;
    self.right = right;
    self.bottom = bottom;
    self.left = left;
}

- (float)getWidth {
    
    return self.right + self.left;
}

- (float)getHeight {
    
    return self.top + self.bottom;
}

- (BOOL)isEmpty {
    
    if ( !self.top && !self.right && !self.bottom && !self.left ) {
        return true;
    }
    return false;
}

@end
