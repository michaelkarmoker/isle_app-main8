/// statusCode : 200
/// status : "success"
/// message : "Exchange requests get successfully"
/// data : {"id":1,"order_details_id":731,"exchange_reason":"Hello Exchange","product_color_variant_id":null,"product_inventory_id":613,"exchange_quantity":1,"exchange_status":"pending","customer_care_status":"pending","dmd_status":null,"seller_status":null,"third_party_logistic_status":null,"third_party_logistic_id":null,"created_at":"2024-02-26T07:04:26.000Z","updated_at":"2024-02-26T07:04:26.000Z","order_detail":{"id":731,"order_id":407,"vendor_id":33,"order_package_id":506,"product_id":140,"color_variant_id":93,"product_inventory_id":614,"quantity":1,"price":899,"calculated_discount":0,"calculated_vat":67.425,"final_price":899,"sub_total":899,"grand_total":966.425,"status":true,"created_at":"2024-02-22T11:13:20.000Z","updated_at":"2024-02-22T11:13:20.000Z","vendor":{"id":33,"name":"Lubnas' Waredrobe"},"product":{"id":140,"vendor_id":33,"brand_id":44,"season_id":3,"vendor_product_code":"LW-210220242","product_code":"LUBNA-LW-210220242","isle_product_code":"ISLE-2024022120126","name":"Regular Fit","vat":7.5,"vat_type":"percent","mrp_price":966.42,"price":899,"discount_type":null,"discount":null,"discounted_price":899,"is_publish":false,"size_guide":"/public/uploads/size-guide-uVcnFHKMR.png","status":"active","created_at":"2024-02-21T07:51:28.000Z","updated_at":"2024-02-21T08:02:27.000Z","brand":{"id":44,"name":"Lubnas' Waredrobe"}},"product_color_variant":{"id":93,"product_id":140,"color_id":4,"profile_photo":"/public/uploads/whatsapp-image-2024-02-21-at-1.33.32-pm-(2)-S6NMgEabAz.jpeg","front_photo":"/public/uploads/whatsapp-image-2024-02-21-at-1.33.31-pm-(5)-4rSmP0vg2.jpeg","backside_photo":"/public/uploads/whatsapp-image-2024-02-21-at-1.33.31-pm-(6)-_vIQN8h_DO.jpeg","details1_photo":null,"details2_photo":null,"outfit_photo":null,"status":true,"created_at":"2024-02-21T07:51:28.000Z","updated_at":"2024-02-21T08:02:27.000Z","color":{"id":4,"name":"Green","color_code":"#00a303","default_color":"#00a303","is_multi":false,"multi_color_1":"","multi_color_2":"","multi_color_3":"","status":true,"created_at":"2023-11-09T03:45:07.000Z","updated_at":"2023-11-09T03:45:07.000Z"}},"product_inventory":{"id":614,"color_variant_id":93,"size_type_id":null,"size_id":30,"stock_qty":0,"status":true,"created_at":"2024-02-21T07:55:12.000Z","updated_at":"2024-02-22T12:48:25.000Z","size":{"id":30,"type_id":9,"size_code":"M","status":true}},"order":{"id":407,"client_corelation_id":"c2a8d442e7258df205af0a14cb18021c","customer_id":39,"is_guest":false,"order_no":"isle241226858","first_name":"MD","last_name":" Riaz","phone":"+8801647777777","email":"","state_id":1,"district_id":2,"sub_district_id":13,"address":"Dhaka, dhanmondi","price":899,"calculated_discount":0,"calculated_vat":67.425,"delivery_charge":100,"final_price":899,"sub_total":899,"grand_total":1066.425,"coupon_id":null,"coupon_or_isle_discount":0,"brand_coupon_discount":0,"first_order_discount":0,"minimum_purchase_discount":0,"redeem_point":0,"redeem_reward":0,"gift_note":"Hello Gift Note","special_note":"","payment_method":"cod","payment_status":"unpaid","order_status":"completed","customer_care_status":"pending","dmd_status":null,"forwarded_to_seller":false,"forwarded_to_3pl":false,"reject_cause":null,"order_log":[{"log":"Order placed","date":"2024-02-20T14:18:06.660Z","action_by":"customer"}],"app_order":false,"status":true,"billing_address":false,"browser":"Chrome","device":"","deviceName":"","publicIp":"103.174.153.164","created_at":"2024-02-22T11:13:20.000Z","updated_at":"2024-02-22T12:48:25.000Z","district":{"id":2,"state_id":1,"name":"Dhaka","status":true,"created_at":"2023-11-23T09:32:41.000Z","updated_at":"2023-11-23T09:32:41.000Z"}},"order_package":{"id":506,"delivery_type_id":3,"delivery_type":{"id":3,"name":"STANDARD","short_description":"Dhaka city 2-3 days & rest of Bangladesh 2-5 days delivery ","description":"<ul>\r\n<li><span style=\"color: rgb(33, 52, 115);\">&nbsp;</span>Free Delivery over 5000tk order</li>\r\n<li>80 tk Dhaka city delivery fee</li>\r\n<li>120 tk All over Bangladesh delivery fee</li>\r\n</ul>","icon":"/public/uploads/asset-8-6KC2ANYnl.png","always_available":true,"available_city":true,"delivery_charge_city":80,"available_outside_city":true,"delivery_charge_outside_city":120,"createdAt":"2023-12-24T07:11:17.000Z","updatedAt":"2024-02-26T15:43:03.000Z"},"vendor":{"id":33,"name":"Lubnas' Waredrobe"}}},"product_color_variant":null,"product_inventory":{"id":613,"color_variant_id":93,"size_type_id":null,"size_id":31,"stock_qty":1,"status":true,"created_at":"2024-02-21T07:55:12.000Z","updated_at":"2024-02-21T07:55:12.000Z","size":{"id":31,"type_id":9,"size_code":"L","status":true}}}

