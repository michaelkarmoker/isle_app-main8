/// statusCode : 200
/// status : "success"
/// message : "Return requests get successfully"
/// data : {"id":1,"order_details_id":670,"return_reason":"Test Return Reason Request ","return_description":null,"return_status":"approved","customer_care_status":"approved","dmd_status":"approved","seller_status":null,"reject_cause":null,"refund_status":"pending","third_party_logistic_id":2,"return_quantity":1,"createdAt":"2024-02-17T10:53:40.000Z","updatedAt":"2024-02-20T14:47:49.000Z","order_detail":{"id":670,"order_id":375,"vendor_id":21,"order_package_id":463,"product_id":45,"color_variant_id":44,"product_inventory_id":263,"quantity":1,"price":1790,"calculated_discount":358,"calculated_vat":103.104,"final_price":1432,"sub_total":1288.8,"grand_total":1391.904,"status":true,"created_at":"2024-02-17T10:07:22.000Z","updated_at":"2024-02-17T10:07:22.000Z","product":{"id":45,"vendor_id":21,"brand_id":19,"season_id":5,"vendor_product_code":"","product_code":"undefined-2023120832751","isle_product_code":"ISLE-2023120899056","name":"Digital Printed Shirt","vat":8,"vat_type":"percent","mrp_price":1933.2,"price":1790,"discount_type":"percent","discount":20,"discounted_price":1432,"is_publish":false,"size_guide":"/public/uploads/taaga-man-shirt-CuyTLooT8.webp","status":"active","created_at":"2023-12-08T11:33:25.000Z","updated_at":"2023-12-26T10:50:00.000Z","brand":{"id":19,"name":"Yellow"}},"product_color_variant":{"id":44,"product_id":45,"color_id":12,"profile_photo":"/public/uploads/20046941_51403857_1000-fUttHWnaZ.webp","front_photo":"/public/uploads/20046941_51403836_1000-45kyEpiM4q.webp","backside_photo":"/public/uploads/20046941_51403860_1000-xocIsFYmZh.webp","details1_photo":"/public/uploads/20046941_51403845_1000-hmBweN8-4y.webp","details2_photo":null,"outfit_photo":null,"status":true,"created_at":"2023-12-08T11:33:25.000Z","updated_at":"2023-12-26T10:50:00.000Z","color":{"id":12,"name":"Multi","color_code":"#01e3f4","default_color":"#007bff","is_multi":true,"multi_color_1":"#e60000","multi_color_2":"#000b9e","multi_color_3":"#008031","status":true,"created_at":"2023-12-03T06:37:58.000Z","updated_at":"2024-02-01T07:33:43.000Z"}},"product_inventory":{"id":263,"color_variant_id":44,"size_type_id":null,"size_id":29,"stock_qty":2,"status":true,"created_at":"2024-02-13T06:09:00.000Z","updated_at":"2024-02-17T10:08:35.000Z","size":{"id":29,"type_id":9,"size_code":"S","status":true}},"order":{"id":375,"client_corelation_id":"web-e145227b456b090911438be6b4f082b9","customer_id":39,"is_guest":false,"order_no":"isle241179347","first_name":"ridoy","last_name":"nasim","phone":"+8801717175652","email":"","state_id":1,"district_id":1,"sub_district_id":66,"address":"Dhka, Banglades","price":6675,"calculated_discount":518,"calculated_vat":440.424,"delivery_charge":0,"final_price":6157,"sub_total":5541.3,"grand_total":5981.724,"coupon_id":null,"coupon_or_isle_discount":0,"brand_coupon_discount":0,"first_order_discount":0,"minimum_purchase_discount":615.7,"redeem_point":0,"redeem_reward":0,"gift_note":null,"special_note":"","payment_method":"cod","payment_status":"unpaid","order_status":"in-process","customer_care_status":"pending","dmd_status":"pending","forwarded_to_seller":true,"forwarded_to_3pl":false,"reject_cause":null,"order_log":[{"log":"Order placed","date":"2024-02-17T06:45:44.922Z","action_by":"customer"},{"log":"Order accepted by super-admin","date":"2024-02-17T10:08:13.402Z","action_by":"super-admin"},{"log":"Order forwarded to Delivery Department","date":"2024-02-17T10:08:15.604Z","action_by":"super-admin"},{"log":"Order forwarded to Seller","date":"2024-02-17T10:08:16.250Z","action_by":"super-admin"},{"log":"Order In Process seller","date":"2024-02-17T10:08:29.120Z","action_by":"super-admin"}],"app_order":false,"status":true,"billing_address":false,"browser":"Chrome","device":"","deviceName":"","publicIp":"103.174.153.164","created_at":"2024-02-17T10:07:22.000Z","updated_at":"2024-02-17T10:08:29.000Z"},"vendor":{"id":21,"name":"Beximco Textile Ltd"}}}

