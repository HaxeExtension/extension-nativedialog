#extension-nativedialog

Native Dialog calls for OpenFL

This is a simple "Native Dialog" API implementation. So far it implements the "showMessage" and the "confirmMessage" function, but the extension will add more features like "showMultipleOptions".

Pull requests and comments are appreciated.

###Simple use Example

```haxe
// This is a simple example that shows how to une the extension-nativedialog extension.

import extension.nativedialog.NativeDialog;

class SimpleExample {

	function new(){

		// setting onShoeMessageClose, onConfirmMessageOk and onConfirmMessageCancel is optional.

		NativeDialog.onShowMessageClose = function() { 
			trace("The user has pressed the 'OK' button.");
		}

		NativeDialog.onConfirmMessageCancel = function () {
			trace("The user has pressed the 'No thanks' button :(");
		}
		
		NativeDialog.onConfirmMessageOk = buyWaterproofTeaBags;

		showMessage();
	}

	function tellSomething(){
		NativeDialog.showMessage("There was an error","Your request failed. Please check your internet conenction and try again.", "OK");
	}

	function askSomething(){
		NativeDialog.confirmMessage("Special offer","Do you want to buy some waterproof tea bags?", "Yes!", "No thanks");
	}

	function buyWaterproofTeaBags(){
		// do something here...
	}

}

```

###How to Install

```bash
haxelib install extension-nativedialog
```

###License

The MIT License (MIT) - [LICENSE.md](LICENSE.md)

Copyright &copy; 2015 SempaiGames (http://www.sempaigames.com)

Author: Federico Bricker
