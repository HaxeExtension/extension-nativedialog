#openfl-nativedialog

Native Dialog calls for OpenFL

This is a simple "Native Dialog" API implementation. So far it implements the "showMessage" function, but the extension will add more features like "showConfirmMessage" and "showMultipleOptions".

Pull requests and comments are appreciated.

###Simple use Example

```haxe
// This example show a simple sharing of a text using the NativeDialog Classs.

import extension.nativedialog.NativeDialog;

class SimpleExample {

	function showSomething(){
		NativeDialog.showMessage("There was an error","You request could not be processed", "OK");
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
