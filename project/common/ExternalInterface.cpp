#ifndef STATIC_LINK
#define IMPLEMENT_API
#endif

#if defined(HX_WINDOWS) || defined(HX_MACOS) || defined(HX_LINUX)
#define NEKO_COMPATIBLE
#endif


#include <hx/CFFI.h>
#include "NativeDialog.h"

using namespace openflNativeDialogExtension;

AutoGCRoot* onShowMessageClose = 0;

static value show_message(value title, value text, value buttonText){
	showMessage(val_string(title), val_string(text), val_string(buttonText));
	return alloc_null();
}
DEFINE_PRIM(show_message,3);

static value set_callback(value _onShowMessageClose)
{
	onShowMessageClose = new AutoGCRoot(_onShowMessageClose);
	return alloc_null();
}
DEFINE_PRIM(set_callback, 1);

extern "C" void sendShowMessageClose()
{
    val_call0(onShowMessageClose->get());
}


extern "C" void nativedialog_main () {	
	val_int(0); // Fix Neko init
	
}
DEFINE_ENTRY_POINT (nativedialog_main);


extern "C" int openflNativeDialogExtension_register_prims () { return 0; }
