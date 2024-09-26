import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'app_name': 'JSC Raffle App',
          'app_detail': 'JSC Merchant Raffle Programs',
          'jsc': 'JSC Global Solutions',
          'developed_by': 'Designed & developed by JSC',
          //screens
          'home': 'Home',
          //text
          //input hint
          'username_hint': 'Username',
          'password_hint': 'Password',
          //input validation
          'username_val': 'Please enter username.',
          'password_val': 'Please enter password',
          //alert
          'alert': 'Alert!',
          'alert_logout': 'Do you want to exit the app?',
          'alert_update':
              'A new version of the app is available.\n\nPlease update it.',
          'alert_file_picker': 'Please choose an option to upload receipt!',
          //button text
          'login': 'Login',
          'upload': 'Upload',
          'cancel': 'Cancel',
          'continue': 'Continue',
          'logout': 'Logout',
          'refresh': 'Refresh',
          'choose_file': 'Choose File',
          'participating_list': 'Participating List',
          'upload_steps': 'Upload Steps',
          'merchant_receipt_upload': 'Merchant Receipt Upload',
          'past_receipts': 'Past Receipts',
          'yes': 'Yes',
          'no': 'No',
          'ok': 'OK',
          'update': 'Update',
          'gallery': 'Gallery',
          'camera': 'Camera',
          'reset': 'Reset Form',
          'image': 'Image',
          'video': 'Video',
          //exception
          'no_record_found': 'No Record found !',
          'internet_exception':
              "We're unable to show results.\nPlease check your data\nconnection.",
          'general_exception':
              "We're unable to process your request.\n Please try again",
        },
        'hi_IN': {
        },
      };
}
