class DropDownModel {
  DropDownModel({
    this.name,
    this.id});

  DropDownModel.fromJson(dynamic json) {
    name = json['Name'];
    id = json['id'];
  }
  String? name;
  String? id;
  DropDownModel copyWith({  String? id,
    String? name
  }) => DropDownModel(
    name: name ?? this.name,
    id: id ?? this.id,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Name'] = name;
    map['id'] = id;
    return map;
  }
}