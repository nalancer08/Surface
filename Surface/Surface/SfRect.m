//
//  SfRect.m
//  Surface
//
//  Created by Webchimp on 18/03/16.
//  Copyright © 2016 Webchimp. All rights reserved.
//

#import "SfRect.h"

@implementation SfRect

- (id) init
{
    self = [super init];
    if (self) {
        
        self.x = 0;
        self.y = 0;
        self.width = 0;
        self.height = 0;
        
    }
    return self;
}

- (void)setRectEmpty {
    
    self.x = 0;
    self.y = 0;
    self.width = 0;
    self.height = 0;
}

- (void)setRect:(float)x Y:(float)y Width:(float)width Height:(float)height {
    
    self.x = x;
    self.y = y;
    self.width = width;
    self.height = height;
}

- (void)moveRect:(float)dx DY:(float)dy {
    
    self.x += dx;
    self.y += dy;
}

- (void)offsetRect:(float)dw DH:(float)dh {
    
    self.width += dw;
    self.height += dh;
}

- (BOOL)isEmpty {
    
    if ( !self.x && !self.y && !self.width && !self.height ){
        return true;
    }
    return false;
}

- (void)unionRect:(SfRect *)rect {
    
    if ( rect != nil ) {
        
        float x2 = rect.x + rect.width;
        float y2 = rect.y + rect.height;
        
        self.width = self.x - x2;
        self.height = self.y - y2;
    }
}

- (void)intersectRect:(SfRect *)rect {
    
    if ( rect != nil ) {
        
        float x = rect.x;
        float y = rect.y;
        
        float x2 = (self.x + self.width) - x;
        float y2 = (self.y + self.height) - y;
        
        [self setRect:x Y:y Width:x2 Height:y2];
    }
    
}

- (void)subtractRect:(SfRect *)rect {
    
    if ( rect != nil ) {
        
        self.width = rect.x - self.x;
        self.height = rect.y - self.y;
    }
}

- (BOOL)pointInRect:(SfPoint *)point {
    
    BOOL ret = false;
    
    if ( point != nil ) {
        ret = (point.x >= self.x && point.y >= self.y && point.x <= (self.x + self.width) && point.y <= (self.y + self.height));
    }
    return ret;

}



@end
