package extension.nativedialog;

class NativeDialog {

	#if android
	private static var __showMessage : String->String->String->Void=openfl.utils.JNI.createStaticMethod("nativedialog/NativeDialog", "showMessage", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V");
	#elseif ios
	private static var __showMessage : String->String->String->Void=cpp.Lib.load("openflNativeDialogExtension","show_message",3);
	#end

	public static function showMessage(title:String, text:String, buttonText:String) {
		try{
			#if ( android || ios )
				__showMessage(title, text, buttonText);
			#elseif hmtl5
				js.Browser.window.alert(title+"\n"+text);
			#end
		}catch(e:Dynamic){
			trace("NativeDialog Exception: "+e);
		}
	}
	
}
