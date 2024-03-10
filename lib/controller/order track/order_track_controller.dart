import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/data/model/response/cart/cart_response.dart';
import 'package:isletestapp/data/model/response/order/place_order_track_response.dart';
import 'package:isletestapp/data/repository/order%20track/order_track_repo.dart';
import '../../data/api/api_checker.dart';

class OrderTrackController extends GetxController implements GetxService {
  final OrderTrackRepo orderTrackRepo;
  OrderTrackController({required this.orderTrackRepo,});

  double subTotal=0;
  TextEditingController ordernoCtr = TextEditingController();
  TextEditingController wardrobCtr = TextEditingController();



  int sectedColorVAriantIndex=0;
  String? sectedSize;
  String? selectedStockQty;
  int stock=10;

  int sectedWishIndex=0;

  // List<Cart> cartList=[];
  List<String> cartList=[];
  // OrderTrackresponse ? orderTrackresponse = null;
  PlaceOrderTrackResponse ? orderTrackresponse = null;
  bool _isLoading = false;

  int cartLength=0;
  bool get isLoading => _isLoading;

  Future<void> dataInitialize(int index)async {
    // await getOrderTrackData(id);
  }

  int? orderNumver;

  ///  order track
  Future<void> getOrderTrackData({
    required String id
  }) async {
    try {
      _isLoading = true;
      update();
      Response response = await orderTrackRepo.getOrderTrackData(id);
      if (response.statusCode == 200) {
        orderTrackresponse = PlaceOrderTrackResponse.fromJson(response.body);

        orderNumver = orderTrackresponse?.data?[0].orderId ?? 0;
        print('Order Id Nu: ${orderTrackresponse?.data?[0].orderId}');
        ordernoCtr.text = "";
        // showCustomSnackBar("Successfully deleted!!",isPosition:true);
        // await getWishlistData();
      } else {
        ApiChecker.checkApi(response);
        // showCustomSnackBar(response.statusCode!.toString());
      }
      _isLoading = false;
      update();
    }
    catch (e) {
      // Handle the exception (e.g., log, show an error message, etc.)
      print('Error accessing orderTrackresponse data: $e');
    }

  }




  /// create wardrobe
/*  Future<void> createWardrobe({
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
      showCustomSnackBar("Wardrobe Create Successful", isError: false , isPosition: false);
      getWardrobeData();
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }*/

















}