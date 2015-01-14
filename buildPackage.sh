#!/bin/bash
dir=`dirname "$0"`
cd "$dir"
rm -f openfl-nativedialog.zip
rm -rf project/obj
lime rebuild . ios
rm -rf project/obj
zip -0r openfl-nativedialog.zip extension haxelib.json include.xml java ndll project
