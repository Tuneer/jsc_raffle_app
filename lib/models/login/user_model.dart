class UserModel {
  UserModel({
    this.webUserId,
    this.userName,
    this.sessionId,
    this.password,
    this.firstName,
    this.lastName,
    this.lastVisit,
    this.dateOfBirth,
    this.gender,
    this.isDisabled,
    this.homePhone,
    this.cellPhone,
    this.address1,
    this.address2,
    this.city,
    this.state,
    this.zip,
    this.country,
    this.email,
    this.altEmail,
    this.roleId,
    this.userType,
    this.fullName,
    this.formattedAddress,
    this.id,
    this.createBy,
    this.modifyBy,
    this.createDate,
    this.modifyDate,
    this.createFromIp,
    this.modifyFromIp,
  });

  UserModel.fromJson(dynamic json) {
    webUserId = json['WebUserId'].toString();
    userName = json['UserName'];
    sessionId = json['SessionId'];
    password = json['Password'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    lastVisit = json['LastVisit'];
    dateOfBirth = json['DateOfBirth'];
    gender = json['Gender'];
    isDisabled = json['IsDisabled'];
    homePhone = json['HomePhone'];
    cellPhone = json['CellPhone'];
    address1 = json['Address1'];
    address2 = json['Address2'];
    city = json['City'];
    state = json['State'];
    zip = json['Zip'];
    country = json['Country'];
    email = json['Email'];
    altEmail = json['AltEmail'];
    roleId = json['RoleId'].toString();
    userType = json['UserType'].toString();
    fullName = json['FullName'];
    formattedAddress = json['FormattedAddress'];
    id = json['Id'].toString();
    createBy = json['CreateBy'];
    modifyBy = json['ModifyBy'];
    createDate = json['CreateDate'];
    modifyDate = json['ModifyDate'];
    createFromIp = json['CreateFromIp'];
    modifyFromIp = json['ModifyFromIp'];
  }

  String? webUserId;
  String? userName;
  String? sessionId;
  String? password;
  String? firstName;
  String? lastName;
  String? lastVisit;
  String? dateOfBirth;
  String? gender;
  bool? isDisabled;
  String? homePhone;
  String? cellPhone;
  String? address1;
  String? address2;
  String? city;
  String? state;
  String? zip;
  String? country;
  String? email;
  String? altEmail;
  String? roleId;
  String? userType;
  String? fullName;
  String? formattedAddress;
  String? id;
  String? createBy;
  String? modifyBy;
  String? createDate;
  String? modifyDate;
  String? createFromIp;
  String? modifyFromIp;

  UserModel copyWith({
    String? webUserId,
    String? userName,
    String? sessionId,
    String? password,
    String? firstName,
    String? lastName,
    String? lastVisit,
    String? dateOfBirth,
    String? gender,
    bool? isDisabled,
    String? homePhone,
    String? cellPhone,
    String? address1,
    String? address2,
    String? city,
    String? state,
    String? zip,
    String? country,
    String? email,
    String? altEmail,
    String? roleId,
    String? userType,
    String? fullName,
    String? formattedAddress,
    String? id,
    String? createBy,
    String? modifyBy,
    String? createDate,
    String? modifyDate,
    String? createFromIp,
    String? modifyFromIp,
  }) =>
      UserModel(
        webUserId: webUserId ?? this.webUserId,
        userName: userName ?? this.userName,
        sessionId: sessionId ?? this.sessionId,
        password: password ?? this.password,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        lastVisit: lastVisit ?? this.lastVisit,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        gender: gender ?? this.gender,
        isDisabled: isDisabled ?? this.isDisabled,
        homePhone: homePhone ?? this.homePhone,
        cellPhone: cellPhone ?? this.cellPhone,
        address1: address1 ?? this.address1,
        address2: address2 ?? this.address2,
        city: city ?? this.city,
        state: state ?? this.state,
        zip: zip ?? this.zip,
        country: country ?? this.country,
        email: email ?? this.email,
        altEmail: altEmail ?? this.altEmail,
        roleId: roleId ?? this.roleId,
        userType: userType ?? this.userType,
        fullName: fullName ?? this.fullName,
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
    map['WebUserId'] = webUserId;
    map['UserName'] = userName;
    map['SessionId'] = sessionId;
    map['Password'] = password;
    map['FirstName'] = firstName;
    map['LastName'] = lastName;
    map['LastVisit'] = lastVisit;
    map['DateOfBirth'] = dateOfBirth;
    map['Gender'] = gender;
    map['IsDisabled'] = isDisabled;
    map['HomePhone'] = homePhone;
    map['CellPhone'] = cellPhone;
    map['Address1'] = address1;
    map['Address2'] = address2;
    map['City'] = city;
    map['State'] = state;
    map['Zip'] = zip;
    map['Country'] = country;
    map['Email'] = email;
    map['AltEmail'] = altEmail;
    map['RoleId'] = roleId;
    map['UserType'] = userType;
    map['FullName'] = fullName;
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
}
