import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/data/model/response/general%20settings/general_settings_response.dart';
import 'package:isletestapp/data/model/response/order/place_order_track_response.dart';
import 'package:isletestapp/data/repository/thank_you_repo/thank_you_repo.dart';
import '../../data/api/api_checker.dart';
import '../../view/base/custom_snackbar.dart';

class ThankYouController extends GetxController implements GetxService {
  final ThankYouRepo thankYouRepo;
  ThankYouController({
    required this.thankYouRepo,
  });

  double subTotal=0;
  TextEditingController ordernoCtr = TextEditingController();
  TextEditingController wardrobCtr = TextEditingController();

  GeneralSettingResponse ? generalSettingResponse =null;
  PlaceOrderTrackResponse ? placeOrderTrackResponse = null;
  bool _isLoading = false;

  int cartLength=0;
  bool get isLoading => _isLoading;

  Future<void> dataInitialize(int index)async {
    // await getOrderTrackData(id);
  }

  ///  order track
  Future<void> getOrderTrackData({
    required String id
  }) async {
    try {
      _isLoading = true;
      update();
      Response response = await thankYouRepo.getOrderTrackData(id);
      if (response.statusCode == 200) {
        placeOrderTrackResponse = PlaceOrderTrackResponse.fromJson(response.body);
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


  /// general settings
  Future<void> getGeneralSettingData() async {
    _isLoading = true;
    update();
    Response response = await thankYouRepo.getGeneralSettingData();

    if (response.statusCode == 200) {
      generalSettingResponse = GeneralSettingResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }


  ///  create feedback
  Future<void> createFeedback({
    required String? message,
    required String? customer_id,
    required String? rating,
  }) async {
    _isLoading = true;
    update();
    Response response = await thankYouRepo.createFeedback(
      message : message,
      customer_id : customer_id,
      rating : rating,
    );
    if (response.statusCode == 201) {
      Get.back();
      showCustomSnackBar("Send Feedback message Successfully", isError: false, isPosition: false);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }





}

