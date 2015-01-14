package nativedialog;

import android.content.DialogInterface;
import android.app.AlertDialog;
import org.haxe.lime.GameActivity;

public class NativeDialog {
    
	public static void showMessage( final String title, final String text, final String buttonText) {

		AlertDialog.Builder dialog = new AlertDialog.Builder(GameActivity.getInstance().getContext());

		DialogInterface.OnClickListener onClickListener = new DialogInterface.OnClickListener() {
			public void onClick(DialogInterface dialog, int which) { }
		};

		dialog.setTitle(title);
		dialog.setMessage(text);
		dialog.setNeutralButton(buttonText, onClickListener);
		dialog.show();

	}

	public static Boolean confirmMessage(String title, String text, String okText, String cancelText) {

		AlertDialog.Builder dialog = new AlertDialog.Builder(GameActivity.getInstance().getContext());

		DialogInterface.OnClickListener onClickListener = new DialogInterface.OnClickListener() {
			public void onClick(DialogInterface dialog, int which) { }
		};

		dialog.setTitle(title);
		dialog.setMessage(text);
		dialog.setPositiveButton(okText, onClickListener);
		dialog.setNegativeButton(cancelText, onClickListener);
		dialog.show();

		return true;
		
	}
}
