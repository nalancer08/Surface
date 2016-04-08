//
//  SfPoint.h
//  Surface
//
//  Created by Webchimp on 22/03/16.
//  Copyright © 2016 Webchimp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SfPoint : NSObject

    // Properties
    @property (nonatomic) float x;
    @property (nonatomic) float y;

    // Methods
    - (void)setPoint:(float)x Y:(float)y;
    - (BOOL)isEmpty;

@end
