class ProductsModel {
  ProductsModel({
      this.id, 
      this.name, 
      this.description, 
      this.isOptional, 
      this.prodImages,});

  ProductsModel.fromJson(dynamic json) {
    id = json['Id'];
    name = json['Name'];
    description = json['Description'];
    isOptional = json['IsOptional'];
    if (json['ProdImages'] != null) {
      prodImages = [];
      json['ProdImages'].forEach((v) {
        prodImages?.add(ProdImages.fromJson(v));
      });
    }
  }
  String? id;
  String? name;
  String? description;
  bool? isOptional;
  List<ProdImages>? prodImages;
ProductsModel copyWith({  String? id,
  String? name,
  String? description,
  bool? isOptional,
  List<ProdImages>? prodImages,
}) => ProductsModel(  id: id ?? this.id,
  name: name ?? this.name,
  description: description ?? this.description,
  isOptional: isOptional ?? this.isOptional,
  prodImages: prodImages ?? this.prodImages,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['Name'] = name;
    map['Description'] = description;
    map['IsOptional'] = isOptional;
    if (prodImages != null) {
      map['ProdImages'] = prodImages?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class ProdImages {
  ProdImages({
      this.id, 
      this.url, 
      this.productId, 
      this.isMain,});

  ProdImages.fromJson(dynamic json) {
    id = json['Id'];
    url = json['Url'];
    productId = json['ProductId'];
    isMain = json['IsMain'];
  }
  String? id;
  String? url;
  String? productId;
  bool? isMain;
ProdImages copyWith({  String? id,
  String? url,
  String? productId,
  bool? isMain,
}) => ProdImages(  id: id ?? this.id,
  url: url ?? this.url,
  productId: productId ?? this.productId,
  isMain: isMain ?? this.isMain,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['Url'] = url;
    map['ProductId'] = productId;
    map['IsMain'] = isMain;
    return map;
  }

}