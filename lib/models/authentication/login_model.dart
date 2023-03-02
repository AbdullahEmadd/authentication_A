class LoginModel {
  LoginModel({
      this.state, 
      this.data, 
      this.message,});

  LoginModel.fromJson(dynamic json) {
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
LoginModel copyWith({  bool? state,
  Data? data,
  List<Message>? message,
}) => LoginModel(  state: state ?? this.state,
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
      this.token, 
      this.loginData, 
      this.user, 
      this.code, 
      this.roles,});

  Data.fromJson(dynamic json) {
    token = json['Token'] != null ? Token.fromJson(json['Token']) : null;
    loginData = json['LoginData'] != null ? LoginData.fromJson(json['LoginData']) : null;
    user = json['User'] != null ? User.fromJson(json['User']) : null;
    code = json['Code'];
    roles = json['Roles'] != null ? json['Roles'].cast<String>() : [];
  }
  Token? token;
  LoginData? loginData;
  User? user;
  String? code;
  List<String>? roles;
Data copyWith({  Token? token,
  LoginData? loginData,
  User? user,
  String? code,
  List<String>? roles,
}) => Data(  token: token ?? this.token,
  loginData: loginData ?? this.loginData,
  user: user ?? this.user,
  code: code ?? this.code,
  roles: roles ?? this.roles,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (token != null) {
      map['Token'] = token?.toJson();
    }
    if (loginData != null) {
      map['LoginData'] = loginData?.toJson();
    }
    if (user != null) {
      map['User'] = user?.toJson();
    }
    map['Code'] = code;
    map['Roles'] = roles;
    return map;
  }

}

class User {
  User({
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

  User.fromJson(dynamic json) {
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
User copyWith({  String? userName,
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
}) => User(  userName: userName ?? this.userName,
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

class LoginData {
  LoginData({
      this.userName, 
      this.password, 
      this.rememberMe, 
      this.deviceId,});

  LoginData.fromJson(dynamic json) {
    userName = json['UserName'];
    password = json['Password'];
    rememberMe = json['RememberMe'];
    deviceId = json['deviceId'];
  }
  String? userName;
  String? password;
  bool? rememberMe;
  String? deviceId;
LoginData copyWith({  String? userName,
  String? password,
  bool? rememberMe,
  String? deviceId,
}) => LoginData(  userName: userName ?? this.userName,
  password: password ?? this.password,
  rememberMe: rememberMe ?? this.rememberMe,
  deviceId: deviceId ?? this.deviceId,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['UserName'] = userName;
    map['Password'] = password;
    map['RememberMe'] = rememberMe;
    map['deviceId'] = deviceId;
    return map;
  }

}

class Token {
  Token({
      this.accessToken, 
      this.tokenType, 
      this.expiresIn,});

  Token.fromJson(dynamic json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
  }
  String? accessToken;
  String? tokenType;
  String? expiresIn;
Token copyWith({  String? accessToken,
  String? tokenType,
  String? expiresIn,
}) => Token(  accessToken: accessToken ?? this.accessToken,
  tokenType: tokenType ?? this.tokenType,
  expiresIn: expiresIn ?? this.expiresIn,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access_token'] = accessToken;
    map['token_type'] = tokenType;
    map['expires_in'] = expiresIn;
    return map;
  }

}