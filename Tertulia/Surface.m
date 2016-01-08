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
    self.box.frame = CGRectMake(position_x, position_y, width, high);
    self.box.backgroundColor = [UIColor blueColor];
    
    [self generateScroll];
    
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
        
        [self generateScroll];
        
        if ( adisplay ) {
            //[acontroller.view addSubview:self.box];
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
                
                /*if(adisplay){
                    label.frame = CGRectMake(0, 0, self.box.frame.size.width - 10, self.box.frame.size.height - 10);
                    [label setBackgroundColor:[UIColor whiteColor]];
                } else {
                    label.frame = CGRectMake(0, 0, self.box.frame.size.width - 20, self.box.frame.size.height - 20);
                    [label setBackgroundColor:[UIColor orangeColor]];
                } */

                [label setText:[aparams objectForKey:@"text"]];
                [label setBackgroundColor:[UIColor whiteColor]];
                
                if ( awidth != 0 && ahigh != 0 ) {
                    label.frame = CGRectMake(self.layout_x, self.layout_y, awidth, ahigh);
                } else if ( awidth!= 0 && ahigh == 0 ) {
                    label.frame = CGRectMake(self.layout_x, self.layout_y, awidth, 35);
                } else if ( awidth == 0 && ahigh != 0 ) {
                    label.frame = CGRectMake(self.layout_x, self.layout_y, (self.scroll.frame.size.width - 40), ahigh);
                } else {
                    label.frame = CGRectMake(self.layout_x, self.layout_y, (self.scroll.frame.size.width - 40), 35);
                }
                
                
                
                [self.scroll addSubview:label];
                [self updateScroll:0 y:label.frame.size.height];
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

- (void)generateScroll {
    
    self.layout_x = 20;
    self.layout_y = 15;
    self.layout_constant_y = 15;
    self.layout_constant_x = 0;
    
    self.scroll = [[UIScrollView alloc] initWithFrame:self.box.bounds];
    self.scroll.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    self.scroll.contentSize = CGSizeMake(self.scroll.frame.size.width, 0);
    [self.box addSubview:self.scroll];
    
}

- (void)updateScroll:(float)ax y:(float)ay {
    
    self.layout_x = self.layout_x + (ax + self.layout_constant_x);
    self.layout_y = self.layout_y + (ay + self.layout_constant_y);
    
    self.scroll.contentSize = CGSizeMake(self.layout_x, self.layout_y);
}


@end
