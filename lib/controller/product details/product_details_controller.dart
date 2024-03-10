import 'dart:developer';
import 'package:get/get.dart';
import 'package:isletestapp/controller/wishlist/wishlist_controller.dart';
import 'package:isletestapp/data/api/api_checker.dart';
import 'package:isletestapp/data/model/response/Product%20details/product_details_response.dart';
import 'package:isletestapp/data/model/response/main%20page/main_page_data_response.dart';
import 'package:isletestapp/data/model/response/product%20details/all_delivery_type_response.dart';
import 'package:isletestapp/data/model/response/product%20details/follow/all_follow_brand_list_response.dart';
import 'package:isletestapp/data/model/response/product%20details/follow/follow_writup_response.dart';
import 'package:isletestapp/data/model/response/product%20details/more_brand_productdetails_response.dart';
import 'package:isletestapp/data/model/response/product%20details/product_details_delivery_type_response.dart';
import 'package:isletestapp/data/model/response/product%20details/product_details_product_review_response.dart';
import 'package:isletestapp/data/model/response/product%20details/shop_the_look_response.dart';
import 'package:isletestapp/data/model/response/product%20details/stock_response.dart';
import 'package:isletestapp/data/model/response/profile/favorite%20brands/all_favourite_brands_response.dart';
import 'package:isletestapp/data/model/response/wishlist/check_wishlist_response.dart';
import 'package:isletestapp/data/repository/product%20details/product_details_repo.dart';
import 'package:isletestapp/view/base/custom_snackbar.dart';
import 'package:isletestapp/view/screens/all_popup/add_to_cart_popup.dart';
import 'package:isletestapp/view/screens/dashboard/dashboard.dart';
import '../../data/model/response/product details/you_may_also_like_model.dart';
import 'package:isletestapp/data/model/response/main%20page/main_page_data_response.dart' as sunny;
import 'package:isletestapp/data/model/response/product%20details/follow/all_follow_brand_list_response.dart' as np;

class ProductDetailsController extends GetxController implements GetxService {
  final ProductDetailsRepo productDetailsRepo;
  ProductDetailsController({required this.productDetailsRepo,});

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  int stock=10;
  int stockcount= 1;

  AllFavouriteBrandsResponse ? allFavouriteBrandsResponse =null;
  StockResponse ? stockResponse =null;
  ProductDetailsDeliveryTypeResponse ? productDetailsDeliveryTypeResponse =null;
  ProductDetailsFeedbackResponse ? productDetailsFeedbackResponse =null;
  GenderPageResponse ? genderPageResponse =null;
  List<sunny.Data> genderList=[];
  int selectedGenderIndex=0;
  ShopTheLookResponse ? shopTheLookResponse =null;
  FollowWriteUpResponse ? followWriteUpResponse =null;
  AllFollowBrandListResponse ? allFollowBrandListResponse = null;
  List<np.Brand>? favoritelist=[];
  AllDeliveryTypeResponse ? allDeliveryTypeResponse =null;
  MoreBrandDetailsPageResponse ? moreBrandDetailsPageResponse =null;
  // YouMayAlsoLikeModel ? youMayAlsoLikeModel = null;
  // ProductDetailsResponse ? productDetailsResponse =null;
  CheckWishlistResponse ? checkWishlistResponse =null;
  List<String> productImage=[];

  List<String>? bags=[];

  ///
  int sectedColorVAriantIndex=0;
  String? sectedSize;
  int? sectedSizeInventoryId;
  String? selectedStockQty;
  List<String>? photos=[];

  // List<s.Data> cartList=[];

  double total=0.0;

  String? selectedDeliveryType=null;

  int myStock=0;
  int myPendingStock= 0;
  bool condition=false;

  List<DeliveryType> deliveryType=[];
  List<DeliveryType> deliveryTypeUsable=[];

   // List combinedList = [];

