//
//  Surface.m
//  Tertulia
//
//  Created by Webchimp on 07/01/16.
//  Copyright © 2016 Webchimp. All rights reserved.
//

#import "Surface.h"

@implementation Surface

- (id)initWithSizeWidth:(float)awidth high:(float)ahigh position_x:(float)aposition_x position_y:(float)aposition_y controller:(UIViewController *)acontroller grid:(NSString *)agrid display:(BOOL)adisplay{
    
    if ( self = [super init] ) {
        
        width = awidth;
        high = ahigh;
        position_x = aposition_x;
        position_y = aposition_y;
        
    }
    
    //NSLog(@"rfre");
    box = [[UIView alloc] init];
    //box.frame = CGRectMake(20, 100, acontroller.view.bounds.size.width-40, acontroller.view.bounds.size.height-120);
    box.frame = CGRectMake(position_x, position_y, width, high);
    //NSLog(@"y= %f", self.view.bounds.size.height);
    //self.cuadro.autoresizingMask =  UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleHeight;
    //[self.cuadro sizeToFit];
    box.backgroundColor = [UIColor blueColor];
    
    if ( adisplay ) {
        [acontroller.view addSubview:box];
    }
    
    return self;
}

- (id)initFullSize:(UIViewController *)acontroller grid:(NSString *)agrid display:(BOOL)adisplay {
    
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

- (void)add:(NSString *)object width:(float)awidth high:(float)ahigh params:(NSMutableDictionary *)aparams display:(BOOL)adisplay {
    
    NSArray *items = @[@"text", @"image", @"text_field"];
    int item = [items indexOfObject:object];
    
    switch (item) {
        case 0:
            if ( [aparams objectForKey:@"text"] ) {
                
                NSLog(@"agregando texto: %@", [aparams objectForKey:@"text"] );
                UILabel *label = [[UILabel alloc] init];
                //label.frame = CGRect(
                //label.text = @"[aparams objectForKey:@"text"]";
            }
            
            if ( [aparams objectForKey:@"font"] ) {NSLog(@"hay font");} else {NSLog(@"no hay font");}
        break;
            
        default:
            break;
    }
}

- (void)showSurface:(UIViewController *)acontroller {
    
    [acontroller.view addSubview:box];
}


@end
