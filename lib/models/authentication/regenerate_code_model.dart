class RegenerateCodeModel {
  RegenerateCodeModel({
      this.state, 
      this.data, 
      this.message,});

  RegenerateCodeModel.fromJson(dynamic json) {
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
RegenerateCodeModel copyWith({  bool? state,
  Data? data,
  List<Message>? message,
}) => RegenerateCodeModel(  state: state ?? this.state,
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
    applicationUser = json['applicationUser'];
  }
  String? code;
  dynamic applicationUser;
Data copyWith({  String? code,
  dynamic applicationUser,
}) => Data(  code: code ?? this.code,
  applicationUser: applicationUser ?? this.applicationUser,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['applicationUser'] = applicationUser;
    return map;
  }

}