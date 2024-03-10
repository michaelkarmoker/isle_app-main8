/// statusCode : 200
/// status : "success"
/// message : "Isle-Rewards-Setting get successfully"
/// data : {"id":1,"title":"About ISLE Rewards","slug":"isle-rewards-setting","short_description":"Everytime you shop you earn points and redeem on your most loved products\r\n\r\n","isle_rewards_banner":"/public/uploads/isle_member-5sYeMk6qI.webp","memebership_short_description":"ISLE reward points are not earned on VAT amount on receipts. For example, when you spend BDT 107.5 in which VAT amount is BDT 7.5 (7.5%), you will earn points on BDT 100 only","created_at":"2024-02-08T10:08:44.000Z","updated_at":"2024-02-08T11:24:21.000Z"}

class IsleRewardSettingsResponse {
  IsleRewardSettingsResponse({
      this.statusCode, 
      this.status, 
      this.message, 
      this.data,});

  IsleRewardSettingsResponse.fromJson(dynamic json) {
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
/// title : "About ISLE Rewards"
/// slug : "isle-rewards-setting"
/// short_description : "Everytime you shop you earn points and redeem on your most loved products\r\n\r\n"
/// isle_rewards_banner : "/public/uploads/isle_member-5sYeMk6qI.webp"
/// memebership_short_description : "ISLE reward points are not earned on VAT amount on receipts. For example, when you spend BDT 107.5 in which VAT amount is BDT 7.5 (7.5%), you will earn points on BDT 100 only"
/// created_at : "2024-02-08T10:08:44.000Z"
/// updated_at : "2024-02-08T11:24:21.000Z"

class Data {
  Data({
      this.id, 
      this.title, 
      this.slug, 
      this.shortDescription, 
      this.isleRewardsBanner, 
      this.memebershipShortDescription, 
      this.createdAt, 
      this.updatedAt,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    shortDescription = json['short_description'];
    isleRewardsBanner = json['isle_rewards_banner'];
    memebershipShortDescription = json['memebership_short_description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? title;
  String? slug;
  String? shortDescription;
  String? isleRewardsBanner;
  String? memebershipShortDescription;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['slug'] = slug;
    map['short_description'] = shortDescription;
    map['isle_rewards_banner'] = isleRewardsBanner;
    map['memebership_short_description'] = memebershipShortDescription;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}