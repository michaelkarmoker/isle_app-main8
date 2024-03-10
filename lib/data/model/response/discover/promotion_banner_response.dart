class PromotionBannerResponse {
  int? statusCode;
  String? status;
  String? message;
  List<Data>? data;

  PromotionBannerResponse(
      {this.statusCode, this.status, this.message, this.data});

  PromotionBannerResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? pageId;
  String? banner;
  String? bannerUrl;
  String? bannerText;
  String? createdAt;
  String? updatedAt;
  Page? page;

  Data(
      {this.id,
        this.pageId,
        this.banner,
        this.bannerUrl,
        this.bannerText,
        this.createdAt,
        this.updatedAt,
        this.page});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pageId = json['page_id'];
    banner = json['banner'];
    bannerUrl = json['banner_url'];
    bannerText = json['banner_text'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    page = json['page'] != null ? new Page.fromJson(json['page']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['page_id'] = this.pageId;
    data['banner'] = this.banner;
    data['banner_url'] = this.bannerUrl;
    data['banner_text'] = this.bannerText;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.page != null) {
      data['page'] = this.page!.toJson();
    }
    return data;
  }
}

class Page {
  int? id;
  String? slug;
  String? title;
  String? details;
  String? buttonTxt;
  String? bgPhoto;
  String? mobileBgPhoto;
  String? banner;
  String? bannerTxt;
  String? color;
  String? bgColor;
  String? activeColor;
  String? activeBgBtnColor;
  bool? status;
  String? createdAt;
  String? updatedAt;

  Page(
      {this.id,
        this.slug,
        this.title,
        this.details,
        this.buttonTxt,
        this.bgPhoto,
        this.mobileBgPhoto,
        this.banner,
        this.bannerTxt,
        this.color,
        this.bgColor,
        this.activeColor,
        this.activeBgBtnColor,
        this.status,
        this.createdAt,
        this.updatedAt});

  Page.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    title = json['title'];
    details = json['details'];
    buttonTxt = json['button_txt'];
    bgPhoto = json['bg_photo'];
    mobileBgPhoto = json['mobile_bg_photo'];
    banner = json['banner'];
    bannerTxt = json['banner_txt'];
    color = json['color'];
    bgColor = json['bg_color'];
    activeColor = json['active_color'];
    activeBgBtnColor = json['active_bg_btn_color'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['title'] = this.title;
    data['details'] = this.details;
    data['button_txt'] = this.buttonTxt;
    data['bg_photo'] = this.bgPhoto;
    data['mobile_bg_photo'] = this.mobileBgPhoto;
    data['banner'] = this.banner;
    data['banner_txt'] = this.bannerTxt;
    data['color'] = this.color;
    data['bg_color'] = this.bgColor;
    data['active_color'] = this.activeColor;
    data['active_bg_btn_color'] = this.activeBgBtnColor;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
