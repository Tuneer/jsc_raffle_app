class AppUrl {
  static const String baseUrl = 'http://3.135.219.244:2071';
  static const String url = '$baseUrl/api/v1/';

  // user
  static String login = '${url}user-login';

  static String getPastReceipts = '${url}Get-UploadedReceiptList';
  static String fileUpload = '${url}FileUpload';
  static String updateUserComment = '${url}UpdateUserComment';
  static String getParticipatingMerchants = '${url}Get-MerchantList';
}
