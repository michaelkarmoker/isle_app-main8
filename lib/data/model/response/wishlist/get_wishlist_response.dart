/*class GetWishlistResponse {
  int? statusCode;
  String? status;
  String? message;
  List<Data>? data;

  GetWishlistResponse({this.statusCode, this.status, this.message, this.data});

  GetWishlistResponse.fromJson(Map<String, dynamic> json) {
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
  int? productId;
  String? corelationId;
  int? customerId;
  String? createdAt;
  String? updatedAt;
  bool isSelect=false;
  Product? product;

  Data(
      {this.id,
        this.productId,
        this.corelationId,
        this.customerId,
        this.createdAt,
        this.updatedAt,
        this.product});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    corelationId = json['corelation_id'];
    customerId = json['customer_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['corelation_id'] = this.corelationId;
    data['customer_id'] = this.customerId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}

class Product {
  int? id;
  int? vendorId;
  int? brandId;
  int? seasonId;
  String? sizeTypeId;
  String? productCode;
  String? isleProductCode;
  String? name;
  double? vat;
  String? vatType;
  double? mrpPrice;
  int? price;
  String? discountType;
  int? discount;
  double? discountedPrice;
  bool? isPublish;
  String? sizeGuide;
  String? status;
  String? createdAt;
  String? updatedAt;
  List<ProductColorVariants>? productColorVariants;
  Brand? brand;
  Season? season;

  Product(
      {this.id,
        this.vendorId,
        this.brandId,
        this.seasonId,
        this.sizeTypeId,
        this.productCode,
        this.isleProductCode,
        this.name,
        this.vat,
        this.vatType,
        this.mrpPrice,
        this.price,
        this.discountType,
        this.discount,
        this.discountedPrice,
        this.isPublish,
        this.sizeGuide,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.productColorVariants,
        this.brand,
        this.season});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vendorId = json['vendor_id'];
    brandId = json['brand_id'];
    seasonId = json['season_id'];
    sizeTypeId = json['size_type_id'];
    productCode = json['product_code'];
    isleProductCode = json['isle_product_code'];
    name = json['name'];
    vat = double.parse(json['vat'].toString());
    vatType = json['vat_type'];
    mrpPrice = double.parse(json['mrp_price'].toString());
    price = json['price'];
    discountType = json['discount_type'];
    discount = json['discount'];
    discountedPrice = double.parse(json['discounted_price'].toString());
    isPublish = json['is_publish'];
    sizeGuide = json['size_guide'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['product_color_variants'] != null) {
      productColorVariants = <ProductColorVariants>[];
      json['product_color_variants'].forEach((v) {
        productColorVariants!.add(new ProductColorVariants.fromJson(v));
      });
    }
    brand = json['brand'] != null ? new Brand.fromJson(json['brand']) : null;
    season =
    json['season'] != null ? new Season.fromJson(json['season']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['vendor_id'] = this.vendorId;
    data['brand_id'] = this.brandId;
    data['season_id'] = this.seasonId;
    data['size_type_id'] = this.sizeTypeId;
    data['product_code'] = this.productCode;
    data['isle_product_code'] = this.isleProductCode;
    data['name'] = this.name;
    data['vat'] = this.vat;
    data['vat_type'] = this.vatType;
    data['mrp_price'] = this.mrpPrice;
    data['price'] = this.price;
    data['discount_type'] = this.discountType;
    data['discount'] = this.discount;
    data['discounted_price'] = this.discountedPrice;
    data['is_publish'] = this.isPublish;
    data['size_guide'] = this.sizeGuide;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.productColorVariants != null) {
      data['product_color_variants'] =
          this.productColorVariants!.map((v) => v.toJson()).toList();
    }
    if (this.brand != null) {
      data['brand'] = this.brand!.toJson();
    }
    if (this.season != null) {
      data['season'] = this.season!.toJson();
    }
    return data;
  }
}

class ProductColorVariants {
  int? id;
  int? productId;
  int? colorId;
  String? profilePhoto;
  String? frontPhoto;
  String? backsidePhoto;
  String? details1Photo;
  String? details2Photo;
  String? outfitPhoto;
  bool? status;
  String? createdAt;
  String? updatedAt;
  Color? color;
  List<ProductInventories>? productInventories;

  ProductColorVariants(
      {this.id,
        this.productId,
        this.colorId,
        this.profilePhoto,
        this.frontPhoto,
        this.backsidePhoto,
        this.details1Photo,
        this.details2Photo,
        this.outfitPhoto,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.color,
        this.productInventories});

  ProductColorVariants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    colorId = json['color_id'];
    profilePhoto = json['profile_photo'];
    frontPhoto = json['front_photo'];
    backsidePhoto = json['backside_photo'];
    details1Photo = json['details1_photo'];
    details2Photo = json['details2_photo'];
    outfitPhoto = json['outfit_photo'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    color = json['color'] != null ? new Color.fromJson(json['color']) : null;
    if (json['product_inventories'] != null) {
      productInventories = <ProductInventories>[];
      json['product_inventories'].forEach((v) {
        productInventories!.add(new ProductInventories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['color_id'] = this.colorId;
    data['profile_photo'] = this.profilePhoto;
    data['front_photo'] = this.frontPhoto;
    data['backside_photo'] = this.backsidePhoto;
    data['details1_photo'] = this.details1Photo;
    data['details2_photo'] = this.details2Photo;
    data['outfit_photo'] = this.outfitPhoto;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.color != null) {
      data['color'] = this.color!.toJson();
    }
    if (this.productInventories != null) {
      data['product_inventories'] =
          this.productInventories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Color {
  int? id;
  String? name;
  String? colorCode;
  String? defaultColor;
  bool? status;
  String? createdAt;
  String? updatedAt;

  Color(
      {this.id,
        this.name,
        this.colorCode,
        this.defaultColor,
        this.status,
        this.createdAt,
        this.updatedAt});

  Color.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    colorCode = json['color_code'];
    defaultColor = json['default_color'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['color_code'] = this.colorCode;
    data['default_color'] = this.defaultColor;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class ProductInventories {
  int? id;
  int? colorVariantId;
  int? sizeTypeId;
  int? sizeId;
  int? stockQty;
  bool? status;
  String? createdAt;
  String? updatedAt;
  Size? size;

  ProductInventories(
      {this.id,
        this.colorVariantId,
        this.sizeTypeId,
        this.sizeId,
        this.stockQty,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.size});

  ProductInventories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    colorVariantId = json['color_variant_id'];
    sizeTypeId = json['size_type_id'];
    sizeId = json['size_id'];
    stockQty = json['stock_qty'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    size = json['size'] != null ? new Size.fromJson(json['size']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['color_variant_id'] = this.colorVariantId;
    data['size_type_id'] = this.sizeTypeId;
    data['size_id'] = this.sizeId;
    data['stock_qty'] = this.stockQty;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.size != null) {
      data['size'] = this.size!.toJson();
    }
    return data;
  }
}

class Size {
  int? id;
  int? typeId;
  String? sizeCode;
  bool? status;

  Size({this.id, this.typeId, this.sizeCode, this.status});

  Size.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    typeId = json['type_id'];
    sizeCode = json['size_code'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type_id'] = this.typeId;
    data['size_code'] = this.sizeCode;
    data['status'] = this.status;
    return data;
  }
}

class Brand {
  int? id;
  String? slug;
  String? brandCategoryId;
  String? brandCode;
  String? name;
  String? details;
  String? logo;
  String? banner;
  bool? isFeatured;
  String? isMegaMenu;
  bool? status;
  String? createdAt;
  String? updatedAt;

  Brand(
      {this.id,
        this.slug,
        this.brandCategoryId,
        this.brandCode,
        this.name,
        this.details,
        this.logo,
        this.banner,
        this.isFeatured,
        this.isMegaMenu,
        this.status,
        this.createdAt,
        this.updatedAt});

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    brandCategoryId = json['brand_category_id'].toString();
    brandCode = json['brand_code'];
    name = json['name'];
    details = json['details'];
    logo = json['logo'];
    banner = json['banner'];
    isFeatured = json['is_featured'];
    isMegaMenu = json['is_mega_menu'].toString();
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['brand_category_id'] = this.brandCategoryId;
    data['brand_code'] = this.brandCode;
    data['name'] = this.name;
    data['details'] = this.details;
    data['logo'] = this.logo;
    data['banner'] = this.banner;
    data['is_featured'] = this.isFeatured;
    data['is_mega_menu'] = this.isMegaMenu;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Season {
  int? id;
  String? name;
  bool? status;
  String? createdAt;
  String? updatedAt;

  Season({this.id, this.name, this.status, this.createdAt, this.updatedAt});

  Season.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}*/



