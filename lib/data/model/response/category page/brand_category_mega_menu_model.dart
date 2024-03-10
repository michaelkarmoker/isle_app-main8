class BrandCategoryMegaMenuModel {
  int? statusCode;
  String? status;
  String? message;
  List<BrandCategoryMegaMenuData>? data;

  BrandCategoryMegaMenuModel(
      {this.statusCode, this.status, this.message, this.data});

  BrandCategoryMegaMenuModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <BrandCategoryMegaMenuData>[];
      json['data'].forEach((v) {
        data!.add(BrandCategoryMegaMenuData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BrandCategoryMegaMenuData {
  int? brandId;
  String? brandName;
  List<BrandCategoryMegaMenuCategories>? categories;
  List<Pages>? pages;
  List<ProductColorVariants>? productColorVariants;
  Brand? brand;

  BrandCategoryMegaMenuData(
      {this.brandId,
        this.brandName,
        this.categories,
        this.pages,
        this.productColorVariants,
        this.brand});

  BrandCategoryMegaMenuData.fromJson(Map<String, dynamic> json) {
    brandId = json['brand_id'];
    brandName = json['brand_name'];
    if (json['categories'] != null) {
      categories = <BrandCategoryMegaMenuCategories>[];
      json['categories'].forEach((v) {
        categories!.add(BrandCategoryMegaMenuCategories.fromJson(v));
      });
    }
    if (json['pages'] != null) {
      pages = <Pages>[];
      json['pages'].forEach((v) {
        pages!.add(Pages.fromJson(v));
      });
    }
    if (json['product_color_variants'] != null) {
      productColorVariants = <ProductColorVariants>[];
      json['product_color_variants'].forEach((v) {
        productColorVariants!.add(ProductColorVariants.fromJson(v));
      });
    }
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['brand_id'] = brandId;
    data['brand_name'] = brandName;
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (pages != null) {
      data['pages'] = pages!.map((v) => v.toJson()).toList();
    }
    if (productColorVariants != null) {
      data['product_color_variants'] =
          productColorVariants!.map((v) => v.toJson()).toList();
    }
    if (brand != null) {
      data['brand'] = brand!.toJson();
    }
    return data;
  }
}

class BrandCategoryMegaMenuCategories {
  int? id;
  CategoryProduct? categoryProduct;

  BrandCategoryMegaMenuCategories({this.id, this.categoryProduct});

  BrandCategoryMegaMenuCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryProduct = json['category_product'] != null
        ? CategoryProduct.fromJson(json['category_product'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (categoryProduct != null) {
      data['category_product'] = categoryProduct!.toJson();
    }
    return data;
  }
}

class CategoryProduct {
  int? productId;
  int? categoryId;

  CategoryProduct({this.productId, this.categoryId});

  CategoryProduct.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    categoryId = json['category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['category_id'] = categoryId;
    return data;
  }
}

class Pages {
  int? id;
  PageProduct? pageProduct;

  Pages({this.id, this.pageProduct});

  Pages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pageProduct = json['page_product'] != null
        ? PageProduct.fromJson(json['page_product'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (pageProduct != null) {
      data['page_product'] = pageProduct!.toJson();
    }
    return data;
  }
}

class PageProduct {
  int? productId;
  int? pageId;

  PageProduct({this.productId, this.pageId});

  PageProduct.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    pageId = json['page_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['page_id'] = pageId;
    return data;
  }
}

class ProductColorVariants {
  int? id;
  List<ProductInventories>? productInventories;

  ProductColorVariants({this.id, this.productInventories});

  ProductColorVariants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['product_inventories'] != null) {
      productInventories = <ProductInventories>[];
      json['product_inventories'].forEach((v) {
        productInventories!.add(ProductInventories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (productInventories != null) {
      data['product_inventories'] =
          productInventories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductInventories {
  int? id;

  ProductInventories({this.id});

  ProductInventories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }
}

class Brand {
  int? id;
  String? name;

  Brand({this.id, this.name});

  Brand.fromJson(Map<String, dynamic> json) {
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
