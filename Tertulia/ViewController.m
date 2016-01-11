//
//  ViewController.m
//  Tertulia
//
//  Created by Webchimp on 07/01/16.
//  Copyright © 2016 Webchimp. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    
    WebchimpUtilities *utilities;
    Surface *surf;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[WebchimpUtilities alerts :self :@"Funcionando todo" :@"Hola mundo desde alerta" :@"default"];

    UIDevice *device = [UIDevice currentDevice];
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(orientationChanged:) name:UIDeviceOrientationDidChangeNotification object:device];
    
    surf = [[Surface alloc] initFullSize:self grid:@"fluid" display:YES];
    //Surface *surface = [[Surface alloc] initWithSizeWidth:(NSInteger)200 height:(NSInteger)200 position_x:(NSInteger)20 position_y:(NSInteger)50 controller:self grid:@"horizontal" display:YES];

    
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{@"text" : @"Hola textooooooo!!!"}];
    //[params setObject:@"font" forKey:@"font"];
    [surf add:@"text" width:-1 height:200 key:@"label1" params:params display:YES controller:self];
    [surf add:@"text" width:-1 height:-1 key:@"label2" params:params display:YES controller:self];
    /*[surf add:@"text" width:10 height:10 params:params display:YES controller:self];
    [surf add:@"text" width:0 height:0 params:params display:YES controller:self];
    [surf add:@"text" width:100 height:100 params:params display:YES controller:self];
    [surf add:@"text" width:0 height:0 params:params display:YES controller:self];
    [surf add:@"text" width:0 height:0 params:params display:YES controller:self];
    [surf add:@"text" width:0 height:0 params:params display:YES controller:self];
    [surf add:@"text" width:0 height:0 params:params display:YES controller:self];
    [surf add:@"text" width:0 height:0 params:params display:YES controller:self];
    [surf add:@"text" width:0 height:0 params:params display:YES controller:self];
    [surf add:@"text" width:0 height:0 params:params display:YES controller:self];
    [surf add:@"text" width:0 height:0 params:params display:YES controller:self];
    [surf add:@"text" width:0 height:0 params:params display:YES controller:self];
    [surf add:@"text" width:0 height:0 params:params display:YES controller:self];*/
    //[surface add:@"text" width:1 height:1 params:params display:NO controller:self];
    
    //NSMutableDictionary *params1 = [NSMutableDictionary dictionaryWithDictionary:@{@"url" : @"https://stopbuyingrotas.files.wordpress.com/2010/08/evox.jpg"}];
    /*[surface add:@"text" width:100 height:100 params:params display:YES controller:self];
    [surface add:@"text" width:0 height:0 params:params display:YES controller:self];
    [surface add:@"text" width:0 height:0 params:params display:YES controller:self];
    [surface add:@"image" width:100 height:100 params:params1 display:YES controller:self];*/
    //[surf addSurface:surface respect_position:NO];
    
    //[surf add:@"image" width:200 height:200 params:params1 display:YES controller:self];
    
    [surf showSurface:self];
    //[surface showSurface:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)orientationChanged:(NSNotification *)note
{
    [surf update];
    //NSLog(@"Orientation  has changed: %ld", (long)[[note object] orientation]);
}

@end