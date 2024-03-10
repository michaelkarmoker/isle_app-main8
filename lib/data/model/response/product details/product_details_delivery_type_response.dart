/// statusCode : 200
/// status : "success"
/// message : "DeliveryTypes get successfully"
/// data : [{"id":1,"name":"SUPER EXPRESS","short_description":"3 hour's in Dhaka","description":"<ul><li>Order before 3 pm</li><li>Delivery in Dhaka city only</li><li>Free Delivery over 10000tk order</li><li>200 tk Dhaka city delivery fee</li></ul>","icon":"/public/uploads/asset-7-aM2di-OrV.png","always_available":false,"available_city":true,"delivery_charge_city":200,"available_outside_city":false,"delivery_charge_outside_city":150,"createdAt":"2023-12-24T06:55:52.000Z","updatedAt":"2024-01-14T06:55:18.000Z"},{"id":2,"name":"EXPRESS","short_description":"Delivery within 24 hours in Dhaka","description":"<ul><li>Order between 10am to 6pm</li><li>Delivery within 24 hours in Dhaka</li><li>Free Delivery over 10000tk order</li><li>150 tk Dhaka city delivery fee</li></ul>","icon":"/public/uploads/asset-6-y18BTh-Pp.png","always_available":false,"available_city":true,"delivery_charge_city":150,"available_outside_city":false,"delivery_charge_outside_city":1.7,"createdAt":"2023-12-24T07:10:32.000Z","updatedAt":"2024-01-14T06:55:23.000Z"},{"id":3,"name":"STANDARD","short_description":"Dhaka city 2-3 days & rest of Bangladesh 2-5 days delivery ","description":"<ul><li><span style=\"color: rgb(33, 52, 115);\">&nbsp;</span>Free Delivery over 10000tk order</li><li>100 tk Dhaka city delivery fee</li><li>150 tk All over Bangladesh delivery fee</li></ul>","icon":"/public/uploads/asset-8-6KC2ANYnl.png","always_available":true,"available_city":true,"delivery_charge_city":100,"available_outside_city":true,"delivery_charge_outside_city":150,"createdAt":"2023-12-24T07:11:17.000Z","updatedAt":"2024-01-14T06:55:28.000Z"}]

class ProductDetailsDeliveryTypeResponse {
  ProductDetailsDeliveryTypeResponse({
      this.statusCode, 
      this.status, 
      this.message, 
      this.data,});

  ProductDetailsDeliveryTypeResponse.fromJson(dynamic json) {
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

/// id : 1
/// name : "SUPER EXPRESS"
/// short_description : "3 hour's in Dhaka"
/// description : "<ul><li>Order before 3 pm</li><li>Delivery in Dhaka city only</li><li>Free Delivery over 10000tk order</li><li>200 tk Dhaka city delivery fee</li></ul>"
/// icon : "/public/uploads/asset-7-aM2di-OrV.png"
/// always_available : false
/// available_city : true
/// delivery_charge_city : 200
/// available_outside_city : false
/// delivery_charge_outside_city : 150
/// createdAt : "2023-12-24T06:55:52.000Z"
/// updatedAt : "2024-01-14T06:55:18.000Z"

class Data {
  Data({
      this.id, 
      this.name, 
      this.shortDescription, 
      this.description, 
      this.icon, 
      this.alwaysAvailable, 
      this.availableCity, 
      this.deliveryChargeCity, 
      this.availableOutsideCity, 
      this.deliveryChargeOutsideCity, 
      this.createdAt, 
      this.updatedAt,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    shortDescription = json['short_description'];
    description = json['description'];
    icon = json['icon'];
    alwaysAvailable = json['always_available'];
    availableCity = json['available_city'];
    deliveryChargeCity = json['delivery_charge_city'];
    availableOutsideCity = json['available_outside_city'];
    deliveryChargeOutsideCity = json['delivery_charge_outside_city'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  num? id;
  String? name;
  String? shortDescription;
  String? description;
  String? icon;
  bool? alwaysAvailable;
  bool? availableCity;
  num? deliveryChargeCity;
  bool? availableOutsideCity;
  num? deliveryChargeOutsideCity;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['short_description'] = shortDescription;
    map['description'] = description;
    map['icon'] = icon;
    map['always_available'] = alwaysAvailable;
    map['available_city'] = availableCity;
    map['delivery_charge_city'] = deliveryChargeCity;
    map['available_outside_city'] = availableOutsideCity;
    map['delivery_charge_outside_city'] = deliveryChargeOutsideCity;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

}