//
//  SfSize.m
//  Surface
//
//  Created by Webchimp on 22/03/16.
//  Copyright © 2016 Webchimp. All rights reserved.
//

#import "SfSize.h"

@implementation SfSize


- (id) init
{
    self = [super init];
    if (self) {
        
        self.width = 0;
        self.height = 0;
    }
    return self;
}

- (void)setSize:(float)width andHeight:(float)height {
    
    self.width = width;
    self.height = height;
}

- (BOOL)isEmpty {
    
    if( !self.width && !self.height ) {
        return true;
    }
    return false;
}

@end
