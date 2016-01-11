//
//  Surface.m
//  Tertulia
//
//  Created by Webchimp on 07/01/16.
//  Copyright © 2016 Webchimp. All rights reserved.
//

#import "Surface.h"
#import "UIImageView+AFNetworking.h"

@implementation Surface

-(id)init {
    
    [self setPaddingsleft:0 top:0 right:0 bottom:0];
    [self setMarginsleft:0 top:0 right:0 bottom:0];
    
    self.parent = nil;
    self.children = [[NSMutableDictionary alloc] init];
    return self;
}

- (id)initWithSizeWidth:(float)awidth height:(float)aheight position_x:(float)aposition_x position_y:(float)aposition_y controller:(UIViewController *)acontroller grid:(NSString *)agrid display:(BOOL)adisplay{

    if ( self = [super init] ) {
        
        width = awidth;
        height = aheight;
        position_x = aposition_x;
        position_y = aposition_y;
        
    }
    
    //NSLog(@"rfre");
    self.box = [[UIView alloc] init];
    self.box.frame = CGRectMake(position_x, position_y, width, height);
    self.box.backgroundColor = [UIColor blueColor];
    
    self.general_grid = agrid;
    
    [self setPaddingsleft:20 top:20 right:20 bottom:20];
    [self setMarginsleft:0 top:0 right:0 bottom:20];
    
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
        
        self.general_grid = agrid;
        
        self.box = [[UIView alloc] init];
        self.box.frame = CGRectMake(0, 0, screenWidth, screenHeight);
        self.box.backgroundColor = [UIColor redColor];
        
        [self setPaddingsleft:20 top:20 right:20 bottom:20];
        
        [self generateScroll];
        
        if ( adisplay ) {
            //[acontroller.view addSubview:self.box];
        }
        
        
    }
    
    return self;
}

-(id) initWithView:(UIViewController *)acontroller view:(UIView *)aview display:(BOOL)adisplay {
    
    
    if ( self = [super init] ) {
        
        self.box = aview;
        width = self.box.frame.size.width;
        height = self.box.frame.size.height;
        
        if ( adisplay ) {
            //[acontroller.view addSubview:self.box];
        }
        
        [self setMarginsleft:0 top:0 right:0 bottom:20];
        
    }
    
    return self;
}

- (void)add:(NSString *)object width:(float)awidth height:(float)aheight key:(NSString *)akey params:(NSMutableDictionary *)aparams display:(BOOL)adisplay controller:(UIViewController *)acontroller{
    
    NSArray *items = @[@"text", @"image", @"text_field"];
    NSInteger item = [items indexOfObject:object];
    
    UILabel *label = [[UILabel alloc] init];
    UIImageView *image = [[UIImageView alloc] init];
    CGRect frame = [self frame:awidth y:aheight];
    Surface *child;
    
    switch (item) {
        case 0:
            
            if ( [aparams objectForKey:@"text"] ) {
                
                [label setText:[aparams objectForKey:@"text"]];
                [label setBackgroundColor:[UIColor whiteColor]];
            }
            
            if ( [aparams objectForKey:@"font"] ) {NSLog(@"hay font");} else {NSLog(@"no hay font");}
            
            label.frame = frame;
            
            child = [[Surface alloc] initWithView:acontroller view:label display:adisplay];
            child.parent = self;
            [self.children setObject:child forKey:akey];
            NSLog(@"%@", self.children);
            
            [self.scroll addSubview:label];
            [self updateScroll];
            
        break;
            
        case 1:
            
            if ( [aparams objectForKey:@"name"] && [[aparams objectForKey:@"name"] length] != 0 ) {
                
                image.image = [UIImage imageNamed:[aparams objectForKey:@"name"]];
            
            } else if( [aparams objectForKey:@"url"] && [[aparams objectForKey:@"url"] length] != 0 ) {
                
                [image setImageWithURL:[NSURL URLWithString: [aparams objectForKey:@"url"] ] placeholderImage:[UIImage imageNamed:@"gato"]];
            }
            
            image.frame = frame;
            
            [self.scroll addSubview:image];
            [self updateScroll:image.frame.size.width y:image.frame.size.height];
            
            break;
            
        default:
            break;
    }
}

