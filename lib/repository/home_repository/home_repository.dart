import '../../data/network/network_api_services.dart';
import '../../models/participating_merchant_model.dart';
import '../../models/file_upload_model.dart';
import '../../models/receipt_detail_model.dart';
import '../../models/update_user_comment_model.dart';
import '../../res/app_url/app_url.dart';

class HomeRepository {
  final _apiService = NetworkApiServices();

  Future<List<ReceiptDetailModel>> getPastReceipts(var userId) async {
    dynamic response =
        await _apiService.getApi('${AppUrl.getPastReceipts}/$userId');

    List<ReceiptDetailModel> temp = [];
    for (dynamic d in response) {
      temp.add(ReceiptDetailModel.fromJson(d));
    }
    return temp;
  }

  Future<FileUploadModel> fileUpload(var data, var fileName) async {
    dynamic response =
        await _apiService.postMultipart(data, AppUrl.fileUpload, fileName);
    return FileUploadModel.fromJson(response);
  }

  Future<UpdateUserCommentModel> updateUserComment(
      var salesOrderId, var webUserId, var specialInstructions) async {
    dynamic response = await _apiService.postApi(null,
        '${AppUrl.updateUserComment}/$salesOrderId/$webUserId/$specialInstructions');
    return UpdateUserCommentModel.fromJson(response);
  }

  Future<List<ParticipatingMerchantModel>> getParticipatingMerchants() async {
    dynamic response =
        await _apiService.getApi(AppUrl.getParticipatingMerchants);

    List<ParticipatingMerchantModel> temp = [];
    for (dynamic d in response) {
      temp.add(ParticipatingMerchantModel.fromJson(d));
    }
    return temp;
  }
}
