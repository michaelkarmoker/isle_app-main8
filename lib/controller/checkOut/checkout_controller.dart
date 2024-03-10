import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/data/model/response/cart/cart_response.dart';
import 'package:isletestapp/data/model/response/cart/confirm_order_response.dart';
import 'package:isletestapp/data/model/response/cart/shop_with_confidence_response.dart';
import 'package:isletestapp/data/model/response/general%20settings/general_settings_response.dart';
import 'package:isletestapp/data/model/response/product%20details/all_delivery_type_response.dart';
import 'package:isletestapp/data/repository/checkOut/checkout_repo.dart';
import '../../data/api/api_checker.dart';
import '../../data/model/request model/order_place_request.dart';
import '../../data/model/response/district/district_response.dart';
import '../../data/model/response/division/division_response.dart';
import '../../data/model/response/thana/thana_response.dart';
import '../cart/cart_controller.dart';

class CheckOutController extends GetxController implements GetxService {
  final CheckOutRepo checkOutRepo;
  CheckOutController({
    required this.checkOutRepo,
  });

  TextEditingController addressCtr = TextEditingController();
  TextEditingController firstNameCtr = TextEditingController();
  TextEditingController lastNameCtr = TextEditingController();
  TextEditingController phoneCtr = TextEditingController();
  TextEditingController specialnoteCtr = TextEditingController();
  TextEditingController emailCtr = TextEditingController();


  // var selectedPayntMethod = "".obs; // Observable variable for selected payment method
  //

  List<String> cartList=[];
  CartPageResponse ? bagePageCartResponse =null;
  double subtotal=0.0;
  double total=0.0;
  double discount=0.0;

  String? selectedPackage=null;
  String? selectedDeliveryType=null;
  String? selectedSchedualDelivery=null;
  String? selectedPayntMethod='';

  List<String> paymentMethods=["Cash on Delivery","Credit Card","Bkash","Paypal"];

  ShopWithConfidenceResponse ? shopWithConfidenceResponse =null;
  AllDeliveryTypeResponse ? allDeliveryTypeResponse =null;
  ConfirmOrderResponse ? confirmOrderResponse =null;
  GeneralSettingResponse ? generalSettingResponse =null;

  DivisionResponse ? divisionResponse =null;
  DistrictResponse ? districtResponse =null;
  ThanaResponse ? thanaResponse =null;
  List<String>? divisions=[];
  List<String>? districts=[];
  List<String>? thanas=[];

  List<VendorWiseCartData> vendorWiseData=[];
  var uniqBrandIds=Set();

  OrderPlaceRequest orderPlaceRequest=OrderPlaceRequest();

  bool _isLoading = false;
  bool get isLoading => _isLoading;


  /// manual address
  String selectedDivision = "Choose Division";
  int selectedDivisionIndex=-1;

  String selectedDistrict = "Choose District";
  int selectedDistrictIndex=-1;

  String selectedThana = "Choose Thana";
  int selectedThanaIndex=-1;


  Future<void> dataInitialize()async {
    await getDivision();
    await getShopWithConfidenceData();
    // await getAllDeliveryTypeData();
    /// need
/*   firstNameCtr.text=await Get.find<AuthController>().getUserFirstName();
   lastNameCtr.text=await Get.find<AuthController>().getUserLastName();
   phoneCtr.text=await Get.find<AuthController>().getUserPhone();*/


    // await getBagPageCartData();
    // await getBagPageCartData(bagePageCartResponse!.data![index].clientCorelationId!.toString());
    // await getCategoryProductData(categoryId);
    // await getFeaturedBrandsData();
  }

  Future<void> dataClear()async {
    // firstNameCtr.text = "";
    // lastNameCtr.text = "";
    // addressCtr.text = "";
    // phoneCtr.text = "";
    // specialnoteCtr.text = "";
    divisions = [];
    districts = [];
    thanas = [];
    selectedDivision = "";
    selectedDistrict = "";
    selectedThana = "";
    bagePageCartResponse = null;
    Get.find<CartController>().clearAllCoupon();
  }


