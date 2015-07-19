#!/bin/bash
dir=`dirname "$0"`
cd "$dir"
haxelib remove extension-nativedialog
haxelib local extension-nativedialog.zip
