class Item {
  String? key;
  String? value;
  bool? isOptional;

  Item({this.key, this.value , this.isOptional});

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        key: json["key"].toString(),
        value: json["value"].toString(),
        isOptional: json["isOptional"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "value": value,
        "isOptional": isOptional,
      };
}
