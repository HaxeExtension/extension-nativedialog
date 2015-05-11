#include <NativeDialog.h>

#include <bps/bps.h>
#include <bps/dialog.h>
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <vector>

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

extern "C" void sendConfirmMessageCancel();
extern "C" void sendConfirmMessageOk();
extern "C" void sendShowMessageClose();

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

namespace openflNativeDialogExtension {

	void onError(const char *error, dialog_instance_t &dialog) {
		fprintf(stderr, error);
		dialog_destroy(dialog);
		dialog = 0;
		bps_shutdown();
	}

	int bbShowMessage(const char *title, const char *text, const char *okButtonText, const char *cancelButtonText) {
		int ret = 0;
		bps_initialize();
		dialog_request_events(0);
		dialog_instance_t dialog = 0;

		if (dialog_create_alert(&dialog) != BPS_SUCCESS) {
			fprintf(stderr, "Failed to create dialog.");
			bps_shutdown();
			return -1;
		}

		if (dialog_set_title_text(dialog, title) != BPS_SUCCESS) {
			onError("Failed to set dialog message text.", dialog);
			return -1;
		}

		if (dialog_set_alert_message_text(dialog, text) != BPS_SUCCESS) {
			onError("Failed to set dialog message text.", dialog);
			return -1;
		}

		if (dialog_add_button(dialog, okButtonText, true, NULL, true) != BPS_SUCCESS) {
			onError("Failed to add button.", dialog);
			return -1;
		}

		if (cancelButtonText!=NULL) {
			if (dialog_add_button(dialog, cancelButtonText, true, NULL, true) != BPS_SUCCESS) {
				onError("Failed to add button.", dialog);
				return -1;
			}
		}

		if (dialog_show(dialog) != BPS_SUCCESS) {
			onError("Failed to show dialog.", dialog);
			return -1;
		}

		bool shutdown = false;
		while (!shutdown) {
			bps_event_t *event = NULL;
			bps_get_event(&event, -1);
			if (event && bps_event_get_domain(event)==dialog_get_domain()) {
				ret = dialog_event_get_selected_index(event);
				shutdown = true;
			}
		}

		if (dialog) {
			dialog_destroy(dialog);
		}

		// Cleanup
		bps_shutdown();
		return ret;
	}

	void showMessage(const char* title, const char* text, const char* buttonText) {

		int result = bbShowMessage(title, text, buttonText, NULL);
		sendShowMessageClose();

	}

	void confirmMessage
		(const char* title, const char* text, const char* okButtonText, const char* cancelButtonText) {

			int result = bbShowMessage(title, text, okButtonText, cancelButtonText);
			if (result==0) {
				sendConfirmMessageOk();
			} else {
				sendConfirmMessageCancel();
			}

	}

}
