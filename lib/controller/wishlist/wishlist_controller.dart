import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/product%20details/product_details_controller.dart';
import 'package:isletestapp/data/model/response/cart/cart_response.dart';
import 'package:isletestapp/data/model/response/product%20details/all_delivery_type_response.dart';
import 'package:isletestapp/data/model/response/profile/favorite%20brands/all_favourite_brands_response.dart';
import 'package:isletestapp/data/model/response/wardrobe/wardrobe_list_response.dart';
import 'package:isletestapp/data/model/response/wishlist/check_wishlist_response.dart';
import 'package:isletestapp/data/model/response/wishlist/get_wishlist_response.dart';
import 'package:isletestapp/data/repository/wishlist/wishlist_repo.dart';
import '../../data/api/api_checker.dart';
import '../../view/base/custom_snackbar.dart';


class WishlistController extends GetxController implements GetxService {

  final WishlistRepo wishlistRepo;


  WishlistController({required this.wishlistRepo,});
  double subTotal=0;
  TextEditingController wardrobCtr = TextEditingController();

  AllDeliveryTypeResponse ? allDeliveryTypeResponse =null;
  AllFavouriteBrandsResponse ? allFavouriteBrandsResponse =null;
  GetWishlistResponse ? getWishlistResponse =null;
  CheckWishlistResponse ? checkWishlistResponse =null;
  WardrobeResponse ? wardrobeResponse =null;
  int sectedColorVAriantIndex=0;
  int sectedImageIndex=0;
  String? sectedSize;
  String? selectedStockQty;
  int stock=10;
  int sectedWishIndex=0;
  // List<Cart> cartList=[];
  List<String> cartList=[];
  CartPageResponse ? bagePageCartResponse =null;
  bool _isLoading = false;
  int wishcartLength=0;
  bool get isLoading => _isLoading;

  bool isWished=false;
  RxBool isFollow = false.obs;

