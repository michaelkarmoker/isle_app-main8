/// statusCode : 200
/// status : "success"
/// message : "InvoiceSetup settings get successfully"
/// data : {"id":1,"title":"Isle Shopping","slug":"invoice","top_image":"/public/uploads/header-yKMDCaBa5.png","term_bg":"/public/uploads/term-section-nGIRlAgoKj.png","footer_image":"/public/uploads/promotional-footer-banner-I_FyO5PSeg.png","created_at":"2024-01-18T00:32:03.000Z","updated_at":"2024-01-31T07:45:25.000Z"}

class InvoiceTopBottomPhotoResponse {
  InvoiceTopBottomPhotoResponse({
      this.statusCode, 
      this.status, 
      this.message, 
      this.data,});

  InvoiceTopBottomPhotoResponse.fromJson(dynamic json) {
    statusCode = json['statusCode'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  num? statusCode;
  String? status;
  String? message;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusCode'] = statusCode;
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// id : 1
/// title : "Isle Shopping"
/// slug : "invoice"
/// top_image : "/public/uploads/header-yKMDCaBa5.png"
/// term_bg : "/public/uploads/term-section-nGIRlAgoKj.png"
/// footer_image : "/public/uploads/promotional-footer-banner-I_FyO5PSeg.png"
/// created_at : "2024-01-18T00:32:03.000Z"
/// updated_at : "2024-01-31T07:45:25.000Z"

class Data {
  Data({
      this.id, 
      this.title, 
      this.slug, 
      this.topImage, 
      this.termBg, 
      this.footerImage, 
      this.createdAt, 
      this.updatedAt,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    topImage = json['top_image'];
    termBg = json['term_bg'];
    footerImage = json['footer_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? title;
  String? slug;
  String? topImage;
  String? termBg;
  String? footerImage;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['slug'] = slug;
    map['top_image'] = topImage;
    map['term_bg'] = termBg;
    map['footer_image'] = footerImage;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}