class ExchangeDetailsResponse {
  ExchangeDetailsResponse({
      this.statusCode,
      this.status,
      this.message,
      this.data,});

  ExchangeDetailsResponse.fromJson(dynamic json) {
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
/// order_details_id : 731
/// exchange_reason : "Hello Exchange"
/// product_color_variant_id : null
/// product_inventory_id : 613
/// exchange_quantity : 1
/// exchange_status : "pending"
/// customer_care_status : "pending"
/// dmd_status : null
/// seller_status : null
/// third_party_logistic_status : null
/// third_party_logistic_id : null
/// created_at : "2024-02-26T07:04:26.000Z"
/// updated_at : "2024-02-26T07:04:26.000Z"
/// order_detail : {"id":731,"order_id":407,"vendor_id":33,"order_package_id":506,"product_id":140,"color_variant_id":93,"product_inventory_id":614,"quantity":1,"price":899,"calculated_discount":0,"calculated_vat":67.425,"final_price":899,"sub_total":899,"grand_total":966.425,"status":true,"created_at":"2024-02-22T11:13:20.000Z","updated_at":"2024-02-22T11:13:20.000Z","vendor":{"id":33,"name":"Lubnas' Waredrobe"},"product":{"id":140,"vendor_id":33,"brand_id":44,"season_id":3,"vendor_product_code":"LW-210220242","product_code":"LUBNA-LW-210220242","isle_product_code":"ISLE-2024022120126","name":"Regular Fit","vat":7.5,"vat_type":"percent","mrp_price":966.42,"price":899,"discount_type":null,"discount":null,"discounted_price":899,"is_publish":false,"size_guide":"/public/uploads/size-guide-uVcnFHKMR.png","status":"active","created_at":"2024-02-21T07:51:28.000Z","updated_at":"2024-02-21T08:02:27.000Z","brand":{"id":44,"name":"Lubnas' Waredrobe"}},"product_color_variant":{"id":93,"product_id":140,"color_id":4,"profile_photo":"/public/uploads/whatsapp-image-2024-02-21-at-1.33.32-pm-(2)-S6NMgEabAz.jpeg","front_photo":"/public/uploads/whatsapp-image-2024-02-21-at-1.33.31-pm-(5)-4rSmP0vg2.jpeg","backside_photo":"/public/uploads/whatsapp-image-2024-02-21-at-1.33.31-pm-(6)-_vIQN8h_DO.jpeg","details1_photo":null,"details2_photo":null,"outfit_photo":null,"status":true,"created_at":"2024-02-21T07:51:28.000Z","updated_at":"2024-02-21T08:02:27.000Z","color":{"id":4,"name":"Green","color_code":"#00a303","default_color":"#00a303","is_multi":false,"multi_color_1":"","multi_color_2":"","multi_color_3":"","status":true,"created_at":"2023-11-09T03:45:07.000Z","updated_at":"2023-11-09T03:45:07.000Z"}},"product_inventory":{"id":614,"color_variant_id":93,"size_type_id":null,"size_id":30,"stock_qty":0,"status":true,"created_at":"2024-02-21T07:55:12.000Z","updated_at":"2024-02-22T12:48:25.000Z","size":{"id":30,"type_id":9,"size_code":"M","status":true}},"order":{"id":407,"client_corelation_id":"c2a8d442e7258df205af0a14cb18021c","customer_id":39,"is_guest":false,"order_no":"isle241226858","first_name":"MD","last_name":" Riaz","phone":"+8801647777777","email":"","state_id":1,"district_id":2,"sub_district_id":13,"address":"Dhaka, dhanmondi","price":899,"calculated_discount":0,"calculated_vat":67.425,"delivery_charge":100,"final_price":899,"sub_total":899,"grand_total":1066.425,"coupon_id":null,"coupon_or_isle_discount":0,"brand_coupon_discount":0,"first_order_discount":0,"minimum_purchase_discount":0,"redeem_point":0,"redeem_reward":0,"gift_note":"Hello Gift Note","special_note":"","payment_method":"cod","payment_status":"unpaid","order_status":"completed","customer_care_status":"pending","dmd_status":null,"forwarded_to_seller":false,"forwarded_to_3pl":false,"reject_cause":null,"order_log":[{"log":"Order placed","date":"2024-02-20T14:18:06.660Z","action_by":"customer"}],"app_order":false,"status":true,"billing_address":false,"browser":"Chrome","device":"","deviceName":"","publicIp":"103.174.153.164","created_at":"2024-02-22T11:13:20.000Z","updated_at":"2024-02-22T12:48:25.000Z","district":{"id":2,"state_id":1,"name":"Dhaka","status":true,"created_at":"2023-11-23T09:32:41.000Z","updated_at":"2023-11-23T09:32:41.000Z"}},"order_package":{"id":506,"delivery_type_id":3,"delivery_type":{"id":3,"name":"STANDARD","short_description":"Dhaka city 2-3 days & rest of Bangladesh 2-5 days delivery ","description":"<ul>\r\n<li><span style=\"color: rgb(33, 52, 115);\">&nbsp;</span>Free Delivery over 5000tk order</li>\r\n<li>80 tk Dhaka city delivery fee</li>\r\n<li>120 tk All over Bangladesh delivery fee</li>\r\n</ul>","icon":"/public/uploads/asset-8-6KC2ANYnl.png","always_available":true,"available_city":true,"delivery_charge_city":80,"available_outside_city":true,"delivery_charge_outside_city":120,"createdAt":"2023-12-24T07:11:17.000Z","updatedAt":"2024-02-26T15:43:03.000Z"},"vendor":{"id":33,"name":"Lubnas' Waredrobe"}}}
/// product_color_variant : null
/// product_inventory : {"id":613,"color_variant_id":93,"size_type_id":null,"size_id":31,"stock_qty":1,"status":true,"created_at":"2024-02-21T07:55:12.000Z","updated_at":"2024-02-21T07:55:12.000Z","size":{"id":31,"type_id":9,"size_code":"L","status":true}}

class Data {
  Data({
      this.id,
      this.orderDetailsId,
      this.exchangeReason,
      this.productColorVariantId,
      this.productInventoryId,
      this.exchangeQuantity,
      this.exchangeStatus,
      this.customerCareStatus,
      this.dmdStatus,
      this.sellerStatus,
      this.thirdPartyLogisticStatus,
      this.thirdPartyLogisticId,
      this.createdAt,
      this.updatedAt,
      this.orderDetail,
      this.productColorVariant,
      this.productInventory,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    orderDetailsId = json['order_details_id'];
    exchangeReason = json['exchange_reason'];
    productColorVariantId = json['product_color_variant_id'];
    productInventoryId = json['product_inventory_id'];
    exchangeQuantity = json['exchange_quantity'];
    exchangeStatus = json['exchange_status'];
    customerCareStatus = json['customer_care_status'];
    dmdStatus = json['dmd_status'];
    sellerStatus = json['seller_status'];
    thirdPartyLogisticStatus = json['third_party_logistic_status'];
    thirdPartyLogisticId = json['third_party_logistic_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    orderDetail = json['order_detail'] != null ? OrderDetail.fromJson(json['order_detail']) : null;
    productColorVariant = json['product_color_variant'];
    productInventory = json['product_inventory'] != null ? ProductInventory.fromJson(json['product_inventory']) : null;
  }
  num? id;
  num? orderDetailsId;
  String? exchangeReason;
  dynamic productColorVariantId;
  num? productInventoryId;
  num? exchangeQuantity;
  String? exchangeStatus;
  String? customerCareStatus;
  dynamic dmdStatus;
  dynamic sellerStatus;
  dynamic thirdPartyLogisticStatus;
  dynamic thirdPartyLogisticId;
  String? createdAt;
  String? updatedAt;
  OrderDetail? orderDetail;
  ProductColorVariant? productColorVariant;
  ProductInventory? productInventory;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['order_details_id'] = orderDetailsId;
    map['exchange_reason'] = exchangeReason;
    map['product_color_variant_id'] = productColorVariantId;
    map['product_inventory_id'] = productInventoryId;
    map['exchange_quantity'] = exchangeQuantity;
    map['exchange_status'] = exchangeStatus;
    map['customer_care_status'] = customerCareStatus;
    map['dmd_status'] = dmdStatus;
    map['seller_status'] = sellerStatus;
    map['third_party_logistic_status'] = thirdPartyLogisticStatus;
    map['third_party_logistic_id'] = thirdPartyLogisticId;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (orderDetail != null) {
      map['order_detail'] = orderDetail?.toJson();
    }
    map['product_color_variant'] = productColorVariant;
    if (productInventory != null) {
      map['product_inventory'] = productInventory?.toJson();
    }
    return map;
  }

}

/// id : 613
/// color_variant_id : 93
/// size_type_id : null
/// size_id : 31
/// stock_qty : 1
/// status : true
/// created_at : "2024-02-21T07:55:12.000Z"
/// updated_at : "2024-02-21T07:55:12.000Z"
/// size : {"id":31,"type_id":9,"size_code":"L","status":true}

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

/// id : 31
/// type_id : 9
/// size_code : "L"
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

/// id : 731
/// order_id : 407
/// vendor_id : 33
/// order_package_id : 506
/// product_id : 140
/// color_variant_id : 93
/// product_inventory_id : 614
/// quantity : 1
/// price : 899
/// calculated_discount : 0
/// calculated_vat : 67.425
/// final_price : 899
/// sub_total : 899
/// grand_total : 966.425
/// status : true
/// created_at : "2024-02-22T11:13:20.000Z"
/// updated_at : "2024-02-22T11:13:20.000Z"
/// vendor : {"id":33,"name":"Lubnas' Waredrobe"}
/// product : {"id":140,"vendor_id":33,"brand_id":44,"season_id":3,"vendor_product_code":"LW-210220242","product_code":"LUBNA-LW-210220242","isle_product_code":"ISLE-2024022120126","name":"Regular Fit","vat":7.5,"vat_type":"percent","mrp_price":966.42,"price":899,"discount_type":null,"discount":null,"discounted_price":899,"is_publish":false,"size_guide":"/public/uploads/size-guide-uVcnFHKMR.png","status":"active","created_at":"2024-02-21T07:51:28.000Z","updated_at":"2024-02-21T08:02:27.000Z","brand":{"id":44,"name":"Lubnas' Waredrobe"}}
/// product_color_variant : {"id":93,"product_id":140,"color_id":4,"profile_photo":"/public/uploads/whatsapp-image-2024-02-21-at-1.33.32-pm-(2)-S6NMgEabAz.jpeg","front_photo":"/public/uploads/whatsapp-image-2024-02-21-at-1.33.31-pm-(5)-4rSmP0vg2.jpeg","backside_photo":"/public/uploads/whatsapp-image-2024-02-21-at-1.33.31-pm-(6)-_vIQN8h_DO.jpeg","details1_photo":null,"details2_photo":null,"outfit_photo":null,"status":true,"created_at":"2024-02-21T07:51:28.000Z","updated_at":"2024-02-21T08:02:27.000Z","color":{"id":4,"name":"Green","color_code":"#00a303","default_color":"#00a303","is_multi":false,"multi_color_1":"","multi_color_2":"","multi_color_3":"","status":true,"created_at":"2023-11-09T03:45:07.000Z","updated_at":"2023-11-09T03:45:07.000Z"}}
/// product_inventory : {"id":614,"color_variant_id":93,"size_type_id":null,"size_id":30,"stock_qty":0,"status":true,"created_at":"2024-02-21T07:55:12.000Z","updated_at":"2024-02-22T12:48:25.000Z","size":{"id":30,"type_id":9,"size_code":"M","status":true}}
/// order : {"id":407,"client_corelation_id":"c2a8d442e7258df205af0a14cb18021c","customer_id":39,"is_guest":false,"order_no":"isle241226858","first_name":"MD","last_name":" Riaz","phone":"+8801647777777","email":"","state_id":1,"district_id":2,"sub_district_id":13,"address":"Dhaka, dhanmondi","price":899,"calculated_discount":0,"calculated_vat":67.425,"delivery_charge":100,"final_price":899,"sub_total":899,"grand_total":1066.425,"coupon_id":null,"coupon_or_isle_discount":0,"brand_coupon_discount":0,"first_order_discount":0,"minimum_purchase_discount":0,"redeem_point":0,"redeem_reward":0,"gift_note":"Hello Gift Note","special_note":"","payment_method":"cod","payment_status":"unpaid","order_status":"completed","customer_care_status":"pending","dmd_status":null,"forwarded_to_seller":false,"forwarded_to_3pl":false,"reject_cause":null,"order_log":[{"log":"Order placed","date":"2024-02-20T14:18:06.660Z","action_by":"customer"}],"app_order":false,"status":true,"billing_address":false,"browser":"Chrome","device":"","deviceName":"","publicIp":"103.174.153.164","created_at":"2024-02-22T11:13:20.000Z","updated_at":"2024-02-22T12:48:25.000Z","district":{"id":2,"state_id":1,"name":"Dhaka","status":true,"created_at":"2023-11-23T09:32:41.000Z","updated_at":"2023-11-23T09:32:41.000Z"}}
/// order_package : {"id":506,"delivery_type_id":3,"delivery_type":{"id":3,"name":"STANDARD","short_description":"Dhaka city 2-3 days & rest of Bangladesh 2-5 days delivery ","description":"<ul>\r\n<li><span style=\"color: rgb(33, 52, 115);\">&nbsp;</span>Free Delivery over 5000tk order</li>\r\n<li>80 tk Dhaka city delivery fee</li>\r\n<li>120 tk All over Bangladesh delivery fee</li>\r\n</ul>","icon":"/public/uploads/asset-8-6KC2ANYnl.png","always_available":true,"available_city":true,"delivery_charge_city":80,"available_outside_city":true,"delivery_charge_outside_city":120,"createdAt":"2023-12-24T07:11:17.000Z","updatedAt":"2024-02-26T15:43:03.000Z"},"vendor":{"id":33,"name":"Lubnas' Waredrobe"}}

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
      this.vendor,
      this.product,
      this.productColorVariant,
      this.productInventory,
      this.order,
      this.orderPackage,});

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
    vendor = json['vendor'] != null ? Vendor.fromJson(json['vendor']) : null;
    product = json['product'] != null ? Product.fromJson(json['product']) : null;
    productColorVariant = json['product_color_variant'] != null ? ProductColorVariant.fromJson(json['product_color_variant']) : null;
    productInventory = json['product_inventory'] != null ? ProductInventory.fromJson(json['product_inventory']) : null;
    order = json['order'] != null ? Order.fromJson(json['order']) : null;
    orderPackage = json['order_package'] != null ? OrderPackage.fromJson(json['order_package']) : null;
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
  Vendor? vendor;
  Product? product;
  ProductColorVariant? productColorVariant;
  ProductInventory? productInventory;
  Order? order;
  OrderPackage? orderPackage;

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
    if (vendor != null) {
      map['vendor'] = vendor?.toJson();
    }
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
    if (orderPackage != null) {
      map['order_package'] = orderPackage?.toJson();
    }
    return map;
  }

}