  ///  add to cart
  Future<void> AddtoCartFromWishlist({
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
    Response response = await wishlistRepo.AddtoCartFromWishlist(
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
      // Get.back();
      print("add to cart sunny");
      // print(productDetailsResponse!.data!.discount);
      print("fsdd");
/*      Get.dialog( AddtoCartFromWishlistPopup(
        // title: 'Product added to your shopping bag',
        brand: getWishlistResponse?.data?[0]?.product?.brand?.name??"",
        producttitle: getWishlistResponse?.data?[0]?.product?.name??"",
        color: getWishlistResponse?.data?[0]?.product?.productColorVariants?[sectedColorVAriantIndex]?.color?.name??"",
        size: sectedSize.toString()??"",
        *//*qty: stockcount!.toString()??"",*//*
        qty: "1",
        // qty: productDetailsResponse?.data?.productColorVariants?[sectedColorVAriantIndex]?.productInventories?[sectedColorVAriantIndex]?.stockQty.toString()??"",
        discount: getWishlistResponse?.data?[0]?.product?.discount??0,
        price: getWishlistResponse?.data?[0]?.product?.price??0,
        discountedprice: getWishlistResponse?.data?[0]?.product?.discountedPrice.toString()??"",
        image: getWishlistResponse?.data?[0]?.product?.productColorVariants?[sectedColorVAriantIndex]?.frontPhoto??"",
        // image: "/public/uploads/happy-people-celebrating-birthday-party-260nw-2283979947-lMnUFzuhK.webp",
        season: getWishlistResponse?.data?[0]?.product?.season?.name??"",
        isError: false,
        iconString: getWishlistResponse?.data?[0]?.product?.name??"",
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

      )
      );*/
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }


  /// global wishlist
  Future<void> AddtoWishlist({
    required String? product_id,
    required String? customer_id,
    required String? corelation_id,
  }) async {
    _isLoading = true;
    update();
    Response response = await wishlistRepo.AddtoWishlist(
      product_id : product_id,
      customer_id : customer_id??null,
      corelation_id : corelation_id,
    );
    log('Product id:$product_id');
    if (response.statusCode == 201) {
      showCustomSnackBar("Add Wishlist Successfully", isError: false, isPosition: false, duration: 1);
      await getWishlistData();
    } else if (response.statusCode == 200){
      showCustomSnackBar("wishlist delete successfully", isError: true, isPosition: false, duration: 1);
      getWishlistData();
      await getWishlistData();
    }
    else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  Future<void> createFollow({required String brandId}) async {
    _isLoading = true;
    update();
    Response response = await wishlistRepo.createFollow(brandId: brandId);
    if (response.statusCode == 201) {
      showCustomSnackBar("Follow brand created successfully", isError: false, isPosition: false, duration: 1);
      await getFavoriteBrandsAllData();
    } else if (response.statusCode == 200) {
      showCustomSnackBar("Brand delete successfully", isError: true, isPosition: false, duration: 1);
      // getFavoriteBrandsAllData();
      await getFavoriteBrandsAllData();
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }


  /// wish list data
  Future<void> getWishlistData() async {
    _isLoading = true;
    update();
    Response response = await wishlistRepo.getWishlistData();
    if (response.statusCode == 200) {
      getWishlistResponse = GetWishlistResponse.fromJson(response.body);
      if(getWishlistResponse!=null){
        wishcartLength=getWishlistResponse!.data!.length;
      }else{
        wishcartLength=0;
      }
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  /// all favorite brands
  Future<void> getFavoriteBrandsAllData() async {
    try {
      _isLoading = true;
      update();
      Response response = await wishlistRepo.getFavoriteList();

      if (response.statusCode == 200) {
        allFavouriteBrandsResponse = AllFavouriteBrandsResponse.fromJson(response.body);
      } else {
        ApiChecker.checkApi(response);
        // showCustomSnackBar(response.statusCode!.toString());
      }
    } catch (error) {
      // Handle the error here
      print('Error fetching data: $error');
      // You can choose to show a custom snackbar or handle the error in some other way
    } finally {
      _isLoading = false;
      update();
    }
  }

  /// checkWishlisted
  bool getCheckWishlisted(String id)  {
    print("/// checkWishlisted${id}");
    bool isWishedList=false;
    for(int i=0;i<getWishlistResponse!.data!.length;i++){
      print(i);
      print(getWishlistResponse!.data![i].product!.id.toString());
      if(getWishlistResponse!.data![i].product!.id.toString()==id){
        isWishedList= true;
        break;
      }
    }
    return isWishedList;
  }

  /// checkbrand
  bool getCheckBranded(String brandId)  {
    print("/// checkBrandlisted${brandId}");
    bool isFollowedList=false;
    if (allFavouriteBrandsResponse != null && allFavouriteBrandsResponse!.data != null) {
      for(int i=0; i < allFavouriteBrandsResponse!.data!.length; i++) {
        print(i);
        print(allFavouriteBrandsResponse!.data![i].brandId.toString());
        if(allFavouriteBrandsResponse!.data![i].brandId!.toString() == brandId) {
          isFollowedList= true;
          break;
        }
      }
    }
    return isFollowedList;
  }


  ///  delete wish
  Future<void> deleteWish(String id) async {
    _isLoading = true;
    update();
    Response response = await wishlistRepo.deleteWish(id);
    if (response.statusCode == 200) {
      showCustomSnackBar("Successfully deleted!!",isPosition:true, duration: 1);
      await getWishlistData();
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  ///  delete wardrobe
  Future<void> deleteWardrobe(String id) async {
    _isLoading = true;
    update();
    Response response = await wishlistRepo.deleteWardrobe(id);
    if (response.statusCode == 200) {
      showCustomSnackBar("Successfully deleted!",isPosition:false, duration: 1);
      await getWardrobeData();
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  ///  delete wardrobe product
  Future<void> deleteWardrobeProduct(String id) async {
    _isLoading = true;
    update();
    Response response = await wishlistRepo.deleteWardrobeProduct(id);
    if (response.statusCode == 200) {
      showCustomSnackBar("Successfully deleted!",isPosition:false, duration: 1);
      await getWardrobeData();
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  /// wardrobe list
  Future<void> getWardrobeData() async {
    _isLoading = true;
    update();
    Response response = await wishlistRepo.getWardrobeData();
    if (response.statusCode == 200) {
      wardrobeResponse = WardrobeResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  /// create wardrobe
  Future<void> createWardrobe({
    required String name,
    required String customer_id,
  }) async {
    _isLoading = true;
    update();
    Response response = await wishlistRepo.createWardrobe(
      name: name,
      customer_id: customer_id,
    );
    if (response.statusCode == 201) {
      /// main chilo
      // Get.to(WardrobNameList());
      wardrobCtr.clear();
      Get.back();
      showCustomSnackBar("Wardrobe Create Successful", isError: false , isPosition: false, duration: 1);
      getWardrobeData();
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  /// create wardrobe product
  Future<void> createWardrobeProduct({
    required String wardrobe_id,
    required String wishlist_id,
  }) async {
    _isLoading = true;
    update();
    Response response = await wishlistRepo.createWardrobeProduct(
      wardrobe_id: wardrobe_id,
      wishlist_id: wishlist_id,
    );
    if (response.statusCode == 201) {
      await getWardrobeData();
      showCustomSnackBar("Wardrobe product choose successful", isError: false , isPosition: false, duration: 1);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }











}