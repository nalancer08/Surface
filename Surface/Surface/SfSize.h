//
//  SfSize.h
//  Surface
//
//  Created by Webchimp on 22/03/16.
//  Copyright © 2016 Webchimp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SfSize : NSObject

    @property (nonatomic) float width;
    @property (nonatomic) float height;

    // Methods
    - (void)setSize:(float)width andHeight:(float)height;
    - (BOOL)isEmpty;

@end
