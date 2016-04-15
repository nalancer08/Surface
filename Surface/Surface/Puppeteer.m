//
//  Puppeteer.m
//  Surface
//
//  Created by Webchimp on 13/04/16.
//  Copyright © 2016 Webchimp. All rights reserved.
//

#import "Puppeteer.h"
#import "Helpers.h"

@implementation Puppeteer

- (id)init:(UIViewController *)controller
{
    self = [super init];
    if (self) {
        
        _context = controller;
        
        _pannelHeader = nil;
        _pannelFooter = nil;
        _pannelContent = nil;
        
        _pannelRoot = nil;
        
        _viewRoot = nil;
        _viewHeader = nil;
        _viewFooter = nil;
        _viewContent = nil;
        
        _footerBottons = [[NSMutableArray alloc] init];
        _footerPanels = [[NSMutableArray alloc] init];
        
        _panelMenuButton = nil;
        _viewMenuButton = nil;
    }
    return self;
}

- (SfPanel *)createLayout:(int)layout {
        
    _pannelRoot = [[SfPanel alloc] init];
    _pannelContent = [[SfPanel alloc] init];
    
    _viewRoot = [[UIView alloc] init];
    _viewContent = [[UIView alloc] init];
    
    [self.pannelRoot setView:self.viewRoot];
    [self.pannelContent setView:self.viewContent];
    
    [self.pannelRoot setKey:@"puppeteer-root"];
    [self.pannelContent setKey:@"puppeteer-content"];
    
    UINavigationController *nav = [[UINavigationController alloc] init];
    float headerHeight = nav.navigationBar.frame.size.height;
    
    switch (layout) {
        case PUPPET_HEADER_ONLY:
            
            _pannelHeader = [[SfPanel alloc] init];
            _viewHeader = [[UIView alloc] init];
            
            [self.pannelHeader setView:self.viewHeader];
            [self.pannelHeader setKey:@"puppeteer-header"];
            
            break;
            
        case PUPPET_FOOTER_ONLY:
            _pannelFooter = [[SfPanel alloc] init];
            _viewFooter = [[UIView alloc] init];
            
            [self.pannelFooter setView:self.viewFooter];
            [self.pannelFooter setKey:@"puppeteer-footer"];
            
            
            break;
            
        case PUPPET_HEADER_FOOTER:
            _pannelHeader = [[SfPanel alloc] init];
            _pannelFooter = [[SfPanel alloc] init];
            
            _viewHeader = [[UIView alloc] init];
            _viewFooter = [[UIView alloc] init];
            
            [self.pannelHeader setView:self.viewHeader];
            [self.pannelFooter setView:self.viewFooter];
            
            [self.pannelHeader setKey:@"puppeteer-header"];
            [self.pannelFooter setKey:@"puppeteer-footer"];
            
            break;
    }
    
    [self.context.view addSubview:self.viewRoot];
    if ( self.viewHeader != nil ) {
        [self.context.view addSubview:self.viewHeader];
        [self.pannelRoot append:self.pannelHeader];

    }
    if ( self.viewFooter != nil ) {
        [self.context.view addSubview:self.viewFooter];
        [self.pannelRoot append:self.pannelFooter];

    }
    
    [self.pannelRoot append:self.pannelContent];
    [self.context.view addSubview:self.viewContent];
    
    [self.pannelRoot setPosition:SF_POSITION_FIXED];
    [self.pannelRoot setSize:-100 andHeight:-100];
    [self.pannelRoot setOrigin:0 Right:SF_UNSET Bottom:SF_UNSET Left:0];
    //[self.pannelRoot setPadding:10 Right:0 Bottom:0 Left:0];
    
    switch (layout) {
        case PUPPET_HEADER_ONLY:
            
            [self.pannelHeader setPosition:SF_POSITION_FIXED];
            [self.pannelHeader setSize:-100 andHeight:headerHeight];
            [self.pannelHeader setOrigin:20 Right:SF_UNSET Bottom:SF_UNSET Left:0];
            [self.pannelHeader setPadding:5 Right:5 Bottom:5 Left:5];
            [self.pannelHeader setZIndex:10];
            
            [self.pannelContent setPosition:SF_POSITION_FIXED];
            [self.pannelContent setSize:-100 andHeight:0];
            [self.pannelContent setOrigin:headerHeight Right:SF_UNSET Bottom:0 Left:0];
            [self.pannelContent setPadding:5 Right:5 Bottom:5 Left:5];
            [self.pannelContent setZIndex:10];
            
        break;
        case PUPPET_FOOTER_ONLY:
        
            [self.pannelFooter setPosition:SF_POSITION_FIXED];
            [self.pannelFooter setSize:-100 andHeight:headerHeight];
            [self.pannelFooter setOrigin:SF_UNSET Right:SF_UNSET Bottom:0 Left:0];
            [self.pannelFooter setPadding:5 Right:5 Bottom:5 Left:5];
            [self.pannelFooter setZIndex:10];
            
            [self.pannelContent setPosition:SF_POSITION_FIXED];
            [self.pannelContent setSize:-100 andHeight:0];
            [self.pannelContent setOrigin:0 Right:SF_UNSET Bottom:headerHeight Left:0];
            [self.pannelContent setPadding:5 Right:5 Bottom:5 Left:5];
            [self.pannelContent setZIndex:10];
            
        break;
            
        case PUPPET_HEADER_FOOTER:
        
            [self.pannelHeader setPosition:SF_POSITION_FIXED];
            [self.pannelHeader setSize:-100 andHeight:headerHeight];
            [self.pannelHeader setOrigin:20 Right:SF_UNSET Bottom:SF_UNSET Left:0];
            [self.pannelHeader setPadding:5 Right:5 Bottom:5 Left:5];
            [self.pannelHeader setZIndex:10];
            
            [self.pannelFooter setPosition:SF_POSITION_FIXED];
            [self.pannelFooter setSize:-100 andHeight:headerHeight];
            [self.pannelFooter setOrigin:SF_UNSET Right:SF_UNSET Bottom:0 Left:0];
            [self.pannelFooter setPadding:5 Right:5 Bottom:5 Left:5];
            [self.pannelFooter setZIndex:10];
            
            [self.pannelContent setPosition:SF_POSITION_FIXED];
            [self.pannelContent setSize:-100 andHeight:0];
            [self.pannelContent setOrigin:headerHeight + 20 Right:SF_UNSET Bottom:headerHeight Left:0];
            [self.pannelContent setPadding:5 Right:5 Bottom:5 Left:5];
            [self.pannelContent setZIndex:10];
            
        break;
    }

    self.viewRoot.backgroundColor = [UIColor clearColor];
    self.viewHeader.backgroundColor = [Helpers rgbColor:76 :76 :76];
    self.viewFooter.backgroundColor = [Helpers rgbColor:76 :76 :76];
    self.viewContent.backgroundColor = [Helpers rgbColor:255 :255 :255];

    [self.pannelRoot update];
    
    return self.pannelContent;
}

