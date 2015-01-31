#openfl-nativedialog

Native Dialog calls for OpenFL

This is a simple "Native Dialog" API implementation. So far it implements the "showMessage" and the "confirmMessage" function, but the extension will add more features like "showMultipleOptions".

Pull requests and comments are appreciated.

###Simple use Example

```haxe
// This is a simple example that shows how to une the openfl-nativedialog extension.

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
haxelib install openfl-nativedialog
```

###License

http://www.gnu.org/licenses/lgpl.html

This library is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License (LGPL) as published by the Free Software Foundation; either
version 3 of the License, or (at your option) any later version.
  
This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
Lesser General Public License for more details.
  
You should have received a copy of the GNU Lesser General Public
License along with this library; if not, write to the Free Software
Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.


WebSite: https://github.com/fbricker/openfl-nativedialog | Author: Federico Bricker | Copyright (c) 2015 SempaiGames (http://www.sempaigames.com)
