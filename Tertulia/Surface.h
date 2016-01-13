//
//  Surface.h
//  Tertulia
//
//  Created by Webchimp on 07/01/16.
//  Copyright © 2016 Webchimp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

struct CGValues {
    
    float left;
    float top;
    float right;
    float bottom;
    
}; typedef struct CGValues CGValues;

@interface Surface : UIView {
    
    float height;
    float width;
    float position_x;
    float position_y;
    
}

@property (nonatomic, retain)UIView *box;
@property (strong,nonatomic) UIScrollView *scroll;
@property (nonatomic) float layout_height;
@property (nonatomic) float layout_widht;
@property (nonatomic) float layout_x;
@property (nonatomic) float layout_y;
@property (nonatomic) float layout_constant_y;
@property (nonatomic) float layout_constant_x;
@property (retain, nonatomic) NSString *general_grid;

@property (retain, nonatomic) Surface *parent;
@property (retain, nonatomic) NSMutableDictionary *children;

@property (nonatomic, assign) CGValues margin;
@property (nonatomic, assign) CGValues padding;

@property (nonatomic, retain) UIViewController *vc;
@property (nonatomic) CGRect general_frame;


// Contructors & Contructores //
- (id)initFullSize:(UIViewController *)acontroller grid:(NSString *)agrid display:(BOOL )adisplay;
- (id)initWithSizeWidth:(float)awidth height:(float)aheight controller:(UIViewController *)acontroller grid:(NSString *)agrid display:(BOOL)adisplay;
- (id)initWithView:(UIViewController *)acontroller view:(UIView *)aview display:(BOOL)adisplay;

// Methods & Metodos //
- (void)add:(NSString *)object width:(float)awidth height:(float)aheight key:(NSString *)akey params:(NSMutableDictionary *)aparams display:(BOOL)adisplay controller:(UIViewController *)acontroller;
//- (void)addCustom:(NSString *)object width:(float)awidth height:(float)aheight position_x:(float)aposition_x position_y:(float)aposition_y display:(BOOL)adisplay;
- (void)addSurface:(Surface *)surf key:(NSString *)akey respect_position:(BOOL)aposition;

- (void)showSurface:(UIViewController *)acontroller;

// Methods Layout & Metodos para Layout //
- (void)generateScroll;
- (void)updateScroll:(float)ax y:(float)ay;
- (void)updateScroll;
- (void)update;

// Details & Detalles //
//- (void)background:(UIColor *)color;

// Frames
- (CGRect)frame:(float)awidth y:(float)aheight;
- (void)setMarginsleft:(float)aleft top:(float)atop right:(float)aright bottom:(float)abottom;
- (void)setPaddingsleft:(float)aleft top:(float)atop right:(float)aright bottom:(float)abottom;
- (void)setOrigins_x:(float)ax y:(float)ay frame:(CGRect)aframe;
- (void)setSizes_width:(float)awidth height:(float)aheight frame:(CGRect)aframe;

@end
