//
//  Helpers.m
//  Groundhog
//
//  Created by Webchimp on 04/04/16.
//  Copyright © 2016 Webchimp. All rights reserved.
//

#import "Helpers.h"

@implementation Helpers

+ (UIColor *)rgbColor:(int)p1 :(int)p2 :(int)p3 {
    
    UIColor *color = [UIColor colorWithRed:p1/255.0f green:p2/255.0f blue:p3/255.0f alpha:1.0];
    return color;
}

@end