class ReturnsDetailsResponse {
  ReturnsDetailsResponse({
      this.statusCode, 
      this.status, 
      this.message, 
      this.data,});

  ReturnsDetailsResponse.fromJson(dynamic json) {
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
/// order_details_id : 670
/// return_reason : "Test Return Reason Request "
/// return_description : null
/// return_status : "approved"
/// customer_care_status : "approved"
/// dmd_status : "approved"
/// seller_status : null
/// reject_cause : null
/// refund_status : "pending"
/// third_party_logistic_id : 2
/// return_quantity : 1
/// createdAt : "2024-02-17T10:53:40.000Z"
/// updatedAt : "2024-02-20T14:47:49.000Z"
/// order_detail : {"id":670,"order_id":375,"vendor_id":21,"order_package_id":463,"product_id":45,"color_variant_id":44,"product_inventory_id":263,"quantity":1,"price":1790,"calculated_discount":358,"calculated_vat":103.104,"final_price":1432,"sub_total":1288.8,"grand_total":1391.904,"status":true,"created_at":"2024-02-17T10:07:22.000Z","updated_at":"2024-02-17T10:07:22.000Z","product":{"id":45,"vendor_id":21,"brand_id":19,"season_id":5,"vendor_product_code":"","product_code":"undefined-2023120832751","isle_product_code":"ISLE-2023120899056","name":"Digital Printed Shirt","vat":8,"vat_type":"percent","mrp_price":1933.2,"price":1790,"discount_type":"percent","discount":20,"discounted_price":1432,"is_publish":false,"size_guide":"/public/uploads/taaga-man-shirt-CuyTLooT8.webp","status":"active","created_at":"2023-12-08T11:33:25.000Z","updated_at":"2023-12-26T10:50:00.000Z","brand":{"id":19,"name":"Yellow"}},"product_color_variant":{"id":44,"product_id":45,"color_id":12,"profile_photo":"/public/uploads/20046941_51403857_1000-fUttHWnaZ.webp","front_photo":"/public/uploads/20046941_51403836_1000-45kyEpiM4q.webp","backside_photo":"/public/uploads/20046941_51403860_1000-xocIsFYmZh.webp","details1_photo":"/public/uploads/20046941_51403845_1000-hmBweN8-4y.webp","details2_photo":null,"outfit_photo":null,"status":true,"created_at":"2023-12-08T11:33:25.000Z","updated_at":"2023-12-26T10:50:00.000Z","color":{"id":12,"name":"Multi","color_code":"#01e3f4","default_color":"#007bff","is_multi":true,"multi_color_1":"#e60000","multi_color_2":"#000b9e","multi_color_3":"#008031","status":true,"created_at":"2023-12-03T06:37:58.000Z","updated_at":"2024-02-01T07:33:43.000Z"}},"product_inventory":{"id":263,"color_variant_id":44,"size_type_id":null,"size_id":29,"stock_qty":2,"status":true,"created_at":"2024-02-13T06:09:00.000Z","updated_at":"2024-02-17T10:08:35.000Z","size":{"id":29,"type_id":9,"size_code":"S","status":true}},"order":{"id":375,"client_corelation_id":"web-e145227b456b090911438be6b4f082b9","customer_id":39,"is_guest":false,"order_no":"isle241179347","first_name":"ridoy","last_name":"nasim","phone":"+8801717175652","email":"","state_id":1,"district_id":1,"sub_district_id":66,"address":"Dhka, Banglades","price":6675,"calculated_discount":518,"calculated_vat":440.424,"delivery_charge":0,"final_price":6157,"sub_total":5541.3,"grand_total":5981.724,"coupon_id":null,"coupon_or_isle_discount":0,"brand_coupon_discount":0,"first_order_discount":0,"minimum_purchase_discount":615.7,"redeem_point":0,"redeem_reward":0,"gift_note":null,"special_note":"","payment_method":"cod","payment_status":"unpaid","order_status":"in-process","customer_care_status":"pending","dmd_status":"pending","forwarded_to_seller":true,"forwarded_to_3pl":false,"reject_cause":null,"order_log":[{"log":"Order placed","date":"2024-02-17T06:45:44.922Z","action_by":"customer"},{"log":"Order accepted by super-admin","date":"2024-02-17T10:08:13.402Z","action_by":"super-admin"},{"log":"Order forwarded to Delivery Department","date":"2024-02-17T10:08:15.604Z","action_by":"super-admin"},{"log":"Order forwarded to Seller","date":"2024-02-17T10:08:16.250Z","action_by":"super-admin"},{"log":"Order In Process seller","date":"2024-02-17T10:08:29.120Z","action_by":"super-admin"}],"app_order":false,"status":true,"billing_address":false,"browser":"Chrome","device":"","deviceName":"","publicIp":"103.174.153.164","created_at":"2024-02-17T10:07:22.000Z","updated_at":"2024-02-17T10:08:29.000Z"},"vendor":{"id":21,"name":"Beximco Textile Ltd"}}

class Data {
  Data({
      this.id, 
      this.orderDetailsId, 
      this.returnReason, 
      this.returnDescription, 
      this.returnStatus, 
      this.customerCareStatus, 
      this.dmdStatus, 
      this.sellerStatus, 
      this.rejectCause, 
      this.refundStatus, 
      this.thirdPartyLogisticId, 
      this.returnQuantity, 
      this.createdAt, 
      this.updatedAt, 
      this.orderDetail,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    orderDetailsId = json['order_details_id'];
    returnReason = json['return_reason'];
    returnDescription = json['return_description'];
    returnStatus = json['return_status'];
    customerCareStatus = json['customer_care_status'];
    dmdStatus = json['dmd_status'];
    sellerStatus = json['seller_status'];
    rejectCause = json['reject_cause'];
    refundStatus = json['refund_status'];
    thirdPartyLogisticId = json['third_party_logistic_id'];
    returnQuantity = json['return_quantity'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    orderDetail = json['order_detail'] != null ? OrderDetail.fromJson(json['order_detail']) : null;
  }
  num? id;
  num? orderDetailsId;
  String? returnReason;
  dynamic returnDescription;
  String? returnStatus;
  String? customerCareStatus;
  String? dmdStatus;
  dynamic sellerStatus;
  dynamic rejectCause;
  String? refundStatus;
  num? thirdPartyLogisticId;
  num? returnQuantity;
  String? createdAt;
  String? updatedAt;
  OrderDetail? orderDetail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['order_details_id'] = orderDetailsId;
    map['return_reason'] = returnReason;
    map['return_description'] = returnDescription;
    map['return_status'] = returnStatus;
    map['customer_care_status'] = customerCareStatus;
    map['dmd_status'] = dmdStatus;
    map['seller_status'] = sellerStatus;
    map['reject_cause'] = rejectCause;
    map['refund_status'] = refundStatus;
    map['third_party_logistic_id'] = thirdPartyLogisticId;
    map['return_quantity'] = returnQuantity;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    if (orderDetail != null) {
      map['order_detail'] = orderDetail?.toJson();
    }
    return map;
  }

}

/// id : 670
/// order_id : 375
/// vendor_id : 21
/// order_package_id : 463
/// product_id : 45
/// color_variant_id : 44
/// product_inventory_id : 263
/// quantity : 1
/// price : 1790
/// calculated_discount : 358
/// calculated_vat : 103.104
/// final_price : 1432
/// sub_total : 1288.8
/// grand_total : 1391.904
/// status : true
/// created_at : "2024-02-17T10:07:22.000Z"
/// updated_at : "2024-02-17T10:07:22.000Z"
/// product : {"id":45,"vendor_id":21,"brand_id":19,"season_id":5,"vendor_product_code":"","product_code":"undefined-2023120832751","isle_product_code":"ISLE-2023120899056","name":"Digital Printed Shirt","vat":8,"vat_type":"percent","mrp_price":1933.2,"price":1790,"discount_type":"percent","discount":20,"discounted_price":1432,"is_publish":false,"size_guide":"/public/uploads/taaga-man-shirt-CuyTLooT8.webp","status":"active","created_at":"2023-12-08T11:33:25.000Z","updated_at":"2023-12-26T10:50:00.000Z","brand":{"id":19,"name":"Yellow"}}
/// product_color_variant : {"id":44,"product_id":45,"color_id":12,"profile_photo":"/public/uploads/20046941_51403857_1000-fUttHWnaZ.webp","front_photo":"/public/uploads/20046941_51403836_1000-45kyEpiM4q.webp","backside_photo":"/public/uploads/20046941_51403860_1000-xocIsFYmZh.webp","details1_photo":"/public/uploads/20046941_51403845_1000-hmBweN8-4y.webp","details2_photo":null,"outfit_photo":null,"status":true,"created_at":"2023-12-08T11:33:25.000Z","updated_at":"2023-12-26T10:50:00.000Z","color":{"id":12,"name":"Multi","color_code":"#01e3f4","default_color":"#007bff","is_multi":true,"multi_color_1":"#e60000","multi_color_2":"#000b9e","multi_color_3":"#008031","status":true,"created_at":"2023-12-03T06:37:58.000Z","updated_at":"2024-02-01T07:33:43.000Z"}}
/// product_inventory : {"id":263,"color_variant_id":44,"size_type_id":null,"size_id":29,"stock_qty":2,"status":true,"created_at":"2024-02-13T06:09:00.000Z","updated_at":"2024-02-17T10:08:35.000Z","size":{"id":29,"type_id":9,"size_code":"S","status":true}}
/// order : {"id":375,"client_corelation_id":"web-e145227b456b090911438be6b4f082b9","customer_id":39,"is_guest":false,"order_no":"isle241179347","first_name":"ridoy","last_name":"nasim","phone":"+8801717175652","email":"","state_id":1,"district_id":1,"sub_district_id":66,"address":"Dhka, Banglades","price":6675,"calculated_discount":518,"calculated_vat":440.424,"delivery_charge":0,"final_price":6157,"sub_total":5541.3,"grand_total":5981.724,"coupon_id":null,"coupon_or_isle_discount":0,"brand_coupon_discount":0,"first_order_discount":0,"minimum_purchase_discount":615.7,"redeem_point":0,"redeem_reward":0,"gift_note":null,"special_note":"","payment_method":"cod","payment_status":"unpaid","order_status":"in-process","customer_care_status":"pending","dmd_status":"pending","forwarded_to_seller":true,"forwarded_to_3pl":false,"reject_cause":null,"order_log":[{"log":"Order placed","date":"2024-02-17T06:45:44.922Z","action_by":"customer"},{"log":"Order accepted by super-admin","date":"2024-02-17T10:08:13.402Z","action_by":"super-admin"},{"log":"Order forwarded to Delivery Department","date":"2024-02-17T10:08:15.604Z","action_by":"super-admin"},{"log":"Order forwarded to Seller","date":"2024-02-17T10:08:16.250Z","action_by":"super-admin"},{"log":"Order In Process seller","date":"2024-02-17T10:08:29.120Z","action_by":"super-admin"}],"app_order":false,"status":true,"billing_address":false,"browser":"Chrome","device":"","deviceName":"","publicIp":"103.174.153.164","created_at":"2024-02-17T10:07:22.000Z","updated_at":"2024-02-17T10:08:29.000Z"}
/// vendor : {"id":21,"name":"Beximco Textile Ltd"}

class OrderDetail {
  OrderDetail({
      this.id, 
      this.orderId, 
      this.vendorId, 
      this.orderPackageId, 
      this.productId, 
      this.colorVariantId, 
      this.productInventoryId, 
      this.quantity, 
      this.price, 
      this.calculatedDiscount, 
      this.calculatedVat, 
      this.finalPrice, 
      this.subTotal, 
      this.grandTotal, 
      this.status, 
      this.createdAt, 
      this.updatedAt, 
      this.product, 
      this.productColorVariant, 
      this.productInventory, 
      this.order, 
      this.vendor,});

  OrderDetail.fromJson(dynamic json) {
    id = json['id'];
    orderId = json['order_id'];
    vendorId = json['vendor_id'];
    orderPackageId = json['order_package_id'];
    productId = json['product_id'];
    colorVariantId = json['color_variant_id'];
    productInventoryId = json['product_inventory_id'];
    quantity = json['quantity'];
    price = json['price'];
    calculatedDiscount = json['calculated_discount'];
    calculatedVat = json['calculated_vat'];
    finalPrice = json['final_price'];
    subTotal = json['sub_total'];
    grandTotal = json['grand_total'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    product = json['product'] != null ? Product.fromJson(json['product']) : null;
    productColorVariant = json['product_color_variant'] != null ? ProductColorVariant.fromJson(json['product_color_variant']) : null;
    productInventory = json['product_inventory'] != null ? ProductInventory.fromJson(json['product_inventory']) : null;
    order = json['order'] != null ? Order.fromJson(json['order']) : null;
    vendor = json['vendor'] != null ? Vendor.fromJson(json['vendor']) : null;
  }
  num? id;
  num? orderId;
  num? vendorId;
  num? orderPackageId;
  num? productId;
  num? colorVariantId;
  num? productInventoryId;
  num? quantity;
  num? price;
  num? calculatedDiscount;
  num? calculatedVat;
  num? finalPrice;
  num? subTotal;
  num? grandTotal;
  bool? status;
  String? createdAt;
  String? updatedAt;
  Product? product;
  ProductColorVariant? productColorVariant;
  ProductInventory? productInventory;
  Order? order;
  Vendor? vendor;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['order_id'] = orderId;
    map['vendor_id'] = vendorId;
    map['order_package_id'] = orderPackageId;
    map['product_id'] = productId;
    map['color_variant_id'] = colorVariantId;
    map['product_inventory_id'] = productInventoryId;
    map['quantity'] = quantity;
    map['price'] = price;
    map['calculated_discount'] = calculatedDiscount;
    map['calculated_vat'] = calculatedVat;
    map['final_price'] = finalPrice;
    map['sub_total'] = subTotal;
    map['grand_total'] = grandTotal;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (product != null) {
      map['product'] = product?.toJson();
    }
    if (productColorVariant != null) {
      map['product_color_variant'] = productColorVariant?.toJson();
    }
    if (productInventory != null) {
      map['product_inventory'] = productInventory?.toJson();
    }
    if (order != null) {
      map['order'] = order?.toJson();
    }
    if (vendor != null) {
      map['vendor'] = vendor?.toJson();
    }
    return map;
  }

}

/// id : 21
/// name : "Beximco Textile Ltd"

class Vendor {
  Vendor({
      this.id, 
      this.name,});

  Vendor.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  num? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}

/// id : 375
/// client_corelation_id : "web-e145227b456b090911438be6b4f082b9"
/// customer_id : 39
/// is_guest : false
/// order_no : "isle241179347"
/// first_name : "ridoy"
/// last_name : "nasim"
/// phone : "+8801717175652"
/// email : ""
/// state_id : 1
/// district_id : 1
/// sub_district_id : 66
/// address : "Dhka, Banglades"
/// price : 6675
/// calculated_discount : 518
/// calculated_vat : 440.424
/// delivery_charge : 0
/// final_price : 6157
/// sub_total : 5541.3
/// grand_total : 5981.724
/// coupon_id : null
/// coupon_or_isle_discount : 0
/// brand_coupon_discount : 0
/// first_order_discount : 0
/// minimum_purchase_discount : 615.7
/// redeem_point : 0
/// redeem_reward : 0
/// gift_note : null
/// special_note : ""
/// payment_method : "cod"
/// payment_status : "unpaid"
/// order_status : "in-process"
/// customer_care_status : "pending"
/// dmd_status : "pending"
/// forwarded_to_seller : true
/// forwarded_to_3pl : false
/// reject_cause : null
/// order_log : [{"log":"Order placed","date":"2024-02-17T06:45:44.922Z","action_by":"customer"},{"log":"Order accepted by super-admin","date":"2024-02-17T10:08:13.402Z","action_by":"super-admin"},{"log":"Order forwarded to Delivery Department","date":"2024-02-17T10:08:15.604Z","action_by":"super-admin"},{"log":"Order forwarded to Seller","date":"2024-02-17T10:08:16.250Z","action_by":"super-admin"},{"log":"Order In Process seller","date":"2024-02-17T10:08:29.120Z","action_by":"super-admin"}]
/// app_order : false
/// status : true
/// billing_address : false
/// browser : "Chrome"
/// device : ""
/// deviceName : ""
/// publicIp : "103.174.153.164"
/// created_at : "2024-02-17T10:07:22.000Z"
/// updated_at : "2024-02-17T10:08:29.000Z"

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
      this.minimumPurchaseDiscount, 
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
      this.browser, 
      this.device, 
      this.deviceName, 
      this.publicIp, 
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
    minimumPurchaseDiscount = json['minimum_purchase_discount'];
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
    browser = json['browser'];
    device = json['device'];
    deviceName = json['deviceName'];
    publicIp = json['publicIp'];
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
  num? minimumPurchaseDiscount;
  num? redeemPoint;
  num? redeemReward;
  dynamic giftNote;
  String? specialNote;
  String? paymentMethod;
  String? paymentStatus;
  String? orderStatus;
  String? customerCareStatus;
  String? dmdStatus;
  bool? forwardedToSeller;
  bool? forwardedTo3pl;
  dynamic rejectCause;
  List<OrderLog>? orderLog;
  bool? appOrder;
  bool? status;
  bool? billingAddress;
  String? browser;
  String? device;
  String? deviceName;
  String? publicIp;
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
    map['minimum_purchase_discount'] = minimumPurchaseDiscount;
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
    map['browser'] = browser;
    map['device'] = device;
    map['deviceName'] = deviceName;
    map['publicIp'] = publicIp;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}

/// log : "Order placed"
/// date : "2024-02-17T06:45:44.922Z"
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

/// id : 263
/// color_variant_id : 44
/// size_type_id : null
/// size_id : 29
/// stock_qty : 2
/// status : true
/// created_at : "2024-02-13T06:09:00.000Z"
/// updated_at : "2024-02-17T10:08:35.000Z"
/// size : {"id":29,"type_id":9,"size_code":"S","status":true}

class ProductInventory {
  ProductInventory({
      this.id, 
      this.colorVariantId, 
      this.sizeTypeId, 
      this.sizeId, 
      this.stockQty, 
      this.status, 
      this.createdAt, 
      this.updatedAt, 
      this.size,});

  ProductInventory.fromJson(dynamic json) {
    id = json['id'];
    colorVariantId = json['color_variant_id'];
    sizeTypeId = json['size_type_id'];
    sizeId = json['size_id'];
    stockQty = json['stock_qty'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    size = json['size'] != null ? Size.fromJson(json['size']) : null;
  }
  num? id;
  num? colorVariantId;
  dynamic sizeTypeId;
  num? sizeId;
  num? stockQty;
  bool? status;
  String? createdAt;
  String? updatedAt;
  Size? size;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['color_variant_id'] = colorVariantId;
    map['size_type_id'] = sizeTypeId;
    map['size_id'] = sizeId;
    map['stock_qty'] = stockQty;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (size != null) {
      map['size'] = size?.toJson();
    }
    return map;
  }

}

/// id : 29
/// type_id : 9
/// size_code : "S"
/// status : true

class Size {
  Size({
      this.id, 
      this.typeId, 
      this.sizeCode, 
      this.status,});

  Size.fromJson(dynamic json) {
    id = json['id'];
    typeId = json['type_id'];
    sizeCode = json['size_code'];
    status = json['status'];
  }
  num? id;
  num? typeId;
  String? sizeCode;
  bool? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['type_id'] = typeId;
    map['size_code'] = sizeCode;
    map['status'] = status;
    return map;
  }

}

/// id : 44
/// product_id : 45
/// color_id : 12
/// profile_photo : "/public/uploads/20046941_51403857_1000-fUttHWnaZ.webp"
/// front_photo : "/public/uploads/20046941_51403836_1000-45kyEpiM4q.webp"
/// backside_photo : "/public/uploads/20046941_51403860_1000-xocIsFYmZh.webp"
/// details1_photo : "/public/uploads/20046941_51403845_1000-hmBweN8-4y.webp"
/// details2_photo : null
/// outfit_photo : null
/// status : true
/// created_at : "2023-12-08T11:33:25.000Z"
/// updated_at : "2023-12-26T10:50:00.000Z"
/// color : {"id":12,"name":"Multi","color_code":"#01e3f4","default_color":"#007bff","is_multi":true,"multi_color_1":"#e60000","multi_color_2":"#000b9e","multi_color_3":"#008031","status":true,"created_at":"2023-12-03T06:37:58.000Z","updated_at":"2024-02-01T07:33:43.000Z"}

class ProductColorVariant {
  ProductColorVariant({
      this.id, 
      this.productId, 
      this.colorId, 
      this.profilePhoto, 
      this.frontPhoto, 
      this.backsidePhoto, 
      this.details1Photo, 
      this.details2Photo, 
      this.outfitPhoto, 
      this.status, 
      this.createdAt, 
      this.updatedAt, 
      this.color,});

