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
    self.box = [[UIView alloc] init];
    //box.frame = CGRectMake(20, 100, acontroller.view.bounds.size.width-40, acontroller.view.bounds.size.height-120);
    self.box.frame = CGRectMake(position_x, position_y, width, high);
    //NSLog(@"y= %f", self.view.bounds.size.height);
    //self.cuadro.autoresizingMask =  UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleHeight;
    //[self.cuadro sizeToFit];
    self.box.backgroundColor = [UIColor blueColor];
    
    if ( adisplay ) {
        //[acontroller.view addSubview:self.box];
    }
    
    return self;
}

- (id)initFullSize:(UIViewController *)acontroller grid:(NSString *)agrid display:(BOOL)adisplay {
    
    if ( self = [super init] ) {
        
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        CGFloat screenWidth = screenRect.size.width;
        CGFloat screenHeight = screenRect.size.height;
        
        self.box = [[UIView alloc] init];
        self.box.frame = CGRectMake(0, 0, screenWidth, screenHeight);
        self.box.backgroundColor = [UIColor redColor];
        
        if ( adisplay ) {
            [acontroller.view addSubview:self.box];
        }
        
        
    }
    
    return self;
    
}

- (void)add:(NSString *)object width:(float)awidth high:(float)ahigh params:(NSMutableDictionary *)aparams display:(BOOL)adisplay controller:(UIViewController *)acontroller{
    
    NSArray *items = @[@"text", @"image", @"text_field"];
    int item = [items indexOfObject:object];
    
    switch (item) {
        case 0:
            
            if ( [aparams objectForKey:@"text"] ) {
                
                NSLog(@"box--  %f", self.box.frame.size.width);
                NSLog(@"agregando texto: %@", [aparams objectForKey:@"text"] );
                UILabel *label = [[UILabel alloc] init];
                if(adisplay){
                    label.frame = CGRectMake(0, 0, self.box.frame.size.width - 10, self.box.frame.size.height - 10);
                    [label setBackgroundColor:[UIColor whiteColor]];
                } else {
                    label.frame = CGRectMake(0, 0, self.box.frame.size.width - 20, self.box.frame.size.height - 20);
                    [label setBackgroundColor:[UIColor orangeColor]];
                }
                
                //label.frame = CGRectMake(self.box.frame.origin.x, self.box.frame.origin.y, self.box.frame.size.width, self.box.frame.size.height);
                [label setText:[aparams objectForKey:@"text"]];
                

                
                [self.box addSubview:label];
                [acontroller.view addSubview:self.box];
            }
            
            
            if ( [aparams objectForKey:@"font"] ) {NSLog(@"hay font");} else {NSLog(@"no hay font");}
        break;
            
        default:
            break;
    }
}

- (void)showSurface:(UIViewController *)acontroller {
    
    [acontroller.view addSubview:self.box];
}


@end
