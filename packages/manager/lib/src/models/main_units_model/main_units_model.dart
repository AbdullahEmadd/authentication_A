class MainUnitsModel {
  MainUnitsModel({
      this.id, 
      this.name,});

  MainUnitsModel.fromJson(dynamic json) {
    id = json['Id'];
    name = json['Name'];
  }
  String? id;
  String? name;
MainUnitsModel copyWith({  String? id,
  String? name,
}) => MainUnitsModel(  id: id ?? this.id,
  name: name ?? this.name,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['Name'] = name;
    return map;
  }

}