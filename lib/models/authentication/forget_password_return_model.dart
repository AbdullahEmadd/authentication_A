class ForgetPasswordReturnModel {
  ForgetPasswordReturnModel({
      this.state, 
      this.data, 
      this.message,});

  ForgetPasswordReturnModel.fromJson(dynamic json) {
    state = json['State'];
    data = json['Data'] != null ? Data.fromJson(json['Data']) : null;
    if (json['Message'] != null) {
      message = [];
      json['Message'].forEach((v) {
        message?.add(Message.fromJson(v));
      });
    }
  }
  bool? state;
  Data? data;
  List<Message>? message;
ForgetPasswordReturnModel copyWith({  bool? state,
  Data? data,
  List<Message>? message,
}) => ForgetPasswordReturnModel(  state: state ?? this.state,
  data: data ?? this.data,
  message: message ?? this.message,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['State'] = state;
    if (data != null) {
      map['Data'] = data?.toJson();
    }
    if (message != null) {
      map['Message'] = message?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Message {
  Message({
      this.value, 
      this.code,});

  Message.fromJson(dynamic json) {
    value = json['Value'];
    code = json['Code'];
  }
  String? value;
  num? code;
Message copyWith({  String? value,
  num? code,
}) => Message(  value: value ?? this.value,
  code: code ?? this.code,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Value'] = value;
    map['Code'] = code;
    return map;
  }

}

class Data {
  Data({
      this.code, 
      this.applicationUser,});

  Data.fromJson(dynamic json) {
    code = json['code'];
    applicationUser = json['applicationUser'] != null ? ApplicationUser.fromJson(json['applicationUser']) : null;
  }
  String? code;
  ApplicationUser? applicationUser;
Data copyWith({  String? code,
  ApplicationUser? applicationUser,
}) => Data(  code: code ?? this.code,
  applicationUser: applicationUser ?? this.applicationUser,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    if (applicationUser != null) {
      map['applicationUser'] = applicationUser?.toJson();
    }
    return map;
  }

}

class ApplicationUser {
  ApplicationUser({
      this.userName, 
      this.emailConfirmed, 
      this.passwordHash, 
      this.companyId, 
      this.departmentId, 
      this.department, 
      this.accountType, 
      this.crmUserId, 
      this.id, 
      this.email, 
      this.phoneNumber, 
      this.image, 
      this.createdBy, 
      this.createdOn, 
      this.modifiedBy, 
      this.modifiedOn, 
      this.isDeleted, 
      this.isDeactivated, 
      this.name, 
      this.deletedOn, 
      this.deletedBy, 
      this.ownerId, 
      this.owner,});

  ApplicationUser.fromJson(dynamic json) {
    userName = json['UserName'];
    emailConfirmed = json['EmailConfirmed'];
    passwordHash = json['PasswordHash'];
    companyId = json['Company_id'];
    departmentId = json['departmentId'];
    department = json['department'];
    accountType = json['AccountType'];
    crmUserId = json['CrmUserId'];
    id = json['Id'];
    email = json['Email'];
    phoneNumber = json['PhoneNumber'];
    image = json['Image'];
    createdBy = json['CreatedBy'];
    createdOn = json['CreatedOn'];
    modifiedBy = json['ModifiedBy'];
    modifiedOn = json['ModifiedOn'];
    isDeleted = json['IsDeleted'];
    isDeactivated = json['IsDeactivated'];
    name = json['Name'];
    deletedOn = json['DeletedOn'];
    deletedBy = json['DeletedBy'];
    ownerId = json['OwnerId'];
    owner = json['Owner'];
  }
  String? userName;
  bool? emailConfirmed;
  String? passwordHash;
  dynamic companyId;
  dynamic departmentId;
  dynamic department;
  num? accountType;
  dynamic crmUserId;
  String? id;
  String? email;
  String? phoneNumber;
  dynamic image;
  dynamic createdBy;
  String? createdOn;
  dynamic modifiedBy;
  String? modifiedOn;
  bool? isDeleted;
  bool? isDeactivated;
  String? name;
  dynamic deletedOn;
  dynamic deletedBy;
  dynamic ownerId;
  dynamic owner;
ApplicationUser copyWith({  String? userName,
  bool? emailConfirmed,
  String? passwordHash,
  dynamic companyId,
  dynamic departmentId,
  dynamic department,
  num? accountType,
  dynamic crmUserId,
  String? id,
  String? email,
  String? phoneNumber,
  dynamic image,
  dynamic createdBy,
  String? createdOn,
  dynamic modifiedBy,
  String? modifiedOn,
  bool? isDeleted,
  bool? isDeactivated,
  String? name,
  dynamic deletedOn,
  dynamic deletedBy,
  dynamic ownerId,
  dynamic owner,
}) => ApplicationUser(  userName: userName ?? this.userName,
  emailConfirmed: emailConfirmed ?? this.emailConfirmed,
  passwordHash: passwordHash ?? this.passwordHash,
  companyId: companyId ?? this.companyId,
  departmentId: departmentId ?? this.departmentId,
  department: department ?? this.department,
  accountType: accountType ?? this.accountType,
  crmUserId: crmUserId ?? this.crmUserId,
  id: id ?? this.id,
  email: email ?? this.email,
  phoneNumber: phoneNumber ?? this.phoneNumber,
  image: image ?? this.image,
  createdBy: createdBy ?? this.createdBy,
  createdOn: createdOn ?? this.createdOn,
  modifiedBy: modifiedBy ?? this.modifiedBy,
  modifiedOn: modifiedOn ?? this.modifiedOn,
  isDeleted: isDeleted ?? this.isDeleted,
  isDeactivated: isDeactivated ?? this.isDeactivated,
  name: name ?? this.name,
  deletedOn: deletedOn ?? this.deletedOn,
  deletedBy: deletedBy ?? this.deletedBy,
  ownerId: ownerId ?? this.ownerId,
  owner: owner ?? this.owner,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['UserName'] = userName;
    map['EmailConfirmed'] = emailConfirmed;
    map['PasswordHash'] = passwordHash;
    map['Company_id'] = companyId;
    map['departmentId'] = departmentId;
    map['department'] = department;
    map['AccountType'] = accountType;
    map['CrmUserId'] = crmUserId;
    map['Id'] = id;
    map['Email'] = email;
    map['PhoneNumber'] = phoneNumber;
    map['Image'] = image;
    map['CreatedBy'] = createdBy;
    map['CreatedOn'] = createdOn;
    map['ModifiedBy'] = modifiedBy;
    map['ModifiedOn'] = modifiedOn;
    map['IsDeleted'] = isDeleted;
    map['IsDeactivated'] = isDeactivated;
    map['Name'] = name;
    map['DeletedOn'] = deletedOn;
    map['DeletedBy'] = deletedBy;
    map['OwnerId'] = ownerId;
    map['Owner'] = owner;
    return map;
  }

}