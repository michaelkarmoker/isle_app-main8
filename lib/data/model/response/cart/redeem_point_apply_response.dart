class RedeemPointApplyResponse {
  int? statusCode;
  String? status;
  String? message;
  Data? data;

  RedeemPointApplyResponse(
      {this.statusCode, this.status, this.message, this.data});

  RedeemPointApplyResponse.fromJson(Map<String, dynamic> json) {
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
  bool? validity;
  int? reward;
  int? point;
  String? msg;

  Data({this.validity, this.reward, this.point,this.msg});

  Data.fromJson(Map<String, dynamic> json) {
    validity = json['validity'];
    reward = json['reward'];
    point = json['point'];
    msg = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['validity'] = this.validity;
    data['reward'] = this.reward;
    data['point'] = this.point;
    return data;
  }
}
