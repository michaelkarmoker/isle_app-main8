/// statusCode : 200
/// status : "success"
/// message : "Feedback get successfully"
/// data : [{"id":25,"customer_id":27,"product_id":96,"message":"Good Product","rating":5,"status":true,"customer":{"id":27,"first_name":"Mehedi","last_name":"Hasan","is_guest":false,"phone":"01621938191","email":"mh994711@gmail.com","gender":"male","date_of_birth":"2002-11-27T00:00:00.000Z","state_id":null,"district_id":null,"sub_district_id":null,"address":null,"password":"$2b$10$4pyupKou7OmAKAe28AeWVOoFO1xFIuCxCdpteScYU//W.kDQmC.f.","otp":null,"otp_verified":null,"email_verified":null,"email_verified_at":null,"photo":"/public/uploads/business_man_emote_thumbs_up_md_nwm_v2-HPjlD9nhZ.gif","membership_tier_id":2,"current_tier_first_order":false,"point":107,"use_point":0,"status":true,"is_email":true,"is_sms":false,"browser":"","device":"","deviceName":"","publicIp":"","created_at":"2023-12-04T07:12:48.000Z","updated_at":"2024-02-14T12:41:04.000Z"},"product":{"id":96,"vendor_id":24,"brand_id":25,"season_id":5,"vendor_product_code":"123456789","product_code":"ECSTA-123456789","isle_product_code":"ISLE-2024012910332","name":"Grapic tshirt","vat":7.5,"vat_type":"percent","mrp_price":860,"price":800,"discount_type":"percent","discount":20,"discounted_price":640,"is_publish":false,"size_guide":"/public/uploads/2023-10-11-kw-1-webapp-gifts-trend-multibrand-multicategory-img-goll9tdmu.jpeg","status":"active","created_at":"2024-01-23T03:12:55.000Z","updated_at":"2024-01-29T08:15:49.000Z"},"product_feedback_replies":[{"id":27,"feedback_id":25,"message":"Thanks from admin"}]}]

class GetProductFeedbackResponse {
  GetProductFeedbackResponse({
    this.statusCode,
    this.status,
    this.message,
    this.data,});

