class Item {
  String? key;
  String? value;

  Item({this.key, this.value});

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        key: json["key"].toString(),
        value: json["value"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "value": value,
      };
}
