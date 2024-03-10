import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/data/model/request%20model/order_place_request.dart';
import 'package:isletestapp/data/model/response/cart/apply_coupon-response.dart';
import 'package:isletestapp/data/model/response/cart/cart_response.dart';
import 'package:isletestapp/data/model/response/cart/redeem_point_apply_response.dart';
import 'package:isletestapp/data/model/response/cart/shop_with_confidence_response.dart';
import 'package:isletestapp/data/model/response/general%20settings/general_settings_response.dart';
import 'package:isletestapp/data/model/response/product%20details/stock_response.dart';
import 'package:isletestapp/data/model/response/profile/customer_user_me_response.dart';
import 'package:isletestapp/data/repository/cart/cart_repo.dart';
import 'package:isletestapp/view/screens/all_popup/custom%20popup%20messages/for_checkout_page_custom_popup.dart';
import '../../data/api/api_checker.dart';
import '../../view/base/custom_snackbar.dart';
import 'package:isletestapp/data/model/response/cart/cart_response.dart' as s;
import '../../view/screens/all_popup/custom popup messages/custom_popup.dart';

class CartController extends GetxController implements GetxService {
  final CartRepo cartRepo;
  CartController({
    required this.cartRepo,
  });


  OrderPlaceRequest orderPlaceRequest=OrderPlaceRequest();

  ///cart amounts values
  double calculatedDis=0;
  double subTotal=0;
  double grandTotal=0;
  // double b=0;
  // double b2=0;
  // double n3=0;
  double vat=0;
  double vatt=0;
  double discountedVat=0;
  double isleVat=0;
  double brandVat=0;
  double redeemVat=0;
  double firstorderVat=0;
  double minimumVat=0;
  double finalvat=0;
  double isleCouponDis=0.0;
  double brandCouponDis=0.0;
  double redeemCouponDis=0.0;
  double redeemPoint=0.0;
  double reward=0.0;
  String? selectedDeliveryType=null;
  String? availableStock=null;

  TextEditingController msgCtr = TextEditingController();
  TextEditingController islecouponCtr = TextEditingController();
  TextEditingController brandcouponCtr = TextEditingController();
  TextEditingController rewardCtr = TextEditingController();

  StockResponse ? stockResponse =null;
  CustomerUserMeResponse ? customerUserMeResponse =null;
  double minimumPoint=0.0;
  double minimumDiscount=0.0;
  double minimumAmount=0.0;
  double minimumPurchaseDiscount=0.0;
  double firstOrderDiscountPercant=0.0;
  double firstOrderDiscount=0.0;
  bool condition= false;
  ShopWithConfidenceResponse ? shopWithConfidenceResponse =null;
  ApplyCouponResponse ? applyCouponResponse =null;
  ApplyCouponResponse ? applyBrandResponse =null;
  // RedeemPointApplyResponse ? redeemPointApplyResponse =null;
  GeneralSettingResponse ? generalSettingResponse =null;
  RedeemPointApplyResponse? rewardApplyCouponResponse=null;
  // List<Cart> cartList=[];
  List<String> cartList=[];
  CartPageResponse ? cartPageResponse =null;
  bool _isLoading = false;

  int cartLength=0;
  bool get isLoading => _isLoading;

