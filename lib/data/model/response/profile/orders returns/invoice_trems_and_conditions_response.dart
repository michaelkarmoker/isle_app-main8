/// statusCode : 200
/// status : "success"
/// message : "InvoiceMembersTermsCondition get successfully"
/// data : [{"id":5,"sort_order":1,"termsCondition":"Returns should be as per products return information , please see products Return policy","created_at":"2024-01-29T06:32:45.000Z","updated_at":"2024-01-29T06:32:45.000Z"},{"id":2,"sort_order":2,"termsCondition":"7.5% VAT applies to wearable ready-made garments. and 5% VAT applies to all other items.","created_at":"2024-01-13T06:43:17.000Z","updated_at":"2024-01-29T06:26:25.000Z"},{"id":3,"sort_order":3,"termsCondition":"Items must be in their original condition with tags intact for exchange eligibility, Please visit our website for details return policy.","created_at":"2024-01-13T06:43:19.000Z","updated_at":"2024-01-29T06:29:12.000Z"},{"id":4,"sort_order":4,"termsCondition":"Refunds will be processed within 5 business days upon receiving returned items.","created_at":"2024-01-29T06:28:08.000Z","updated_at":"2024-01-29T06:28:08.000Z"},{"id":1,"sort_order":5,"termsCondition":"Isle reserves the right to refuse exchanges or returns that do not meet the specified criteria.","created_at":"2024-01-13T06:43:15.000Z","updated_at":"2024-01-29T06:27:13.000Z"}]

class InvoiceTermsAndConditionsResponse {
  InvoiceTermsAndConditionsResponse({
      this.statusCode, 
      this.status, 
      this.message, 
      this.data,});

  InvoiceTermsAndConditionsResponse.fromJson(dynamic json) {
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

/// id : 5
/// sort_order : 1
/// termsCondition : "Returns should be as per products return information , please see products Return policy"
/// created_at : "2024-01-29T06:32:45.000Z"
/// updated_at : "2024-01-29T06:32:45.000Z"

class Data {
  Data({
      this.id, 
      this.sortOrder, 
      this.termsCondition, 
      this.createdAt, 
      this.updatedAt,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    sortOrder = json['sort_order'];
    termsCondition = json['termsCondition'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  num? sortOrder;
  String? termsCondition;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['sort_order'] = sortOrder;
    map['termsCondition'] = termsCondition;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}