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

- (void) start {
    
    [self setPaddingsleft:0 top:0 right:0 bottom:0];
    [self setMarginsleft:0 top:0 right:0 bottom:0];
    
    self.parent = nil;
    self.children = [[NSMutableDictionary alloc] init];
}

- (id)initFullSize:(UIViewController *)acontroller grid:(NSString *)agrid display:(BOOL)adisplay {
    
    if ( self = [super init] ) {
        
        [self start];
        
        
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        CGFloat screenWidth = screenRect.size.width;
        CGFloat screenHeight = screenRect.size.height;
        
        width = screenWidth;
        height = screenHeight;
        
        self.general_grid = agrid;
        self.vc = acontroller;
        [self setSizes_width:screenWidth height:screenHeight];
        
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

- (id)initWithSizeWidth:(float)awidth height:(float)aheight controller:(UIViewController *)acontroller grid:(NSString *)agrid display:(BOOL)adisplay {

    if ( self = [super init] ) {
        
        width = awidth;
        height = aheight;
        
        [self setSizes_width:awidth height:aheight];
        
        [self start];
        
    }
    
    //NSLog(@"rfre");
    self.box = [[UIView alloc] init];
    self.box.frame = CGRectMake(0, 0, width, height);
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


-(id) initWithView:(UIViewController *)acontroller view:(UIView *)aview display:(BOOL)adisplay {
    
    
    if ( self = [super init] ) {
        
        self.box = aview;
        width = self.box.frame.size.width;
        height = self.box.frame.size.height;
        
        if ( adisplay ) {
            //[acontroller.view addSubview:self.box];
        }
        
        self.parent = nil;
        self.children = [[NSMutableDictionary alloc] init];
        
        [self setMarginsleft:0 top:0 right:0 bottom:20];
        [self setPaddingsleft:0 top:0 right:0 bottom:0];
        
    }
    
    return self;
}

- (void)add:(NSString *)object width:(float)awidth height:(float)aheight key:(NSString *)akey params:(NSMutableDictionary *)aparams display:(BOOL)adisplay controller:(UIViewController *)acontroller{
    
    NSArray *items = @[@"text", @"image", @"text_field"];
    NSInteger item = [items indexOfObject:object];
    
    UILabel *label;
    UIImageView *image;
    
    CGRect frame = [self frame:awidth y:aheight];
    Surface *child;
    
    switch (item) {
        case 0:
            
            label = [[UILabel alloc] init];
            if ( [aparams objectForKey:@"text"] ) {
                
                [label setText:[aparams objectForKey:@"text"]];
                [label setBackgroundColor:[UIColor whiteColor]];
            }
            
            //if ( [aparams objectForKey:@"font"] ) {NSLog(@"hay font");} else {NSLog(@"no hay font");}
            
            label.frame = frame;
            
            child = [[Surface alloc] initWithView:acontroller view:label display:adisplay];
            child.parent = self;
            [self.children setObject:child forKey:akey];
            //NSLog(@"agregando el hijo::: %@", child);
            
            [self.scroll addSubview:label];
            [self updateScroll];
            
        break;
            
        case 1:
            
            image = [[UIImageView alloc] init];
            
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

- (void)addSurface:(Surface *)surf key:(NSString *)akey respect_position:(BOOL)aposition {
    
    surf.self.box.frame = [self frame:surf.self.box.frame.size.width y:surf.self.box.frame.size.height];
    [surf setPaddingsleft:0 top:0 right:0 bottom:0];
    
    surf.parent = self;
    [self.children setObject:surf forKey:akey];
    
    [self.scroll addSubview:surf.self.box];
    [self updateScroll];
}

- (void)showSurface:(UIViewController *)acontroller {
    
    [acontroller.view addSubview:self.box];
}

- (void)generateScroll {
    
    self.layout_x = self.padding.left;
    self.layout_y = self.padding.top;
    
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
    
    self.layout_y = self.padding.top;
    self.layout_x = self.padding.left;

    for ( NSString* key in self.children ) {
        
        Surface *Surf = [self.children valueForKey:key];
        //NSLog(@"el surf en el loop == %@", Surf);
        
        self.layout_y = self.layout_y + (Surf.margin.top + Surf.margin.bottom + Surf.padding.top + Surf.padding.bottom + Surf->height);
        
    }
    
    self.scroll.contentSize = CGSizeMake(self.layout_x, (self.layout_y + self.padding.bottom));
}

- (CGRect)frame:(float)awidth y:(float)aheight {
    
    CGRect frame;
    //FRAME
    awidth = awidth != -1 ? awidth : ( self.scroll.frame.size.width - ( self.padding.left + self.padding.right ) );
    aheight = aheight != -1 ? aheight : 35;
    
    [self updateScroll];
    
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
        
        if ( width != -1 || height != -1 ) {
            
            self->width = self.parent->width - (self.parent.padding.left + self.margin.left + self.parent.padding.right + self.margin.right);

            CGRect frame = self.frame;
            frame.size.width = self->width;
            frame.size.height = self->height;
            self.frame = frame;

        }
    }
    
    for ( NSString* key in self.children ) {
        
        Surface *Surf = [self.children valueForKey:key];
        [Surf update];
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
    
    CGValues paddings = self.padding;
    paddings.left = aleft;
    paddings.top = atop;
    paddings.right = aright;
    paddings.bottom = abottom;
    self.padding = paddings;
}

- (void)setSizes_width:(float)awidth height:(float)aheight {
    
    CGRect frame = self.general_frame;
    frame.size.width = awidth;
    frame.size.height = aheight;
    self.general_frame = frame;
}

@end