  ProductColorVariant.fromJson(dynamic json) {
    id = json['id'];
    productId = json['product_id'];
    colorId = json['color_id'];
    profilePhoto = json['profile_photo'];
    frontPhoto = json['front_photo'];
    backsidePhoto = json['backside_photo'];
    details1Photo = json['details1_photo'];
    details2Photo = json['details2_photo'];
    outfitPhoto = json['outfit_photo'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    color = json['color'] != null ? Color.fromJson(json['color']) : null;
  }
  num? id;
  num? productId;
  num? colorId;
  String? profilePhoto;
  String? frontPhoto;
  String? backsidePhoto;
  String? details1Photo;
  dynamic details2Photo;
  dynamic outfitPhoto;
  bool? status;
  String? createdAt;
  String? updatedAt;
  Color? color;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['product_id'] = productId;
    map['color_id'] = colorId;
    map['profile_photo'] = profilePhoto;
    map['front_photo'] = frontPhoto;
    map['backside_photo'] = backsidePhoto;
    map['details1_photo'] = details1Photo;
    map['details2_photo'] = details2Photo;
    map['outfit_photo'] = outfitPhoto;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (color != null) {
      map['color'] = color?.toJson();
    }
    return map;
  }

}

/// id : 12
/// name : "Multi"
/// color_code : "#01e3f4"
/// default_color : "#007bff"
/// is_multi : true
/// multi_color_1 : "#e60000"
/// multi_color_2 : "#000b9e"
/// multi_color_3 : "#008031"
/// status : true
/// created_at : "2023-12-03T06:37:58.000Z"
/// updated_at : "2024-02-01T07:33:43.000Z"

class Color {
  Color({
      this.id, 
      this.name, 
      this.colorCode, 
      this.defaultColor, 
      this.isMulti, 
      this.multiColor1, 
      this.multiColor2, 
      this.multiColor3, 
      this.status, 
      this.createdAt, 
      this.updatedAt,});