  /// stock
  Future<void> getAvailableStockData(int inventoryId) async {
    _isLoading = true;
    update();
    Response response = await cartRepo.getAvailableStockData(inventoryId);
    if (response.statusCode == 200) {
      stockResponse= StockResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  /// user/me
  Future<void> getCustomerUserMeData({required bool isPop}) async {
    print("user/me api call check=ssss=>");
    _isLoading = true;
    update();
    Response response = await cartRepo.getCustomerUserMeData();
    print("user/me api call check=ssss=>");
    if (response.statusCode == 200) {
      print("user/me api call check==>");
      customerUserMeResponse= CustomerUserMeResponse.fromJson(response.body);



      customerUserMeResponse?.data?.membershipTier?.membershipIsleRewardRules?.map((e) {
        double firstOrderProductDisc = 0.0;

        if(e.isleRewardRule!.rule=="minimum_point_to_redeem"){
          minimumPoint=e.minimumPoint??0.0;
        }
        if(e.isleRewardRule!.rule=="free_shipping"){
          minimumPoint=e.minimumPoint??0.0;
          minimumAmount=e.isleRewardRule?.purchaseAmount??0.0;
/*          if(subTotal+vat>minimumAmount&&e.available!){
            // isPop && e.isleRewardRule!.rewardMessage!=""?
            // Get.dialog(ForCheckOutCustomPopUp(msg:e.isleRewardRule!.rewardMessage!, username: "${customerUserMeResponse?.data?.firstName??""} ${customerUserMeResponse?.data?.lastName??""}",))
            //     : null;
            double totalDeliveryCost=0.0;
           orderPlaceRequest.deliveryTypes.map((e) {

              totalDeliveryCost=totalDeliveryCost+e.deliveryCharge!.toDouble();
            }).toList();
           orderPlaceRequest.shippingCost=totalDeliveryCost;
            // print("vat minimum order er vat ${vat}");
          }*/
        }
        if(e.isleRewardRule!.rule=="minimum_purchase_discount"){
          minimumDiscount=e.isleRewardRule?.purchaseDiscount??0.0;
          minimumAmount=e.isleRewardRule?.purchaseAmount??0.0;
          condition =minimumAmount<subTotal&&e.available!;
          if(minimumAmount<subTotal&&e.available!){
            isPop && e.isleRewardRule!.rewardMessage!=""?
            Get.dialog(ForCheckOutCustomPopUp(msg:e.isleRewardRule!.rewardMessage!, username: "${customerUserMeResponse?.data?.firstName??""} ${customerUserMeResponse?.data?.lastName??""}",))
                : null;
            minimumPurchaseDiscount = (minimumDiscount*subTotal)/100;
            // vat = vat+minimumPurchaseDiscount;

            print("vat minimum order er vat ${vat}");
            print("minimumPurchaseDiscount ${minimumPurchaseDiscount}");
            print("minimumDiscount ${minimumDiscount}");
            print("subTotal ${subTotal}");
            ///showCustomSnackBar(e.isleRewardRule!.rewardMessage!);
          }
        }

        if(e.isleRewardRule!.rule=="first_order_discount"){
          print("print e${e}");
          firstOrderDiscountPercant=e.isleRewardRule?.firstOrderDiscount??0.0;
          minimumAmount=e.isleRewardRule?.purchaseAmount??0.0;
          if(customerUserMeResponse!.data!.currentTierFirstOrder!&&e.available!){
            isPop &&  e.isleRewardRule!.rewardMessage!=""?
            Get.dialog(ForCheckOutCustomPopUp(msg:e.isleRewardRule!.rewardMessage!, username: "${customerUserMeResponse?.data?.firstName??""} ${customerUserMeResponse?.data?.lastName??""} hgfhf"))
                : null;
            firstOrderDiscount = (firstOrderDiscountPercant*subTotal)/100;
            // vat = vat+firstOrderDiscount;
            print("firstOrderDiscount ${firstOrderDiscount}");
            print("vat first order ${vat}");
            print("firstOrderDiscountPercant ${firstOrderDiscountPercant}");
            print("firstOrderDiscount ${firstOrderDiscount}");
            print("subTotal ${subTotal}");
            ///showCustomSnackBar(e.isleRewardRule!.rewardMessage!);
          } else {
            firstOrderDiscount = 0.0;
          }
        }


      }).toList();
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  /// shop with confidence
  Future<void> getShopWithConfidenceData() async {
    _isLoading = true;
    update();
    Response response = await cartRepo.getShopWithConfidenceData();
    if (response.statusCode == 201) {
      shopWithConfidenceResponse = ShopWithConfidenceResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  /// general settings
  Future<void> getGeneralSettingData() async {
    _isLoading = true;
    update();
    Response response = await cartRepo.getGeneralSettingData();

    if (response.statusCode == 200) {
      generalSettingResponse = GeneralSettingResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  /// bag page cart data
  Future<void> getCartPageData({required bool isPop}) async {
    _isLoading = true;
    update();
    islecouponCtr.text=cartRepo.getIsleCouponText();
    brandcouponCtr.text=cartRepo.getBrandText();

    Response response = await cartRepo.getCartPageData();
    if (response.statusCode == 200) {
      cartPageResponse= CartPageResponse.fromJson(response.body);
      if(cartPageResponse!=null){
        isleCouponDis=double.parse(cartRepo.getIsleCouponDiscount());
        brandCouponDis=double.parse(cartRepo.getBrandDiscount());

        cartPageResponse!.data!.map((e) {
          //  e.totalPrice= e.finalPrice!;
          e.stock=e.productInventory?.stockQty??0;
          e.totalPrice=e.product!.price!*e.quantity!;
        }).toList();
        cartPageResponse!.data!.map((e) {
          //  e.totalPrice= e.finalPrice!;
          e.stock=e.productInventory?.stockQty??0;
          e.totalDiscountedPrice=e.product!.discountedPrice!*e.quantity!;
        }).toList();
        /*       cartPageResponse!.data!.map((e) {
          getAvailableStockData(cartPageResponse?.data?[0]?.productInventoryId??0);
        }).toList();*/
        cartLength=cartPageResponse!.data!.length;

      }else{
        cartLength=0;
      }
      getTotal(isPop: isPop, fromCheckout: false);
      // getGrandTotal();
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
    Response response = await cartRepo.updateCartQuantity(id, qty);

    if (response.statusCode == 200) {

      if(response.body["status"]=="success"){
        await getCartPageData(isPop: true);
      }else{
        showCustomSnackBar(response.body["message"],isError: false);
      }
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  Future<void> cartDelete(String id) async {
    _isLoading = true;
    update();
    Response response = await cartRepo.deleteCart(id);

    if (response.statusCode == 200) {
      await getCartPageData(isPop: false);
      showCustomSnackBar("Successfully deleted!!",isPosition:true, duration: 1);
      Get.back();
      clearAllCoupon();
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }



  Future<void> addQuantity(bool isIncrease,int index)async {
    if(isIncrease){

      int stock=cartPageResponse!.data![index]?.productInventory?.stockQty??1;
      // if(bagePageCartResponse!.data![index].quantity!<=stock){
      if(cartPageResponse!.data![index].quantity!<stock){
        cartPageResponse!.data![index].quantity= cartPageResponse!.data![index].quantity!+1;
        cartPageResponse!.data![index].totalPrice= cartPageResponse!.data![index].quantity!*cartPageResponse!.data![index]!.product!.price!;
        cartPageResponse!.data![index].totalDiscountedPrice= cartPageResponse!.data![index].quantity!*cartPageResponse!.data![index]!.product!.discountedPrice!;
        cartQtyUpdate(cartPageResponse!.data![index].id.toString(), cartPageResponse!.data![index].quantity!);
      }
    } else{
      if(cartPageResponse!.data![index].quantity!>1){
        cartPageResponse!.data![index].quantity= cartPageResponse!.data![index].quantity!-1;
        cartPageResponse!.data![index].totalPrice= cartPageResponse!.data![index].quantity!*cartPageResponse!.data![index]!.product!.price!;
        cartPageResponse!.data![index].totalDiscountedPrice= cartPageResponse!.data![index].quantity!*cartPageResponse!.data![index]!.product!.discountedPrice!;
        cartQtyUpdate(cartPageResponse!.data![index].id.toString(), cartPageResponse!.data![index].quantity!);
      }
    }
    getTotal(isPop: true, fromCheckout: false);
  }

  /// isle coupon apply
  Future<void> applyIsleCoupon({
    required String? customer_id,
    required String? corelation_id,
    required String? code,
    required String? type,
    required String? is_guest,
  }) async {
    _isLoading = true;
    update();
    Response response = await cartRepo.applyIsleCoupon(
      customer_id : customer_id,
      corelation_id : corelation_id,
      type : type,
      code: code,
      is_guest : is_guest,
    );
    if (response.statusCode == 201) {
      log('Full response: ${response.body}');
      applyCouponResponse = ApplyCouponResponse.fromJson(response.body);
      //  Get.to(BagPage(isleCoupon: applyCouponResponse!.data!.discount!.toString(), coupontype: applyCouponResponse!.data!.type??"",));
      if(applyCouponResponse!.data!.type=="isle"){
        isleCouponDis=applyCouponResponse!.data!.discount!.toDouble();
        cartRepo.saveIsleCouponDiscount(isleCouponDis.toString());
        cartRepo.saveIsleCouponText(islecouponCtr.text);
        if(applyCouponResponse!.data!.type=="flat"){
          isleVat = (applyCouponResponse!.data!.discount_value!/applyCouponResponse!.data!.applicable_cart_amount!)*subTotal!;
          // vat=vat+isleVat;
        }else{
          isleVat = (subTotal*applyCouponResponse!.data!.discount_value!)/100*2;
          // vat=vat+brandVat;
          // print("brand Vat ${isleVat}");
        }
      }else{
        brandCouponDis=applyCouponResponse!.data!.discount!.toDouble();
        cartRepo.saveBrandDiscount(brandCouponDis.toString());
        cartRepo.saveBrandText(code.toString());
      }
      getTotal(isPop: false, fromCheckout: false);
      if (response.statusCode == 500) {
        if (response.body.contains("This coupon is not valid")) {
          showCustomSnackBar("Sorry, the coupon is not valid. Please check and try again.", isError: true, isPosition: false);
        } else {
          ApiChecker.checkApi(response);
        }
      }
      showCustomSnackBar("You Got ${applyCouponResponse!.data!.discount!.toString()} discount", isError: false, isPosition: false);
    } else {
      showCustomSnackBar("Sorry, the coupon is not valid. Please check and try again.", isError: true, isPosition: false);
    }
    _isLoading = false;
    update();
  }


  bool isUpdateCount = false;
  Future<void> getTotal({required bool isPop, required bool fromCheckout}) async {
    subTotal = 0;
    grandTotal = 0;
    vat=0;
    if (cartPageResponse != null) {
      cartPageResponse!.data!.forEach((e) async {
        e.stock = e.productInventory?.stockQty ?? 0;
        double qty = double.parse(e.quantity.toString());
        // Check for discount availability, if available, use discountedPrice, otherwise use price
        double price = e.product!.discount != null && e.product!.discount! > 0
            ? e.product!.discountedPrice!
            : e.product!.price!;
        subTotal += price * qty;
        if(e.product!.vatType=="percent"){
          double vatPercentAmount=((e.product!.vat!*price)/100);
          vat=vat+vatPercentAmount;
          //double finalPrice= ((subTotal*qty)-(isleVat*qty)-(brandVat*qty)-(redeemVat*qty)-(firstOrderDiscount*qty)-(minimumPurchaseDiscount*qty));
          print("total vat${vat} hh ${isleVat} hh ${brandVat} hh ${redeemVat} hh ${firstorderVat} hh ${minimumVat}");
        }else{
          vat=vat+e.product!.vat!.toDouble();

        }
        // if(subTotal < ){}
        if(subTotal>=5000 && !isUpdateCount && isPop){
          isUpdateCount= true;
          await getCustomerUserMeData(isPop: isPop);
        }
        if(isUpdateCount && subTotal<5000){
          isUpdateCount =false;
        }
      }
      );
    }

    if (cartPageResponse != null) {

      print("Hello,,,,");
      calculatedDis = 0;

      cartPageResponse!.data!.forEach((e) async {
        double isleCouponProductDisc = 0.0;
        double brandCouponProductDisc = 0.0;
        double redeemCouponProductDisc = 0.0;
        double firstOrderProductDisc = 0.0;
        double minimumOrderProductDisc = 0.0;

        if (isleCouponDis > 0) {
          isleCouponProductDisc = (isleCouponProductDisc / subTotal) * e.product!.discountedPrice!.toDouble();
        }

        if (firstOrderDiscount>0){
          print("object");
          firstOrderProductDisc = (firstOrderDiscount / subTotal) * e.product!.discountedPrice!.toDouble();
        }
        if (firstOrderDiscount>0){
          print("object");
          firstOrderProductDisc = (firstOrderDiscount / subTotal) * e.product!.discountedPrice!.toDouble();
        }

        print("discountedPrice ${e.product!.discountedPrice}");
        print("discountedPrice Double ${e.product!.discountedPrice!.toDouble()}");

        double productFinalPrice = (e.product!.discountedPrice!.toDouble() * e.quantity!.toDouble()) - (firstOrderProductDisc * e.quantity!.toDouble()) - (isleCouponProductDisc * e.quantity!.toDouble());

        vatt = e.product!.vat!.toDouble();

        print("vat ${vatt}");
        print("vat Double ${vatt!.toDouble()}");

        calculatedDis += (productFinalPrice * vatt) / 100;
        firstOrderProductDisc = 0;

        print("vat ${vatt}");
        print("firstOrderProductDisc ${firstOrderProductDisc}");
        print("productFinalPrice ${productFinalPrice}");
        print("calculatedDis ${calculatedDis}");

      });


    }

    if(subTotal<5000){
      minimumPurchaseDiscount=0.0;
    }
    vat = fromCheckout? vat : 0.0;
    print("subTotal : $subTotal, isleCouponDis : $isleCouponDis, brandCouponDis : $brandCouponDis, minimumPurchaseDiscount : $minimumPurchaseDiscount, redeemPoint : $redeemPoint, firstOrderDiscount : $firstOrderDiscount,");
    grandTotal = subTotal+calculatedDis-isleCouponDis-brandCouponDis-minimumPurchaseDiscount-redeemPoint-firstOrderDiscount; // Subtract discount from subTotal
    // grandTotal -= discountValue; // Subtract discount from subTotal
    print("Sunyyyyyyyyyyyyy${grandTotal}");
    // vat=vat.ceilToDouble();
    orderPlaceRequest.vat=vat.ceilToDouble();
    print("print vat $vat");
    orderPlaceRequest.subtotal=subTotal;
    orderPlaceRequest.grandTotal=grandTotal;
    orderPlaceRequest.brandCouponAmount=brandCouponDis;
    orderPlaceRequest.isleCouponAmount=isleCouponDis;
    update();
  }

/*  Future<void> getTotal() async {
    subTotal = 0;
    if (bagePageCartResponse != null) {
      bagePageCartResponse!.data!.forEach((e) {
        e.stock = e.productInventory?.stockQty ?? 0;
        double qty = double.parse(e.quantity.toString());
        // Check for discount availability, if available, use discountedPrice, otherwise use price
        double price = e.product!.discount != null && e.product!.discount! > 0
            ? e.product!.discountedPrice!
            : e.product!.price!;
        subTotal += price * qty;
      });
    }
    update();
  }*/

/*  Future<void> getTotal()async {
    subTotal=0;

    if(bagePageCartResponse!=null){
      bagePageCartResponse!.data!.map((e) {
        e.stock = e.productInventory?.stockQty ?? 0;
        double qty=double.parse(e.quantity.toString());
        subTotal=subTotal+(e.product!.price!*qty);

      }).toList();
    }
    update();
  }*/




  Future<void> deleteIsleCouponDiscount() async {
    isleCouponDis = 0.0;
    await cartRepo.deleteIsleCouponDiscount();
  }
  Future<void> deleteBrandDiscount() async {
    brandCouponDis = 0.0;
    await cartRepo.deleteBrandDiscount();
  }
  Future<void> deletRedeemDiscount() async {
    // update();
    redeemPoint = 0.0;
    await cartRepo.deletRedeemDiscount();
    // update();
  }
  void clearAllCoupon(){
    cartRepo.clearCoupon();
  }
  void clearIsleCoupon(){
    cartRepo.clearIsleCoupon();
  }
  void clearBrandCoupon(){
    cartRepo.clearBrandCoupon();
  }
  void clearRedeem(){
    cartRepo.clearRedeem();
  }
  /// redeem apply post
  Future<void> applyRedeem({
    required String? customer_id,
    required String? redeem_point,
  }) async {
    _isLoading = true;
    update();
    Response response = await cartRepo.applyRedeem(
      customer_id : customer_id,
      redeem_point : redeem_point,
    );
    log('customer id:$customer_id');
    log('Redeem Ctr:$redeem_point');
    if (response.statusCode == 200) {
      log('Full response: ${response.body}');
      RedeemPointApplyResponse rewardApplyCouponResponse = RedeemPointApplyResponse.fromJson(response.body);
      //  Get.to(BagPage(isleCoupon: applyCouponResponse!.data!.discount!.toString(), coupontype: applyCouponResponse!.data!.type??"",));
      if(rewardApplyCouponResponse!.data!.validity!){
        showCustomSnackBar("Redeem successfully", isError: false, isPosition: false);
        redeemPoint=rewardApplyCouponResponse!.data!.point!.toDouble();
        reward=rewardApplyCouponResponse!.data!.reward!.toDouble();
        redeemVat = (reward/subTotal)*subTotal;
        // vat = vat+redeemVat;
        print("redeem vat ${vat}");
        print("reward ${reward}");
        print("redeemPoint ${redeemPoint}");
        print("subTotal ${subTotal}");
      }else{
        redeemPoint=0.0;
        showCustomSnackBar(rewardApplyCouponResponse!.data!.msg!);
      }

    } else {
      // ApiChecker.checkApi(response);
      redeemPoint=0.0;
      showCustomSnackBar("Sorry, the coupon is not valid. Please check and try again.", isError: true, isPosition: false);
      // showCustomSnackBar("You can't redeem more than your existing total point.", isError: true, isPosition: false);
    }
    getTotal(isPop: false, fromCheckout: false);
    _isLoading = false;
    update();
  }


/*
  /// brand coupon apply
  Future<void> applyBrandCoupon({
    required String? customer_id,
    required String? corelation_id,
    required String? code,
    required String? type,
    required String? is_guest,
  }) async {
    _isLoading = true;
    update();
    Response response = await cartRepo.applyBrandCoupon(
      customer_id : customer_id,
      corelation_id : corelation_id,
      code : code,
      type : type,
      is_guest : is_guest,
    );
    log('customer id:$customer_id');
    log('corelation id:$corelation_id');
    log('code:$code');
    log('Type:$type');
    if (response.statusCode == 201) {
      log('Full response: ${response.body}');
      applyCouponResponse = ApplyCouponResponse.fromJson(response.body);
      Get.to(BagPage(brandCoupon: applyCouponResponse!.data!.discount!.toString(), coupontype: applyCouponResponse!.data!.type??"",));
      if (response.statusCode == 500) {
        if (response.body.contains("This coupon is not valid")) {
          // Display a specific message for invalid coupon
          showCustomSnackBar("Sorry, the coupon is not valid. Please check and try again.", isError: true, isPosition: false);
        } else {
          // Display a generic error message for other errors
          ApiChecker.checkApi(response);
        }
      }
      showCustomSnackBar("You Got ${applyCouponResponse!.data!.discount!.toString()} discount", isError: false, isPosition: false);
      // brandcouponCtr.text = "";
    } else {
      // ApiChecker.checkApi(response);
      showCustomSnackBar("Sorry, the coupon is not valid. Please check and try again.", isError: true, isPosition: false);
    }
    _isLoading = false;
    update();
  }
*/
















}
