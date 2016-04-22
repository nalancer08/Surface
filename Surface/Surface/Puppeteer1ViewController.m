//
//  Puppeteer1ViewController.m
//  Surface
//
//  Created by Webchimp on 13/04/16.
//  Copyright © 2016 Webchimp. All rights reserved.
//

#import "Puppeteer1ViewController.h"
#import "Puppeteer.h"
#import "SfPanel.h"
#import "Helpers.h"

@interface Puppeteer1ViewController () {
    Puppeteer *puppeteer;
}

@end

@implementation Puppeteer1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    puppeteer = [[Puppeteer alloc] init:self];
    SfPanel *content = [puppeteer createLayout:PUPPET_HEADER_FOOTER];
    
    content.view.backgroundColor = [UIColor whiteColor];
    SfPanel *button1 = [puppeteer addFooterButton:@"Aqui vamos" :nil :-25 :@selector(chachan)];
    SfPanel *button2 = [[[puppeteer addFooterButton:@"ATululun" :nil :-25 :@selector(chachan)] setMargin:-10 Right:0 Bottom:0 Left:0] setSize:-25 andHeight:puppeteer.pannelFooter.frame.height + 10];
    SfPanel *button3 = [puppeteer addFooterButton:@"laa" :nil :-25 :@selector(chachan)];
    
    [puppeteer.pannelFooter setPadding:0 Right:0 Bottom:0 Left:0];
    [puppeteer.pannelFooter update];
    
    UIFont *all = [UIFont fontWithName:@"FontAwesome" size:30];
    
    SfPanel *menu = [puppeteer addMenuButton:@"MENU" :nil :-25 :PUPPET_MENU_RIGHT :@selector(chachan)];
    UIButton *menuButton = (UIButton *)menu.view;
    [menuButton.titleLabel setFont:all];
    [menuButton setTintColor:[UIColor whiteColor]];
    menuButton.backgroundColor = [Helpers rgbColor:50 :50 :50];
    //NSString *str = [NSString stringWithFormat:@"%C", 0xf07d];
    [menuButton setTitle:@"\U0000f0c9" forState:UIControlStateNormal];
    
    
    UIButton *but1 = (UIButton *)button1.view;
    [but1.titleLabel setFont:all];
    [but1 setTintColor:[UIColor whiteColor]];
    but1.backgroundColor = [Helpers rgbColor:50 :50 :50];
    [but1 setTitle:@"\U0000f007" forState:UIControlStateNormal];
    
    UIButton *but2 = (UIButton *)button2.view;
    [but2.titleLabel setFont:all];
    [but2 setTintColor:[UIColor whiteColor]];
    but2.backgroundColor = [Helpers rgbColor:152 :50 :50];
    [but2 setTitle:@"\U0000f041" forState:UIControlStateNormal];
    
    UIButton *but3 = (UIButton *)button3.view;
    [but3.titleLabel setFont:all];
    [but3 setTintColor:[UIColor whiteColor]];
    but3.backgroundColor = [Helpers rgbColor:50 :50 :50];
    [but3 setTitle:@"\U0000f1ea" forState:UIControlStateNormal];
    
    /////////////Scroll
    
    SfPanel *panel1 = [[SfPanel alloc] init];
    SfPanel *panel2 = [[SfPanel alloc] init];
    SfPanel *panel3 = [[SfPanel alloc] init];
    SfPanel *panel4 = [[SfPanel alloc] init];
    SfPanel *panel5 = [[SfPanel alloc] init];
    SfPanel *panel6 = [[SfPanel alloc] init];
    SfPanel *panel7 = [[SfPanel alloc] init];
    
    UIView *view1 = [[UIView alloc] init];
    UIView *view2 = [[UIView alloc] init];
    UIView *view3 = [[UIView alloc] init];
    UIView *view4 = [[UIView alloc] init];
    UIView *view5 = [[UIView alloc] init];
    UIView *view6 = [[UIView alloc] init];
    UIView *view7 = [[UIView alloc] init];
    
    
    view1.backgroundColor = [UIColor redColor];
    view2.backgroundColor = [UIColor blueColor];
    view3.backgroundColor = [UIColor cyanColor];
    view4.backgroundColor = [UIColor yellowColor];
    view5.backgroundColor = [UIColor magentaColor];
    view6.backgroundColor = [UIColor grayColor];
    view7.backgroundColor = [UIColor greenColor];
    
    [panel1 setView:view1];
    [panel2 setView:view2];
    [panel3 setView:view3];
    [panel4 setView:view4];
    [panel5 setView:view5];
    [panel6 setView:view6];
    [panel7 setView:view7];
    
    [[panel1 setSize:-30 andHeight:60] setMargin:0 Right:5 Bottom:5 Left:0];
    [[panel2 setSize:-30 andHeight:60] setMargin:0 Right:5 Bottom:5 Left:0];
    [[panel3 setSize:-30 andHeight:30] setMargin:0 Right:5 Bottom:5 Left:0];
    [[panel4 setSize:-30 andHeight:150] setMargin:0 Right:5 Bottom:5 Left:0];
    [[panel5 setSize:-30 andHeight:60] setMargin:0 Right:5 Bottom:5 Left:0];
    [[panel6 setSize:-30 andHeight:60] setMargin:0 Right:5 Bottom:5 Left:0];
    [[panel7 setSize:-30 andHeight:150] setMargin:0 Right:5 Bottom:5 Left:0];
    
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    scrollView.contentSize = CGSizeMake(350, 10);
    scrollView.backgroundColor = [UIColor blueColor];
    
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor orangeColor];
    
    SfPanel *scrollPanel = [[SfPanel alloc] init];
    SfPanel *innerPanel = [[SfPanel alloc] init];
    
    [self.view addSubview:scrollView];
    [scrollView addSubview:view];
    [scrollView addSubview:view1];
    [scrollView addSubview:view2];
    [scrollView addSubview:view3];
    [scrollView addSubview:view4];
    [scrollView addSubview:view5];
    [scrollView addSubview:view6];
    [scrollView addSubview:view7];
    
    [scrollPanel setView:scrollView];
    [innerPanel setView:view];
    
    [[[scrollPanel setSize:-100 andHeight:200] append:innerPanel] setKey:@"scroll"];
    [[innerPanel setSize:-100 andHeight:0] setKey:@"children"];
    
    [innerPanel append:panel1];
    [innerPanel append:panel2];
    [innerPanel append:panel3];
    [innerPanel append:panel4];
    [innerPanel append:panel5];
    [innerPanel append:panel6];
    [innerPanel append:panel7];
    
    scrollPanel.scrollHost = TRUE;
    
    [content append:scrollPanel];
    [content update];
    
    scrollView.contentSize = CGSizeMake(350, scrollPanel.scrollHeight);
    
    
    /*UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"Magia" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    
    
    //[button addTarget:self action:@selector(magia) forControlEvents:UIControlEventTouchUpInside];
    
    /*for (NSString* family in [UIFont familyNames])
    {
        NSLog(@"%@", family);
        
        for (NSString* name in [UIFont fontNamesForFamilyName: family])
        {
            NSLog(@"  %@", name);
        }
    }*/
    
    /*SfPanel *b3 = [[SfPanel alloc] init];
    [b3 setKey:@"b3"];
    [b3 setView:button];
    [b3 setSize:-100 andHeight:40];
    [content append:b3];
    [self.view addSubview:button];*/
    
    
    [content update];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)chachan {
    NSLog(@"funcionando el agregado de botones al footer");
}

@end
