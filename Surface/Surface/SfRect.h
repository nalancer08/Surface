//
//  SfRect.h
//  Surface
//
//  Created by Webchimp on 18/03/16.
//  Copyright © 2016 Webchimp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SfPoint.h"

@interface SfRect : NSObject

    // Properties
    @property (nonatomic) float x;
    @property (nonatomic) float y;
    @property (nonatomic) float width;
    @property (nonatomic) float height;

    // Methods
    - (void)setRectEmpty;
    - (void)setRect:(float)x Y:(float)y Width:(float)width Height:(float)height;
    - (void)moveRect:(float)dx DY:(float)dy;
    - (void)offsetRect:(float)dw DH:(float)dh;
    - (BOOL)isEmpty;
    - (void)unionRect:(SfRect *)rect;
    - (void)intersectRect:(SfRect *)rect;
    - (void)subtractRect:(SfRect *)rect;
    - (BOOL)pointInRect:(SfPoint *)point;

@end
