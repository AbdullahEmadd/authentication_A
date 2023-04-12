class ProdImagesModel {
  ProdImagesModel({
      this.isMain, 
      this.url,});

  ProdImagesModel.fromJson(dynamic json) {
    isMain = json['isMain'];
    url = json['Url'];
  }
  bool? isMain;
  String? url;
ProdImagesModel copyWith({  bool? isMain,
  String? url,
}) => ProdImagesModel(  isMain: isMain ?? this.isMain,
  url: url ?? this.url,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isMain'] = isMain;
    map['Url'] = url;
    return map;
  }

}