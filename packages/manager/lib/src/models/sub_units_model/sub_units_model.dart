class SubUnitsModel {
  SubUnitsModel({
      this.id, 
      this.name, 
      this.symbol, 
      this.unitGroupId, 
      this.quantityPerUnit, 
      this.quantityPerUnitGroup,});

  SubUnitsModel.fromJson(dynamic json) {
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
SubUnitsModel copyWith({  String? id,
  String? name,
  String? symbol,
  String? unitGroupId,
  num? quantityPerUnit,
  num? quantityPerUnitGroup,
}) => SubUnitsModel(  id: id ?? this.id,
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