/// statusCode : 200
/// status : "success"
/// message : "reward history settings get successfully"
/// data : [{"id":2,"customer_id":31,"order_id":7,"point":100,"created_at":"2024-01-24T08:09:03.000Z","updated_at":"2024-01-24T08:09:05.000Z","order":{"id":7,"client_corelation_id":"web-ad0e3bee996eb30dcbba453e66db5b81","customer_id":31,"is_guest":false,"order_no":"isle2311282435","first_name":"     bb","last_name":"ggg","phone":"+8888688677868","email":"naymurrahman.cse@gmail.com","state_id":1,"district_id":3,"sub_district_id":17,"address":"  v v","price":7195,"calculated_discount":110,"calculated_vat":566.8,"delivery_charge":400,"final_price":7651.8,"sub_total":0,"grand_total":0,"coupon_id":null,"coupon_or_isle_discount":0,"brand_coupon_discount":0,"first_order_discount":0,"redeem_point":0,"redeem_reward":0,"gift_note":"","special_note":"ffff","payment_method":"cod","payment_status":"unpaid","order_status":"pending","customer_care_status":"pending","dmd_status":null,"forwarded_to_seller":false,"forwarded_to_3pl":false,"reject_cause":null,"order_log":[{"log":"Order placed","date":"2023-12-28T15:29:39.632Z","action_by":"customer"}],"app_order":false,"status":true,"billing_address":false,"created_at":"2023-12-28T12:58:10.000Z","updated_at":"2023-12-28T12:58:10.000Z"}},{"id":3,"customer_id":31,"order_id":196,"point":180,"created_at":"2024-02-01T12:56:55.000Z","updated_at":"2024-02-01T13:03:00.000Z","order":{"id":196,"client_corelation_id":"web-f117ecb80ca2979e469e1025cadfd946","customer_id":31,"is_guest":false,"order_no":"isle24114407","first_name":"Md. NAYMUR Rahaman","last_name":"Sunny","phone":"+8801733424273","email":"sunny@gmail.com","state_id":1,"district_id":2,"sub_district_id":6,"address":"fghdfh","price":2800,"calculated_discount":0,"calculated_vat":224,"delivery_charge":150,"final_price":3024,"sub_total":0,"grand_total":0,"coupon_id":22,"coupon_or_isle_discount":10,"brand_coupon_discount":0,"first_order_discount":0,"redeem_point":null,"redeem_reward":0,"gift_note":null,"special_note":"fgfd","payment_method":"cod","payment_status":"unpaid","order_status":"completed","customer_care_status":"pending","dmd_status":"pending","forwarded_to_seller":true,"forwarded_to_3pl":false,"reject_cause":null,"order_log":[{"log":"Order placed","date":"2024-02-01T09:35:45.099Z","action_by":"customer"},{"log":"Order accepted by super-admin","date":"2024-02-01T12:56:20.804Z","action_by":"super-admin"},{"log":"Order forwarded to Delivery Department","date":"2024-02-01T12:56:24.494Z","action_by":"super-admin"},{"log":"Order forwarded to Seller","date":"2024-02-01T12:56:27.420Z","action_by":"super-admin"},{"log":"Order In Process seller","date":"2024-02-01T12:56:37.387Z","action_by":"super-admin"}],"app_order":false,"status":true,"billing_address":false,"created_at":"2024-02-01T12:54:56.000Z","updated_at":"2024-02-01T13:03:00.000Z"}}]

class RewardHistoryResponse {
  RewardHistoryResponse({
      this.statusCode, 
      this.status, 
      this.message, 
      this.data,});