  Color.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    colorCode = json['color_code'];
    defaultColor = json['default_color'];
    isMulti = json['is_multi'];
    multiColor1 = json['multi_color_1'];
    multiColor2 = json['multi_color_2'];
    multiColor3 = json['multi_color_3'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? name;
  String? colorCode;
  String? defaultColor;
  bool? isMulti;
  String? multiColor1;
  String? multiColor2;
  String? multiColor3;
  bool? status;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['color_code'] = colorCode;
    map['default_color'] = defaultColor;
    map['is_multi'] = isMulti;
    map['multi_color_1'] = multiColor1;
    map['multi_color_2'] = multiColor2;
    map['multi_color_3'] = multiColor3;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}

/// id : 45
/// vendor_id : 21
/// brand_id : 19
/// season_id : 5
/// vendor_product_code : ""
/// product_code : "undefined-2023120832751"
/// isle_product_code : "ISLE-2023120899056"
/// name : "Digital Printed Shirt"
/// vat : 8
/// vat_type : "percent"
/// mrp_price : 1933.2
/// price : 1790
/// discount_type : "percent"
/// discount : 20
/// discounted_price : 1432
/// is_publish : false
/// size_guide : "/public/uploads/taaga-man-shirt-CuyTLooT8.webp"
/// status : "active"
/// created_at : "2023-12-08T11:33:25.000Z"
/// updated_at : "2023-12-26T10:50:00.000Z"
/// brand : {"id":19,"name":"Yellow"}

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
      this.updatedAt, 
      this.brand,});

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
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
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
  Brand? brand;

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
    if (brand != null) {
      map['brand'] = brand?.toJson();
    }
    return map;
  }

}

/// id : 19
/// name : "Yellow"

class Brand {
  Brand({
      this.id, 
      this.name,});

  Brand.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  num? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}