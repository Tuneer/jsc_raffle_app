class FileUploadModel {
  FileUploadModel({
    this.saleOrderId,
    this.restaurantId,
    this.referenceId,
    this.webUserId,
    this.orderNo,
    this.orderDate,
    this.orderTypeId,
    this.sessionId,
    this.specialInstructions,
    this.merchantName,
    this.receiptNo,
    this.receiptDate,
    this.receiptTime,
    this.receiptAmount,
    this.subTotal,
    this.tax,
    this.orderStatusId,
    this.paidDate,
    this.voidReason,
    this.promotion,
    this.customerId,
    this.deliveryAddress,
    this.deliveryCity,
    this.deliveryState,
    this.deliveryZip,
    this.orderStatus,
    this.paymentType,
    this.discountAmount,
    this.totalAmount,
    this.id,
    this.createBy,
    this.modifyBy,
    this.createDate,
    this.modifyDate,
    this.createFromIp,
    this.modifyFromIp,
  });

  FileUploadModel.fromJson(dynamic json) {
    saleOrderId = json['SaleOrderId'];
    restaurantId = json['RestaurantId'];
    referenceId = json['ReferenceId'];
    webUserId = json['WebUserId'];
    orderNo = json['OrderNo'];
    orderDate = json['OrderDate'];
    orderTypeId = json['OrderTypeId'];
    sessionId = json['SessionId'];
    specialInstructions = json['SpecialInstructions'];
    merchantName = json['MerchantName'];
    receiptNo = json['ReceiptNo'];
    receiptDate = json['ReceiptDate'];
    receiptTime = json['ReceiptTime'];
    receiptAmount = json['ReceiptAmount'];
    subTotal = json['SubTotal'];
    tax = json['Tax'];
    orderStatusId = json['OrderStatusId'];
    paidDate = json['PaidDate'];
    voidReason = json['VoidReason'];
    promotion = json['Promotion'];
    customerId = json['CustomerId'];
    deliveryAddress = json['DeliveryAddress'];
    deliveryCity = json['DeliveryCity'];
    deliveryState = json['DeliveryState'];
    deliveryZip = json['DeliveryZip'];
    orderStatus = json['OrderStatus'];
    paymentType = json['PaymentType'];
    discountAmount = json['DiscountAmount'];
    totalAmount = json['TotalAmount'];
    id = json['Id'];
    createBy = json['CreateBy'];
    modifyBy = json['ModifyBy'];
    createDate = json['CreateDate'];
    modifyDate = json['ModifyDate'];
    createFromIp = json['CreateFromIp'];
    modifyFromIp = json['ModifyFromIp'];
  }

  num? saleOrderId;
  num? restaurantId;
  String? referenceId;
  num? webUserId;
  String? orderNo;
  String? orderDate;
  num? orderTypeId;
  String? sessionId;
  String? specialInstructions;
  String? merchantName;
  String? receiptNo;
  String? receiptDate;
  String? receiptTime;
  num? receiptAmount;
  num? subTotal;
  num? tax;
  num? orderStatusId;
  String? paidDate;
  String? voidReason;
  dynamic promotion;
  num? customerId;
  String? deliveryAddress;
  String? deliveryCity;
  String? deliveryState;
  String? deliveryZip;
  num? orderStatus;
  num? paymentType;
  num? discountAmount;
  num? totalAmount;
  num? id;
  dynamic createBy;
  dynamic modifyBy;
  String? createDate;
  String? modifyDate;
  dynamic createFromIp;
  dynamic modifyFromIp;

  FileUploadModel copyWith({
    num? saleOrderId,
    num? restaurantId,
    String? referenceId,
    num? webUserId,
    String? orderNo,
    String? orderDate,
    num? orderTypeId,
    String? sessionId,
    String? specialInstructions,
    String? merchantName,
    String? receiptNo,
    String? receiptDate,
    String? receiptTime,
    num? receiptAmount,
    num? subTotal,
    num? tax,
    num? orderStatusId,
    String? paidDate,
    String? voidReason,
    dynamic promotion,
    num? customerId,
    String? deliveryAddress,
    String? deliveryCity,
    String? deliveryState,
    String? deliveryZip,
    num? orderStatus,
    num? paymentType,
    num? discountAmount,
    num? totalAmount,
    num? id,
    dynamic createBy,
    dynamic modifyBy,
    String? createDate,
    String? modifyDate,
    dynamic createFromIp,
    dynamic modifyFromIp,
  }) =>
      FileUploadModel(
        saleOrderId: saleOrderId ?? this.saleOrderId,
        restaurantId: restaurantId ?? this.restaurantId,
        referenceId: referenceId ?? this.referenceId,
        webUserId: webUserId ?? this.webUserId,
        orderNo: orderNo ?? this.orderNo,
        orderDate: orderDate ?? this.orderDate,
        orderTypeId: orderTypeId ?? this.orderTypeId,
        sessionId: sessionId ?? this.sessionId,
        specialInstructions: specialInstructions ?? this.specialInstructions,
        merchantName: merchantName ?? this.merchantName,
        receiptNo: receiptNo ?? this.receiptNo,
        receiptDate: receiptDate ?? this.receiptDate,
        receiptTime: receiptTime ?? this.receiptTime,
        receiptAmount: receiptAmount ?? this.receiptAmount,
        subTotal: subTotal ?? this.subTotal,
        tax: tax ?? this.tax,
        orderStatusId: orderStatusId ?? this.orderStatusId,
        paidDate: paidDate ?? this.paidDate,
        voidReason: voidReason ?? this.voidReason,
        promotion: promotion ?? this.promotion,
        customerId: customerId ?? this.customerId,
        deliveryAddress: deliveryAddress ?? this.deliveryAddress,
        deliveryCity: deliveryCity ?? this.deliveryCity,
        deliveryState: deliveryState ?? this.deliveryState,
        deliveryZip: deliveryZip ?? this.deliveryZip,
        orderStatus: orderStatus ?? this.orderStatus,
        paymentType: paymentType ?? this.paymentType,
        discountAmount: discountAmount ?? this.discountAmount,
        totalAmount: totalAmount ?? this.totalAmount,
        id: id ?? this.id,
        createBy: createBy ?? this.createBy,
        modifyBy: modifyBy ?? this.modifyBy,
        createDate: createDate ?? this.createDate,
        modifyDate: modifyDate ?? this.modifyDate,
        createFromIp: createFromIp ?? this.createFromIp,
        modifyFromIp: modifyFromIp ?? this.modifyFromIp,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['SaleOrderId'] = saleOrderId;
    map['RestaurantId'] = restaurantId;
    map['ReferenceId'] = referenceId;
    map['WebUserId'] = webUserId;
    map['OrderNo'] = orderNo;
    map['OrderDate'] = orderDate;
    map['OrderTypeId'] = orderTypeId;
    map['SessionId'] = sessionId;
    map['SpecialInstructions'] = specialInstructions;
    map['MerchantName'] = merchantName;
    map['ReceiptNo'] = receiptNo;
    map['ReceiptDate'] = receiptDate;
    map['ReceiptTime'] = receiptTime;
    map['ReceiptAmount'] = receiptAmount;
    map['SubTotal'] = subTotal;
    map['Tax'] = tax;
    map['OrderStatusId'] = orderStatusId;
    map['PaidDate'] = paidDate;
    map['VoidReason'] = voidReason;
    map['Promotion'] = promotion;
    map['CustomerId'] = customerId;
    map['DeliveryAddress'] = deliveryAddress;
    map['DeliveryCity'] = deliveryCity;
    map['DeliveryState'] = deliveryState;
    map['DeliveryZip'] = deliveryZip;
    map['OrderStatus'] = orderStatus;
    map['PaymentType'] = paymentType;
    map['DiscountAmount'] = discountAmount;
    map['TotalAmount'] = totalAmount;
    map['Id'] = id;
    map['CreateBy'] = createBy;
    map['ModifyBy'] = modifyBy;
    map['CreateDate'] = createDate;
    map['ModifyDate'] = modifyDate;
    map['CreateFromIp'] = createFromIp;
    map['ModifyFromIp'] = modifyFromIp;
    return map;
  }
}