  /// shop with confidence
  Future<void> getShopWithConfidenceData() async {
    _isLoading = true;
    update();
    Response response = await checkOutRepo.getShopWithConfidenceData();

    if (response.statusCode == 201) {
      shopWithConfidenceResponse = ShopWithConfidenceResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  /// for order id
  Future<void> getOrderId() async {
    _isLoading = true;
    update();
    Response response = await checkOutRepo.getGeneralSettingData();

    if (response.statusCode == 200) {
      generalSettingResponse = GeneralSettingResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
    }
    _isLoading = false;
    update();
  }

  /// general settings
  Future<void> getGeneralSettingData() async {
    _isLoading = true;
    update();
    Response response = await checkOutRepo.getGeneralSettingData();

    if (response.statusCode == 200) {
      generalSettingResponse = GeneralSettingResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
    }
    _isLoading = false;
    update();
  }

  Future<void> getBagPageCartData() async {
    _isLoading = true;
    update();
    Response response = await checkOutRepo.getBagPageCartData();
    if (response.statusCode == 200) {
      bagePageCartResponse= CartPageResponse.fromJson(response.body);
      if(bagePageCartResponse!=null){



        /*List<Cart> sharedCart=cartRepo.getCartList();
        if(sharedCart.length>0){
          *//*for(int i=0;i<bagePageCartResponse!.data!.length;i++){
            if(bagePageCartResponse!.data![i].id==)
          }*//*
        }{
          cartRepo.addToCartList(bagePageCartResponse!.data!);
        }*/




        subtotal=0;
        discount=0;
        total=0;
        if(bagePageCartResponse!=null){
          bagePageCartResponse!.data!.map((e) {
            if(e.product!.vat!>0){
              double qty=double.parse(e.quantity.toString());
              subtotal=subtotal+(e.product!.price!*qty);
              total=total+(e.product!.price!*qty);
              discount=discount+e.product!.discount!;
            }else{
              double qty=double.parse(e.quantity.toString());
              subtotal=subtotal+(e.product!.discountedPrice!*qty);
              total=total+(e.product!.discountedPrice!*qty);
              discount=discount+e.product!.discount!;
            }


          }).toList();
        }


      }else{

      }


    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }


  Future<void> getBagPageCartDataForVendorType() async {
    _isLoading = true;
    update();
    Response response = await checkOutRepo.getBagPageCartData();
    if (response.statusCode == 200) {
      vendorWiseData=[];
      bagePageCartResponse= CartPageResponse.fromJson(response.body);
      if(bagePageCartResponse!=null){
        print(bagePageCartResponse!.data!.length);
        List<BagePageCartData> templist = [];
        bagePageCartResponse!.data!.map((e){
          templist.add(e);
        }).toList();



        uniqBrandIds = templist.map((e) => e.product!.vendorId).toSet();
        templist.retainWhere((x) => uniqBrandIds.add(x.product!.vendorId));

        List<int> ids=[];
        uniqBrandIds.map((e) => {
          ids.add(e)
        }).toList();




        for(int k=0;k<ids.length;k++) {
          print("uniss");
          print(bagePageCartResponse!.data!.length);
          List<BagePageCartData> data = [];
          List<DeliveryType> deliveryType = [];

          for (int i = 0; i < bagePageCartResponse!.data!.length; i++) {
            print("inner llopp");
            if (ids[k] == bagePageCartResponse!.data![i].product!.vendorId) {
              print("inner llopp yes");
              data.add(bagePageCartResponse!.data![i]);
            }
            if(bagePageCartResponse!.data![i].product!.productVendorWarehouses!.length>0){
              bagePageCartResponse!.data![i].product!.productVendorWarehouses![0].productVendorWarehouseDeliveryTypes!.map((e){
                deliveryType.add(e.deliveryType!);
              }).toList();
            }

            ///for product warehouse
            if(bagePageCartResponse!.data![i].product!.productWarehouses!.length>0){
              bagePageCartResponse!.data![i].product!.productWarehouses![0].productWarehouseDeliveryTypes!.map((e){
                deliveryType.add(e.deliveryType!);
              }).toList();
            }

            /*if(deliveryType.length>0){
                  bagePageCartResponse!.data![i].product!.productVendorWarehouses![0].productVendorWarehouseDeliveryTypes!.map((e) {
                    List<DeliveryType> dataTypeList=[];

                    deliveryType.map((e2) => {
                      if(e2.id==e.id){
                        dataTypeList.add(e2)
                      }else{

                      }
                    }).toList();
                    *//*dataTypeList.map((e3) {
                      deliveryType.add(e3);
                    }).toList();*//*
                  }).toList();



                }else{
                  bagePageCartResponse!.data![i].product!.productVendorWarehouses![0].productVendorWarehouseDeliveryTypes!.map((e) {
                    deliveryType.add(e.deliveryType!);
                  }).toList();
                }*/


          }
          final uniqDeliveryType = deliveryType.map((e) => e.id).toSet();
          deliveryType.retainWhere((x) => uniqDeliveryType.remove(x.id));
          if(data.length>0){
            vendorWiseData.add(new VendorWiseCartData(ids[k],data[0].product!.vendor!.name??"",data,deliveryType));
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
  }
  /// division
  Future<void> getDivision() async {
    _isLoading = true;
    update();
    Response response = await checkOutRepo.getDivisionData();
    if (response.statusCode == 200) {
      log("Method success Check:");
      divisions=[];
      divisionResponse= DivisionResponse.fromJson(response.body);
      divisionResponse!.data!.map((e) {
        divisions!.add(e.name!);
      }).toList();
      log("BBBBBBBBBBBBBBBBB");
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  /// district
  Future<void> getDistrict(String divisionId) async {
    _isLoading = true;
    update();
    Response response = await checkOutRepo.getDistrictData(divisionId);

    if (response.statusCode == 200) {
      districts=[];
      districtResponse= DistrictResponse.fromJson(response.body);
      if(districtResponse!=null&&districtResponse!.data!=null) {
        districtResponse!.data!.map((e) {
          districts!.add(e.name!);
        }).toList();
      }
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }


  /// thana
  Future<void> getThana(String id) async {
    _isLoading = true;
    update();
    Response response = await checkOutRepo.getThanaData(id);

    if (response.statusCode == 200) {
      thanas=[];
      thanaResponse= ThanaResponse.fromJson(response.body);
      if(thanaResponse!=null&&thanaResponse!.data!=null) {
        thanaResponse!.data!.map((e) {
          thanas!.add(e.name!);
        }).toList();
      }
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
    Response response = await checkOutRepo.getAllDeliveryTypeData();

    if (response.statusCode == 200) {
      allDeliveryTypeResponse= AllDeliveryTypeResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }


/*  ///  place order
  Future<void> PlaceOrder() async {
    _isLoading = true;
    update();
    print("Order to cart 2 sunny");
    Response response = await checkOutRepo.placeOrder(
        orderPlaceRequest: orderPlaceRequest

    );
    if (response.statusCode == 201) {
      // Get.back();
      dataClear();
      Get.to(ThankYou());


      print("add to cart sunny");
      // showCustomSnackBar("Place Order Successfully", isError: true, isPosition: true);

    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }*/

  String? orderNumber;
  Future<void> PlaceOrder() async {
    _isLoading = true;
    update();
    print("Order to cart 2 sunny");
    Response response = await checkOutRepo.placeOrder(
      orderPlaceRequest: orderPlaceRequest,
    );
    print('Res Api: ${response.request?.url ?? ' '}');
    if (response.statusCode == 201) {
      // Extract order number from the response data
      orderNumber = response.body['data']['order_no'];
      String orderId = response.body['data']['order_id'].toString();
      String phone = response.body['data']['phone'];
      String email = response.body['data']['email'];
      print(' order 1${orderNumber ?? ' '}');
      print('Order 1 ${response.body['data']['order_id'].toString() ?? ''}');
      print("sgdsgtsfgdfgh");
      print(orderNumber);
      await getBagPageCartData();
      // Clear data and navigate to ThankYou page with the order number
      dataClear();
      // getBagPageCartData();
      // Get.to(()=>ThankYou(
      //   orderNumber: orderNumber,
      //   orderId: orderId!,
      //   // phone: phone,
      //   // email: email,
      // ));

      print("add to cart sunny");
    } else {
      ApiChecker.checkApi(response);
      // Handle error case (you may want to show a snackbar or take other actions)
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }



}

class VendorWiseCartData{
  int? vendorId;
  String? vendorName;
  List<BagePageCartData> data=[];
  List<DeliveryType> deliveryType=[];
  int selectedDeliveryValue=0;

  VendorWiseCartData(this.vendorId,this.vendorName,this.data,this.deliveryType);
}