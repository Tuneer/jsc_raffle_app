class ParticipatingMerchantModel {
  ParticipatingMerchantModel({
    this.restaurantId,
    this.restaurantTypeId,
    this.restaurantCode,
    this.identifier,
    this.paymentIdentifier,
    this.aboutRestaurant,
    this.address1,
    this.address2,
    this.city,
    this.state,
    this.country,
    this.zip,
    this.phone,
    this.fax,
    this.storeStartTime,
    this.storeEndTime,
    this.selectedDate,
    this.deliveryStartTime,
    this.deliveryEndTime,
    this.restaurantName,
    this.appKey,
    this.shortName,
    this.email,
    this.foodDescription,
    this.imagePath,
    this.ratings,
    this.webSite,
    this.googleMapAddress,
    this.minimumOrderAmount,
    this.yelpBusinessId,
    this.yelpRatingImageUrl,
    this.yelpReviewsCount,
    this.lat,
    this.lng,
    this.deliveryCharge,
    this.serviceChargeAmount,
    this.highTax,
    this.timeNeedAfterOrder,
    this.allowPickup,
    this.allowDelivery,
    this.contactPersonName,
    this.kitchenPrinter,
    this.receiptPrinter,
    this.receiptPrinterPort,
    this.kitchenPrinterPort,
    this.isActive,
    this.isPayAtStore,
    this.isPayCard,
    this.isSliceMode,
    this.isTestMerchant,
    this.isDeliveryTime,
    this.isOpen,
    this.formattedAddress,
    this.id,
    this.createBy,
    this.modifyBy,
    this.createDate,
    this.modifyDate,
    this.createFromIp,
    this.modifyFromIp,
  });

  ParticipatingMerchantModel.fromJson(dynamic json) {
    restaurantId = json['RestaurantId'].toString();
    restaurantTypeId = json['RestaurantTypeId'].toString();
    restaurantCode = json['RestaurantCode'];
    identifier = json['Identifier'];
    paymentIdentifier = json['PaymentIdentifier'];
    aboutRestaurant = json['AboutRestaurant'];
    address1 = json['Address1'];
    address2 = json['Address2'];
    city = json['City'];
    state = json['State'];
    country = json['Country'];
    zip = json['Zip'];
    phone = json['Phone'];
    fax = json['Fax'];
    storeStartTime = json['StoreStartTime'];
    storeEndTime = json['StoreEndTime'];
    selectedDate = json['SelectedDate'];
    deliveryStartTime = json['DeliveryStartTime'];
    deliveryEndTime = json['DeliveryEndTime'];
    restaurantName = json['RestaurantName'];
    appKey = json['AppKey'];
    shortName = json['ShortName'];
    email = json['Email'];
    foodDescription = json['FoodDescription'];
    imagePath = json['ImagePath'];
    ratings = json['Ratings'];
    webSite = json['WebSite'];
    googleMapAddress = json['GoogleMapAddress'];
    minimumOrderAmount = json['MinimumOrderAmount'].toString();
    yelpBusinessId = json['YelpBusinessId'];
    yelpRatingImageUrl = json['YelpRatingImageUrl'];
    yelpReviewsCount = json['YelpReviewsCount'].toString();
    lat = json['Lat'].toString();
    lng = json['Lng'].toString();
    deliveryCharge = json['DeliveryCharge'].toString();
    serviceChargeAmount = json['ServiceChargeAmount'].toString();
    highTax = json['HighTax'].toString();
    timeNeedAfterOrder = json['TimeNeedAfterOrder'].toString();
    allowPickup = json['AllowPickup'];
    allowDelivery = json['AllowDelivery'];
    contactPersonName = json['ContactPersonName'];
    kitchenPrinter = json['KitchenPrinter'];
    receiptPrinter = json['ReceiptPrinter'];
    receiptPrinterPort = json['ReceiptPrinterPort'];
    kitchenPrinterPort = json['KitchenPrinterPort'];
    isActive = json['IsActive'];
    isPayAtStore = json['IsPayAtStore'];
    isPayCard = json['IsPayCard'];
    isSliceMode = json['IsSliceMode'];
    isTestMerchant = json['IsTestMerchant'];
    isDeliveryTime = json['IsDeliveryTime'];
    isOpen = json['IsOpen'];
    formattedAddress = json['FormattedAddress'];
    id = json['Id'].toString();
    createBy = json['CreateBy'];
    modifyBy = json['ModifyBy'];
    createDate = json['CreateDate'];
    modifyDate = json['ModifyDate'];
    createFromIp = json['CreateFromIp'];
    modifyFromIp = json['ModifyFromIp'];
  }

  String? restaurantId;
  String? restaurantTypeId;
  String? restaurantCode;
  String? identifier;
  String? paymentIdentifier;
  String? aboutRestaurant;
  String? address1;
  String? address2;
  String? city;
  String? state;
  String? country;
  String? zip;
  String? phone;
  String? fax;
  String? storeStartTime;
  String? storeEndTime;
  String? selectedDate;
  String? deliveryStartTime;
  String? deliveryEndTime;
  String? restaurantName;
  String? appKey;
  String? shortName;
  String? email;
  String? foodDescription;
  String? imagePath;
  String? ratings;
  String? webSite;
  String? googleMapAddress;
  String? minimumOrderAmount;
  String? yelpBusinessId;
  String? yelpRatingImageUrl;
  String? yelpReviewsCount;
  String? lat;
  String? lng;
  String? deliveryCharge;
  String? serviceChargeAmount;
  String? highTax;
  String? timeNeedAfterOrder;
  bool? allowPickup;
  bool? allowDelivery;
  String? contactPersonName;
  String? kitchenPrinter;
  String? receiptPrinter;
  String? receiptPrinterPort;
  String? kitchenPrinterPort;
  bool? isActive;
  bool? isPayAtStore;
  bool? isPayCard;
  bool? isSliceMode;
  bool? isTestMerchant;
  bool? isDeliveryTime;
  bool? isOpen;
  String? formattedAddress;
  String? id;
  String? createBy;
  String? modifyBy;
  String? createDate;
  String? modifyDate;
  String? createFromIp;
  String? modifyFromIp;

  ParticipatingMerchantModel copyWith({
    String? restaurantId,
    String? restaurantTypeId,
    String? restaurantCode,
    String? identifier,
    String? paymentIdentifier,
    String? aboutRestaurant,
    String? address1,
    String? address2,
    String? city,
    String? state,
    String? country,
    String? zip,
    String? phone,
    String? fax,
    String? storeStartTime,
    String? storeEndTime,
    String? selectedDate,
    String? deliveryStartTime,
    String? deliveryEndTime,
    String? restaurantName,
    String? appKey,
    String? shortName,
    String? email,
    String? foodDescription,
    String? imagePath,
    String? ratings,
    String? webSite,
    String? googleMapAddress,
    String? minimumOrderAmount,
    String? yelpBusinessId,
    String? yelpRatingImageUrl,
    String? yelpReviewsCount,
    String? lat,
    String? lng,
    String? deliveryCharge,
    String? serviceChargeAmount,
    String? highTax,
    String? timeNeedAfterOrder,
    bool? allowPickup,
    bool? allowDelivery,
    String? contactPersonName,
    String? kitchenPrinter,
    String? receiptPrinter,
    String? receiptPrinterPort,
    String? kitchenPrinterPort,
    bool? isActive,
    bool? isPayAtStore,
    bool? isPayCard,
    bool? isSliceMode,
    bool? isTestMerchant,
    bool? isDeliveryTime,
    bool? isOpen,
    String? formattedAddress,
    String? id,
    String? createBy,
    String? modifyBy,
    String? createDate,
    String? modifyDate,
    String? createFromIp,
    String? modifyFromIp,
  }) =>
      ParticipatingMerchantModel(
        restaurantId: restaurantId ?? this.restaurantId,
        restaurantTypeId: restaurantTypeId ?? this.restaurantTypeId,
        restaurantCode: restaurantCode ?? this.restaurantCode,
        identifier: identifier ?? this.identifier,
        paymentIdentifier: paymentIdentifier ?? this.paymentIdentifier,
        aboutRestaurant: aboutRestaurant ?? this.aboutRestaurant,
        address1: address1 ?? this.address1,
        address2: address2 ?? this.address2,
        city: city ?? this.city,
        state: state ?? this.state,
        country: country ?? this.country,
        zip: zip ?? this.zip,
        phone: phone ?? this.phone,
        fax: fax ?? this.fax,
        storeStartTime: storeStartTime ?? this.storeStartTime,
        storeEndTime: storeEndTime ?? this.storeEndTime,
        selectedDate: selectedDate ?? this.selectedDate,
        deliveryStartTime: deliveryStartTime ?? this.deliveryStartTime,
        deliveryEndTime: deliveryEndTime ?? this.deliveryEndTime,
        restaurantName: restaurantName ?? this.restaurantName,
        appKey: appKey ?? this.appKey,
        shortName: shortName ?? this.shortName,
        email: email ?? this.email,
        foodDescription: foodDescription ?? this.foodDescription,
        imagePath: imagePath ?? this.imagePath,
        ratings: ratings ?? this.ratings,
        webSite: webSite ?? this.webSite,
        googleMapAddress: googleMapAddress ?? this.googleMapAddress,
        minimumOrderAmount: minimumOrderAmount ?? this.minimumOrderAmount,
        yelpBusinessId: yelpBusinessId ?? this.yelpBusinessId,
        yelpRatingImageUrl: yelpRatingImageUrl ?? this.yelpRatingImageUrl,
        yelpReviewsCount: yelpReviewsCount ?? this.yelpReviewsCount,
        lat: lat ?? this.lat,
        lng: lng ?? this.lng,
        deliveryCharge: deliveryCharge ?? this.deliveryCharge,
        serviceChargeAmount: serviceChargeAmount ?? this.serviceChargeAmount,
        highTax: highTax ?? this.highTax,
        timeNeedAfterOrder: timeNeedAfterOrder ?? this.timeNeedAfterOrder,
        allowPickup: allowPickup ?? this.allowPickup,
        allowDelivery: allowDelivery ?? this.allowDelivery,
        contactPersonName: contactPersonName ?? this.contactPersonName,
        kitchenPrinter: kitchenPrinter ?? this.kitchenPrinter,
        receiptPrinter: receiptPrinter ?? this.receiptPrinter,
        receiptPrinterPort: receiptPrinterPort ?? this.receiptPrinterPort,
        kitchenPrinterPort: kitchenPrinterPort ?? this.kitchenPrinterPort,
        isActive: isActive ?? this.isActive,
        isPayAtStore: isPayAtStore ?? this.isPayAtStore,
        isPayCard: isPayCard ?? this.isPayCard,
        isSliceMode: isSliceMode ?? this.isSliceMode,
        isTestMerchant: isTestMerchant ?? this.isTestMerchant,
        isDeliveryTime: isDeliveryTime ?? this.isDeliveryTime,
        isOpen: isOpen ?? this.isOpen,
        formattedAddress: formattedAddress ?? this.formattedAddress,
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
    map['RestaurantId'] = restaurantId;
    map['RestaurantTypeId'] = restaurantTypeId;
    map['RestaurantCode'] = restaurantCode;
    map['Identifier'] = identifier;
    map['PaymentIdentifier'] = paymentIdentifier;
    map['AboutRestaurant'] = aboutRestaurant;
    map['Address1'] = address1;
    map['Address2'] = address2;
    map['City'] = city;
    map['State'] = state;
    map['Country'] = country;
    map['Zip'] = zip;
    map['Phone'] = phone;
    map['Fax'] = fax;
    map['StoreStartTime'] = storeStartTime;
    map['StoreEndTime'] = storeEndTime;
    map['SelectedDate'] = selectedDate;
    map['DeliveryStartTime'] = deliveryStartTime;
    map['DeliveryEndTime'] = deliveryEndTime;
    map['RestaurantName'] = restaurantName;
    map['AppKey'] = appKey;
    map['ShortName'] = shortName;
    map['Email'] = email;
    map['FoodDescription'] = foodDescription;
    map['ImagePath'] = imagePath;
    map['Ratings'] = ratings;
    map['WebSite'] = webSite;
    map['GoogleMapAddress'] = googleMapAddress;
    map['MinimumOrderAmount'] = minimumOrderAmount;
    map['YelpBusinessId'] = yelpBusinessId;
    map['YelpRatingImageUrl'] = yelpRatingImageUrl;
    map['YelpReviewsCount'] = yelpReviewsCount;
    map['Lat'] = lat;
    map['Lng'] = lng;
    map['DeliveryCharge'] = deliveryCharge;
    map['ServiceChargeAmount'] = serviceChargeAmount;
    map['HighTax'] = highTax;
    map['TimeNeedAfterOrder'] = timeNeedAfterOrder;
    map['AllowPickup'] = allowPickup;
    map['AllowDelivery'] = allowDelivery;
    map['ContactPersonName'] = contactPersonName;
    map['KitchenPrinter'] = kitchenPrinter;
    map['ReceiptPrinter'] = receiptPrinter;
    map['ReceiptPrinterPort'] = receiptPrinterPort;
    map['KitchenPrinterPort'] = kitchenPrinterPort;
    map['IsActive'] = isActive;
    map['IsPayAtStore'] = isPayAtStore;
    map['IsPayCard'] = isPayCard;
    map['IsSliceMode'] = isSliceMode;
    map['IsTestMerchant'] = isTestMerchant;
    map['IsDeliveryTime'] = isDeliveryTime;
    map['IsOpen'] = isOpen;
    map['FormattedAddress'] = formattedAddress;
    map['Id'] = id;
    map['CreateBy'] = createBy;
    map['ModifyBy'] = modifyBy;
    map['CreateDate'] = createDate;
    map['ModifyDate'] = modifyDate;
    map['CreateFromIp'] = createFromIp;
    map['ModifyFromIp'] = modifyFromIp;
    return map;
  }

  bool isEqual(ParticipatingMerchantModel dto) {
    return restaurantName == dto.restaurantName;
  }
}
