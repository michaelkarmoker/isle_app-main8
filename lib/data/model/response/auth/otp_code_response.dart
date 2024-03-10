/// statusCode : 200
/// status : "success"
/// message : "token send update successfully"
/// data : {"token":"$2b$10$/crTArt4uOt2q9dFMynqf.KWFBzV2fPgBzqK2NcB372c2jjtRj4l61211"}

class OtpCodeResponse {
  OtpCodeResponse({
      this.statusCode, 
      this.status, 
      this.message, 
      this.data,});

  OtpCodeResponse.fromJson(dynamic json) {
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

/// token : "$2b$10$/crTArt4uOt2q9dFMynqf.KWFBzV2fPgBzqK2NcB372c2jjtRj4l61211"

class Data {
  Data({
      this.token,});

  Data.fromJson(dynamic json) {
    token = json['token'];
  }
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    return map;
  }

}