/// id : 506
/// delivery_type_id : 3
/// delivery_type : {"id":3,"name":"STANDARD","short_description":"Dhaka city 2-3 days & rest of Bangladesh 2-5 days delivery ","description":"<ul>\r\n<li><span style=\"color: rgb(33, 52, 115);\">&nbsp;</span>Free Delivery over 5000tk order</li>\r\n<li>80 tk Dhaka city delivery fee</li>\r\n<li>120 tk All over Bangladesh delivery fee</li>\r\n</ul>","icon":"/public/uploads/asset-8-6KC2ANYnl.png","always_available":true,"available_city":true,"delivery_charge_city":80,"available_outside_city":true,"delivery_charge_outside_city":120,"createdAt":"2023-12-24T07:11:17.000Z","updatedAt":"2024-02-26T15:43:03.000Z"}
/// vendor : {"id":33,"name":"Lubnas' Waredrobe"}

class OrderPackage {
  OrderPackage({
      this.id,
      this.deliveryTypeId,
      this.deliveryType,
      this.vendor,});

  OrderPackage.fromJson(dynamic json) {
    id = json['id'];
    deliveryTypeId = json['delivery_type_id'];
    deliveryType = json['delivery_type'] != null ? DeliveryType.fromJson(json['delivery_type']) : null;
    vendor = json['vendor'] != null ? Vendor.fromJson(json['vendor']) : null;
  }
  num? id;
  num? deliveryTypeId;
  DeliveryType? deliveryType;
  Vendor? vendor;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['delivery_type_id'] = deliveryTypeId;
    if (deliveryType != null) {
      map['delivery_type'] = deliveryType?.toJson();
    }
    if (vendor != null) {
      map['vendor'] = vendor?.toJson();
    }
    return map;
  }

}

