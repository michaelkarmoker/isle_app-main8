/// statusCode : 200
/// status : "success"
/// message : "FaqTypes get successfully"
/// data : [{"id":3,"title":"ORDER ","status":true,"created_at":"2023-12-17T01:07:17.000Z","updated_at":"2023-12-18T12:37:31.000Z"},{"id":4,"title":"PAYMENTS","status":true,"created_at":"2023-12-17T01:08:46.000Z","updated_at":"2023-12-18T12:37:46.000Z"},{"id":5,"title":"DELIVERY","status":true,"created_at":"2023-12-18T01:05:43.000Z","updated_at":"2023-12-18T12:38:08.000Z"},{"id":6,"title":"RETURN & REFUND","status":true,"created_at":"2023-12-18T12:38:21.000Z","updated_at":"2024-01-14T06:00:20.000Z"},{"id":7,"title":"CUSTOMER CARE","status":true,"created_at":"2023-12-18T12:39:24.000Z","updated_at":"2023-12-18T12:39:24.000Z"},{"id":8,"title":"MY ACCOUTS","status":true,"created_at":"2023-12-18T12:39:43.000Z","updated_at":"2023-12-18T12:39:43.000Z"},{"id":9,"title":"WISHLIST & MY WARDROBE","status":true,"created_at":"2023-12-18T12:40:24.000Z","updated_at":"2023-12-18T12:40:24.000Z"}]

class FaqTabResponse {
  FaqTabResponse({
      this.statusCode, 
      this.status, 
      this.message, 
      this.data,});

  FaqTabResponse.fromJson(dynamic json) {
    statusCode = json['statusCode'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  num? statusCode;
  String? status;
  String? message;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusCode'] = statusCode;
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 3
/// title : "ORDER "
/// status : true
/// created_at : "2023-12-17T01:07:17.000Z"
/// updated_at : "2023-12-18T12:37:31.000Z"

class Data {
  Data({
      this.id, 
      this.title, 
      this.status, 
      this.createdAt, 
      this.updatedAt,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? title;
  bool? status;
  String? createdAt;
  String? updatedAt;
  bool isDrop1= false;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}