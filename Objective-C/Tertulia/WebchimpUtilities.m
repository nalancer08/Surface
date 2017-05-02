//
//  WebchimpUtilities.m
//  Tertulia
//
//  Created by Webchimp on 07/01/16.
//  Copyright © 2016 Webchimp. All rights reserved.
//

#import "WebchimpUtilities.h"

@interface WebchimpUtilities ()

@end

@implementation WebchimpUtilities

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+ (void)alerts:(UIViewController *)controller :(NSString *)title :(NSString *)message :(NSString *)style {
    
    //NSLog(@"Esta cosa dice: %@ ", message);
    
    if ( [style  isEqualToString: @"default"] ) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                    message:message
                                                    preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
            NSLog(@"You pressed button OK");
        }];
        
        [alert addAction:defaultAction];
        [controller.parentViewController presentViewController:alert animated:YES completion:nil];

    } else if ( [style isEqualToString: @"action"] ) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                       message:message
                                                                preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *firstAction = [UIAlertAction actionWithTitle:@"one"
                                                              style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                                                                  NSLog(@"You pressed button one");
                                                              }];
        UIAlertAction *secondAction = [UIAlertAction actionWithTitle:@"two"
                                                               style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                                                                   NSLog(@"You pressed button two");
                                                               }];
        
        [alert addAction:firstAction];
        [alert addAction:secondAction];
        
        [controller.parentViewController presentViewController:alert animated:YES completion:nil];
    }

}

@end
