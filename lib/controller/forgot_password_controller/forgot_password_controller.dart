import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/data/model/response/auth/otp_code_response.dart';
import 'package:isletestapp/data/repository/forgot_password/forgot_password_repo.dart';
import 'package:isletestapp/view/screens/all_popup/otp/change_password_popup_design.dart';
import 'package:isletestapp/view/screens/all_popup/otp/otp_popup_design.dart';
import '../../data/api/api_checker.dart';
import '../../view/base/custom_snackbar.dart';

class ForgotPasswordController extends GetxController implements GetxService {
  final ForgotPasswordRepo forgotPasswordRepo;
  ForgotPasswordController({required this.forgotPasswordRepo,});

  TextEditingController phoneORemailCtr = TextEditingController();
  TextEditingController submitOTPCtr = TextEditingController();
  TextEditingController changePassCtr = TextEditingController();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  OtpCodeResponse ? otpCodeResponse =null;

  /// get otp request
  Future<void> phoneOTPRequest({
    required String? phone,
  }) async {
    _isLoading = true;
    update();
    print("Otp Request");
    Response response = await forgotPasswordRepo.phoneOTPRequest(
      phone : phone??"",
    );
    if (response.statusCode == 200) {
      // Get.back();
      print("OTP Request 22");
      showCustomSnackBar(response.body["message"], isError: false, isPosition: false, duration: 3);
      phoneORemailCtr.text = "";
      Get.dialog(const CustomOTPDialog());
      // showCustomSnackBar("Add Cat Successfully", isError: true, isPosition: true);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  /// get otp request
  Future<void> emailOTPRequest({
    required String? email,
  }) async {
    _isLoading = true;
    update();
    print("Otp Request");
    Response response = await forgotPasswordRepo.emailOTPRequest(
      email : email??"",
    );
    if (response.statusCode == 200) {
      print("OTP Request 22");
      showCustomSnackBar(response.body["message"], isError: false, isPosition: false, duration: 3);
      phoneORemailCtr.text = "";
      Get.dialog(const CustomOTPDialog());
      // showCustomSnackBar("Add Cat Successfully", isError: true, isPosition: true);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }


  /// submit otp
 String? otpToken;
  Future<void> submitOTPRequest({
    required String? otp,
  }) async {
    _isLoading = true;
    update();
    print("Otp Request");
    Response response = await forgotPasswordRepo.submitOTPRequest(
      otp : otp??"",
    );
    if (response.statusCode == 200) {
      otpCodeResponse= OtpCodeResponse.fromJson(response.body);
    otpToken = otpCodeResponse?.data?.token??"";
      print("OTP Request 22${otpToken}");
      // showCustomSnackBar(response.body["message"], isError: false, isPosition: false, duration: 3);
      submitOTPCtr.text = "";
      Get.dialog(ChangePasswordDialog(otpToken: otpToken??"",));
      showCustomSnackBar("OTP Submit Successfully", isError: false, isPosition: false);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  ///  change Password(for forgotpassword)
  Future<void> submitNewPassword({
    required String? token,
    required String? new_password,
  }) async {
    _isLoading = true;
    update();
    print("Otp Request");
    Response response = await forgotPasswordRepo.submitNewPassword(
      token : token??"",
      new_password : new_password??"",
    );
    if (response.statusCode == 200) {
      Get.back();
      Get.back();
      Get.back();
      print("OTP Request 22");
      // showCustomSnackBar("New Password Update Successfully", isError: false, isPosition: false);
      showCustomSnackBar(response.body["message"], isError: false, isPosition: false, duration: 3);
      changePassCtr.text = "";
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }
















}