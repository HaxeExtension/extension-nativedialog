#include <NativeDialog.h>
#import <UIKit/UIKit.h>

namespace openflNativeDialogExtension {
	
	void showMessage(const char* title, const char* text, const char* buttonText){
		[[[UIAlertView alloc] 
					initWithTitle:[[NSString alloc] initWithUTF8String:title]
					message:[[NSString alloc] initWithUTF8String:text]
					delegate:nil
					cancelButtonTitle:[[NSString alloc] initWithUTF8String:buttonText]
					otherButtonTitles:nil, nil] show];			
	}

}
