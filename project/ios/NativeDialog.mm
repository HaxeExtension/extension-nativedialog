#include <NativeDialog.h>
#import <UIKit/UIKit.h>

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

extern "C" void sendShowMessageClose();

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

@interface ViewController : UIViewController<UIAlertViewDelegate>
	- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;
@end

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

namespace openflNativeDialogExtension {

	ViewController* vc = NULL;

	ViewController* getVC(){
		if(vc==NULL) vc = [ViewController alloc];
		return vc;
	}

	void showMessage(const char* title, const char* text, const char* buttonText){
		[[[UIAlertView alloc] 
					initWithTitle:[[NSString alloc] initWithUTF8String:title]
					message:[[NSString alloc] initWithUTF8String:text]
					delegate:getVC()
					cancelButtonTitle:[[NSString alloc] initWithUTF8String:buttonText]
					otherButtonTitles:nil, nil] show];			
	}	

}

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

@implementation ViewController

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex; {
	sendShowMessageClose();
	/*if (buttonIndex == 0)  {
		NSLog(@"You have clicked Cancel");
	} else if(buttonIndex == 1) {
		NSLog(@"You have clicked GOO");
	}*/     
}

@end