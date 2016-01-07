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
    
    Surface *surface = [[Surface alloc] initWithSizeWidth:(NSInteger)10 high:(NSInteger)10 position_x:(NSInteger)15 position_y:(NSInteger)60 controller:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
