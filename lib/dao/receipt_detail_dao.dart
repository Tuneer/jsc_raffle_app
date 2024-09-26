import 'package:floor/floor.dart';

import '../models/receipt_detail_model.dart';

@dao
abstract class ReceiptDetailDao {
  @Query('SELECT * FROM ReceiptDetailModel')
  Future<List<ReceiptDetailModel>> findAllReceiptDetails();

  @Query('SELECT * FROM ReceiptDetailModel WHERE id = :id')
  Stream<ReceiptDetailModel?> findReceiptDetailByID(int id);

  @insert
  Future<void> insertReceiptDetail(ReceiptDetailModel appDetail);

  @Query('DELETE FROM ReceiptDetailModel')
  Future<void> deleteAllReceiptDetail();
}