class GetWishlistResponse {
  int? statusCode;
  String? status;
  String? message;
  List<Data>? data;

  GetWishlistResponse({this.statusCode, this.status, this.message, this.data});

  GetWishlistResponse.fromJson(Map<String, dynamic> json) {
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
  int? productId;
  String? corelationId;
  int? customerId;
  String? createdAt;
  String? updatedAt;
  bool isSelect=false;
  Product? product;

  Data(
      {this.id,
        this.productId,
        this.corelationId,
        this.customerId,
        this.createdAt,
        this.updatedAt,
        this.product});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    corelationId = json['corelation_id'];
    customerId = json['customer_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['corelation_id'] = this.corelationId;
    data['customer_id'] = this.customerId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}

class Product {
  int? id;
  int? vendorId;
  int? brandId;
  int? seasonId;
  String? vendorProductCode;
  String? productCode;
  String? isleProductCode;
  String? name;
  double? vat;
  String? vatType;
  double? mrpPrice;
  int? price;
  String? discountType;
  int? discount;
  int? discountedPrice;
  bool? isPublish;
  String? sizeGuide;
  String? status;
  String? createdAt;
  String? updatedAt;
  List<ProductColorVariants>? productColorVariants;
  Brand? brand;
  Season? season;
  List<Pages>? pages;
  List<Categories>? categories;
  List<SubCategories>? subCategories;
  List<ChildCategories>? childCategories;

  Product(
      {this.id,
        this.vendorId,
        this.brandId,
        this.seasonId,
        this.vendorProductCode,
        this.productCode,
        this.isleProductCode,
        this.name,
        this.vat,
        this.vatType,
        this.mrpPrice,
        this.price,
        this.discountType,
        this.discount,
        this.discountedPrice,
        this.isPublish,
        this.sizeGuide,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.productColorVariants,
        this.brand,
        this.season,
        this.pages,
        this.categories,
        this.subCategories,
        this.childCategories});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vendorId = json['vendor_id'];
    brandId = json['brand_id'];
    seasonId = json['season_id'];
    vendorProductCode = json['vendor_product_code'];
    productCode = json['product_code'];
    isleProductCode = json['isle_product_code'];
    name = json['name'];
    vat = double.parse(json['vat'].toString());
    vatType = json['vat_type'];
    mrpPrice = double.parse(json['mrp_price'].toString());
    price = json['price'];
    discountType = json['discount_type'];
    discount = json['discount'];
    discountedPrice = json['discounted_price'];
    isPublish = json['is_publish'];
    sizeGuide = json['size_guide'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['product_color_variants'] != null) {
      productColorVariants = <ProductColorVariants>[];
      json['product_color_variants'].forEach((v) {
        productColorVariants!.add(new ProductColorVariants.fromJson(v));
      });
    }
    brand = json['brand'] != null ? new Brand.fromJson(json['brand']) : null;
    season =
    json['season'] != null ? new Season.fromJson(json['season']) : null;
    if (json['pages'] != null) {
      pages = <Pages>[];
      json['pages'].forEach((v) {
        pages!.add(new Pages.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    if (json['sub_categories'] != null) {
      subCategories = <SubCategories>[];
      json['sub_categories'].forEach((v) {
        subCategories!.add(new SubCategories.fromJson(v));
      });
    }
    if (json['child_categories'] != null) {
      childCategories = <ChildCategories>[];
      json['child_categories'].forEach((v) {
        childCategories!.add(new ChildCategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['vendor_id'] = this.vendorId;
    data['brand_id'] = this.brandId;
    data['season_id'] = this.seasonId;
    data['vendor_product_code'] = this.vendorProductCode;
    data['product_code'] = this.productCode;
    data['isle_product_code'] = this.isleProductCode;
    data['name'] = this.name;
    data['vat'] = this.vat;
    data['vat_type'] = this.vatType;
    data['mrp_price'] = this.mrpPrice;
    data['price'] = this.price;
    data['discount_type'] = this.discountType;
    data['discount'] = this.discount;
    data['discounted_price'] = this.discountedPrice;
    data['is_publish'] = this.isPublish;
    data['size_guide'] = this.sizeGuide;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.productColorVariants != null) {
      data['product_color_variants'] =
          this.productColorVariants!.map((v) => v.toJson()).toList();
    }
    if (this.brand != null) {
      data['brand'] = this.brand!.toJson();
    }
    if (this.season != null) {
      data['season'] = this.season!.toJson();
    }
    if (this.pages != null) {
      data['pages'] = this.pages!.map((v) => v.toJson()).toList();
    }
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.subCategories != null) {
      data['sub_categories'] =
          this.subCategories!.map((v) => v.toJson()).toList();
    }
    if (this.childCategories != null) {
      data['child_categories'] =
          this.childCategories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductColorVariants {
  int? id;
  int? productId;
  int? colorId;
  String? profilePhoto;
  String? frontPhoto;
  String? backsidePhoto;
  String? details1Photo;
  String? details2Photo;
  String? outfitPhoto;
  bool? status;
  String? createdAt;
  String? updatedAt;
  Color? color;
  List<ProductInventories>? productInventories;

  ProductColorVariants(
      {this.id,
        this.productId,
        this.colorId,
        this.profilePhoto,
        this.frontPhoto,
        this.backsidePhoto,
        this.details1Photo,
        this.details2Photo,
        this.outfitPhoto,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.color,
        this.productInventories});

  ProductColorVariants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    colorId = json['color_id'];
    profilePhoto = json['profile_photo'];
    frontPhoto = json['front_photo'];
    backsidePhoto = json['backside_photo'];
    details1Photo = json['details1_photo'];
    details2Photo = json['details2_photo'];
    outfitPhoto = json['outfit_photo'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    color = json['color'] != null ? new Color.fromJson(json['color']) : null;
    if (json['product_inventories'] != null) {
      productInventories = <ProductInventories>[];
      json['product_inventories'].forEach((v) {
        productInventories!.add(new ProductInventories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['color_id'] = this.colorId;
    data['profile_photo'] = this.profilePhoto;
    data['front_photo'] = this.frontPhoto;
    data['backside_photo'] = this.backsidePhoto;
    data['details1_photo'] = this.details1Photo;
    data['details2_photo'] = this.details2Photo;
    data['outfit_photo'] = this.outfitPhoto;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.color != null) {
      data['color'] = this.color!.toJson();
    }
    if (this.productInventories != null) {
      data['product_inventories'] =
          this.productInventories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Color {
  int? id;
  String? name;
  String? colorCode;
  String? defaultColor;
  bool? isMulti;
  String? multiColor1;
  String? multiColor2;
  String? multiColor3;
  bool? status;
  String? createdAt;
  String? updatedAt;

  Color(
      {this.id,
        this.name,
        this.colorCode,
        this.defaultColor,
        this.isMulti,
        this.multiColor1,
        this.multiColor2,
        this.multiColor3,
        this.status,
        this.createdAt,
        this.updatedAt});

  Color.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    colorCode = json['color_code'];
    defaultColor = json['default_color'];
    isMulti = json['is_multi'];
    multiColor1 = json['multi_color_1'];
    multiColor2 = json['multi_color_2'];
    multiColor3 = json['multi_color_3'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['color_code'] = this.colorCode;
    data['default_color'] = this.defaultColor;
    data['is_multi'] = this.isMulti;
    data['multi_color_1'] = this.multiColor1;
    data['multi_color_2'] = this.multiColor2;
    data['multi_color_3'] = this.multiColor3;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class ProductInventories {
  int? id;
  int? colorVariantId;
  int? sizeTypeId;
  int? sizeId;
  int? stockQty;
  bool? status;
  String? createdAt;
  String? updatedAt;
  Size? size;

  ProductInventories(
      {this.id,
        this.colorVariantId,
        this.sizeTypeId,
        this.sizeId,
        this.stockQty,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.size});

  ProductInventories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    colorVariantId = json['color_variant_id'];
    sizeTypeId = json['size_type_id'];
    sizeId = json['size_id'];
    stockQty = json['stock_qty'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    size = json['size'] != null ? new Size.fromJson(json['size']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['color_variant_id'] = this.colorVariantId;
    data['size_type_id'] = this.sizeTypeId;
    data['size_id'] = this.sizeId;
    data['stock_qty'] = this.stockQty;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.size != null) {
      data['size'] = this.size!.toJson();
    }
    return data;
  }
}

class Size {
  int? id;
  int? typeId;
  String? sizeCode;
  bool? status;

  Size({this.id, this.typeId, this.sizeCode, this.status});

  Size.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    typeId = json['type_id'];
    sizeCode = json['size_code'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type_id'] = this.typeId;
    data['size_code'] = this.sizeCode;
    data['status'] = this.status;
    return data;
  }
}

class Brand {
  int? id;
  String? slug;
  int? brandCategoryId;
  String? brandCode;
  String? name;
  String? details;
  String? logo;
  String? banner;
  bool? isFeatured;
  int? sortOrder;
  String? landingBanner;
  String? landingTitle;
  String? landingDescription;
  bool? status;
  String? createdAt;
  String? updatedAt;

  Brand(
      {this.id,
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
        this.updatedAt});

  Brand.fromJson(Map<String, dynamic> json) {
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['brand_category_id'] = this.brandCategoryId;
    data['brand_code'] = this.brandCode;
    data['name'] = this.name;
    data['details'] = this.details;
    data['logo'] = this.logo;
    data['banner'] = this.banner;
    data['is_featured'] = this.isFeatured;
    data['sort_order'] = this.sortOrder;
    data['landing_banner'] = this.landingBanner;
    data['landing_title'] = this.landingTitle;
    data['landing_description'] = this.landingDescription;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Season {
  int? id;
  String? name;
  bool? status;
  String? createdAt;
  String? updatedAt;

  Season({this.id, this.name, this.status, this.createdAt, this.updatedAt});

  Season.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Pages {
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
  PageProduct? pageProduct;

  Pages(
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
        this.updatedAt,
        this.pageProduct});

  Pages.fromJson(Map<String, dynamic> json) {
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
    pageProduct = json['page_product'] != null
        ? new PageProduct.fromJson(json['page_product'])
        : null;
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
    if (this.pageProduct != null) {
      data['page_product'] = this.pageProduct!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['page_id'] = this.pageId;
    return data;
  }
}

class Categories {
  int? id;
  int? pageId;
  String? title;
  String? slug;
  int? sortOrder;
  String? shortDescription;
  String? details;
  String? banner;
  String? hoverBanner;
  bool? status;
  bool? isBrandShow;
  bool? isFooterShow;
  String? buttonText;
  String? landingPageTitle;
  String? createdAt;
  String? updatedAt;
  CategoryProduct? categoryProduct;

  Categories(
      {this.id,
        this.pageId,
        this.title,
        this.slug,
        this.sortOrder,
        this.shortDescription,
        this.details,
        this.banner,
        this.hoverBanner,
        this.status,
        this.isBrandShow,
        this.isFooterShow,
        this.buttonText,
        this.landingPageTitle,
        this.createdAt,
        this.updatedAt,
        this.categoryProduct});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pageId = json['page_id'];
    title = json['title'];
    slug = json['slug'];
    sortOrder = json['sort_order'];
    shortDescription = json['short_description'];
    details = json['details'];
    banner = json['banner'];
    hoverBanner = json['hover_banner'];
    status = json['status'];
    isBrandShow = json['is_brand_show'];
    isFooterShow = json['is_footer_show'];
    buttonText = json['button_text'];
    landingPageTitle = json['landing_page_title'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    categoryProduct = json['category_product'] != null
        ? new CategoryProduct.fromJson(json['category_product'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['page_id'] = this.pageId;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['sort_order'] = this.sortOrder;
    data['short_description'] = this.shortDescription;
    data['details'] = this.details;
    data['banner'] = this.banner;
    data['hover_banner'] = this.hoverBanner;
    data['status'] = this.status;
    data['is_brand_show'] = this.isBrandShow;
    data['is_footer_show'] = this.isFooterShow;
    data['button_text'] = this.buttonText;
    data['landing_page_title'] = this.landingPageTitle;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.categoryProduct != null) {
      data['category_product'] = this.categoryProduct!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['category_id'] = this.categoryId;
    return data;
  }
}

class SubCategories {
  int? id;
  int? categoryId;
  String? title;
  String? slug;
  int? sortOrder;
  String? details;
  String? shortDescription;
  String? banner;
  bool? status;
  String? buttonText;
  String? landingPageTitle;
  String? createdAt;
  String? updatedAt;
  SubCategoryProduct? subCategoryProduct;

  SubCategories(
      {this.id,
        this.categoryId,
        this.title,
        this.slug,
        this.sortOrder,
        this.details,
        this.shortDescription,
        this.banner,
        this.status,
        this.buttonText,
        this.landingPageTitle,
        this.createdAt,
        this.updatedAt,
        this.subCategoryProduct});

  SubCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    title = json['title'];
    slug = json['slug'];
    sortOrder = json['sort_order'];
    details = json['details'];
    shortDescription = json['short_description'];
    banner = json['banner'];
    status = json['status'];
    buttonText = json['button_text'];
    landingPageTitle = json['landing_page_title'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    subCategoryProduct = json['sub_category_product'] != null
        ? new SubCategoryProduct.fromJson(json['sub_category_product'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['sort_order'] = this.sortOrder;
    data['details'] = this.details;
    data['short_description'] = this.shortDescription;
    data['banner'] = this.banner;
    data['status'] = this.status;
    data['button_text'] = this.buttonText;
    data['landing_page_title'] = this.landingPageTitle;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.subCategoryProduct != null) {
      data['sub_category_product'] = this.subCategoryProduct!.toJson();
    }
    return data;
  }
}

class SubCategoryProduct {
  int? productId;
  int? subCategoryId;

  SubCategoryProduct({this.productId, this.subCategoryId});

  SubCategoryProduct.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    subCategoryId = json['sub_category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['sub_category_id'] = this.subCategoryId;
    return data;
  }
}

class ChildCategories {
  int? id;
  int? subCategoryId;
  String? title;
  int? sizeTypeId;
  String? slug;
  int? sortOrder;
  String? shortDescription;
  String? details;
  String? banner;
  bool? status;
  String? buttonText;
  String? landingPageTitle;
  String? createdAt;
  String? updatedAt;
  ChildCategoryProduct? childCategoryProduct;

  ChildCategories(
      {this.id,
        this.subCategoryId,
        this.title,
        this.sizeTypeId,
        this.slug,
        this.sortOrder,
        this.shortDescription,
        this.details,
        this.banner,
        this.status,
        this.buttonText,
        this.landingPageTitle,
        this.createdAt,
        this.updatedAt,
        this.childCategoryProduct});

  ChildCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subCategoryId = json['sub_category_id'];
    title = json['title'];
    sizeTypeId = json['size_type_id'];
    slug = json['slug'];
    sortOrder = json['sort_order'];
    shortDescription = json['short_description'];
    details = json['details'];
    banner = json['banner'];
    status = json['status'];
    buttonText = json['button_text'];
    landingPageTitle = json['landing_page_title'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    childCategoryProduct = json['child_category_product'] != null
        ? new ChildCategoryProduct.fromJson(json['child_category_product'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sub_category_id'] = this.subCategoryId;
    data['title'] = this.title;
    data['size_type_id'] = this.sizeTypeId;
    data['slug'] = this.slug;
    data['sort_order'] = this.sortOrder;
    data['short_description'] = this.shortDescription;
    data['details'] = this.details;
    data['banner'] = this.banner;
    data['status'] = this.status;
    data['button_text'] = this.buttonText;
    data['landing_page_title'] = this.landingPageTitle;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.childCategoryProduct != null) {
      data['child_category_product'] = this.childCategoryProduct!.toJson();
    }
    return data;
  }
}

class ChildCategoryProduct {
  int? productId;
  int? childCategoryId;

  ChildCategoryProduct({this.productId, this.childCategoryId});

  ChildCategoryProduct.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    childCategoryId = json['child_category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['child_category_id'] = this.childCategoryId;
    return data;
  }
}