/// id : 33
/// name : "Lubnas' Waredrobe"

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

/// id : 3
/// name : "STANDARD"
/// short_description : "Dhaka city 2-3 days & rest of Bangladesh 2-5 days delivery "
/// description : "<ul>\r\n<li><span style=\"color: rgb(33, 52, 115);\">&nbsp;</span>Free Delivery over 5000tk order</li>\r\n<li>80 tk Dhaka city delivery fee</li>\r\n<li>120 tk All over Bangladesh delivery fee</li>\r\n</ul>"
/// icon : "/public/uploads/asset-8-6KC2ANYnl.png"
/// always_available : true
/// available_city : true
/// delivery_charge_city : 80
/// available_outside_city : true
/// delivery_charge_outside_city : 120
/// createdAt : "2023-12-24T07:11:17.000Z"
/// updatedAt : "2024-02-26T15:43:03.000Z"

class DeliveryType {
  DeliveryType({
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

  DeliveryType.fromJson(dynamic json) {
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

/// id : 407
/// client_corelation_id : "c2a8d442e7258df205af0a14cb18021c"
/// customer_id : 39
/// is_guest : false
/// order_no : "isle241226858"
/// first_name : "MD"
/// last_name : " Riaz"
/// phone : "+8801647777777"
/// email : ""
/// state_id : 1
/// district_id : 2
/// sub_district_id : 13
/// address : "Dhaka, dhanmondi"
/// price : 899
/// calculated_discount : 0
/// calculated_vat : 67.425
/// delivery_charge : 100
/// final_price : 899
/// sub_total : 899
/// grand_total : 1066.425
/// coupon_id : null
/// coupon_or_isle_discount : 0
/// brand_coupon_discount : 0
/// first_order_discount : 0
/// minimum_purchase_discount : 0
/// redeem_point : 0
/// redeem_reward : 0
/// gift_note : "Hello Gift Note"
/// special_note : ""
/// payment_method : "cod"
/// payment_status : "unpaid"
/// order_status : "completed"
/// customer_care_status : "pending"
/// dmd_status : null
/// forwarded_to_seller : false
/// forwarded_to_3pl : false
/// reject_cause : null
/// order_log : [{"log":"Order placed","date":"2024-02-20T14:18:06.660Z","action_by":"customer"}]
/// app_order : false
/// status : true
/// billing_address : false
/// browser : "Chrome"
/// device : ""
/// deviceName : ""
/// publicIp : "103.174.153.164"
/// created_at : "2024-02-22T11:13:20.000Z"
/// updated_at : "2024-02-22T12:48:25.000Z"
/// district : {"id":2,"state_id":1,"name":"Dhaka","status":true,"created_at":"2023-11-23T09:32:41.000Z","updated_at":"2023-11-23T09:32:41.000Z"}

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
      this.updatedAt,
      this.district,});

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
    district = json['district'] != null ? District.fromJson(json['district']) : null;
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
  String? browser;
  String? device;
  String? deviceName;
  String? publicIp;
  String? createdAt;
  String? updatedAt;
  District? district;

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
    if (district != null) {
      map['district'] = district?.toJson();
    }
    return map;
  }

}

