#!/bin/bash
dir=`dirname "$0"`
cd "$dir"
rm -f extension-nativedialog.zip
rm -rf project/obj
lime rebuild . ios && lime rebuild . blackberry
rm -rf project/obj
zip -0r extension-nativedialog.zip extension haxelib.json include.xml java ndll project
