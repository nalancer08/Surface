//
//  Surface.h
//  Tertulia
//
//  Created by Webchimp on 07/01/16.
//  Copyright © 2016 Webchimp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Surface : NSObject {
    
    NSInteger *high;
    NSInteger *width;
    NSInteger *position_x;
    NSInteger *position_y;
    UIView *box;
}

- (id)initWithSizeWidth:(NSInteger *)width high:(NSInteger *)high position_x:(NSInteger *)aposition_x position_y:(NSInteger *)aposition_y controller:(UIViewController *)acontroller;

@end
