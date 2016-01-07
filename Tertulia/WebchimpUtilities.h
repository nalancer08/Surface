//
//  WebchimpUtilities.h
//  Tertulia
//
//  Created by Webchimp on 07/01/16.
//  Copyright © 2016 Webchimp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebchimpUtilities : UIViewController <UIAlertViewDelegate>

+ (void)alerts:(UIViewController *)controller :(NSString *)title :(NSString *)message :(NSString *)style;

@end
