import 'dart:developer';
import 'package:get/get.dart';
import 'package:isletestapp/controller/auth_controller.dart';
import 'package:isletestapp/data/api/api_client.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FooterTypeWiseRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  FooterTypeWiseRepo({required this.apiClient, required this.sharedPreferences});

  /// footer
  Future<Response> getFooterByTypeData() async {
    Response _response = await apiClient.getData(AppConstants.FOOTER_BY_TYPES_URI);
    return _response;
  }








}

