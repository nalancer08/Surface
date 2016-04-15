//
//  Puppeteer.h
//  Surface
//
//  Created by Webchimp on 13/04/16.
//  Copyright © 2016 Webchimp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SfPanel.h"
#import <UIKit/UIKit.h>


#define PUPPET_HEADER_ONLY 0
#define PUPPET_FOOTER_ONLY 1
#define PUPPET_HEADER_FOOTER 2

#define PUPPET_MENU_RIGHT 0
#define PUPPET_MENU_LEFT 1

@interface Puppeteer : NSObject

    @property (retain, nonatomic) UIViewController *context;

    @property (retain, nonatomic) SfPanel *pannelHeader;
    @property (retain, nonatomic) SfPanel *pannelFooter;
    @property (retain, nonatomic) SfPanel *pannelContent;

    @property (retain, nonatomic) SfPanel *pannelRoot;
    @property (retain, nonatomic) UIView *viewRoot;

    @property (retain, nonatomic) UIView *viewHeader;
    @property (retain, nonatomic) UIView *viewFooter;
    @property (retain, nonatomic) UIView *viewContent;

    @property (retain, nonatomic) NSMutableArray *footerBottons;
    @property (retain, nonatomic) NSMutableArray *footerPanels;

    @property (retain, nonatomic) SfPanel *panelMenuButton;
    @property (retain, nonatomic) UIButton *viewMenuButton;

    // METHODS
    - (id)init:(UIViewController *)controller;
    - (SfPanel *)createLayout:(int)layout;

    - (SfPanel *)addFooterButton:(NSString *)caption :(UIImage *)image :(int)width :(SEL)listener;
    - (SfPanel *)getFooterButton;
    - (SfPanel *)removeFooterButton;
    - (SfPanel *)clearFooterButtons;

    - (SfPanel *)addMenuButton:(NSString *)caption :(UIImage *)image :(int)width :(int)placement :(SEL)listener;


@end
