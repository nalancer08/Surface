//
//  SfPanel.m
//  Surface
//
//  Created by Webchimp on 22/03/16.
//  Copyright © 2016 Webchimp. All rights reserved.
//

#import "SfPanel.h"

@implementation SfPanel

//@dynamic position;

- (id) init
{
    self = [super init];
    if (self) {
        
        self.point = [[SfPoint alloc] init];
        self.size = [[SfSize alloc] init];
        self.frame = [[SfRect alloc] init];
        self.origin = [[SfBox alloc] init];
        self.margin = [[SfBox alloc] init];
        self.padding = [[SfBox alloc] init];
        self.view = [[UIView alloc] init];
        self.parent = nil;
        
        self.next = nil;
        self.prev = nil;
        self.lastChild = nil;
        self.firstChild = nil;
        
        //self.children = [[NSMutableArray alloc] init];
        self.position = SF_POSITION_RELATIVE;
        self.alignment = SF_ALIGNMENT_CENTER;
    }
    return self;
}

- (SfPanel *)setSize:(float)width andHeight:(float)height {
    
    [self.size setSize:width andHeight:height];
    //NSLog(@"size %@", self.size);
    return self;
}

- (void)setPosition:(int)position {

    _position = position;

}

- (void)setAlignment:(int)alignment {
    
    _alignment = alignment;
    
}

- (SfPanel *)setOrigin:(float)top Right:(float)right Bottom:(float)bottom Left:(float)left {
    
    [self.origin setBox:top Right:right Bottom:bottom Left:left];
    return self;
}

- (SfPanel *)setMargin:(float)top Right:(float)right Bottom:(float)bottom Left:(float)left {
    
    [self.margin setBox:top Right:right Bottom:bottom Left:left];
    return self;
}

- (SfPanel *)setPadding:(float)top Right:(float)right Bottom:(float)bottom Left:(float)left {
    
    [self.padding setBox:top Right:right Bottom:bottom Left:left];
    return self;
}

- (void)setParent:(SfPanel *)parent {
    
    if (parent != nil) {
    	_parent = parent;
    }
    
}

- (SfPanel *)getParent {
    
    return self.parent;
}

- (void)setKey:(NSString *)key {
    _key = key;
}

- (NSString *)getKey {
    return self.key;
}

- (SfPanel *)append:(SfPanel *)object {
    
    if ( object != nil ) {
    	
        [object setParent:self];
        //[self.children addObject:object];
        // Logica de nuestra lista magica
        if ( !self.lastChild ) {
            
            self.firstChild = object;
            self.lastChild = object;
            
        } else {
            
            object.prev = self.lastChild;
            self.lastChild.next = object;
            self.lastChild = object;
        }
        
    }
    return self;
}

- (SfPanel *)prepend:(SfPanel *)object {
    
    if ( object != nil ) {
    
        [object setParent:self];
        //[self.children insertObject:object atIndex:0];
        // Logica de nuestra lista magica
        if ( !self.firstChild ) {
            
            self.firstChild = object;
            self.lastChild = object;
            
        } else {
            
            object.next = self.firstChild;
            self.firstChild.prev = object;
            self.firstChild = object;
        }


    }
    
    return self;
}

- (NSMutableArray *)getChildren {
    
    NSMutableArray *children = [[NSMutableArray alloc] init];
    SfPanel *child = self.firstChild;
    
    while ( child != NULL || child != nil ) {
        
        [children addObject:child];
        child = child.next;
    }
    
    return children;
}

- (void)setZIndex:(int)z {
    
    _zIndex = z;
}

- (void)setVisible:(BOOL)vis {
    
    _visible = vis;
}


- (SfPanel *)next {
    return _next;
}

- (SfPanel *)prev {
    return _prev;
}

- (NSMutableArray *)siblings {
    
    NSMutableArray *siblings = [[NSMutableArray alloc] init];
    
    if ( self.parent ) {
        SfPanel *sibling = self.parent.firstChild;
        
        while ( sibling != NULL || sibling != nil ) {
            
            if ( sibling == self ) continue;
            [siblings addObject:sibling];
            sibling = sibling.next;
        }
    }
    return siblings;

}

