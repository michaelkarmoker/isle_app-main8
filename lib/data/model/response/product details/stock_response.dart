class StockResponse {
  int? statusCode;
  String? status;
  String? message;
  Data? data;

  StockResponse({this.statusCode, this.status, this.message, this.data});

  StockResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  int? stockQty;
  String? pendingDeliveryQty;

  Data({this.id, this.stockQty, this.pendingDeliveryQty});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stockQty = json['stock_qty'];
    pendingDeliveryQty = json['pending_delivery_qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['stock_qty'] = this.stockQty;
    data['pending_delivery_qty'] = this.pendingDeliveryQty;
    return data;
  }
}
