import 'package:floor/floor.dart';

@entity
class ReceiptDetailModel {
  ReceiptDetailModel({
    this.saleOrderId,
    this.restaurantId,
    this.restaurantName,
    this.webUserId,
    this.orderNo,
    this.orderDate,
    this.orderTypeId,
    this.specialInstructions,
    this.referenceId,
    this.receiptNo,
    this.receiptDate,
    this.receiptTime,
    this.orderStatus,
    this.subTotal,
    this.tax,
  });

  ReceiptDetailModel.fromJson(dynamic json) {
    saleOrderId = json['SaleOrderId'].toString();
    restaurantId = json['RestaurantId'].toString();
    restaurantName = json['RestaurantName'];
    webUserId = json['WebUserId'].toString();
    orderNo = json['OrderNo'];
    orderDate = json['OrderDate'];
    orderTypeId = json['OrderTypeId'].toString();
    specialInstructions = json['SpecialInstructions'];
    referenceId = json['ReferenceId'];
    receiptNo = json['ReceiptNo'];
    receiptDate = json['ReceiptDate'];
    receiptTime = json['ReceiptTime'];
    orderStatus = json['OrderStatus'].toString();
    subTotal = json['SubTotal'].toString();
    tax = json['Tax'].toString();
  }

  @PrimaryKey(autoGenerate: true)
  int? rowId;
  String? saleOrderId;
  String? restaurantId;
  String? restaurantName;
  String? webUserId;
  String? orderNo;
  String? orderDate;
  String? orderTypeId;
  String? specialInstructions;
  String? referenceId;
  String? receiptNo;
  String? receiptDate;
  String? receiptTime;
  String? orderStatus;
  String? subTotal;
  String? tax;

  ReceiptDetailModel copyWith({
    String? saleOrderId,
    String? restaurantId,
    String? restaurantName,
    String? webUserId,
    String? orderNo,
    String? orderDate,
    String? orderTypeId,
    String? specialInstructions,
    String? referenceId,
    String? receiptNo,
    String? receiptDate,
    String? receiptTime,
    String? orderStatus,
    String? subTotal,
    String? tax,
  }) =>
      ReceiptDetailModel(
        saleOrderId: saleOrderId ?? this.saleOrderId,
        restaurantId: restaurantId ?? this.restaurantId,
        restaurantName: restaurantName ?? this.restaurantName,
        webUserId: webUserId ?? this.webUserId,
        orderNo: orderNo ?? this.orderNo,
        orderDate: orderDate ?? this.orderDate,
        orderTypeId: orderTypeId ?? this.orderTypeId,
        specialInstructions: specialInstructions ?? this.specialInstructions,
        referenceId: referenceId ?? this.referenceId,
        receiptNo: receiptNo ?? this.receiptNo,
        receiptDate: receiptDate ?? this.receiptDate,
        receiptTime: receiptTime ?? this.receiptTime,
        orderStatus: orderStatus ?? this.orderStatus,
        subTotal: subTotal ?? this.subTotal,
        tax: tax ?? this.tax,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['SaleOrderId'] = saleOrderId;
    map['RestaurantId'] = restaurantId;
    map['RestaurantName'] = restaurantName;
    map['WebUserId'] = webUserId;
    map['OrderNo'] = orderNo;
    map['OrderDate'] = orderDate;
    map['OrderTypeId'] = orderTypeId;
    map['SpecialInstructions'] = specialInstructions;
    map['ReferenceId'] = referenceId;
    map['ReceiptNo'] = receiptNo;
    map['ReceiptDate'] = receiptDate;
    map['ReceiptTime'] = receiptTime;
    map['OrderStatus'] = orderStatus;
    map['SubTotal'] = subTotal;
    map['Tax'] = tax;
    return map;
  }

  bool isEqual(ReceiptDetailModel dto) {
    return orderNo == dto.orderNo;
  }
}