- (SfPanel *)find:(NSString *)key {
    SfPanel *child = self.firstChild;
    SfPanel *ret;
    
    while ( child != nil ) {
        if ( [ [child getKey] isEqualToString:key ] ) {
            ret = child;
            break;
        } else {
            ret = [child find:key];
            if ( ret != nil )break;
        }
        child = child.next;
    }
    return ret;
}

- (SfPanel *)closest:(NSString *)key {
    
    SfPanel *ret;
    if ( self.parent != nil ) {
        if ( [ [self.parent getKey] isEqualToString:key ] ) {
            ret = self.parent;
        } else {
            ret = [self.parent closest:key];
        }
    }
    
    return ret;
}

- (void)remove {
    
    SfPanel *prev = self.prev;
    SfPanel *next = self.next;
    
    prev.next = next;
    next.prev = prev;
    
}

- (void)calcSize {
    
    float parentW = 0;
    float parentH = 0;
    CGRect screenRect = [[UIScreen mainScreen] bounds];
        
    float screenW = screenRect.size.width;
    float screenH = screenRect.size.height;
    
    
    if ( self.parent ) {
        
        parentW = self.parent.frame.width - [self.parent.padding getWidth];
        parentH = self.parent.frame.height - [self.parent.padding getHeight];
        
    } else {
        
        parentW = screenW;
        parentH = screenH;
        
    }
            
    self.frame.width = self.size.width >= 0 ? self.size.width : ((parentW * (-self.size.width)) / 100 );
    self.frame.height = self.size.height >= 0 ? self.size.height : ((parentH * (-self.size.height)) / 100 );
    
    switch (self.position) {
        case SF_POSITION_RELATIVE:
            // Do nothing YAY!
        break;
            
        case SF_POSITION_ABSOLUTE:
            
            if ( self.origin.left != SF_UNSET && self.origin.right != SF_UNSET ) {
                
                self.frame.width = parentW - (self.origin.left + self.origin.right);
            }
            
            if ( self.origin.top != SF_UNSET && self.origin.bottom != SF_UNSET ) {
                
                self.frame.height = parentH - (self.origin.top + self.origin.bottom);
            }
            
        break;
            
        case SF_POSITION_FIXED:
            
            if ( self.origin.left != SF_UNSET && self.origin.right != SF_UNSET ) {
                
                self.frame.width = screenW - (self.origin.left + self.origin.right);
            }
            
            if ( self.origin.top != SF_UNSET && self.origin.bottom != SF_UNSET ) {
                
                self.frame.height = screenH - (self.origin.top + self.origin.bottom);
            }
            
            
        break;
    }
    
    
    SfPanel *child = self.firstChild;
    
    while ( child != nil ) {
        [child calcSize];
        child = child.next;
    }
    
}