  Future<void> dataInitialize()async {
    dataClear();
    await getFollowWriteUpData();
    await getAllDeliveryTypeData();
    // await getFollowList();
    // await getFavoriteBrandsAllData();
    /// open korte hobe
    // await allFavouriteListData();

// await getMoreFromBrandsData(productDetailsResponse!.data!.id!.toString(), productDetailsResponse!.data!.pages![sectedColorVAriantIndex].pageProduct!.pageId!.toString(), productDetailsResponse!.data!.brandId!.toString());
    // await getBagPageCartData(bagePageCartResponse!.data![index].clientCorelationId!.toString());
    // await getCategoryProductData(categoryId);
    // await getFeaturedBrandsData();
  }

  Future<void> dataClear()async {
    productDetailsResponse = null;
    productDetailsFeedbackResponse = null;
    sectedSize=null;
    stockcount=1;
  }
  Future<void> dataClearForRating()async {
    productDetailsFeedbackResponse = null;
  }


  /// stock
  Future<void> getAvailableStockData(int inventoryId) async {
    _isLoading = true;
    update();
    Response response = await productDetailsRepo.getAvailableStockData(inventoryId);
    if (response.statusCode == 200) {
      stockResponse= StockResponse.fromJson(response.body);
      myStock = stockResponse?.data?.stockQty??1;
      myPendingStock = int.parse(stockResponse?.data?.pendingDeliveryQty??"0");
      condition = myStock>myPendingStock;
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  ///  product review
  Future<void> ProductDetailsReview(String id) async {
    _isLoading = true;
    update();
    Response response = await productDetailsRepo.ProductDetailsReview(id);
    if (response.statusCode == 200) {
      productDetailsFeedbackResponse = ProductDetailsFeedbackResponse.fromJson(response.body);
      // await getWishlistData();
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }
  /// shop the look
  Future<void> getShopTheLookData(
      {
        required String gender_id,
        required String? product_id,
        required String? child_category_id,
      }
      ) async {
    _isLoading = true;
    update();
    Response response = await productDetailsRepo.getShopTheLookData(
      gender_id : gender_id,
      product_id : product_id,
      child_category_id : child_category_id,
    );

    if (response.statusCode == 200) {
      shopTheLookResponse= ShopTheLookResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }
  /// page gender
  Future<void> getGenderPageData() async {
    _isLoading = true;
    genderList=[];
    update();
    Response response = await productDetailsRepo.getGenderPageData();

    if (response.statusCode == 200) {
      genderPageResponse= GenderPageResponse.fromJson(response.body);
      // alldata!.add(new sunny.Data(title: "View All"));
      GenderPageResponse.fromJson(response.body).data!.map((e) {
        genderList!.add(e);
      }).toList();
      if(genderList!.length>0){
        // await getTopSliderData(genderList![selectedGenderIndex].id.toString());
        // await getHomePageAllData(genderList![selectedGenderIndex].id.toString());
        // await getBrandProductData(genderList![selectedGenderIndex].id.toString());
      }
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  ///
  Future<void> cartQtyUpdate(String id,int qty) async {
    _isLoading = true;
    update();
    Response response = await productDetailsRepo.updateCartQuantity(id, qty);
    if (response.statusCode == 200) {
      if(response.body["status"]=="success"){
        await getProductDetailsData(id);
      }else{
        showCustomSnackBar(response.body["message"],isError: false);
      }
    } else {
      ///
/*      ApiChecker.checkApi(response);*/
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  Future<void> addQuantity(bool isIncrease,int index)async {
    if(isIncrease){
      int stock= productDetailsResponse?.data?.productColorVariants?[index]?.productInventories?[index]?.stockQty??1;
      log("${productDetailsResponse?.data?.productColorVariants?[index]?.productInventories?[index]?.stockQty}");
      if(stockcount!<=stock){
        stockcount= stockcount+1;
        // productDetailsResponse!.data!.price= productDetailsResponse!.data!.price *stockcount;
        // bagePageCartResponse!.data![index].totalDiscountedPrice= bagePageCartResponse!.data![index].quantity!*bagePageCartResponse!.data![index]!.product!.discountedPrice!;
        cartQtyUpdate(productDetailsResponse!.data!.id.toString(), stockcount);
      }
    }else{
      if(stockcount!>1){
        stockcount= stockcount-1;
        // bagePageCartResponse!.data![index].totalPrice= bagePageCartResponse!.data![index].quantity!*bagePageCartResponse!.data![index]!.product!.price!;
        // bagePageCartResponse!.data![index].totalDiscountedPrice= bagePageCartResponse!.data![index].quantity!*bagePageCartResponse!.data![index]!.product!.discountedPrice!;
        cartQtyUpdate(productDetailsResponse!.data!.id.toString(), stockcount);
      }
    }
    update();
    // getTotal();

  }

  ProductDetailsResponse ? productDetailsResponse;

  ///  product details
  Future<void> getProductDetailsData(String id) async {
    _isLoading = true;
    productImage=[];
    update();
    Response response = await productDetailsRepo.getProductDetailsData(id);

    if (response.statusCode == 200) {
      deliveryType=[];
      productDetailsResponse= ProductDetailsResponse.fromJson(response.body);
      if(productDetailsResponse!=null){
        productDetailsResponse!.data!.productWarehouses![0].productWarehouseDeliveryTypes!.map((e) {
          deliveryType.add(e.deliveryType!);
        }).toList();
        productDetailsResponse!.data!.productVendorWarehouses![0].productVendorWarehouseDeliveryTypes!.map((e) {
          deliveryType.add(e.deliveryType!);
        }).toList();
        final uniqDeliveryType = deliveryType.map((e) => e.id).toSet();
        deliveryType.retainWhere((x) => uniqDeliveryType.remove(x.id));

      }


/*

      List<ProductVendorWarehouseDeliveryTypes> productVendorWarehouseDeliveryTypes = productDetailsResponse?.data?.productVendorWarehouses?[0]?.productVendorWarehouseDeliveryTypes ?? [];
      List<ProductWarehouseDeliveryTypes> productVendorWarehouses = productDetailsResponse?.data?.productWarehouses?[0]?.productWarehouseDeliveryTypes ?? [];

// Combine the two lists based on matching deliveryType values
      List<ProductVendorWarehouseDeliveryTypes> combinedList = List.from(productVendorWarehouseDeliveryTypes);

      combinedList.retainWhere((deliveryType1) =>
          productVendorWarehouses.any((deliveryType2) =>
          deliveryType1.deliveryType!.name == deliveryType2.deliveryType!.name &&
              deliveryType1.deliveryType!.shortDescription == deliveryType2.deliveryType!.shortDescription));

*/


/// trying
   /*   if(productDetailsResponse!=null){
        List<int> ids=[];
        for(int k=0;k<ids.length;k++) {
          print("uniss");
          // print(bagePageCartResponse!.data!.length);
          List<ProductVendorWarehouses> data = [];
          List<DeliveryType> deliveryType = [];

          for (int i = 0; i < productDetailsResponse!.data!.productWarehouses!.length; i++) {
            if(productDetailsResponse!.data!.productVendorWarehouses!.length>0){
              productDetailsResponse!.data!.productVendorWarehouses![0].productVendorWarehouseDeliveryTypes!.map((e){
                deliveryType.add(e.deliveryType!);
              }).toList();
            }
          }
          final uniqDeliveryType = deliveryType.map((e) => e.id).toSet();
          deliveryType.retainWhere((x) => uniqDeliveryType.remove(x.id));
          if(data.length>0){
            vendorWiseData.add(new VendorWiseCartData(deliveryType));
          }

        }


        print("hiii");
        print(vendorWiseData.length);
      }*/


    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

/*/// for delivery combine
  Future<void> getBagPageCartDataForVendorType(String id) async {
    _isLoading = true;
    update();
    Response response = await productDetailsRepo.getProductDetailsData(id);
    if (response.statusCode == 200) {
      vendorWiseData=[];
      productDetailsResponse= ProductDetailsResponse.fromJson(response.body);
      if(productDetailsResponse!=null){
        List<int> ids=[];
        for(int k=0;k<ids.length;k++) {
          print("uniss");
          // print(bagePageCartResponse!.data!.length);
          List<ProductVendorWarehouses> data = [];
          List<DeliveryType> deliveryType = [];

          for (int i = 0; i < productDetailsResponse!.data!.productWarehouses!.length; i++) {
            if(productDetailsResponse!.data!.productVendorWarehouses!.length>0){
              productDetailsResponse!.data!.productVendorWarehouses![0].productVendorWarehouseDeliveryTypes!.map((e){
                deliveryType.add(e.deliveryType!);
              }).toList();
            }
          }
          final uniqDeliveryType = deliveryType.map((e) => e.id).toSet();
          deliveryType.retainWhere((x) => uniqDeliveryType.remove(x.id));
          if(data.length>0){
            vendorWiseData.add(new VendorWiseCartData(deliveryType));
          }

        }


        print("hiii");
        print(vendorWiseData.length);
      }





    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }*/

  ///  more from brands
  Future<void> getMoreFromBrandsData(String id, String page, String brand) async {
    _isLoading = true;
    update();
    Response response = await productDetailsRepo.getMoreFromBrandsData(id, page, brand);

    if (response.statusCode == 200) {
      moreBrandDetailsPageResponse= MoreBrandDetailsPageResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  List<YouMayAlsoLikeData> youmayAlsoLikeList = [];
  YouMayAlsoLikeModel? youMayAlsoLikeModel;

  Future<void> getYouMayAlsoLike({
    required String id,
    required List<int> childCat,
    required List<int> page,
    required String brand
  }) async {

    try{
      _isLoading = true;
      update();
      Response response = await productDetailsRepo.getYouMayAlsoLike(
          id: id,
          childCat: childCat,
          page: page,
          brand: brand
      );

      if(response.statusCode == 200){

        youmayAlsoLikeList = [];
        youMayAlsoLikeModel = YouMayAlsoLikeModel.fromJson(response.body);

        /// Add to list data
        youmayAlsoLikeList.addAll(youMayAlsoLikeModel?.data ?? []);

        log('====/@ Section1 List Con1: $youmayAlsoLikeList');
        log('====/@ Section1 List Con1: ${youMayAlsoLikeModel?.data}');
        log('====/@ Section1 List Con1: ${youMayAlsoLikeModel?.toJson()}');

      } else {
        ApiChecker.checkApi(response);
      }

    } catch (e, s) {
      // Handle the error here
      log('====/@ Error fetching data: $e', error: e, stackTrace: s);
      // You can choose to show a custom snackbar or handle the error in some other way
    } finally {
      _isLoading = false;
      update();
    }


    // _isLoading = true;
    // update();
    // Response response = await productDetailsRepo.getYouMayAlsoLike(
    //     id: id,
    //     childCat: childCat,
    //     page: page,
    //     brand: brand);
    //
    // log("====/@ You May Also Con: ${response.body}");
    // log("====/@ You May Also status: ${response.statusCode}");
    // if (response.statusCode == 200) {
    //   youMayAlsoLikeModel = YouMayAlsoLikeModel.fromJson(response.body);
    //   log("====/@ You May Also Model: ${youMayAlsoLikeModel!.data}");
    // } else {
    //   ApiChecker.checkApi(response);
    //   // showCustomSnackBar(response.statusCode!.toString());
    // }
    // _isLoading = false;
    // update();
  }

  // /// checkWishlisted
  // Future<void> getCheckWishlisted(String id) async {
  //   _isLoading = true;
  //   update();
  //   Response response = await productDetailsRepo.getCheckWishlisted(id);
  //   if (response.statusCode == 200) {
  //     checkWishlistResponse = CheckWishlistResponse.fromJson(response.body);
  //   } else {
  //     ApiChecker.checkApi(response);
  //     // showCustomSnackBar(response.statusCode!.toString());
  //   }
  //   _isLoading = false;
  //   update();
  // }

  ///  add to cart
  Future<void> AddtoCart({
    required String client_corelation_id,
    required String customer_id,
    required String product_id,
    required String color_variant_id,
    required String discount,
    required String quantity,
    required String size,
    required String price,
    required String mrp_price,
    required String product_inventory_id,
    required String final_price,

  }) async {
    _isLoading = true;
    update();
    print("add to cart sunny");
    Response response = await productDetailsRepo.AddtoCart(
      client_corelation_id : client_corelation_id,
      customer_id : customer_id,
      product_id : product_id,
      color_variant_id : color_variant_id,
      discount : discount,
      quantity : quantity,
      size : size,
      price : price,
      mrp_price : mrp_price,
      final_price : final_price,
      product_inventory_id: product_inventory_id,

    );
    if (response.statusCode == 201) {
      Get.back();
      print("add to cart sunny");
      // print(productDetailsResponse!.data!.discount);
      print("fsdd");
      // showCustomSnackBar("Add Cat Successfully", isError: true, isPosition: true);
    /*  Get.dialog( AddtoCartPopup(
        // title: 'Product added to your shopping bag',
        brand: productDetailsResponse?.data?.brand?.brandName??"",
        producttitle: productDetailsResponse?.data?.name??"",
        color: productDetailsResponse?.data?.productColorVariants?[sectedColorVAriantIndex]?.color?.colorName??"",
        size: sectedSize.toString()??"",
    *//*    qty: stockcount!.toString()??"",*//*
        qty: stockValue,
        // qty: productDetailsResponse?.data?.productColorVariants?[sectedColorVAriantIndex]?.productInventories?[sectedColorVAriantIndex]?.stockQty.toString()??"",
        discount: productDetailsResponse?.data?.discount??0,
        price: productDetailsResponse?.data?.price??0,
        discountedprice: productDetailsResponse?.data?.discountedPrice.toString()??"",
        image: productDetailsResponse?.data?.productColorVariants?[sectedColorVAriantIndex]?.profilePhoto??"",
        season: productDetailsResponse?.data?.season?.seasonName??"",
        isError: false,
        iconString: productDetailsResponse?.data?.name??"",
        noBtntap: ()
        {
          Get.back();
          // Get.to(BagPage());
          Get.to(()=>Dashboard(pageIndex: 4));
        },
        yesBtntap: () {
          Get.back();
          Get.back();
        },
        noBtnText: "GO TO BAG",
        yesBtnText: "CONTINUE SHOPPING",

      ));*/
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }


  /// all delivery type
  Future<void> getAllDeliveryTypeData() async {
    _isLoading = true;
    update();
    Response response = await productDetailsRepo.getAllDeliveryTypeData();
    if (response.statusCode == 200) {
      allDeliveryTypeResponse= AllDeliveryTypeResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }


  /// follow write up method
  Future<void> getFollowWriteUpData() async {
    _isLoading = true;
    update();
    Response response = await productDetailsRepo.getFollowWriteUpData();

    if (response.statusCode == 200) {
      followWriteUpResponse= FollowWriteUpResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

}


class VendorWiseCartData{
  // int? vendorId;
  // String? vendorName;
  // String? desc;
  // List<BagePageCartData> data=[];
  List<DeliveryType> deliveryType=[];

  VendorWiseCartData(
      // this.vendorId,
      // this.vendorName,
      // this.desc,
      // this.data,
      this.deliveryType
      );
}