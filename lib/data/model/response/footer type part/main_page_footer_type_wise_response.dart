class MainPageFooterTypeWiseResponse {
  MainPageFooterTypeWiseResponse({
    this.statusCode,
    this.status,
    this.message,
    this.data,});

  MainPageFooterTypeWiseResponse.fromJson(dynamic json) {
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



class Data {
  Data({
    this.customerCare,
    this.company,
    this.legal,
    this.quickLink,
    this.howToShop,});

  Data.fromJson(dynamic json) {
    if (json['customer_care'] != null) {
      customerCare = [];
      json['customer_care'].forEach((v) {
        customerCare?.add(CustomerCare.fromJson(v));
      });
    }
    if (json['company'] != null) {
      company = [];
      json['company'].forEach((v) {
        company?.add(Company.fromJson(v));
      });
    }
    if (json['legal'] != null) {
      legal = [];
      json['legal'].forEach((v) {
        legal?.add(Legal.fromJson(v));
      });
    }
    if (json['quick_link'] != null) {
      quickLink = [];
      json['quick_link'].forEach((v) {
        quickLink?.add(QuickLink.fromJson(v));
      });
    }
    if (json['how_to_shop'] != null) {
      howToShop = [];
      json['how_to_shop'].forEach((v) {
        howToShop?.add(HowToShop.fromJson(v));
      });
    }
  }
  List<CustomerCare>? customerCare;
  List<Company>? company;
  List<Legal>? legal;
  List<QuickLink>? quickLink;
  List<HowToShop>? howToShop;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (customerCare != null) {
      map['customer_care'] = customerCare?.map((v) => v.toJson()).toList();
    }
    if (company != null) {
      map['company'] = company?.map((v) => v.toJson()).toList();
    }
    if (legal != null) {
      map['legal'] = legal?.map((v) => v.toJson()).toList();
    }
    if (quickLink != null) {
      map['quick_link'] = quickLink?.map((v) => v.toJson()).toList();
    }
    if (howToShop != null) {
      map['how_to_shop'] = howToShop?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}


class HowToShop {
  HowToShop({
    this.id,
    this.pageTitle,
    this.slug,
    this.subtitle,
    this.details,
    this.cover,
    this.pageUrlType,
    this.pageUrl,
    this.type,
    this.sortOrder,
    this.video,
    this.createdAt,
    this.updatedAt,});

  HowToShop.fromJson(dynamic json) {
    id = json['id'];
    pageTitle = json['page_title'];
    slug = json['slug'];
    subtitle = json['subtitle'];
    details = json['details'];
    cover = json['cover'];
    pageUrlType = json['page_url_type'];
    pageUrl = json['page_url'];
    type = json['type'];
    sortOrder = json['sort_order'];
    video = json['video'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? pageTitle;
  String? slug;
  String? subtitle;
  String? details;
  String? cover;
  String? pageUrlType;
  String? pageUrl;
  String? type;
  num? sortOrder;
  String? video;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['page_title'] = pageTitle;
    map['slug'] = slug;
    map['subtitle'] = subtitle;
    map['details'] = details;
    map['cover'] = cover;
    map['page_url_type'] = pageUrlType;
    map['page_url'] = pageUrl;
    map['type'] = type;
    map['sort_order'] = sortOrder;
    map['video'] = video;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}



class QuickLink {
  QuickLink({
    this.id,
    this.pageTitle,
    this.slug,
    this.subtitle,
    this.details,
    this.cover,
    this.pageUrlType,
    this.pageUrl,
    this.type,
    this.sortOrder,
    this.video,
    this.createdAt,
    this.updatedAt,});

  QuickLink.fromJson(dynamic json) {
    id = json['id'];
    pageTitle = json['page_title'];
    slug = json['slug'];
    subtitle = json['subtitle'];
    details = json['details'];
    cover = json['cover'];
    pageUrlType = json['page_url_type'];
    pageUrl = json['page_url'];
    type = json['type'];
    sortOrder = json['sort_order'];
    video = json['video'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? pageTitle;
  String? slug;
  String? subtitle;
  String? details;
  String? cover;
  String? pageUrlType;
  String? pageUrl;
  String? type;
  num? sortOrder;
  String? video;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['page_title'] = pageTitle;
    map['slug'] = slug;
    map['subtitle'] = subtitle;
    map['details'] = details;
    map['cover'] = cover;
    map['page_url_type'] = pageUrlType;
    map['page_url'] = pageUrl;
    map['type'] = type;
    map['sort_order'] = sortOrder;
    map['video'] = video;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}



class Legal {
  Legal({
    this.id,
    this.pageTitle,
    this.slug,
    this.subtitle,
    this.details,
    this.cover,
    this.pageUrlType,
    this.pageUrl,
    this.type,
    this.sortOrder,
    this.video,
    this.createdAt,
    this.updatedAt,});

  Legal.fromJson(dynamic json) {
    id = json['id'];
    pageTitle = json['page_title'];
    slug = json['slug'];
    subtitle = json['subtitle'];
    details = json['details'];
    cover = json['cover'];
    pageUrlType = json['page_url_type'];
    pageUrl = json['page_url'];
    type = json['type'];
    sortOrder = json['sort_order'];
    video = json['video'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? pageTitle;
  String? slug;
  String? subtitle;
  String? details;
  dynamic cover;
  String? pageUrlType;
  String? pageUrl;
  String? type;
  dynamic sortOrder;
  dynamic video;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['page_title'] = pageTitle;
    map['slug'] = slug;
    map['subtitle'] = subtitle;
    map['details'] = details;
    map['cover'] = cover;
    map['page_url_type'] = pageUrlType;
    map['page_url'] = pageUrl;
    map['type'] = type;
    map['sort_order'] = sortOrder;
    map['video'] = video;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}



class Company {
  Company({
    this.id,
    this.pageTitle,
    this.slug,
    this.subtitle,
    this.details,
    this.cover,
    this.pageUrlType,
    this.pageUrl,
    this.type,
    this.sortOrder,
    this.video,
    this.createdAt,
    this.updatedAt,});

  Company.fromJson(dynamic json) {
    id = json['id'];
    pageTitle = json['page_title'];
    slug = json['slug'];
    subtitle = json['subtitle'];
    details = json['details'];
    cover = json['cover'];
    pageUrlType = json['page_url_type'];
    pageUrl = json['page_url'];
    type = json['type'];
    sortOrder = json['sort_order'];
    video = json['video'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? pageTitle;
  String? slug;
  String? subtitle;
  String? details;
  dynamic cover;
  String? pageUrlType;
  String? pageUrl;
  String? type;
  num? sortOrder;
  String? video;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['page_title'] = pageTitle;
    map['slug'] = slug;
    map['subtitle'] = subtitle;
    map['details'] = details;
    map['cover'] = cover;
    map['page_url_type'] = pageUrlType;
    map['page_url'] = pageUrl;
    map['type'] = type;
    map['sort_order'] = sortOrder;
    map['video'] = video;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}



class CustomerCare {
  CustomerCare({
    this.id,
    this.pageTitle,
    this.slug,
    this.subtitle,
    this.details,
    this.cover,
    this.pageUrlType,
    this.pageUrl,
    this.type,
    this.sortOrder,
    this.video,
    this.createdAt,
    this.updatedAt,});

  CustomerCare.fromJson(dynamic json) {
    id = json['id'];
    pageTitle = json['page_title'];
    slug = json['slug'];
    subtitle = json['subtitle'];
    details = json['details'];
    cover = json['cover'];
    pageUrlType = json['page_url_type'];
    pageUrl = json['page_url'];
    type = json['type'];
    sortOrder = json['sort_order'];
    video = json['video'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? pageTitle;
  String? slug;
  String? subtitle;
  String? details;
  dynamic cover;
  String? pageUrlType;
  String? pageUrl;
  String? type;
  num? sortOrder;
  dynamic video;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['page_title'] = pageTitle;
    map['slug'] = slug;
    map['subtitle'] = subtitle;
    map['details'] = details;
    map['cover'] = cover;
    map['page_url_type'] = pageUrlType;
    map['page_url'] = pageUrl;
    map['type'] = type;
    map['sort_order'] = sortOrder;
    map['video'] = video;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}









/*class MainPageFooterTypeWiseResponse {
  int? statusCode;
  String? status;
  String? message;
  Data? data;

  MainPageFooterTypeWiseResponse(
      {this.statusCode, this.status, this.message, this.data});

  MainPageFooterTypeWiseResponse.fromJson(Map<String, dynamic> json) {
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
  List<CustomerCare>? customerCare;
  List<Company>? company;
  List<Legal>? legal;
  List<QuickLink>? quickLink;
  List<HowToShop>? howToShop;

  Data(
      {this.customerCare,
        this.company,
        this.legal,
        this.quickLink,
        this.howToShop});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['customer_care'] != null) {
      customerCare = <CustomerCare>[];
      json['customer_care'].forEach((v) {
        customerCare!.add(new CustomerCare.fromJson(v));
      });
    }
    if (json['company'] != null) {
      company = <Company>[];
      json['company'].forEach((v) {
        company!.add(new Company.fromJson(v));
      });
    }
    if (json['legal'] != null) {
      legal = <Legal>[];
      json['legal'].forEach((v) {
        legal!.add(new Legal.fromJson(v));
      });
    }
    if (json['quick_link'] != null) {
      quickLink = <QuickLink>[];
      json['quick_link'].forEach((v) {
        quickLink!.add(new QuickLink.fromJson(v));
      });
    }
    if (json['how_to_shop'] != null) {
      howToShop = <HowToShop>[];
      json['how_to_shop'].forEach((v) {
        howToShop!.add(new HowToShop.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.customerCare != null) {
      data['customer_care'] =
          this.customerCare!.map((v) => v.toJson()).toList();
    }
    if (this.company != null) {
      data['company'] = this.company!.map((v) => v.toJson()).toList();
    }
    if (this.legal != null) {
      data['legal'] = this.legal!.map((v) => v.toJson()).toList();
    }
    if (this.quickLink != null) {
      data['quick_link'] = this.quickLink!.map((v) => v.toJson()).toList();
    }
    if (this.howToShop != null) {
      data['how_to_shop'] = this.howToShop!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CustomerCare {
  CustomerCare({
    this.id,
    this.pageTitle,
    this.slug,
    this.subtitle,
    this.details,
    this.cover,
    this.pageUrl,
    this.type,
    this.sortOrder,
    this.video,
    this.createdAt,
    this.updatedAt,});

  CustomerCare.fromJson(dynamic json) {
    id = json['id'];
    pageTitle = json['page_title'];
    slug = json['slug'];
    subtitle = json['subtitle'];
    details = json['details'];
    cover = json['cover'];
    pageUrl = json['page_url'];
    type = json['type'];
    sortOrder = json['sort_order'];
    video = json['video'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? pageTitle;
  String? slug;
  String? subtitle;
  String? details;
  dynamic cover;
  String? pageUrl;
  String? type;
  num? sortOrder;
  dynamic video;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['page_title'] = pageTitle;
    map['slug'] = slug;
    map['subtitle'] = subtitle;
    map['details'] = details;
    map['cover'] = cover;
    map['page_url'] = pageUrl;
    map['type'] = type;
    map['sort_order'] = sortOrder;
    map['video'] = video;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}

class Company {
  Company({
    this.id,
    this.pageTitle,
    this.slug,
    this.subtitle,
    this.details,
    this.cover,
    this.pageUrl,
    this.type,
    this.sortOrder,
    this.video,
    this.createdAt,
    this.updatedAt,});

  Company.fromJson(dynamic json) {
    id = json['id'];
    pageTitle = json['page_title'];
    slug = json['slug'];
    subtitle = json['subtitle'];
    details = json['details'];
    cover = json['cover'];
    pageUrl = json['page_url'];
    type = json['type'];
    sortOrder = json['sort_order'];
    video = json['video'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? pageTitle;
  String? slug;
  String? subtitle;
  String? details;
  dynamic cover;
  String? pageUrl;
  String? type;
  num? sortOrder;
  String? video;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['page_title'] = pageTitle;
    map['slug'] = slug;
    map['subtitle'] = subtitle;
    map['details'] = details;
    map['cover'] = cover;
    map['page_url'] = pageUrl;
    map['type'] = type;
    map['sort_order'] = sortOrder;
    map['video'] = video;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}

class Legal {
  Legal({
    this.id,
    this.pageTitle,
    this.slug,
    this.subtitle,
    this.details,
    this.cover,
    this.pageUrl,
    this.type,
    this.sortOrder,
    this.video,
    this.createdAt,
    this.updatedAt,});

  Legal.fromJson(dynamic json) {
    id = json['id'];
    pageTitle = json['page_title'];
    slug = json['slug'];
    subtitle = json['subtitle'];
    details = json['details'];
    cover = json['cover'];
    pageUrl = json['page_url'];
    type = json['type'];
    sortOrder = json['sort_order'];
    video = json['video'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? pageTitle;
  String? slug;
  String? subtitle;
  String? details;
  dynamic cover;
  String? pageUrl;
  String? type;
  dynamic sortOrder;
  dynamic video;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['page_title'] = pageTitle;
    map['slug'] = slug;
    map['subtitle'] = subtitle;
    map['details'] = details;
    map['cover'] = cover;
    map['page_url'] = pageUrl;
    map['type'] = type;
    map['sort_order'] = sortOrder;
    map['video'] = video;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}

class QuickLink {
  int? id;
  String? pageTitle;
  String? slug;
  String? subtitle;
  String? details;
  String? cover;
  String? pageUrl;
  String? type;
  int? sortOrder;
  String? video;
  String? createdAt;
  String? updatedAt;

  QuickLink(
      {this.id,
        this.pageTitle,
        this.slug,
        this.subtitle,
        this.details,
        this.cover,
        this.pageUrl,
        this.type,
        this.sortOrder,
        this.video,
        this.createdAt,
        this.updatedAt});

  QuickLink.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pageTitle = json['page_title'];
    slug = json['slug'];
    subtitle = json['subtitle'];
    details = json['details'];
    cover = json['cover'];
    pageUrl = json['page_url'];
    type = json['type'];
    sortOrder = json['sort_order'];
    video = json['video'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['page_title'] = this.pageTitle;
    data['slug'] = this.slug;
    data['subtitle'] = this.subtitle;
    data['details'] = this.details;
    data['cover'] = this.cover;
    data['page_url'] = this.pageUrl;
    data['type'] = this.type;
    data['sort_order'] = this.sortOrder;
    data['video'] = this.video;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class HowToShop {
  HowToShop({
    this.id,
    this.pageTitle,
    this.slug,
    this.subtitle,
    this.details,
    this.cover,
    this.pageUrl,
    this.type,
    this.sortOrder,
    this.video,
    this.createdAt,
    this.updatedAt,});

  HowToShop.fromJson(dynamic json) {
    id = json['id'];
    pageTitle = json['page_title'];
    slug = json['slug'];
    subtitle = json['subtitle'];
    details = json['details'];
    cover = json['cover'];
    pageUrl = json['page_url'];
    type = json['type'];
    sortOrder = json['sort_order'];
    video = json['video'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? pageTitle;
  String? slug;
  String? subtitle;
  String? details;
  String? cover;
  String? pageUrl;
  String? type;
  num? sortOrder;
  String? video;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['page_title'] = pageTitle;
    map['slug'] = slug;
    map['subtitle'] = subtitle;
    map['details'] = details;
    map['cover'] = cover;
    map['page_url'] = pageUrl;
    map['type'] = type;
    map['sort_order'] = sortOrder;
    map['video'] = video;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}*/








/*
class MainPageFooterTypeWiseResponse {
  MainPageFooterTypeWiseResponse({
      this.statusCode, 
      this.status, 
      this.message, 
      this.data,});

  MainPageFooterTypeWiseResponse.fromJson(dynamic json) {
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



class Data {
  Data({
      this.customerCare, 
      this.company, 
      this.legal, 
      this.quickLink, 
      this.howToShop,});

  Data.fromJson(dynamic json) {
    if (json['customer_care'] != null) {
      customerCare = [];
      json['customer_care'].forEach((v) {
        customerCare?.add(CustomerCare.fromJson(v));
      });
    }
    if (json['company'] != null) {
      company = [];
      json['company'].forEach((v) {
        company?.add(Company.fromJson(v));
      });
    }
    if (json['legal'] != null) {
      legal = [];
      json['legal'].forEach((v) {
        legal?.add(Legal.fromJson(v));
      });
    }
    if (json['quick_link'] != null) {
      quickLink = [];
      json['quick_link'].forEach((v) {
        quickLink?.add(QuickLink.fromJson(v));
      });
    }
    if (json['how_to_shop'] != null) {
      howToShop = [];
      json['how_to_shop'].forEach((v) {
        howToShop?.add(HowToShop.fromJson(v));
      });
    }
  }
  List<CustomerCare>? customerCare;
  List<Company>? company;
  List<Legal>? legal;
  List<QuickLink>? quickLink;
  List<HowToShop>? howToShop;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (customerCare != null) {
      map['customer_care'] = customerCare?.map((v) => v.toJson()).toList();
    }
    if (company != null) {
      map['company'] = company?.map((v) => v.toJson()).toList();
    }
    if (legal != null) {
      map['legal'] = legal?.map((v) => v.toJson()).toList();
    }
    if (quickLink != null) {
      map['quick_link'] = quickLink?.map((v) => v.toJson()).toList();
    }
    if (howToShop != null) {
      map['how_to_shop'] = howToShop?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}


class HowToShop {
  HowToShop({
      this.id, 
      this.pageTitle, 
      this.slug, 
      this.subtitle, 
      this.details, 
      this.cover, 
      this.pageUrl, 
      this.type, 
      this.sortOrder, 
      this.video, 
      this.createdAt, 
      this.updatedAt,});

  HowToShop.fromJson(dynamic json) {
    id = json['id'];
    pageTitle = json['page_title'];
    slug = json['slug'];
    subtitle = json['subtitle'];
    details = json['details'];
    cover = json['cover'];
    pageUrl = json['page_url'];
    type = json['type'];
    sortOrder = json['sort_order'];
    video = json['video'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? pageTitle;
  String? slug;
  String? subtitle;
  String? details;
  String? cover;
  String? pageUrl;
  String? type;
  num? sortOrder;
  String? video;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['page_title'] = pageTitle;
    map['slug'] = slug;
    map['subtitle'] = subtitle;
    map['details'] = details;
    map['cover'] = cover;
    map['page_url'] = pageUrl;
    map['type'] = type;
    map['sort_order'] = sortOrder;
    map['video'] = video;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}



class QuickLink {
  QuickLink({
      this.id, 
      this.pageTitle, 
      this.slug, 
      this.subtitle, 
      this.details, 
      this.cover, 
      this.pageUrl, 
      this.type, 
      this.sortOrder, 
      this.video, 
      this.createdAt, 
      this.updatedAt,});

  QuickLink.fromJson(dynamic json) {
    id = json['id'];
    pageTitle = json['page_title'];
    slug = json['slug'];
    subtitle = json['subtitle'];
    details = json['details'];
    cover = json['cover'];
    pageUrl = json['page_url'];
    type = json['type'];
    sortOrder = json['sort_order'];
    video = json['video'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? pageTitle;
  String? slug;
  String? subtitle;
  String? details;
  String? cover;
  String? pageUrl;
  String? type;
  num? sortOrder;
  String? video;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['page_title'] = pageTitle;
    map['slug'] = slug;
    map['subtitle'] = subtitle;
    map['details'] = details;
    map['cover'] = cover;
    map['page_url'] = pageUrl;
    map['type'] = type;
    map['sort_order'] = sortOrder;
    map['video'] = video;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}



class Legal {
  Legal({
      this.id, 
      this.pageTitle, 
      this.slug, 
      this.subtitle, 
      this.details, 
      this.cover, 
      this.pageUrl, 
      this.type, 
      this.sortOrder, 
      this.video, 
      this.createdAt, 
      this.updatedAt,});

  Legal.fromJson(dynamic json) {
    id = json['id'];
    pageTitle = json['page_title'];
    slug = json['slug'];
    subtitle = json['subtitle'];
    details = json['details'];
    cover = json['cover'];
    pageUrl = json['page_url'];
    type = json['type'];
    sortOrder = json['sort_order'];
    video = json['video'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? pageTitle;
  String? slug;
  String? subtitle;
  String? details;
  dynamic cover;
  String? pageUrl;
  String? type;
  dynamic sortOrder;
  dynamic video;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['page_title'] = pageTitle;
    map['slug'] = slug;
    map['subtitle'] = subtitle;
    map['details'] = details;
    map['cover'] = cover;
    map['page_url'] = pageUrl;
    map['type'] = type;
    map['sort_order'] = sortOrder;
    map['video'] = video;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}

class Company {
  Company({
      this.id, 
      this.pageTitle, 
      this.slug, 
      this.subtitle, 
      this.details, 
      this.cover, 
      this.pageUrl, 
      this.type, 
      this.sortOrder, 
      this.video, 
      this.createdAt, 
      this.updatedAt,});

  Company.fromJson(dynamic json) {
    id = json['id'];
    pageTitle = json['page_title'];
    slug = json['slug'];
    subtitle = json['subtitle'];
    details = json['details'];
    cover = json['cover'];
    pageUrl = json['page_url'];
    type = json['type'];
    sortOrder = json['sort_order'];
    video = json['video'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? pageTitle;
  String? slug;
  String? subtitle;
  String? details;
  dynamic cover;
  String? pageUrl;
  String? type;
  num? sortOrder;
  String? video;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['page_title'] = pageTitle;
    map['slug'] = slug;
    map['subtitle'] = subtitle;
    map['details'] = details;
    map['cover'] = cover;
    map['page_url'] = pageUrl;
    map['type'] = type;
    map['sort_order'] = sortOrder;
    map['video'] = video;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}



class CustomerCare {
  CustomerCare({
      this.id, 
      this.pageTitle, 
      this.slug, 
      this.subtitle, 
      this.details, 
      this.cover, 
      this.pageUrl, 
      this.type, 
      this.sortOrder, 
      this.video, 
      this.createdAt, 
      this.updatedAt,});

  CustomerCare.fromJson(dynamic json) {
    id = json['id'];
    pageTitle = json['page_title'];
    slug = json['slug'];
    subtitle = json['subtitle'];
    details = json['details'];
    cover = json['cover'];
    pageUrl = json['page_url'];
    type = json['type'];
    sortOrder = json['sort_order'];
    video = json['video'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? pageTitle;
  String? slug;
  String? subtitle;
  String? details;
  dynamic cover;
  String? pageUrl;
  String? type;
  num? sortOrder;
  dynamic video;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['page_title'] = pageTitle;
    map['slug'] = slug;
    map['subtitle'] = subtitle;
    map['details'] = details;
    map['cover'] = cover;
    map['page_url'] = pageUrl;
    map['type'] = type;
    map['sort_order'] = sortOrder;
    map['video'] = video;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}*/
