class StockProductsModel {
  StockProductsModel({
      this.productVM,
      this.unitVM,
      this.unitGroupVM,
      this.quantity,});

  StockProductsModel.fromJson(dynamic json) {
    productVM = json['productVM'] != null ? ProductVm.fromJson(json['productVM']) : null;
    unitVM = json['unitVM'] != null ? UnitVm.fromJson(json['unitVM']) : null;
    unitGroupVM = json['unitGroupVM'] != null ? UnitGroupVm.fromJson(json['unitGroupVM']) : null;
    quantity = json['Quantity'];
  }
  ProductVm? productVM;
  UnitVm? unitVM;
  UnitGroupVm? unitGroupVM;
  num? quantity;
StockProductsModel copyWith({  ProductVm? productVM,
  UnitVm? unitVM,
  UnitGroupVm? unitGroupVM,
  num? quantity,
}) => StockProductsModel(  productVM: productVM ?? this.productVM,
  unitVM: unitVM ?? this.unitVM,
  unitGroupVM: unitGroupVM ?? this.unitGroupVM,
  quantity: quantity ?? this.quantity,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (productVM != null) {
      map['productVM'] = productVM?.toJson();
    }
    if (unitVM != null) {
      map['unitVM'] = unitVM?.toJson();
    }
    if (unitGroupVM != null) {
      map['unitGroupVM'] = unitGroupVM?.toJson();
    }
    map['Quantity'] = quantity;
    return map;
  }

}

class UnitGroupVm {
  UnitGroupVm({
      this.id,
      this.name,});

  UnitGroupVm.fromJson(dynamic json) {
    id = json['Id'];
    name = json['Name'];
  }
  String? id;
  String? name;
UnitGroupVm copyWith({  String? id,
  String? name,
}) => UnitGroupVm(  id: id ?? this.id,
  name: name ?? this.name,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['Name'] = name;
    return map;
  }

}

class UnitVm {
  UnitVm({
      this.id,
      this.name,
      this.symbol,
      this.unitGroupId,
      this.quantityPerUnit,
      this.quantityPerUnitGroup,});

  UnitVm.fromJson(dynamic json) {
    id = json['Id'];
    name = json['Name'];
    symbol = json['Symbol'];
    unitGroupId = json['UnitGroupId'];
    quantityPerUnit = json['QuantityPerUnit'];
    quantityPerUnitGroup = json['QuantityPerUnitGroup'];
  }
  String? id;
  String? name;
  String? symbol;
  String? unitGroupId;
  num? quantityPerUnit;
  num? quantityPerUnitGroup;
UnitVm copyWith({  String? id,
  String? name,
  String? symbol,
  String? unitGroupId,
  num? quantityPerUnit,
  num? quantityPerUnitGroup,
}) => UnitVm(  id: id ?? this.id,
  name: name ?? this.name,
  symbol: symbol ?? this.symbol,
  unitGroupId: unitGroupId ?? this.unitGroupId,
  quantityPerUnit: quantityPerUnit ?? this.quantityPerUnit,
  quantityPerUnitGroup: quantityPerUnitGroup ?? this.quantityPerUnitGroup,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['Name'] = name;
    map['Symbol'] = symbol;
    map['UnitGroupId'] = unitGroupId;
    map['QuantityPerUnit'] = quantityPerUnit;
    map['QuantityPerUnitGroup'] = quantityPerUnitGroup;
    return map;
  }

}

class ProductVm {
  ProductVm({
      this.id,
      this.name,
      this.description,
      this.isOptional,
      this.prodImages,});

  ProductVm.fromJson(dynamic json) {
    id = json['Id'];
    name = json['Name'];
    description = json['Description'];
    isOptional = json['IsOptional'];
  }
  String? id;
  String? name;
  String? description;
  bool? isOptional;
  List<dynamic>? prodImages;
ProductVm copyWith({  String? id,
  String? name,
  String? description,
  bool? isOptional,
  List<dynamic>? prodImages,
}) => ProductVm(  id: id ?? this.id,
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