  RewardHistoryResponse.fromJson(dynamic json) {
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

/// id : 2
/// customer_id : 31
/// order_id : 7
/// point : 100
/// created_at : "2024-01-24T08:09:03.000Z"
/// updated_at : "2024-01-24T08:09:05.000Z"
/// order : {"id":7,"client_corelation_id":"web-ad0e3bee996eb30dcbba453e66db5b81","customer_id":31,"is_guest":false,"order_no":"isle2311282435","first_name":"     bb","last_name":"ggg","phone":"+8888688677868","email":"naymurrahman.cse@gmail.com","state_id":1,"district_id":3,"sub_district_id":17,"address":"  v v","price":7195,"calculated_discount":110,"calculated_vat":566.8,"delivery_charge":400,"final_price":7651.8,"sub_total":0,"grand_total":0,"coupon_id":null,"coupon_or_isle_discount":0,"brand_coupon_discount":0,"first_order_discount":0,"redeem_point":0,"redeem_reward":0,"gift_note":"","special_note":"ffff","payment_method":"cod","payment_status":"unpaid","order_status":"pending","customer_care_status":"pending","dmd_status":null,"forwarded_to_seller":false,"forwarded_to_3pl":false,"reject_cause":null,"order_log":[{"log":"Order placed","date":"2023-12-28T15:29:39.632Z","action_by":"customer"}],"app_order":false,"status":true,"billing_address":false,"created_at":"2023-12-28T12:58:10.000Z","updated_at":"2023-12-28T12:58:10.000Z"}

class Data {
  Data({
      this.id, 
      this.customerId, 
      this.orderId, 
      this.point, 
      this.createdAt, 
      this.updatedAt, 
      this.order,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    customerId = json['customer_id'];
    orderId = json['order_id'];
    point = json['point'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    order = json['order'] != null ? Order.fromJson(json['order']) : null;
  }
  num? id;
  num? customerId;
  num? orderId;
  num? point;
  String? createdAt;
  String? updatedAt;
  Order? order;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['customer_id'] = customerId;
    map['order_id'] = orderId;
    map['point'] = point;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (order != null) {
      map['order'] = order?.toJson();
    }
    return map;
  }

}

/// id : 7
/// client_corelation_id : "web-ad0e3bee996eb30dcbba453e66db5b81"
/// customer_id : 31
/// is_guest : false
/// order_no : "isle2311282435"
/// first_name : "     bb"
/// last_name : "ggg"
/// phone : "+8888688677868"
/// email : "naymurrahman.cse@gmail.com"
/// state_id : 1
/// district_id : 3
/// sub_district_id : 17
/// address : "  v v"
/// price : 7195
/// calculated_discount : 110
/// calculated_vat : 566.8
/// delivery_charge : 400
/// final_price : 7651.8
/// sub_total : 0
/// grand_total : 0
/// coupon_id : null
/// coupon_or_isle_discount : 0
/// brand_coupon_discount : 0
/// first_order_discount : 0
/// redeem_point : 0
/// redeem_reward : 0
/// gift_note : ""
/// special_note : "ffff"
/// payment_method : "cod"
/// payment_status : "unpaid"
/// order_status : "pending"
/// customer_care_status : "pending"
/// dmd_status : null
/// forwarded_to_seller : false
/// forwarded_to_3pl : false
/// reject_cause : null
/// order_log : [{"log":"Order placed","date":"2023-12-28T15:29:39.632Z","action_by":"customer"}]
/// app_order : false
/// status : true
/// billing_address : false
/// created_at : "2023-12-28T12:58:10.000Z"
/// updated_at : "2023-12-28T12:58:10.000Z"

class Order {
  Order({
      this.id, 
      this.clientCorelationId, 
      this.customerId, 
      this.isGuest, 
      this.orderNo, 
      this.firstName, 
      this.lastName, 
      this.phone, 
      this.email, 
      this.stateId, 
      this.districtId, 
      this.subDistrictId, 
      this.address, 
      this.price, 
      this.calculatedDiscount, 
      this.calculatedVat, 
      this.deliveryCharge, 
      this.finalPrice, 
      this.subTotal, 
      this.grandTotal, 
      this.couponId, 
      this.couponOrIsleDiscount, 
      this.brandCouponDiscount, 
      this.firstOrderDiscount, 
      this.redeemPoint, 
      this.redeemReward, 
      this.giftNote, 
      this.specialNote, 
      this.paymentMethod, 
      this.paymentStatus, 
      this.orderStatus, 
      this.customerCareStatus, 
      this.dmdStatus, 
      this.forwardedToSeller, 
      this.forwardedTo3pl, 
      this.rejectCause, 
      this.orderLog, 
      this.appOrder, 
      this.status, 
      this.billingAddress, 
      this.createdAt, 
      this.updatedAt,});

  Order.fromJson(dynamic json) {
    id = json['id'];
    clientCorelationId = json['client_corelation_id'];
    customerId = json['customer_id'];
    isGuest = json['is_guest'];
    orderNo = json['order_no'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    email = json['email'];
    stateId = json['state_id'];
    districtId = json['district_id'];
    subDistrictId = json['sub_district_id'];
    address = json['address'];
    price = json['price'];
    calculatedDiscount = json['calculated_discount'];
    calculatedVat = json['calculated_vat'];
    deliveryCharge = json['delivery_charge'];
    finalPrice = json['final_price'];
    subTotal = json['sub_total'];
    grandTotal = json['grand_total'];
    couponId = json['coupon_id'];
    couponOrIsleDiscount = json['coupon_or_isle_discount'];
    brandCouponDiscount = json['brand_coupon_discount'];
    firstOrderDiscount = json['first_order_discount'];
    redeemPoint = json['redeem_point'];
    redeemReward = json['redeem_reward'];
    giftNote = json['gift_note'];
    specialNote = json['special_note'];
    paymentMethod = json['payment_method'];
    paymentStatus = json['payment_status'];
    orderStatus = json['order_status'];
    customerCareStatus = json['customer_care_status'];
    dmdStatus = json['dmd_status'];
    forwardedToSeller = json['forwarded_to_seller'];
    forwardedTo3pl = json['forwarded_to_3pl'];
    rejectCause = json['reject_cause'];
    if (json['order_log'] != null) {
      orderLog = [];
      json['order_log'].forEach((v) {
        orderLog?.add(OrderLog.fromJson(v));
      });
    }
    appOrder = json['app_order'];
    status = json['status'];
    billingAddress = json['billing_address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? clientCorelationId;
  num? customerId;
  bool? isGuest;
  String? orderNo;
  String? firstName;
  String? lastName;
  String? phone;
  String? email;
  num? stateId;
  num? districtId;
  num? subDistrictId;
  String? address;
  num? price;
  num? calculatedDiscount;
  num? calculatedVat;
  num? deliveryCharge;
  num? finalPrice;
  num? subTotal;
  num? grandTotal;
  dynamic couponId;
  num? couponOrIsleDiscount;
  num? brandCouponDiscount;
  num? firstOrderDiscount;
  num? redeemPoint;
  num? redeemReward;
  String? giftNote;
  String? specialNote;
  String? paymentMethod;
  String? paymentStatus;
  String? orderStatus;
  String? customerCareStatus;
  dynamic dmdStatus;
  bool? forwardedToSeller;
  bool? forwardedTo3pl;
  dynamic rejectCause;
  List<OrderLog>? orderLog;
  bool? appOrder;
  bool? status;
  bool? billingAddress;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['client_corelation_id'] = clientCorelationId;
    map['customer_id'] = customerId;
    map['is_guest'] = isGuest;
    map['order_no'] = orderNo;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['phone'] = phone;
    map['email'] = email;
    map['state_id'] = stateId;
    map['district_id'] = districtId;
    map['sub_district_id'] = subDistrictId;
    map['address'] = address;
    map['price'] = price;
    map['calculated_discount'] = calculatedDiscount;
    map['calculated_vat'] = calculatedVat;
    map['delivery_charge'] = deliveryCharge;
    map['final_price'] = finalPrice;
    map['sub_total'] = subTotal;
    map['grand_total'] = grandTotal;
    map['coupon_id'] = couponId;
    map['coupon_or_isle_discount'] = couponOrIsleDiscount;
    map['brand_coupon_discount'] = brandCouponDiscount;
    map['first_order_discount'] = firstOrderDiscount;
    map['redeem_point'] = redeemPoint;
    map['redeem_reward'] = redeemReward;
    map['gift_note'] = giftNote;
    map['special_note'] = specialNote;
    map['payment_method'] = paymentMethod;
    map['payment_status'] = paymentStatus;
    map['order_status'] = orderStatus;
    map['customer_care_status'] = customerCareStatus;
    map['dmd_status'] = dmdStatus;
    map['forwarded_to_seller'] = forwardedToSeller;
    map['forwarded_to_3pl'] = forwardedTo3pl;
    map['reject_cause'] = rejectCause;
    if (orderLog != null) {
      map['order_log'] = orderLog?.map((v) => v.toJson()).toList();
    }
    map['app_order'] = appOrder;
    map['status'] = status;
    map['billing_address'] = billingAddress;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}

/// log : "Order placed"
/// date : "2023-12-28T15:29:39.632Z"
/// action_by : "customer"

class OrderLog {
  OrderLog({
      this.log, 
      this.date, 
      this.actionBy,});

  OrderLog.fromJson(dynamic json) {
    log = json['log'];
    date = json['date'];
    actionBy = json['action_by'];
  }
  String? log;
  String? date;
  String? actionBy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['log'] = log;
    map['date'] = date;
    map['action_by'] = actionBy;
    return map;
  }

}