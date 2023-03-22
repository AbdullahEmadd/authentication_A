class AddCategoriesModel {
  AddCategoriesModel({
      this.state, 
      this.data, 
      this.message,});

  AddCategoriesModel.fromJson(dynamic json) {
    state = json['State'];
    data = json['Data'];
    if (json['Message'] != null) {
      message = [];
      json['Message'].forEach((v) {
        message?.add(Message.fromJson(v));
      });
    }
  }
  bool? state;
  dynamic data;
  List<Message>? message;
AddCategoriesModel copyWith({  bool? state,
  dynamic data,
  List<Message>? message,
}) => AddCategoriesModel(  state: state ?? this.state,
  data: data ?? this.data,
  message: message ?? this.message,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['State'] = state;
    map['Data'] = data;
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