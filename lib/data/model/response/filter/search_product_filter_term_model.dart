class SearchPoductFilterTermModel {
  int? statusCode;
  String? status;
  String? message;
  SearchPoductFilterTermData? data;

  SearchPoductFilterTermModel(
      {this.statusCode, this.status, this.message, this.data});

  SearchPoductFilterTermModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? SearchPoductFilterTermData.fromJson(json['data']) : null;
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

class SearchPoductFilterTermData {
  List<SearchPoductFilterTermSizes>? sizes;
  List<SearchPoductFilterTermColors>? colors;
  List<SearchPoductFilterTermBrands>? brands;
  SearchPoductFilterTermNewInModel? newIn;
  SearchPoductFilterTermDiscount? discount;

  SearchPoductFilterTermData({
    this.sizes,
    this.colors,
    this.brands,
    this.newIn,
    this.discount
  });

  SearchPoductFilterTermData.fromJson(Map<String, dynamic> json) {
    if (json['sizes'] != null) {
      sizes = <SearchPoductFilterTermSizes>[];
      json['sizes'].forEach((v) {
        sizes!.add(SearchPoductFilterTermSizes.fromJson(v));
      });
    }
    if (json['colors'] != null) {
      colors = <SearchPoductFilterTermColors>[];
      json['colors'].forEach((v) {
        colors!.add(SearchPoductFilterTermColors.fromJson(v));
      });
    }
    if (json['brands'] != null) {
      brands = <SearchPoductFilterTermBrands>[];
      json['brands'].forEach((v) {
        brands!.add(SearchPoductFilterTermBrands.fromJson(v));
      });
    }
    newIn = json['new_in'] != null ? SearchPoductFilterTermNewInModel.fromJson(json['new_in']) : null;
    discount = json['discount'] != null
        ? SearchPoductFilterTermDiscount.fromJson(json['discount'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (sizes != null) {
      data['sizes'] = sizes!.map((v) => v.toJson()).toList();
    }
    if (colors != null) {
      data['colors'] = colors!.map((v) => v.toJson()).toList();
    }
    if (brands != null) {
      data['brands'] = brands!.map((v) => v.toJson()).toList();
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

class SearchPoductFilterTermSizes {
  int? id;
  String? typeName;
  List<Sizes>? sizes;

  SearchPoductFilterTermSizes({this.id, this.typeName, this.sizes});

  SearchPoductFilterTermSizes.fromJson(Map<String, dynamic> json) {
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


class SearchPoductFilterTermNewInModel {
  int? lastWeekProductCount;
  int? last15DaysProductCount;
  int? lastMonthProductCount;
  int? lastYearProductCount;

  SearchPoductFilterTermNewInModel(
      {this.lastWeekProductCount,
        this.last15DaysProductCount,
        this.lastMonthProductCount,
        this.lastYearProductCount});

  SearchPoductFilterTermNewInModel.fromJson(Map<String, dynamic> json) {
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


class SearchPoductFilterTermColors {
  int? id;
  String? name;
  String? colorCode;
  List<ProductColorVariants>? productColorVariants;

  SearchPoductFilterTermColors({this.id, this.name, this.colorCode, this.productColorVariants});

  SearchPoductFilterTermColors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    colorCode = json['color_code'];
    if (json['product_color_variants'] != null) {
      productColorVariants = <ProductColorVariants>[];
      json['product_color_variants'].forEach((v) {
        productColorVariants!.add(ProductColorVariants.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['color_code'] = colorCode;
    if (productColorVariants != null) {
      data['product_color_variants'] =
          productColorVariants!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductColorVariants {
  int? id;

  ProductColorVariants({this.id});

  ProductColorVariants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }
}

class SearchPoductFilterTermBrands {
  int? id;
  String? name;

  SearchPoductFilterTermBrands({this.id, this.name});

  SearchPoductFilterTermBrands.fromJson(Map<String, dynamic> json) {
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

class SearchPoductFilterTermDiscount {
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

  SearchPoductFilterTermDiscount(
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

  SearchPoductFilterTermDiscount.fromJson(Map<String, dynamic> json) {
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

