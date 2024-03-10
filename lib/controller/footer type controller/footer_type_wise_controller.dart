import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:isletestapp/data/api/api_checker.dart';
import 'package:isletestapp/data/model/response/footer%20type%20part/main_page_footer_type_wise_response.dart';
import 'package:isletestapp/data/repository/footer%20type%20repo/footer_type_wise_repo.dart';

class FooterTypeWiseController extends GetxController implements GetxService {
  final FooterTypeWiseRepo footerTypeWiseRepo;
  ScrollController scrollController = ScrollController();
  FooterTypeWiseController({required this.footerTypeWiseRepo}){
  }
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  MainPageFooterTypeWiseResponse ? mainPageFooterTypeWiseResponse =null;

  Future<void> dataInitialize()async {
    await getFooterByTypeData();
  }


  /// footer part
  Future<void> getFooterByTypeData() async {
    _isLoading = true;
    update();
    Response response = await footerTypeWiseRepo.getFooterByTypeData();
    if (response.statusCode == 200) {
      mainPageFooterTypeWiseResponse = MainPageFooterTypeWiseResponse.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }








}
