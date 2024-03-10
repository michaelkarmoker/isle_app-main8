class HomeHeadlineResponse {
  int? statusCode;
  String? status;
  String? message;
  List<Data>? data;

  HomeHeadlineResponse(
      {this.statusCode, this.status, this.message, this.data});

  HomeHeadlineResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? brandId;
  String? name;
  String? logo;
  int? sortOrder;
  bool? status;
  String? createdAt;
  String? updatedAt;
  Brand? brand;

  Data(
      {this.id,
        this.brandId,
        this.name,
        this.logo,
        this.sortOrder,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.brand});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brandId = json['brand_id'];
    name = json['name'];
    logo = json['logo'];
    sortOrder = json['sort_order'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['brand_id'] = brandId;
    data['name'] = name;
    data['logo'] = logo;
    data['sort_order'] = sortOrder;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (brand != null) {
      data['brand'] = brand!.toJson();
    }
    return data;
  }
}

class Brand {
  int? id;
  String? slug;
  String? brandCategoryId;
  String? brandCode;
  String? name;
  String? details;
  String? logo;
  String? banner;
  bool? isFeatured;
  bool? status;
  String? createdAt;
  String? updatedAt;

  Brand(
      {this.id,
        this.slug,
        this.brandCategoryId,
        this.brandCode,
        this.name,
        this.details,
        this.logo,
        this.banner,
        this.isFeatured,
        this.status,
        this.createdAt,
        this.updatedAt});

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    brandCategoryId = json['brand_category_id'].toString();
    brandCode = json['brand_code'];
    name = json['name'];
    details = json['details'];
    logo = json['logo'];
    banner = json['banner'];
    isFeatured = json['is_featured'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['slug'] = slug;
    data['brand_category_id'] = brandCategoryId;
    data['brand_code'] = brandCode;
    data['name'] = name;
    data['details'] = details;
    data['logo'] = logo;
    data['banner'] = banner;
    data['is_featured'] = isFeatured;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
