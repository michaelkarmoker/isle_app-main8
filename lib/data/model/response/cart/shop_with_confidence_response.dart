/// statusCode : 201
/// status : "success"
/// message : "tag create successfully"
/// data : {"id":1,"title":"Shop with confidence","description":"100% Original Branded Products\r\n\r\nEasy return & exchange .","short_description":null,"icon":"/public/uploads/like-V9tLj_zrj.png","status":true,"created_at":"2024-02-14T10:11:29.000Z","updated_at":"2024-02-14T10:34:32.000Z"}

class ShopWithConfidenceResponse {
  ShopWithConfidenceResponse({
      this.statusCode, 
      this.status, 
      this.message, 
      this.data,});

  ShopWithConfidenceResponse.fromJson(dynamic json) {
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
/// title : "Shop with confidence"
/// description : "100% Original Branded Products\r\n\r\nEasy return & exchange ."
/// short_description : null
/// icon : "/public/uploads/like-V9tLj_zrj.png"
/// status : true
/// created_at : "2024-02-14T10:11:29.000Z"
/// updated_at : "2024-02-14T10:34:32.000Z"

class Data {
  Data({
      this.id, 
      this.title, 
      this.description, 
      this.shortDescription, 
      this.icon, 
      this.status, 
      this.createdAt, 
      this.updatedAt,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    shortDescription = json['short_description'];
    icon = json['icon'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? title;
  String? description;
  dynamic shortDescription;
  String? icon;
  bool? status;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['description'] = description;
    map['short_description'] = shortDescription;
    map['icon'] = icon;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}