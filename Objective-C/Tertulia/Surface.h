//
//  Surface.h
//  Tertulia
//
//  Created by Webchimp on 07/01/16.
//  Copyright © 2016 Webchimp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Surface : UIView {
    
    float high;
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

// Contructors & Contructores //
- (id)initWithSizeWidth:(float)awidth high:(float)ahigh position_x:(float)aposition_x position_y:(float)aposition_y controller:(UIViewController *)acontroller grid:(NSString *)agrid display:(BOOL)adisplay;
- (id)initFullSize:(UIViewController *)acontroller grid:(NSString *)agrid display:(BOOL )adisplay;

// Methods & Metodos //
- (void)add:(NSString *)object width:(float)awidth high:(float)ahigh params:(NSMutableDictionary *)aparams display:(BOOL)adisplay controller:(UIViewController *)acontroller;
- (void)addCustom:(NSString *)object width:(float)awidth high:(float)ahigh position_x:(float)aposition_x position_y:(float)aposition_y display:(BOOL)adisplay;
- (void)addSurface:(Surface *)surf respect_position:(BOOL)aposition;

- (void)showSurface:(UIViewController *)acontroller;

// Methods Layout & Metodos para Layout //
- (void)generateScroll;
- (void)updateScroll:(float)ax y:(float)ay;

// Details & Detalles //
- (void)background:(UIColor *)color;

@end
