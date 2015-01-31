#include <NativeDialog.h>
#import <UIKit/UIKit.h>

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

extern "C" void sendShowMessageClose();
extern "C" void sendConfirmMessageOk();
extern "C" void sendConfirmMessageCancel();

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

@interface ShowController : UIViewController<UIAlertViewDelegate>
	- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;
@end

@interface ConfirmController : UIViewController<UIAlertViewDelegate>
	- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;
@end

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

namespace openflNativeDialogExtension {

	ShowController* showVC = NULL;
	ConfirmController* confirmVC = NULL;

	ShowController* getShowVC(){
		if(showVC==NULL) showVC = [ShowController alloc];
		return showVC;
	}

	ConfirmController* getConfirmVC(){
		if(confirmVC==NULL) confirmVC = [ConfirmController alloc];
		return confirmVC;
	}

	void showMessage(const char* title, const char* text, const char* buttonText){
		[[[UIAlertView alloc] 
					initWithTitle:[[NSString alloc] initWithUTF8String:title]
					message:[[NSString alloc] initWithUTF8String:text]
					delegate:getShowVC()
					cancelButtonTitle:[[NSString alloc] initWithUTF8String:buttonText]
					otherButtonTitles:nil, nil] show];			
	}

	void confirmMessage(const char* title, const char* text, const char* okButtonText, const char* cancelButtonText){
		[[[UIAlertView alloc] 
					initWithTitle:[[NSString alloc] initWithUTF8String:title]
					message:[[NSString alloc] initWithUTF8String:text]
					delegate:getConfirmVC()
					cancelButtonTitle:[[NSString alloc] initWithUTF8String:cancelButtonText]
					otherButtonTitles:[[NSString alloc] initWithUTF8String:okButtonText], nil] show];		
	}

}

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

@implementation ShowController

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex; {
	sendShowMessageClose();
}

@end


@implementation ConfirmController

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex; {
	if (buttonIndex == 0)  {
		sendConfirmMessageCancel();
	} else if(buttonIndex == 1) {
		sendConfirmMessageOk();
	}
}

@end