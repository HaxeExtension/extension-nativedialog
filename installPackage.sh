#!/bin/bash
dir=`dirname "$0"`
cd "$dir"
haxelib remove openfl-nativedialog
haxelib local openfl-nativedialog.zip
