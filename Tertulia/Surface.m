//
//  Surface.m
//  Tertulia
//
//  Created by Webchimp on 07/01/16.
//  Copyright © 2016 Webchimp. All rights reserved.
//

#import "Surface.h"

@implementation Surface

- (id)initWithSizeWidth:(NSInteger *)awidth high:(NSInteger *)ahigh position_x:(NSInteger *)aposition_x position_y:(NSInteger *)aposition_y controller:(UIViewController *)acontroller{
    
    if ( self = [super init] ) {
        
        width = awidth;
        high = ahigh;
        position_x = aposition_x;
        position_y = aposition_y;
        
    }
    
    NSLog(@"rfre");
    box = [[UIView alloc] init];
    box.frame = CGRectMake(20, 100, acontroller.view.bounds.size.width-40, acontroller.view.bounds.size.height-120);
    //NSLog(@"y= %f", self.view.bounds.size.height);
    //self.cuadro.autoresizingMask =  UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleHeight;
    //[self.cuadro sizeToFit];
    box.backgroundColor = [UIColor blueColor];
    
    [acontroller.view addSubview:box];
    
    return self;
}

- (id)initFullSize:(UIViewController *)acontroller display:(BOOL *)adisplay {
    
    if ( self = [super init] ) {
        
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        CGFloat screenWidth = screenRect.size.width;
        CGFloat screenHeight = screenRect.size.height;
        
        box = [[UIView alloc] init];
        box.frame = CGRectMake(0, 0, screenWidth, screenHeight);
        box.backgroundColor = [UIColor redColor];
        
        if ( adisplay ) {
            [acontroller.view addSubview:box];
        }
        
        
    }
    
    return self;
    
}

- (void)showSurface:(UIViewController *)acontroller {
    
    [acontroller.view addSubview:box];
}


@end