- (void)calcPos {
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    CGSize statusBarSize = [[UIApplication sharedApplication] statusBarFrame].size;
    
    float screenW = screenRect.size.width;
    float screenH = screenRect.size.height - statusBarSize.height;

    if ( !self.parent ) {
                
        self.frame.x = self.origin.left + self.margin.left;
        self.frame.y = self.origin.top +  self.margin.top;
    }
    
    float srcX = 0;
    float srcY = 0;
    float srcW = self.frame.width - [self.padding getWidth];
    float srcH = self.frame.height - [self.padding getHeight];
            
    switch (self.alignment) {
        case SF_ALIGNMENT_LEFT:
            
            srcX = self.frame.x + self.padding.left;
            srcY = self.frame.y + self.padding.top;
            
        break;
            
        case SF_ALIGNMENT_RIGHT:
        
            srcX = self.frame.width - self.padding.left;
            srcY = self.frame.y + self.padding.top;
            
        break;
            
        case SF_ALIGNMENT_CENTER:
            
            srcX = srcW / 2;
            srcY = self.frame.y + self.padding.top;
            
        break;

    }
    
    float curX = srcX;
    float curY = srcY;
    
    // Iterate through children panels
    
    SfPanel *panel = self.firstChild;
    
    while ( panel != NULL || panel != nil ) {
        
        float panelW = panel.frame.width + [panel.margin getWidth];
        float panelH = panel.frame.height + [panel.margin getHeight];
        
        switch (panel.position) {
            case SF_POSITION_RELATIVE:
                
                    //
                    switch (self.alignment) {
                        case SF_ALIGNMENT_LEFT:
                            
                            if ( (srcW - curX) < panelW ) {
                                
                                curX = srcX;
                                curY += panelH;
                            }
                            
                            panel.frame.x = curX + panel.margin.left;
                            panel.frame.y = curY + panel.margin.top;
                            curX += panelW;
                            
                            
                            break;
                            
                        case SF_ALIGNMENT_RIGHT:
                            
                            if ( curX - panelW >= 0 ) {
                                
                                curX = srcX;
                                curY += panelH;
                            }
                            
                            panel.frame.x = curX - (panel.frame.width + panel.margin.left);
                            panel.frame.y = curY + panel.margin.top;
                            curX -= panelW;
                            
                            break;
                            
                        case SF_ALIGNMENT_CENTER:
                            
                            if ( curX == srcX ) {
                                
                                SfPanel *subPanel = panel;
                                float totalWidth = 0;
                                
                                while ( subPanel != nil ) {
                                    if ( subPanel.position == SF_POSITION_RELATIVE ) {
                                    
                                        float subPanelW = subPanel.frame.width + [subPanel.margin getWidth];
                                        if ( totalWidth + subPanelW <= srcW ) {
                                            totalWidth += panelW;
                                            
                                            // Increment
                                            subPanel = subPanel.next;
                                        } else {
                                            subPanel = nil;
                                        }
                                    
                                    } else {
                                        subPanel = subPanel.next;  
                                    }
                                    
                                }
                                
                                curX = srcX - (totalWidth / 2);
                                //
                            }
                            
                            if ( (srcW - curX) < panelW ) {
                                
                                curX = srcX;
                                curY += panelH;
                            }
                            
                            panel.frame.x = curX + panel.margin.left;
                            panel.frame.y = curY + panel.margin.top;
                            curX += panelW;
                            
                            break;
                    }

                    //
                
            break;
                
            case SF_POSITION_ABSOLUTE:
                
                if ( panel.origin.left == SF_UNSET || panel.origin.right == SF_UNSET ) {
                    
                    float parentRight = self.frame.x + self.frame.width - self.padding.right;
                    panel.frame.x = (panel.origin.left == SF_UNSET) ? (self.origin.left + panel.origin.left + panel.margin.left) : (parentRight - (panelW + panel.origin.right));
                }
                
                
                if ( panel.origin.top == SF_UNSET || panel.origin.bottom == SF_UNSET ) {
                    
                    float parentBotton = self.frame.y + self.frame.height - self.padding.bottom;
                    panel.frame.y = (panel.origin.top == SF_UNSET) ? (self.origin.top + panel.origin.top + panel.margin.top) : (parentBotton - panelH + self.origin.bottom);
                }
                
            break;
                
            case SF_POSITION_FIXED:
                
                if ( panel.origin.left == SF_UNSET || panel.origin.right == SF_UNSET ) {
                    panel.frame.x = (panel.origin.left != SF_UNSET) ? (panel.origin.left + panel.margin.left) : (screenW - (panelW + panel.origin.right));
                }
                
                if ( panel.origin.top == SF_UNSET || panel.origin.bottom == SF_UNSET ) {
                    panel.frame.y = (panel.origin.top != SF_UNSET) ? (panel.origin.top + panel.margin.top) : (screenH - (panelH + panel.origin.bottom));
                }
                
            break;
        }
            
        
        [panel calcPos];
        // Increment
        panel = panel.next;
        
    }
    
}


- (void)update {
    
    [self calcSize];
    [self calcPos];
    
    CGRect rect = CGRectMake(self.frame.x, self.frame.y, self.frame.width, self.frame.height);
    
    if ( self.view ) {
        self.view.frame = rect;
    }
    
    SfPanel *child = self.firstChild;
    
    while ( child != nil ) {
        [child update];
        child = child.next;
    }
}

- (void)setView:(UIView *)view {
    _view = view;
}

- (UIView *)getView {
    return self.view;
}

@end
