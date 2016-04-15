//
//  SfPanel.h
//  Surface
//
//  Created by Webchimp on 22/03/16.
//  Copyright © 2016 Webchimp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SfPoint.h"
#import "SfRect.h"
#import "SfSize.h"
#import "SfBox.h"

#define SF_POSITION_ABSOLUTE 0
#define SF_POSITION_RELATIVE 1
#define SF_POSITION_FIXED 2

#define SF_ALIGNMENT_LEFT 0
#define SF_ALIGNMENT_RIGHT 1
#define SF_ALIGNMENT_CENTER 2
#define SF_UNSET -9999


@interface SfPanel : NSObject

    // Properties
    @property (retain, nonatomic) SfPoint *point;
    @property (retain, nonatomic) SfSize *size;
    @property (retain, nonatomic) SfRect *frame;
    @property (retain, nonatomic)SfBox *origin;
    @property (nonatomic) int zIndex;
    @property (nonatomic) int position;
    @property (nonatomic) bool visible;
    @property (retain, nonatomic) SfBox *margin;
    @property (retain, nonatomic) SfBox *padding;

    @property (retain, nonatomic) SfPanel *parent;
    @property (retain, nonatomic) SfPanel *next;
    @property (retain, nonatomic) SfPanel *prev;
    @property (retain, nonatomic) SfPanel *firstChild;
    @property (retain, nonatomic) SfPanel *lastChild;

    @property (retain, nonatomic) NSString *key;

    @property (retain, nonatomic) UIView *view;

    //@property (retain, nonatomic) NSMutableArray *children;
    @property (nonatomic) int alignment;

    // Methods
    - (SfPanel *)setSize:(float)width andHeight:(float)height;
    - (void)setPosition:(int)position;
    - (SfPanel *)setOrigin:(float)top Right:(float)right Bottom:(float)bottom Left:(float)left;
    - (SfPanel *)setMargin:(float)top Right:(float)right Bottom:(float)bottom Left:(float)left;
    - (SfPanel *)setPadding:(float)top Right:(float)right Bottom:(float)bottom Left:(float)left;
    - (void)setParent:(SfPanel *)parent;
    - (SfPanel *)getParent;
    - (SfPanel *)append:(SfPanel *)object;
    - (SfPanel *)prepend:(SfPanel *)object;
    - (NSMutableArray *)getChildren;
    - (void)setZIndex:(int)z;
    - (void)setVisible:(BOOL)vis;
    - (void)setAlignment:(int)alignment;

    - (void)setKey:(NSString *)key;
    - (NSString *)getKey;

    //
    - (void)calcSize;
    - (void)calcPos;
    - (void)update;

    - (void)setView:(UIView *)view;
    - (UIView *)getView;

    //
    - (SfPanel *)find:(NSString *)key;
    - (SfPanel *)next;
    - (SfPanel *)prev;
    - (NSMutableArray *)siblings;
    - (SfPanel *)closest:(NSString *)key;
    - (void)remove;


@end
