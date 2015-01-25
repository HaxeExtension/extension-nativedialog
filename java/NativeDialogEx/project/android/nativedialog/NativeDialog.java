package nativedialog;

import android.content.DialogInterface;
import android.app.AlertDialog;
import org.haxe.lime.GameActivity;
import org.haxe.lime.HaxeObject;
import org.haxe.extension.Extension;

public class NativeDialog {

	private static HaxeObject callback = null;

	public static void init( HaxeObject callback ) {
		NativeDialog.callback = callback;
	}
    
	public static void showMessage( final String title, final String text, final String buttonText) {
		Extension.mainActivity.runOnUiThread(new Runnable() {
			public void run() {
				AlertDialog.Builder dialog = new AlertDialog.Builder(GameActivity.getInstance().getContext());
				DialogInterface.OnClickListener onClickListener = new DialogInterface.OnClickListener() {
					public void onClick(DialogInterface dialog, int which) {
						if(NativeDialog.callback!=null) NativeDialog.callback.call ("_onShowMessageClose",null);
					}
				};
				dialog.setTitle(title);
				dialog.setMessage(text);
				dialog.setNeutralButton(buttonText, onClickListener);
				dialog.show();
			}
		});
	}

	public static void confirmMessage( final String title, final String text, final String okText, final String cancelText) {
		Extension.mainActivity.runOnUiThread(new Runnable() {
			public void run() {
				AlertDialog.Builder dialog = new AlertDialog.Builder(GameActivity.getInstance().getContext());
				DialogInterface.OnClickListener onClickListener = new DialogInterface.OnClickListener() {
					public void onClick(DialogInterface dialog, int which) { }
				};
				dialog.setTitle(title);
				dialog.setMessage(text);
				dialog.setPositiveButton(okText, onClickListener);
				dialog.setNegativeButton(cancelText, onClickListener);
				dialog.show();
			}
		});		
	}
}
