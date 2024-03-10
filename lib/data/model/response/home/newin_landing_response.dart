class NewInLandingProductResponse {
  int? statusCode;
  String? status;
  String? message;
  Data? data;

  NewInLandingProductResponse(
      {this.statusCode, this.status, this.message, this.data});

  NewInLandingProductResponse.fromJson(Map<String, dynamic> json) {
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
  List<Result>? result;
  Pagination? pagination;

  Data({this.result, this.pagination});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class Result {
  int? id;
  int? vendorId;
  int? brandId;
  int? seasonId;
  String? sizeTypeId;
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
  List<Pages>? pages;
  List<Categories>? categories;
  List<SubCategories>? subCategories;
  List<ChildCategories>? childCategories;
  List<Sections>? sections;
  Brand? brand;
  Season? season;
  List<Tags>? tags;
  Vendor? vendor;
  List<ProductColorVariants>? productColorVariants;
  List<Wishlists>? wishlists;

  Result(
      {this.id,
        this.vendorId,
        this.brandId,
        this.seasonId,
        this.sizeTypeId,
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
        this.pages,
        this.categories,
        this.subCategories,
        this.childCategories,
        this.sections,
        this.brand,
        this.season,
        this.tags,
        this.vendor,
        this.productColorVariants,
        this.wishlists});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vendorId = json['vendor_id'];
    brandId = json['brand_id'];
    seasonId = json['season_id'];
    sizeTypeId = json['size_type_id'];
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
    if (json['sections'] != null) {
      sections = <Sections>[];
      json['sections'].forEach((v) {
        sections!.add(new Sections.fromJson(v));
      });
    }
    brand = json['brand'] != null ? new Brand.fromJson(json['brand']) : null;
    season =
    json['season'] != null ? new Season.fromJson(json['season']) : null;
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(new Tags.fromJson(v));
      });
    }
    vendor =
    json['vendor'] != null ? new Vendor.fromJson(json['vendor']) : null;
    if (json['product_color_variants'] != null) {
      productColorVariants = <ProductColorVariants>[];
      json['product_color_variants'].forEach((v) {
        productColorVariants!.add(new ProductColorVariants.fromJson(v));
      });
    }
    if (json['wishlists'] != null) {
      wishlists = <Wishlists>[];
      json['wishlists'].forEach((v) {
        wishlists!.add(new Wishlists.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['vendor_id'] = this.vendorId;
    data['brand_id'] = this.brandId;
    data['season_id'] = this.seasonId;
    data['size_type_id'] = this.sizeTypeId;
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
    if (this.sections != null) {
      data['sections'] = this.sections!.map((v) => v.toJson()).toList();
    }
    if (this.brand != null) {
      data['brand'] = this.brand!.toJson();
    }
    if (this.season != null) {
      data['season'] = this.season!.toJson();
    }
    if (this.tags != null) {
      data['tags'] = this.tags!.map((v) => v.toJson()).toList();
    }
    if (this.vendor != null) {
      data['vendor'] = this.vendor!.toJson();
    }
    if (this.productColorVariants != null) {
      data['product_color_variants'] =
          this.productColorVariants!.map((v) => v.toJson()).toList();
    }
    if (this.wishlists != null) {
      data['wishlists'] = this.wishlists!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pages {
  int? id;
  String? title;
  PageProduct? pageProduct;

  Pages({this.id, this.title, this.pageProduct});

  Pages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    pageProduct = json['page_product'] != null
        ? new PageProduct.fromJson(json['page_product'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
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
  String? categoryTitle;
  Page? page;
  CategoryProduct? categoryProduct;

  Categories({this.categoryTitle, this.page, this.categoryProduct});

  Categories.fromJson(Map<String, dynamic> json) {
    categoryTitle = json['category_title'];
    page = json['page'] != null ? new Page.fromJson(json['page']) : null;
    categoryProduct = json['category_product'] != null
        ? new CategoryProduct.fromJson(json['category_product'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_title'] = this.categoryTitle;
    if (this.page != null) {
      data['page'] = this.page!.toJson();
    }
    if (this.categoryProduct != null) {
      data['category_product'] = this.categoryProduct!.toJson();
    }
    return data;
  }
}

class Page {
  String? pageTitle;

  Page({this.pageTitle});

  Page.fromJson(Map<String, dynamic> json) {
    pageTitle = json['page_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page_title'] = this.pageTitle;
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
  String? subCategoryTitle;
  Category? category;
  SubCategoryProduct? subCategoryProduct;

  SubCategories(
      {this.subCategoryTitle, this.category, this.subCategoryProduct});

  SubCategories.fromJson(Map<String, dynamic> json) {
    subCategoryTitle = json['sub_category_title'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    subCategoryProduct = json['sub_category_product'] != null
        ? new SubCategoryProduct.fromJson(json['sub_category_product'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sub_category_title'] = this.subCategoryTitle;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.subCategoryProduct != null) {
      data['sub_category_product'] = this.subCategoryProduct!.toJson();
    }
    return data;
  }
}

class Category {
  String? categoryTitle;
  Page? page;

  Category({this.categoryTitle, this.page});

  Category.fromJson(Map<String, dynamic> json) {
    categoryTitle = json['category_title'];
    page = json['page'] != null ? new Page.fromJson(json['page']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_title'] = this.categoryTitle;
    if (this.page != null) {
      data['page'] = this.page!.toJson();
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
  String? childCategoryTitle;
  SubCategory? subCategory;
  ChildCategoryProduct? childCategoryProduct;

  ChildCategories(
      {this.childCategoryTitle, this.subCategory, this.childCategoryProduct});

  ChildCategories.fromJson(Map<String, dynamic> json) {
    childCategoryTitle = json['child_category_title'];
    subCategory = json['sub_category'] != null
        ? new SubCategory.fromJson(json['sub_category'])
        : null;
    childCategoryProduct = json['child_category_product'] != null
        ? new ChildCategoryProduct.fromJson(json['child_category_product'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['child_category_title'] = this.childCategoryTitle;
    if (this.subCategory != null) {
      data['sub_category'] = this.subCategory!.toJson();
    }
    if (this.childCategoryProduct != null) {
      data['child_category_product'] = this.childCategoryProduct!.toJson();
    }
    return data;
  }
}

class SubCategory {
  String? subCategoryTitle;
  Category? category;

  SubCategory({this.subCategoryTitle, this.category});

  SubCategory.fromJson(Map<String, dynamic> json) {
    subCategoryTitle = json['sub_category_title'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sub_category_title'] = this.subCategoryTitle;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
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

class Sections {
  int? id;
  int? pageId;
  String? sectionTypeMegamenu;
  String? sectionTypeHomepage;
  String? title;
  String? slug;
  int? sortOrder;
  String? shortDescription;
  String? details;
  String? banner;
  String? hoverBanner;
  bool? status;
  String? buttonText;
  String? landingPageTitle;
  String? createdAt;
  String? updatedAt;
  int? parentSectionId;
  ProductSection? productSection;

  Sections(
      {this.id,
        this.pageId,
        this.sectionTypeMegamenu,
        this.sectionTypeHomepage,
        this.title,
        this.slug,
        this.sortOrder,
        this.shortDescription,
        this.details,
        this.banner,
        this.hoverBanner,
        this.status,
        this.buttonText,
        this.landingPageTitle,
        this.createdAt,
        this.updatedAt,
        this.parentSectionId,
        this.productSection});

  Sections.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pageId = json['page_id'];
    sectionTypeMegamenu = json['section_type_megamenu'];
    sectionTypeHomepage = json['section_type_homepage'];
    title = json['title'];
    slug = json['slug'];
    sortOrder = json['sort_order'];
    shortDescription = json['short_description'];
    details = json['details'];
    banner = json['banner'];
    hoverBanner = json['hover_banner'];
    status = json['status'];
    buttonText = json['button_text'];
    landingPageTitle = json['landing_page_title'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    parentSectionId = json['parent_section_id'];
    productSection = json['product_section'] != null
        ? new ProductSection.fromJson(json['product_section'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['page_id'] = this.pageId;
    data['section_type_megamenu'] = this.sectionTypeMegamenu;
    data['section_type_homepage'] = this.sectionTypeHomepage;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['sort_order'] = this.sortOrder;
    data['short_description'] = this.shortDescription;
    data['details'] = this.details;
    data['banner'] = this.banner;
    data['hover_banner'] = this.hoverBanner;
    data['status'] = this.status;
    data['button_text'] = this.buttonText;
    data['landing_page_title'] = this.landingPageTitle;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['parent_section_id'] = this.parentSectionId;
    if (this.productSection != null) {
      data['product_section'] = this.productSection!.toJson();
    }
    return data;
  }
}

class ProductSection {
  int? productId;
  int? sectionId;
  String? createdAt;
  String? updatedAt;

  ProductSection(
      {this.productId, this.sectionId, this.createdAt, this.updatedAt});

  ProductSection.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    sectionId = json['section_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['section_id'] = this.sectionId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Brand {
  String? brandName;

  Brand({this.brandName});

  Brand.fromJson(Map<String, dynamic> json) {
    brandName = json['brand_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['brand_name'] = this.brandName;
    return data;
  }
}

class Season {
  String? seasonName;

  Season({this.seasonName});

  Season.fromJson(Map<String, dynamic> json) {
    seasonName = json['season_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['season_name'] = this.seasonName;
    return data;
  }
}

class Tags {
  int? id;
  String? name;
  bool? status;
  String? createdAt;
  String? updatedAt;
  ProductTag? productTag;

  Tags(
      {this.id,
        this.name,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.productTag});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    productTag = json['product_tag'] != null
        ? new ProductTag.fromJson(json['product_tag'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.productTag != null) {
      data['product_tag'] = this.productTag!.toJson();
    }
    return data;
  }
}

class ProductTag {
  int? productId;
  int? tagId;

  ProductTag({this.productId, this.tagId});

  ProductTag.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    tagId = json['tag_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['tag_id'] = this.tagId;
    return data;
  }
}

class Vendor {
  String? vendorName;
  Null? vendorShopName;

  Vendor({this.vendorName, this.vendorShopName});

  Vendor.fromJson(Map<String, dynamic> json) {
    vendorName = json['vendor_name'];
    vendorShopName = json['vendor_shop_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vendor_name'] = this.vendorName;
    data['vendor_shop_name'] = this.vendorShopName;
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

class Wishlists {
  int? id;

  Wishlists({this.id});

  Wishlists.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}

class Pagination {
  int? currentPage;
  int? currentPageLimit;
  int? total;
  int? totalPage;
  int? prevPage;
  int? prevPageLimit;
  int? nextPage;
  int? nextPageLimit;

  Pagination(
      {this.currentPage,
        this.currentPageLimit,
        this.total,
        this.totalPage,
        this.prevPage,
        this.prevPageLimit,
        this.nextPage,
        this.nextPageLimit});

  Pagination.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    currentPageLimit = json['currentPageLimit'];
    total = json['total'];
    totalPage = json['totalPage'];
    prevPage = json['prevPage'];
    prevPageLimit = json['prevPageLimit'];
    nextPage = json['nextPage'];
    nextPageLimit = json['nextPageLimit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currentPage'] = this.currentPage;
    data['currentPageLimit'] = this.currentPageLimit;
    data['total'] = this.total;
    data['totalPage'] = this.totalPage;
    data['prevPage'] = this.prevPage;
    data['prevPageLimit'] = this.prevPageLimit;
    data['nextPage'] = this.nextPage;
    data['nextPageLimit'] = this.nextPageLimit;
    return data;
  }
}
