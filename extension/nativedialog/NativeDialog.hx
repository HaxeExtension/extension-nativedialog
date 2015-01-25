package extension.nativedialog;

#if android
import openfl.utils.JNI;
#elseif ios
import cpp.Lib;
#end

class NativeDialog {

	private static var callbackObject:NativeDialog=null;
	#if android
	private static var __showMessage : String->String->String->Void = JNI.createStaticMethod("nativedialog/NativeDialog", "showMessage", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V");
	private static var __init : NativeDialog->Void = JNI.createStaticMethod ("nativedialog/NativeDialog", "init", "(Lorg/haxe/lime/HaxeObject;)V");
	#elseif ios
	private static var __showMessage : String->String->String->Void = Lib.load("openflNativeDialogExtension","show_message",3);
	private static var __init : NativeDialog->Void = function(n:NativeDialog){};
	#end

	private static function init(){
		if(callbackObject != null) return;
		callbackObject = new NativeDialog();
		#if ( android || ios )
		__init(callbackObject);
		#end
	}

	public static var onShowMessageClose:Void->Void = null;

	public static function showMessage(title:String, text:String, buttonText:String) {
		init();
		try{
			#if ( android || ios )
				__showMessage(title, text, buttonText);
			#elseif hmtl5
				js.Browser.window.alert(title+"\n"+text);
				callbackObject._onShowMessageClose();
			#end
		}catch(e:Dynamic){
			trace("NativeDialog Exception: "+e);
		}
	}

	/////////////////////////// EVENT HANDLING ////////////////////////////

	private function new() {}
	private function _onShowMessageClose() { if(onShowMessageClose!=null) onShowMessageClose(); }
	
}
