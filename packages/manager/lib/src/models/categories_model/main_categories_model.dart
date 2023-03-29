class MainCategoriesModel {
  MainCategoriesModel({
      this.id,
      this.name,
      this.logo,
      this.parentCategoryId,
      this.companyId,
      this.isOptional,
      this.relatedCategoryId,});

  MainCategoriesModel.fromJson(dynamic json) {
    id = json['Id'];
    name = json['Name'];
    logo = json['Logo'];
    parentCategoryId = json['ParentCategoryId'];
    companyId = json['CompanyId'];
    isOptional = json['IsOptional'];
    relatedCategoryId = json['RelatedCategoryId'];
  }
  String? id;
  String? name;
  String? logo;
  String? parentCategoryId;
  String? companyId;
  dynamic isOptional;
  dynamic relatedCategoryId;
MainCategoriesModel copyWith({  String? id,
  String? name,
  String? logo,
  String? parentCategoryId,
  String? companyId,
  dynamic isOptional,
  dynamic relatedCategoryId,
}) => MainCategoriesModel(  id: id ?? this.id,
  name: name ?? this.name,
  logo: logo ?? this.logo,
  parentCategoryId: parentCategoryId ?? this.parentCategoryId,
  companyId: companyId ?? this.companyId,
  isOptional: isOptional ?? this.isOptional,
  relatedCategoryId: relatedCategoryId ?? this.relatedCategoryId,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['Name'] = name;
    map['Logo'] = logo;
    map['ParentCategoryId'] = parentCategoryId;
    map['CompanyId'] = companyId;
    map['IsOptional'] = isOptional;
    map['RelatedCategoryId'] = relatedCategoryId;
    return map;
  }

}