/// id : 2
/// state_id : 1
/// name : "Dhaka"
/// status : true
/// created_at : "2023-11-23T09:32:41.000Z"
/// updated_at : "2023-11-23T09:32:41.000Z"

class District {
  District({
      this.id,
      this.stateId,
      this.name,
      this.status,
      this.createdAt,
      this.updatedAt,});

  District.fromJson(dynamic json) {
    id = json['id'];
    stateId = json['state_id'];
    name = json['name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  num? stateId;
  String? name;
  bool? status;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['state_id'] = stateId;
    map['name'] = name;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}

/// log : "Order placed"
/// date : "2024-02-20T14:18:06.660Z"
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

/// id : 614
/// color_variant_id : 93
/// size_type_id : null
/// size_id : 30
/// stock_qty : 0
/// status : true
/// created_at : "2024-02-21T07:55:12.000Z"
/// updated_at : "2024-02-22T12:48:25.000Z"
/// size : {"id":30,"type_id":9,"size_code":"M","status":true}

/*class ProductInventory {
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

}*/

/// id : 30
/// type_id : 9
/// size_code : "M"
/// status : true

/*class Size {
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

}*/

/// id : 93
/// product_id : 140
/// color_id : 4
/// profile_photo : "/public/uploads/whatsapp-image-2024-02-21-at-1.33.32-pm-(2)-S6NMgEabAz.jpeg"
/// front_photo : "/public/uploads/whatsapp-image-2024-02-21-at-1.33.31-pm-(5)-4rSmP0vg2.jpeg"
/// backside_photo : "/public/uploads/whatsapp-image-2024-02-21-at-1.33.31-pm-(6)-_vIQN8h_DO.jpeg"
/// details1_photo : null
/// details2_photo : null
/// outfit_photo : null
/// status : true
/// created_at : "2024-02-21T07:51:28.000Z"
/// updated_at : "2024-02-21T08:02:27.000Z"
/// color : {"id":4,"name":"Green","color_code":"#00a303","default_color":"#00a303","is_multi":false,"multi_color_1":"","multi_color_2":"","multi_color_3":"","status":true,"created_at":"2023-11-09T03:45:07.000Z","updated_at":"2023-11-09T03:45:07.000Z"}

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
  dynamic details1Photo;
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

/// id : 4
/// name : "Green"
/// color_code : "#00a303"
/// default_color : "#00a303"
/// is_multi : false
/// multi_color_1 : ""
/// multi_color_2 : ""
/// multi_color_3 : ""
/// status : true
/// created_at : "2023-11-09T03:45:07.000Z"
/// updated_at : "2023-11-09T03:45:07.000Z"

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

/// id : 140
/// vendor_id : 33
/// brand_id : 44
/// season_id : 3
/// vendor_product_code : "LW-210220242"
/// product_code : "LUBNA-LW-210220242"
/// isle_product_code : "ISLE-2024022120126"
/// name : "Regular Fit"
/// vat : 7.5
/// vat_type : "percent"
/// mrp_price : 966.42
/// price : 899
/// discount_type : null
/// discount : null
/// discounted_price : 899
/// is_publish : false
/// size_guide : "/public/uploads/size-guide-uVcnFHKMR.png"
/// status : "active"
/// created_at : "2024-02-21T07:51:28.000Z"
/// updated_at : "2024-02-21T08:02:27.000Z"
/// brand : {"id":44,"name":"Lubnas' Waredrobe"}

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
  dynamic discountType;
  dynamic discount;
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

/// id : 44
/// name : "Lubnas' Waredrobe"

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

/// id : 33
/// name : "Lubnas' Waredrobe"

/*
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

}*/
