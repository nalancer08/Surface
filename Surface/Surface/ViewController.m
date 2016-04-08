//
//  ViewController.m
//  Surface
//
//  Created by Webchimp on 18/03/16.
//  Copyright © 2016 Webchimp. All rights reserved.
//

#import "ViewController.h"
#import "SfPanel.h"

@interface ViewController ()

@end

@implementation ViewController {
    SfPanel *root;
    SfPanel *b1;
    SfPanel *b2;
    SfPanel *b3;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
   /* SfPanel *body = [[SfPanel alloc] init];
    SfPanel *header = [[SfPanel alloc] init];
    SfPanel *footer = [[SfPanel alloc] init];
    
    [body setSize:-50 andHeight:80];
    [body setPosition:SF_POSITION_ABSOLUTE];
    [body setOrigin:0 Right:-1 Bottom:-1 Left:0];
    
    [body calcSize];
    
    [header setSize:-100 andHeight:40];
    [header setPosition:SF_POSITION_ABSOLUTE];
    [header setOrigin:0 Right:-1 Bottom:-1 Left:0];
    [header setZIndex:10];
    
    [body calcSize];
    
    [footer setSize:-100 andHeight:40];
    [footer setPosition:SF_POSITION_ABSOLUTE];
    [footer setOrigin:0 Right:-1 Bottom:-1 Left:0];
    [footer setZIndex:10];
    
    [body calcSize];
    
    [body append:header];
    [body append:footer];*/
    
    CGSize statusBarSize = [[UIApplication sharedApplication] statusBarFrame].size;
    NSLog(@"hb == %f", statusBarSize.height);
    
    UIView *uroot = [[UIView alloc] init];
    uroot.backgroundColor = [UIColor redColor];
    
    UIView *uheader = [[UIView alloc] init];
    uheader.backgroundColor = [UIColor blueColor];
    
    UIView *ub1 = [[UIView alloc] init];
    ub1.backgroundColor = [UIColor yellowColor];
    
    UIView *ub2 = [[UIView alloc] init];
    ub2.backgroundColor = [UIColor magentaColor];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"Magia" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor clearColor];
    [button addTarget:self action:@selector(magia) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *ub3 = [[UIView alloc] init];
    ub3.backgroundColor = [UIColor cyanColor];
    
    
    root = [[SfPanel alloc] init];
    SfPanel *header = [[SfPanel alloc] init];
    
    b1 = [[SfPanel alloc] init];
    b2 = [[SfPanel alloc] init];
    b3 = [[SfPanel alloc] init];
    
    // LLaves
    [root setKey:@"root"];
    [header setKey:@"header"];
    [b1 setKey:@"b1"];
    [b2 setKey:@"b2"];
    [b3 setKey:@"b3"];
    //
    
    
    [root setView:uroot];
    [header setView:uheader];
    
    [b1 setView:ub1];
    [b2 setView:button];
    [b3 setView:ub3];
    
    [self.view addSubview:uroot];
    [self.view addSubview:uheader];
    [self.view addSubview:ub1];
    [self.view addSubview:button];
    [self.view addSubview:ub3];
    
    [root setSize:-100 andHeight:-100];
    [root setOrigin:20 Right:SF_UNSET Bottom:SF_UNSET Left:0];
    [root setPosition:SF_POSITION_FIXED];
    
    [header setSize:-100 andHeight:50];
    [header setOrigin:20 Right:SF_UNSET Bottom:SF_UNSET Left:0];
    [header setPadding:5 Right:5 Bottom:5 Left:5];
    [header setPosition:SF_POSITION_FIXED];

    
    [b1 setSize:60 andHeight:40];
    [b1 setOrigin:0 Right:SF_UNSET Bottom:SF_UNSET Left:0];
    [b1 setMargin:0 Right:5 Bottom:0 Left:5];
    
    [b2 setSize:60 andHeight:40];
    [b2 setOrigin:0 Right:SF_UNSET Bottom:SF_UNSET Left:0];
    [b2 setMargin:0 Right:5 Bottom:0 Left:5];

    
    [b3 setSize:60 andHeight:40];
    [b3 setOrigin:0 Right:SF_UNSET Bottom:SF_UNSET Left:0];
    [b3 setMargin:0 Right:5 Bottom:0 Left:5];

    
    [root append:header];
    
    [header append:b1];
    [header append:b2];
    [header append:b3];
    

    [root update];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidLayoutSubviews {
    NSLog(@"func ruli");

    [root update];
}

- (void)magia {
    
    SfPanel *root2 = [b1 closest:@"root"];
    root2.view.backgroundColor = [UIColor purpleColor];
    
    SfPanel *buu = [root find:@"b3"];
    buu.view.backgroundColor = [UIColor whiteColor];
}

@end
