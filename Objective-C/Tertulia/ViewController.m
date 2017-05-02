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
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[WebchimpUtilities alerts :self :@"Funcionando todo" :@"Hola mundo desde alerta" :@"default"];
    
    Surface *surf = [[Surface alloc] initFullSize:self grid:@"fluid" display:YES];
    Surface *surface = [[Surface alloc] initWithSizeWidth:(NSInteger)200 high:(NSInteger)200 position_x:(NSInteger)20 position_y:(NSInteger)50 controller:self grid:@"horizontal" display:YES];

    
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{@"text" : @"Hola textooooooo!!!"}];
    //[params setObject:@"font" forKey:@"font"];
    [surf add:@"text" width:1 high:1 params:params display:YES controller:self];
    [surf add:@"text" width:0 high:0 params:params display:YES controller:self];
    [surf add:@"text" width:10 high:10 params:params display:YES controller:self];
    [surf add:@"text" width:0 high:0 params:params display:YES controller:self];
    [surf add:@"text" width:100 high:100 params:params display:YES controller:self];
    [surf add:@"text" width:0 high:0 params:params display:YES controller:self];
    [surf add:@"text" width:0 high:0 params:params display:YES controller:self];
    [surf add:@"text" width:0 high:0 params:params display:YES controller:self];
    [surf add:@"text" width:0 high:0 params:params display:YES controller:self];
    [surf add:@"text" width:0 high:0 params:params display:YES controller:self];
    [surf add:@"text" width:0 high:0 params:params display:YES controller:self];
    [surf add:@"text" width:0 high:0 params:params display:YES controller:self];
    [surf add:@"text" width:0 high:0 params:params display:YES controller:self];
    [surf add:@"text" width:0 high:0 params:params display:YES controller:self];
    [surf add:@"text" width:0 high:0 params:params display:YES controller:self];
    //[surface add:@"text" width:1 high:1 params:params display:NO controller:self];
    [surface add:@"text" width:100 high:100 params:params display:YES controller:self];
    [surface add:@"text" width:0 high:0 params:params display:YES controller:self];
    [surface add:@"text" width:0 high:0 params:params display:YES controller:self];
    [surf addSurface:surface respect_position:NO];
    
    [surf showSurface:self];
    //[surface showSurface:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end