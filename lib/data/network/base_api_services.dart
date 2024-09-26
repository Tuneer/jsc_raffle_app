abstract class BaseApiServices {
  Future<dynamic> getApi(String url);

  Future<dynamic> postApi(dynamic data, String url);

  Future<dynamic> postMultipart(dynamic data, String url, String fileName);

  Future<dynamic> loadJsonFromAssets(String filePath);
}
