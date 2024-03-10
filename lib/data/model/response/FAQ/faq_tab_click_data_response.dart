/// statusCode : 200
/// status : "success"
/// message : "faq get successfully"
/// data : [{"id":5,"faq_type_id":3,"question":"I have received a wrong item","answer":"If you receive the wrong item, please arrange for the return of the item through the Order Details page, selecting \"incorrect items received\" as the return reason. Please note, the item must be returned in the same condition it was received in within 30 days of receipt for a full refund including, where applicable, original Order delivery charges, cash handling fees, taxes and any duties","status":true},{"id":6,"faq_type_id":3,"question":"I have a missing item in my order","answer":"For any missing items in your order, please visit the Contact Us section and send us an e-mail with your order number and the missing item's name and number. Our team will look into your request and back to you in 2-3 business days.","status":true}]

class FaqTabClickDataResponse {
  FaqTabClickDataResponse({
      this.statusCode, 
      this.status, 
      this.message, 
      this.data,});

  FaqTabClickDataResponse.fromJson(dynamic json) {
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
/// faq_type_id : 3
/// question : "I have received a wrong item"
/// answer : "If you receive the wrong item, please arrange for the return of the item through the Order Details page, selecting \"incorrect items received\" as the return reason. Please note, the item must be returned in the same condition it was received in within 30 days of receipt for a full refund including, where applicable, original Order delivery charges, cash handling fees, taxes and any duties"
/// status : true

class Data {
  Data({
      this.id, 
      this.faqTypeId, 
      this.question, 
      this.answer, 
      this.status,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    faqTypeId = json['faq_type_id'];
    question = json['question'];
    answer = json['answer'];
    status = json['status'];
  }
  num? id;
  num? faqTypeId;
  String? question;
  String? answer;
  bool? status;
  bool isDrop= false;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['faq_type_id'] = faqTypeId;
    map['question'] = question;
    map['answer'] = answer;
    map['status'] = status;
    return map;
  }

}