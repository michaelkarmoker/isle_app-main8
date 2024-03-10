/// statusCode : 200
/// status : "success"
/// message : "brand get successfully"
/// data : {"id":40,"slug":"MANIQUE prive-irxu","brand_category_id":4,"brand_code":"MANIQUE prive24151787","name":"MANIQUE prive","details":"<p>A Unique Menswear destination for today&rsquo;s fashion statement. It symbolizes dandy look for stylish craze in new cohort. It is characterizing modern deconstruction &amp; traditional tailored outfit.</p>","logo":"/public/uploads/425454734_881545603670216_5979953474501827741_n-9FCXyy45gs.jpg","banner":"/public/uploads/425509011_881546020336841_7030049497606016505_n-rC5B8Bnc4.jpg","is_featured":false,"sort_order":0,"landing_banner":"/public/uploads/manique-brand-banner-9KgcKBk8L.jpg","landing_title":"MANIQUE prive","landing_description":"<p>A Unique Menswear destination for today&rsquo;s fashion statement. It symbolizes dandy look for stylish craze in new cohort. It is characterizing modern deconstruction &amp; traditional tailored outfit.</p>","status":true,"created_at":"2024-02-05T17:53:26.000Z","updated_at":"2024-03-09T06:21:10.000Z","pages":[{"id":1,"slug":"men","title":"MEN","details":"<p><br></p>","button_txt":"","bg_photo":"/public/uploads/isle-landing-page-men-VAly_66Dg.jpg","mobile_bg_photo":"/public/uploads/homepage-banner-mobile-(men)-34zsBS282p.jpg","banner":"/public/uploads/gender-banner-(men)-9O1-Dmp0z.jpg","banner_txt":"MEN","color":"#000000","bg_color":"#0b1d65","active_color":"#d1d5db","active_bg_btn_color":"#0b1d65","status":true,"created_at":"2023-11-09T01:06:26.000Z","updated_at":"2024-03-06T08:51:41.000Z","brand_page":{"brand_id":40,"page_id":1}}]}

class BrandsLandingImageResponse {
  BrandsLandingImageResponse({
      this.statusCode, 
      this.status, 
      this.message, 
      this.data,});

