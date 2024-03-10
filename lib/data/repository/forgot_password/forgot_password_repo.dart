import 'dart:async';
import 'package:get/get.dart';
import 'package:isletestapp/controller/auth_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../util/app_constants.dart';
import '../../api/api_client.dart';
class ForgotPasswordRepo{
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  ForgotPasswordRepo({required this.apiClient, required this.sharedPreferences}
  );

  /// get otp request
  Future<Response> phoneOTPRequest({
    required String? phone,
  }) async {
    String customerID = await Get.find<AuthController>().getUserId();
    Response _response = await apiClient.putData(AppConstants.GET_OTP_CODE_URI,{
      "phone":phone??"",
    });
    return _response;
  }

  /// get otp request
  Future<Response> emailOTPRequest({
    required String? email,
  }) async {
    String customerID = await Get.find<AuthController>().getUserId();
    Response _response = await apiClient.putData(AppConstants.GET_OTP_CODE_URI,{
      "email":email??"",
    });
    return _response;
  }


  ///  otp screen
  Future<Response> submitOTPRequest({
    required String? otp,
  }) async {
    Response _response = await apiClient.putData(AppConstants.SUBMIT_OTP_CODE_URI,{
      "otp":otp??"",
    });
    return _response;
  }


  ///  change Password(for forgotpassword)
  Future<Response> submitNewPassword({
    required String? token,
    required String? new_password,
  }) async {
    Response _response = await apiClient.putData(AppConstants.CHANGE_NEW_PASSWORD_URI,{
      "token":token??"",
      "new_password":new_password??"",
    });
    return _response;
  }



















}
