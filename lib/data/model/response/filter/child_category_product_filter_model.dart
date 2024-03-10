class ChildCategoryProductFilterModel {
  int? statusCode;
  String? status;
  String? message;
  ChildCategoryProductFilterData? data;

  ChildCategoryProductFilterModel(
      {this.statusCode, this.status, this.message, this.data});

  ChildCategoryProductFilterModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? ChildCategoryProductFilterData.fromJson(json['data']) : null;
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

class ChildCategoryProductFilterData {
  List<ChildCategoryProductFilterSections>? sections;
  List<ChildCategoryProductFilterCategories>? categories;
  List<ChildCategoryProductFilterBrands>? brands;
  List<ChildCategoryProductFilterColors>? colors;
  List<ChildCategoryProductFilterSizesModel>? sizes;
  ChildCategoryProductFilterNewIn? newIn;
  ChildCategoryProductFilterDiscount? discount;

  ChildCategoryProductFilterData(
      {this.sections,
        this.categories,
        this.brands,
        this.colors,
        this.sizes,
        this.newIn,
        this.discount});

  ChildCategoryProductFilterData.fromJson(Map<String, dynamic> json) {
    if (json['sections'] != null) {
      sections = <ChildCategoryProductFilterSections>[];
      json['sections'].forEach((v) {
        sections!.add(ChildCategoryProductFilterSections.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <ChildCategoryProductFilterCategories>[];
      json['categories'].forEach((v) {
        categories!.add(ChildCategoryProductFilterCategories.fromJson(v));
      });
    }
    if (json['brands'] != null) {
      brands = <ChildCategoryProductFilterBrands>[];
      json['brands'].forEach((v) {
        brands!.add(ChildCategoryProductFilterBrands.fromJson(v));
      });
    }
    if (json['colors'] != null) {
      colors = <ChildCategoryProductFilterColors>[];
      json['colors'].forEach((v) {
        colors!.add(ChildCategoryProductFilterColors.fromJson(v));
      });
    }
    if (json['sizes'] != null) {
      sizes = <ChildCategoryProductFilterSizesModel>[];
      json['sizes'].forEach((v) {
        sizes!.add(ChildCategoryProductFilterSizesModel.fromJson(v));
      });
    }
    newIn = json['new_in'] != null ? ChildCategoryProductFilterNewIn.fromJson(json['new_in']) : null;
    discount = json['discount'] != null
        ? ChildCategoryProductFilterDiscount.fromJson(json['discount'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (sections != null) {
      data['sections'] = sections!.map((v) => v.toJson()).toList();
    }
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
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

class ChildCategoryProductFilterSections {
  int? id;
  String? title;

  ChildCategoryProductFilterSections({this.id, this.title});

  ChildCategoryProductFilterSections.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    return data;
  }
}

class ChildCategoryProductFilterCategories {
  int? id;
  String? title;
  int? productCount;
  List<ChildCategoriesModel>? childCategories;

  ChildCategoryProductFilterCategories({this.id, this.title, this.productCount, this.childCategories});

  ChildCategoryProductFilterCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    productCount = json['product_count'];
    if (json['child_categories'] != null) {
      childCategories = <ChildCategoriesModel>[];
      json['child_categories'].forEach((v) {
        childCategories!.add(ChildCategoriesModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['product_count'] = productCount;
    if (childCategories != null) {
      data['child_categories'] =
          childCategories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChildCategoriesModel {
  int? id;
  String? title;
  int? productCount;

  ChildCategoriesModel({this.id, this.title, this.productCount});

  ChildCategoriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    productCount = json['product_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['product_count'] = productCount;
    return data;
  }
}

class ChildCategoryProductFilterBrands {
  int? id;
  String? name;
  int? productCount;

  ChildCategoryProductFilterBrands({this.id, this.name, this.productCount});

  ChildCategoryProductFilterBrands.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    productCount = json['product_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['product_count'] = productCount;
    return data;
  }
}

class ChildCategoryProductFilterColors {
  int? id;
  String? name;
  String? colorCode;
  int? productCount;

  ChildCategoryProductFilterColors({this.id, this.name, this.colorCode, this.productCount});

  ChildCategoryProductFilterColors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    colorCode = json['color_code'];
    productCount = json['product_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['color_code'] = colorCode;
    data['product_count'] = productCount;
    return data;
  }
}

class ChildCategoryProductFilterSizesModel {
  int? id;
  String? typeName;
  List<ChildCategoryProductFilterSizesData>? sizes;
  List<ChildCategoryProductFilterCategories>? categories;

  ChildCategoryProductFilterSizesModel({this.id, this.typeName, this.sizes, this.categories});

  ChildCategoryProductFilterSizesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    typeName = json['type_name'];
    if (json['sizes'] != null) {
      sizes = <ChildCategoryProductFilterSizesData>[];
      json['sizes'].forEach((v) {
        sizes!.add(ChildCategoryProductFilterSizesData.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <ChildCategoryProductFilterCategories>[];
      json['categories'].forEach((v) {
        categories!.add(ChildCategoryProductFilterCategories.fromJson(v));
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
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChildCategoryProductFilterSizesData {
  int? id;
  String? sizeCode;
  int? productCount;

  ChildCategoryProductFilterSizesData({this.id, this.sizeCode, this.productCount});

  ChildCategoryProductFilterSizesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sizeCode = json['size_code'];
    productCount = json['product_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['size_code'] = sizeCode;
    data['product_count'] = productCount;
    return data;
  }
}

class Categories {
  int? id;
  List<SubCategories>? subCategories;

  Categories({this.id, this.subCategories});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['sub_categories'] != null) {
      subCategories = <SubCategories>[];
      json['sub_categories'].forEach((v) {
        subCategories!.add(SubCategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (subCategories != null) {
      data['sub_categories'] =
          subCategories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubCategories {
  int? id;
  List<ChildCategoriesModel>? childCategories;

  SubCategories({this.id, this.childCategories});

  SubCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['child_categories'] != null) {
      childCategories = <ChildCategoriesModel>[];
      json['child_categories'].forEach((v) {
        childCategories!.add(ChildCategoriesModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (childCategories != null) {
      data['child_categories'] =
          childCategories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChildCategoriesId {
  int? id;

  ChildCategoriesId({this.id});

  ChildCategoriesId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }
}

class ChildCategoryProductFilterNewIn {
  int? lastWeekProductCount;
  int? last15DaysProductCount;
  int? lastMonthProductCount;
  int? lastYearProductCount;

  ChildCategoryProductFilterNewIn(
      {this.lastWeekProductCount,
        this.last15DaysProductCount,
        this.lastMonthProductCount,
        this.lastYearProductCount});

  ChildCategoryProductFilterNewIn.fromJson(Map<String, dynamic> json) {
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

class ChildCategoryProductFilterDiscount {
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

  ChildCategoryProductFilterDiscount(
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

  ChildCategoryProductFilterDiscount.fromJson(Map<String, dynamic> json) {
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