  BrandsLandingImageResponse.fromJson(dynamic json) {
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

/// id : 40
/// slug : "MANIQUE prive-irxu"
/// brand_category_id : 4
/// brand_code : "MANIQUE prive24151787"
/// name : "MANIQUE prive"
/// details : "<p>A Unique Menswear destination for today&rsquo;s fashion statement. It symbolizes dandy look for stylish craze in new cohort. It is characterizing modern deconstruction &amp; traditional tailored outfit.</p>"
/// logo : "/public/uploads/425454734_881545603670216_5979953474501827741_n-9FCXyy45gs.jpg"
/// banner : "/public/uploads/425509011_881546020336841_7030049497606016505_n-rC5B8Bnc4.jpg"
/// is_featured : false
/// sort_order : 0
/// landing_banner : "/public/uploads/manique-brand-banner-9KgcKBk8L.jpg"
/// landing_title : "MANIQUE prive"
/// landing_description : "<p>A Unique Menswear destination for today&rsquo;s fashion statement. It symbolizes dandy look for stylish craze in new cohort. It is characterizing modern deconstruction &amp; traditional tailored outfit.</p>"
/// status : true
/// created_at : "2024-02-05T17:53:26.000Z"
/// updated_at : "2024-03-09T06:21:10.000Z"
/// pages : [{"id":1,"slug":"men","title":"MEN","details":"<p><br></p>","button_txt":"","bg_photo":"/public/uploads/isle-landing-page-men-VAly_66Dg.jpg","mobile_bg_photo":"/public/uploads/homepage-banner-mobile-(men)-34zsBS282p.jpg","banner":"/public/uploads/gender-banner-(men)-9O1-Dmp0z.jpg","banner_txt":"MEN","color":"#000000","bg_color":"#0b1d65","active_color":"#d1d5db","active_bg_btn_color":"#0b1d65","status":true,"created_at":"2023-11-09T01:06:26.000Z","updated_at":"2024-03-06T08:51:41.000Z","brand_page":{"brand_id":40,"page_id":1}}]

class Data {
  Data({
      this.id, 
      this.slug, 
      this.brandCategoryId, 
      this.brandCode, 
      this.name, 
      this.details, 
      this.logo, 
      this.banner, 
      this.isFeatured, 
      this.sortOrder, 
      this.landingBanner, 
      this.landingTitle, 
      this.landingDescription, 
      this.status, 
      this.createdAt, 
      this.updatedAt, 
      this.pages,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    slug = json['slug'];
    brandCategoryId = json['brand_category_id'];
    brandCode = json['brand_code'];
    name = json['name'];
    details = json['details'];
    logo = json['logo'];
    banner = json['banner'];
    isFeatured = json['is_featured'];
    sortOrder = json['sort_order'];
    landingBanner = json['landing_banner'];
    landingTitle = json['landing_title'];
    landingDescription = json['landing_description'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['pages'] != null) {
      pages = [];
      json['pages'].forEach((v) {
        pages?.add(Pages.fromJson(v));
      });
    }
  }
  num? id;
  String? slug;
  num? brandCategoryId;
  String? brandCode;
  String? name;
  String? details;
  String? logo;
  String? banner;
  bool? isFeatured;
  num? sortOrder;
  String? landingBanner;
  String? landingTitle;
  String? landingDescription;
  bool? status;
  String? createdAt;
  String? updatedAt;
  List<Pages>? pages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['slug'] = slug;
    map['brand_category_id'] = brandCategoryId;
    map['brand_code'] = brandCode;
    map['name'] = name;
    map['details'] = details;
    map['logo'] = logo;
    map['banner'] = banner;
    map['is_featured'] = isFeatured;
    map['sort_order'] = sortOrder;
    map['landing_banner'] = landingBanner;
    map['landing_title'] = landingTitle;
    map['landing_description'] = landingDescription;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (pages != null) {
      map['pages'] = pages?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// slug : "men"
/// title : "MEN"
/// details : "<p><br></p>"
/// button_txt : ""
/// bg_photo : "/public/uploads/isle-landing-page-men-VAly_66Dg.jpg"
/// mobile_bg_photo : "/public/uploads/homepage-banner-mobile-(men)-34zsBS282p.jpg"
/// banner : "/public/uploads/gender-banner-(men)-9O1-Dmp0z.jpg"
/// banner_txt : "MEN"
/// color : "#000000"
/// bg_color : "#0b1d65"
/// active_color : "#d1d5db"
/// active_bg_btn_color : "#0b1d65"
/// status : true
/// created_at : "2023-11-09T01:06:26.000Z"
/// updated_at : "2024-03-06T08:51:41.000Z"
/// brand_page : {"brand_id":40,"page_id":1}

class Pages {
  Pages({
      this.id, 
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
      this.updatedAt, 
      this.brandPage,});

  Pages.fromJson(dynamic json) {
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
    brandPage = json['brand_page'] != null ? BrandPage.fromJson(json['brand_page']) : null;
  }
  num? id;
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
  BrandPage? brandPage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['slug'] = slug;
    map['title'] = title;
    map['details'] = details;
    map['button_txt'] = buttonTxt;
    map['bg_photo'] = bgPhoto;
    map['mobile_bg_photo'] = mobileBgPhoto;
    map['banner'] = banner;
    map['banner_txt'] = bannerTxt;
    map['color'] = color;
    map['bg_color'] = bgColor;
    map['active_color'] = activeColor;
    map['active_bg_btn_color'] = activeBgBtnColor;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (brandPage != null) {
      map['brand_page'] = brandPage?.toJson();
    }
    return map;
  }

}

/// brand_id : 40
/// page_id : 1

class BrandPage {
  BrandPage({
      this.brandId, 
      this.pageId,});

  BrandPage.fromJson(dynamic json) {
    brandId = json['brand_id'];
    pageId = json['page_id'];
  }
  num? brandId;
  num? pageId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['brand_id'] = brandId;
    map['page_id'] = pageId;
    return map;
  }

}