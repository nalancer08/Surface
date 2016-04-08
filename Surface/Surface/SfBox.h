//
//  SfBox.h
//  Surface
//
//  Created by Webchimp on 22/03/16.
//  Copyright © 2016 Webchimp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SfBox : NSObject

    // Properties
    @property (nonatomic) float top;
    @property (nonatomic) float right;
    @property (nonatomic) float bottom;
    @property (nonatomic) float left;

    // Methods
    - (void)setBox:(float)top Right:(float)right Bottom:(float)bottom Left:(float)left;
    - (float)getWidth;
    - (float)getHeight;
    - (BOOL)isEmpty;

@end
