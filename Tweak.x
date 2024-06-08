#include <Foundation/NSObjCRuntime.h> 
#import <UIKit/UIKit.h>

@interface SupportPageViewController : UIPageViewController <UIPageViewControllerDelegate, UIPageViewControllerDataSource>
@end

%hook AppSettingsView



- (void)showTerms{
	 [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"https://google.com"] options:@{} completionHandler:nil];

	
}
// Always make sure you clean up after yourself; Not doing so could have grave consequences!
%end


%hook SupportPageViewController

- (void)showFAQs{
	UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Pingas!App"
	            message:@"Dr Pingas would like to see you." 
	            preferredStyle:UIAlertControllerStyleAlert]; // 1
	    UIAlertAction *firstAction = [UIAlertAction actionWithTitle:@"YES"
	            style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
	               NSLog(@"You pressed button one");
	            }]; // 2
	    UIAlertAction *secondAction = [UIAlertAction actionWithTitle:@"YES"
	            style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
	                NSLog(@"You pressed button two");
	            }]; // 3

    [alert addAction:firstAction]; // 4
    [alert addAction:secondAction]; // 5

    [self presentViewController:alert animated:YES completion:nil]; // 6

}

%end