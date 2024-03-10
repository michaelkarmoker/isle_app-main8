class MostPopularFilterTermModel {
  int? statusCode;
  String? status;
  String? message;
  MostPopularFilterTermData? data;

  MostPopularFilterTermModel(
      {this.statusCode, this.status, this.message, this.data});

  MostPopularFilterTermModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? MostPopularFilterTermData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class MostPopularFilterTermData {
  List<MostPopularFilterTermBrands>? brands;
  List<MostPopularFilterTermColors>? colors;
  List<MostPopularFilterTermSizes>? sizes;
  MostPopularFilterTermNewInDataModel? newIn;
  MostPopularFilterTermDiscount? discount;

  MostPopularFilterTermData({
    this.brands,
    this.colors,
    this.sizes,
    this.newIn,
    this.discount
  });

  MostPopularFilterTermData.fromJson(Map<String, dynamic> json) {
    if (json['brands'] != null) {
      brands = <MostPopularFilterTermBrands>[];
      json['brands'].forEach((v) {
        brands!.add(MostPopularFilterTermBrands.fromJson(v));
      });
    }
    if (json['colors'] != null) {
      colors = <MostPopularFilterTermColors>[];
      json['colors'].forEach((v) {
        colors!.add(MostPopularFilterTermColors.fromJson(v));
      });
    }
    if (json['sizes'] != null) {
      sizes = <MostPopularFilterTermSizes>[];
      json['sizes'].forEach((v) {
        sizes!.add(MostPopularFilterTermSizes.fromJson(v));
      });
    }
    newIn = json['new_in'] != null ? MostPopularFilterTermNewInDataModel.fromJson(json['new_in']) : null;
    discount = json['discount'] != null
        ? MostPopularFilterTermDiscount.fromJson(json['discount'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (brands != null) {
      data['brands'] = brands!.map((v) => v.toJson()).toList();
    }
    if (colors != null) {
      data['colors'] = colors!.map((v) => v.toJson()).toList();
    }
    if (sizes != null) {
      data['sizes'] = sizes!.map((v) => v.toJson()).toList();
    }
    if (newIn != null) {
      data['new_in'] = newIn!.toJson();
    }
    if (discount != null) {
      data['discount'] = discount!.toJson();
    }
    return data;
  }
}

class MostPopularFilterTermBrands {
  int? id;
  String? name;

  MostPopularFilterTermBrands({this.id, this.name});

  MostPopularFilterTermBrands.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class MostPopularFilterTermColors {
  int? id;
  String? name;
  String? colorCode;

  MostPopularFilterTermColors({this.id, this.name, this.colorCode});

  MostPopularFilterTermColors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    colorCode = json['color_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['color_code'] = colorCode;
    return data;
  }
}

class MostPopularFilterTermSizes {
  int? id;
  String? typeName;
  List<Sizes>? sizes;

  MostPopularFilterTermSizes({this.id, this.typeName, this.sizes});

  MostPopularFilterTermSizes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    typeName = json['type_name'];
    if (json['sizes'] != null) {
      sizes = <Sizes>[];
      json['sizes'].forEach((v) {
        sizes!.add(Sizes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type_name'] = typeName;
    if (sizes != null) {
      data['sizes'] = sizes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sizes {
  int? id;
  String? sizeCode;

  Sizes({this.id, this.sizeCode});

  Sizes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sizeCode = json['size_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['size_code'] = sizeCode;
    return data;
  }
}

class MostPopularFilterTermNewInDataModel {
  int? lastWeekProductCount;
  int? last15DaysProductCount;
  int? lastMonthProductCount;
  int? lastYearProductCount;

  MostPopularFilterTermNewInDataModel(
      {this.lastWeekProductCount,
        this.last15DaysProductCount,
        this.lastMonthProductCount,
        this.lastYearProductCount});

  MostPopularFilterTermNewInDataModel.fromJson(Map<String, dynamic> json) {
    lastWeekProductCount = json['last_week_product_count'];
    last15DaysProductCount = json['last_15_days_product_count'];
    lastMonthProductCount = json['last_month_product_count'];
    lastYearProductCount = json['last_year_product_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['last_week_product_count'] = lastWeekProductCount;
    data['last_15_days_product_count'] = last15DaysProductCount;
    data['last_month_product_count'] = lastMonthProductCount;
    data['last_year_product_count'] = lastYearProductCount;
    return data;
  }
}

class MostPopularFilterTermDiscount {
  int? discount10;
  int? discount20;
  int? discount30;
  int? discount40;
  int? discount50;
  int? discount60;
  int? discount70;
  int? discount80;
  int? discount90;
  int? discount100;

  MostPopularFilterTermDiscount(
      {this.discount10,
        this.discount20,
        this.discount30,
        this.discount40,
        this.discount50,
        this.discount60,
        this.discount70,
        this.discount80,
        this.discount90,
        this.discount100});

  MostPopularFilterTermDiscount.fromJson(Map<String, dynamic> json) {
    discount10 = json['discount_10'];
    discount20 = json['discount_20'];
    discount30 = json['discount_30'];
    discount40 = json['discount_40'];
    discount50 = json['discount_50'];
    discount60 = json['discount_60'];
    discount70 = json['discount_70'];
    discount80 = json['discount_80'];
    discount90 = json['discount_90'];
    discount100 = json['discount_100'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['discount_10'] = discount10;
    data['discount_20'] = discount20;
    data['discount_30'] = discount30;
    data['discount_40'] = discount40;
    data['discount_50'] = discount50;
    data['discount_60'] = discount60;
    data['discount_70'] = discount70;
    data['discount_80'] = discount80;
    data['discount_90'] = discount90;
    data['discount_100'] = discount100;
    return data;
  }
}