- (void)addSurface:(Surface *)surf respect_position:(BOOL)aposition{

    if ( aposition ) {
        [self.scroll addSubview:surf.self.box];
    } else {
        surf.self.box.frame = CGRectMake(self.layout_x, self.layout_y, surf.self.box.frame.size.width, surf.self.box.frame.size.height);
        [self.scroll addSubview:surf.self.box];
    }
    
    [self updateScroll:surf.self.box.frame.size.width y:surf.self.box.frame.size.height];
}

- (void)showSurface:(UIViewController *)acontroller {
    
    [acontroller.view addSubview:self.box];
}

- (void)generateScroll {
    
    self.layout_x = 0;
    self.layout_y = 0;
    
    if ( [self.general_grid isEqualToString:@"horizontal"] ) {
        
        self.scroll = [[UIScrollView alloc] initWithFrame:self.box.bounds];
        self.scroll.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        self.scroll.contentSize = CGSizeMake(0, self.scroll.frame.size.height);
        [self.box addSubview:self.scroll];
    } else if ( [self.general_grid isEqualToString:@"fluid"] ) {
        
        self.scroll = [[UIScrollView alloc] initWithFrame:self.box.bounds];
        self.scroll.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        self.scroll.contentSize = CGSizeMake(self.scroll.frame.size.width, 0);
        [self.box addSubview:self.scroll];
    }
    
}


- (void)updateScroll:(float)ax y:(float)ay {
    
    if ( [self.general_grid isEqualToString:@"fluid"] ) {
       // self.layout_x = self.layout_x + (ax + self.layout_constant_x);
        self.layout_y = self.layout_y + (ay + self.layout_constant_y);
    }
    if ( [self.general_grid isEqualToString:@"horizontal"] ) {
        self.layout_x = self.layout_x + (ax + self.layout_constant_x);
        //self.layout_y = self.layout_y + (ay + self.layout_constant_y);
    }
   
    self.scroll.contentSize = CGSizeMake(self.layout_x, self.layout_y);
}

- (void)updateScroll {
    
    self.layout_y = self.parent != nil ? self.parent.padding.top : 0 ;
    self.layout_x = self.parent != nil ? self.parent.padding.left : 0 ;
    
    for (NSString *aKey in [self.children allKeys]) {
        
        NSDictionary *aValue = [self.children valueForKey:aKey];
        NSLog(@"Key : %@", aKey);
        NSLog(@"Value : %@", aValue);

    }
    
}

- (CGRect)frame:(float)awidth y:(float)aheight {
    
    CGRect frame;
    //FRAME
    awidth = awidth !=-1 ? awidth : (self.scroll.frame.size.width -40 );
    aheight = aheight !=-1 ? aheight : 35;
    
    frame = CGRectMake(self.layout_x, self.layout_y, awidth, aheight);
    
    return frame;
    
}

- (void)update {
    
    if ( self.parent == nil || self.parent == NULL ) {
        
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        CGFloat screenWidth = screenRect.size.width;
        CGFloat screenHeight = screenRect.size.height;
        
        self.box.frame = CGRectMake(0, 0, screenWidth, screenHeight);
    } else {
        
        if ( width == -1 || height == -1 ) {
            
        }
    }
    
    //[self generateScroll];
}

- (void)setMarginsleft:(float)aleft top:(float)atop right:(float)aright bottom:(float)abottom {
    
    CGValues margins = self.margin;
    margins.left = aleft;
    margins.top = atop;
    margins.right = aright;
    margins.bottom = abottom;
    self.margin = margins;
}

- (void)setPaddingsleft:(float)aleft top:(float)atop right:(float)aright bottom:(float)abottom {
    
    CGValues paddings = self.margin;
    paddings.left = aleft;
    paddings.top = atop;
    paddings.right = aright;
    paddings.bottom = abottom;
    self.margin = paddings;
}

@end