  GetProductFeedbackResponse.fromJson(dynamic json) {
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

/// id : 25
/// customer_id : 27
/// product_id : 96
/// message : "Good Product"
/// rating : 5
/// status : true
/// customer : {"id":27,"first_name":"Mehedi","last_name":"Hasan","is_guest":false,"phone":"01621938191","email":"mh994711@gmail.com","gender":"male","date_of_birth":"2002-11-27T00:00:00.000Z","state_id":null,"district_id":null,"sub_district_id":null,"address":null,"password":"$2b$10$4pyupKou7OmAKAe28AeWVOoFO1xFIuCxCdpteScYU//W.kDQmC.f.","otp":null,"otp_verified":null,"email_verified":null,"email_verified_at":null,"photo":"/public/uploads/business_man_emote_thumbs_up_md_nwm_v2-HPjlD9nhZ.gif","membership_tier_id":2,"current_tier_first_order":false,"point":107,"use_point":0,"status":true,"is_email":true,"is_sms":false,"browser":"","device":"","deviceName":"","publicIp":"","created_at":"2023-12-04T07:12:48.000Z","updated_at":"2024-02-14T12:41:04.000Z"}
/// product : {"id":96,"vendor_id":24,"brand_id":25,"season_id":5,"vendor_product_code":"123456789","product_code":"ECSTA-123456789","isle_product_code":"ISLE-2024012910332","name":"Grapic tshirt","vat":7.5,"vat_type":"percent","mrp_price":860,"price":800,"discount_type":"percent","discount":20,"discounted_price":640,"is_publish":false,"size_guide":"/public/uploads/2023-10-11-kw-1-webapp-gifts-trend-multibrand-multicategory-img-goll9tdmu.jpeg","status":"active","created_at":"2024-01-23T03:12:55.000Z","updated_at":"2024-01-29T08:15:49.000Z"}
/// product_feedback_replies : [{"id":27,"feedback_id":25,"message":"Thanks from admin"}]

class Data {
  Data({
    this.id,
    this.customerId,
    this.productId,
    this.message,
    this.rating,
    this.status,
    this.customer,
    this.product,
    this.productFeedbackReplies,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    customerId = json['customer_id'];
    productId = json['product_id'];
    message = json['message'];
    rating = json['rating'];
    status = json['status'];
    customer = json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    product = json['product'] != null ? Product.fromJson(json['product']) : null;
    if (json['product_feedback_replies'] != null) {
      productFeedbackReplies = [];
      json['product_feedback_replies'].forEach((v) {
        productFeedbackReplies?.add(ProductFeedbackReplies.fromJson(v));
      });
    }
  }
  num? id;
  num? customerId;
  num? productId;
  String? message;
  num? rating;
  bool? status;
  Customer? customer;
  Product? product;
  List<ProductFeedbackReplies>? productFeedbackReplies;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['customer_id'] = customerId;
    map['product_id'] = productId;
    map['message'] = message;
    map['rating'] = rating;
    map['status'] = status;
    if (customer != null) {
      map['customer'] = customer?.toJson();
    }
    if (product != null) {
      map['product'] = product?.toJson();
    }
    if (productFeedbackReplies != null) {
      map['product_feedback_replies'] = productFeedbackReplies?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 27
/// feedback_id : 25
/// message : "Thanks from admin"

class ProductFeedbackReplies {
  ProductFeedbackReplies({
    this.id,
    this.feedbackId,
    this.message,});

  ProductFeedbackReplies.fromJson(dynamic json) {
    id = json['id'];
    feedbackId = json['feedback_id'];
    message = json['message'];
  }
  num? id;
  num? feedbackId;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['feedback_id'] = feedbackId;
    map['message'] = message;
    return map;
  }

}

/// id : 96
/// vendor_id : 24
/// brand_id : 25
/// season_id : 5
/// vendor_product_code : "123456789"
/// product_code : "ECSTA-123456789"
/// isle_product_code : "ISLE-2024012910332"
/// name : "Grapic tshirt"
/// vat : 7.5
/// vat_type : "percent"
/// mrp_price : 860
/// price : 800
/// discount_type : "percent"
/// discount : 20
/// discounted_price : 640
/// is_publish : false
/// size_guide : "/public/uploads/2023-10-11-kw-1-webapp-gifts-trend-multibrand-multicategory-img-goll9tdmu.jpeg"
/// status : "active"
/// created_at : "2024-01-23T03:12:55.000Z"
/// updated_at : "2024-01-29T08:15:49.000Z"

class Product {
  Product({
    this.id,
    this.vendorId,
    this.brandId,
    this.seasonId,
    this.vendorProductCode,
    this.productCode,
    this.isleProductCode,
    this.name,
    this.vat,
    this.vatType,
    this.mrpPrice,
    this.price,
    this.discountType,
    this.discount,
    this.discountedPrice,
    this.isPublish,
    this.sizeGuide,
    this.status,
    this.createdAt,
    this.updatedAt,});

  Product.fromJson(dynamic json) {
    id = json['id'];
    vendorId = json['vendor_id'];
    brandId = json['brand_id'];
    seasonId = json['season_id'];
    vendorProductCode = json['vendor_product_code'];
    productCode = json['product_code'];
    isleProductCode = json['isle_product_code'];
    name = json['name'];
    vat = json['vat'];
    vatType = json['vat_type'];
    mrpPrice = json['mrp_price'];
    price = json['price'];
    discountType = json['discount_type'];
    discount = json['discount'];
    discountedPrice = json['discounted_price'];
    isPublish = json['is_publish'];
    sizeGuide = json['size_guide'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  num? vendorId;
  num? brandId;
  num? seasonId;
  String? vendorProductCode;
  String? productCode;
  String? isleProductCode;
  String? name;
  num? vat;
  String? vatType;
  num? mrpPrice;
  num? price;
  String? discountType;
  num? discount;
  num? discountedPrice;
  bool? isPublish;
  String? sizeGuide;
  String? status;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['vendor_id'] = vendorId;
    map['brand_id'] = brandId;
    map['season_id'] = seasonId;
    map['vendor_product_code'] = vendorProductCode;
    map['product_code'] = productCode;
    map['isle_product_code'] = isleProductCode;
    map['name'] = name;
    map['vat'] = vat;
    map['vat_type'] = vatType;
    map['mrp_price'] = mrpPrice;
    map['price'] = price;
    map['discount_type'] = discountType;
    map['discount'] = discount;
    map['discounted_price'] = discountedPrice;
    map['is_publish'] = isPublish;
    map['size_guide'] = sizeGuide;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}

/// id : 27
/// first_name : "Mehedi"
/// last_name : "Hasan"
/// is_guest : false
/// phone : "01621938191"
/// email : "mh994711@gmail.com"
/// gender : "male"
/// date_of_birth : "2002-11-27T00:00:00.000Z"
/// state_id : null
/// district_id : null
/// sub_district_id : null
/// address : null
/// password : "$2b$10$4pyupKou7OmAKAe28AeWVOoFO1xFIuCxCdpteScYU//W.kDQmC.f."
/// otp : null
/// otp_verified : null
/// email_verified : null
/// email_verified_at : null
/// photo : "/public/uploads/business_man_emote_thumbs_up_md_nwm_v2-HPjlD9nhZ.gif"
/// membership_tier_id : 2
/// current_tier_first_order : false
/// point : 107
/// use_point : 0
/// status : true
/// is_email : true
/// is_sms : false
/// browser : ""
/// device : ""
/// deviceName : ""
/// publicIp : ""
/// created_at : "2023-12-04T07:12:48.000Z"
/// updated_at : "2024-02-14T12:41:04.000Z"

class Customer {
  Customer({
    this.id,
    this.firstName,
    this.lastName,
    this.isGuest,
    this.phone,
    this.email,
    this.gender,
    this.dateOfBirth,
    this.stateId,
    this.districtId,
    this.subDistrictId,
    this.address,
    this.password,
    this.otp,
    this.otpVerified,
    this.emailVerified,
    this.emailVerifiedAt,
    this.photo,
    this.membershipTierId,
    this.currentTierFirstOrder,
    this.point,
    this.usePoint,
    this.status,
    this.isEmail,
    this.isSms,
    this.browser,
    this.device,
    this.deviceName,
    this.publicIp,
    this.createdAt,
    this.updatedAt,});

  Customer.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    isGuest = json['is_guest'];
    phone = json['phone'];
    email = json['email'];
    gender = json['gender'];
    dateOfBirth = json['date_of_birth'];
    stateId = json['state_id'];
    districtId = json['district_id'];
    subDistrictId = json['sub_district_id'];
    address = json['address'];
    password = json['password'];
    otp = json['otp'];
    otpVerified = json['otp_verified'];
    emailVerified = json['email_verified'];
    emailVerifiedAt = json['email_verified_at'];
    photo = json['photo'];
    membershipTierId = json['membership_tier_id'];
    currentTierFirstOrder = json['current_tier_first_order'];
    point = json['point'];
    usePoint = json['use_point'];
    status = json['status'];
    isEmail = json['is_email'];
    isSms = json['is_sms'];
    browser = json['browser'];
    device = json['device'];
    deviceName = json['deviceName'];
    publicIp = json['publicIp'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? firstName;
  String? lastName;
  bool? isGuest;
  String? phone;
  String? email;
  String? gender;
  String? dateOfBirth;
  dynamic stateId;
  dynamic districtId;
  dynamic subDistrictId;
  dynamic address;
  String? password;
  dynamic otp;
  dynamic otpVerified;
  dynamic emailVerified;
  dynamic emailVerifiedAt;
  String? photo;
  num? membershipTierId;
  bool? currentTierFirstOrder;
  num? point;
  num? usePoint;
  bool? status;
  bool? isEmail;
  bool? isSms;
  String? browser;
  String? device;
  String? deviceName;
  String? publicIp;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['is_guest'] = isGuest;
    map['phone'] = phone;
    map['email'] = email;
    map['gender'] = gender;
    map['date_of_birth'] = dateOfBirth;
    map['state_id'] = stateId;
    map['district_id'] = districtId;
    map['sub_district_id'] = subDistrictId;
    map['address'] = address;
    map['password'] = password;
    map['otp'] = otp;
    map['otp_verified'] = otpVerified;
    map['email_verified'] = emailVerified;
    map['email_verified_at'] = emailVerifiedAt;
    map['photo'] = photo;
    map['membership_tier_id'] = membershipTierId;
    map['current_tier_first_order'] = currentTierFirstOrder;
    map['point'] = point;
    map['use_point'] = usePoint;
    map['status'] = status;
    map['is_email'] = isEmail;
    map['is_sms'] = isSms;
    map['browser'] = browser;
    map['device'] = device;
    map['deviceName'] = deviceName;
    map['publicIp'] = publicIp;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}