- (SfPanel *)addFooterButton:(NSString *)caption :(UIImage *)image :(int)width :(SEL)listener {
    
    
    SfPanel *panel = nil;
    
    if ( self.pannelFooter != nil ) {
        
        panel = [[SfPanel alloc] init];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        if ( caption != nil || ![caption isEqualToString:@""] ) {
            [button setTitle:caption forState:UIControlStateNormal];
            button.backgroundColor = [UIColor whiteColor];
            [button setTintColor:[UIColor blueColor]];
        }
        
        if ( listener != nil ) {
            [button addTarget:self.context action:listener forControlEvents:UIControlEventTouchUpInside];
        }
        
        if ( image != nil ) {
            //
        }
        
        [panel setView:button];
        [panel setSize:width andHeight:self.pannelFooter.frame.height];
        [self.pannelFooter append:panel];
        [self.context.view addSubview:button];
        
        [self.footerBottons addObject:button];
        [self.footerPanels addObject:panel];
        
        [self.pannelFooter update];
        
    }
    
    return panel;
    
}


- (SfPanel *)addMenuButton:(NSString *)caption :(UIImage *)image :(int)width :(int)placement :(SEL)listener {
    
    if ( self.pannelHeader != nil ) {
        if ( self.panelMenuButton == nil ) {
            self.panelMenuButton = [[SfPanel alloc] init];
            self.viewMenuButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            
            if ( caption != nil || ![caption isEqualToString:@""] ) {
                
                [self.viewMenuButton setTitle:caption forState:UIControlStateNormal];
                self.viewMenuButton.backgroundColor = [UIColor whiteColor];
                [self.viewMenuButton setTintColor:[UIColor blueColor]];
            }
            
            if ( listener != nil ) {
                [self.viewMenuButton addTarget:self.context action:listener forControlEvents:UIControlEventTouchUpInside];
            }
            
            [self.panelMenuButton setView:self.viewMenuButton];
            [self.panelMenuButton setSize:width andHeight:self.pannelHeader.frame.height];
            [self.pannelHeader append:self.panelMenuButton];
            [self.context.view addSubview:self.viewMenuButton];
            
            [self.panelMenuButton setPosition:SF_POSITION_ABSOLUTE];
            
            if ( placement == PUPPET_MENU_LEFT ) {
                [self.panelMenuButton setOrigin:0 Right:SF_UNSET Bottom:SF_UNSET Left:0];
            } else {
                [self.panelMenuButton setOrigin:0 Right:0 Bottom:SF_UNSET Left:SF_UNSET];
            }
            
            [self.pannelHeader update];
            
        }
    }
    
    return self.panelMenuButton;
}


@end
