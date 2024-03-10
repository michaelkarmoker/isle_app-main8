import 'dart:developer';
import 'dart:io';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/data/api/api_checker.dart';
import 'package:isletestapp/data/model/response/auth/guest_login_response.dart';
import 'package:isletestapp/data/model/response/auth/login_response.dart';
import 'package:isletestapp/view/base/custom_snackbar.dart';
import 'package:isletestapp/view/screens/cart_page/cart_page.dart';
import 'package:isletestapp/view/screens/dashboard/dashboard.dart';
import 'package:isletestapp/view/screens/profile/profile.dart';
import '../data/repository/auth_repo.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;

  AuthController({
    required this.authRepo,
  });

/*  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();*/
  TextEditingController passCtr = TextEditingController();
  TextEditingController emailCtr = TextEditingController();
  LoginResponse? loginResponse = null;
  GuestLoginResponse? guestLoginResponse = null;
  bool _isLoading = false;
  int notification=0;
  bool _isActiveRememberMe = false;

  bool get isActiveRememberMe => _isActiveRememberMe;

  set isActiveRememberMe(bool value) {
    _isActiveRememberMe = value;
    update();
  }

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
  }

  Future<void> setuserName() async {
    String userName = getUserName();
    String password = getUserPassword();
    emailCtr.text = userName;
    passCtr.text = password;

  }

  /// signup
  Future<void> signup({
    String? email,
    String? phone,
    required String password,
  }) async {

    _isLoading = true;
    update();
    Response response = await authRepo.signup(
        email: email ?? '',
        phone: phone ?? '',
        password: password
    );

    if (response.statusCode == 201) {
      showCustomSnackBar("Signup Successful", isError: false, isPosition: false);
      // Get.off(MainScreen()) ;
      Get.off(()=> const Dashboard(pageIndex: 5, initialTabIndex: 0));
      // Get.off(()=>UserInfo(isbottomSheet: true));
    } else if(response.statusCode == 401){
      showCustomSnackBar(response.body["message"], isError: true, isPosition: false);
    } else {
      ApiChecker.checkApi(response);
      // showCustomSnackBar(response.statusCode!.toString());
    }
    _isLoading = false;
    update();
  }

  /// for login Code
  Future<void> login({
    String? email,
    String? phone,
    required String password,
    bool? isfromCart
  }) async {
    _isLoading = true;
    update();
    Response response = await authRepo.login(
        email: email ?? '',
        phone: phone ?? '',
        password: password
    );
    log('Status Code: ${response.statusCode ?? ''}');
    if (response.statusCode == 201) {
      loginResponse = LoginResponse.fromJson(response.body);

      if(_isActiveRememberMe){
        await authRepo.saveUserNameAndPassword(email ?? phone ?? '', password,);
      } else{
        await authRepo.clearUserNumberAndPassword();
      }
      // await authRepo.saveUserType(userSelectValue);
      await authRepo.saveUserId(loginResponse!.data!.user!.id!.toString());
/// 1
      await authRepo.saveUserToken(loginResponse!.data!.accessToken!);
      log('==========@ Access Token : ${loginResponse!.data!.accessToken!}');
      // await authRepo.saveUserRToken(loginResponse!.data!.refreshToken!);
      showCustomSnackBar(response.body["message"], isError: false, isPosition: false, duration: 3);
/// 2
      isfromCart!?
        Get.off(()=>CartPage(isbottomSheet: true)) :


        Get.off(()=>UserInfo(isbottomSheet: true));

/// 3

    } else if(response.statusCode == 401){
      showCustomSnackBar(response.body["message"], isError: true);
    } else{
      _isLoading = false;
      update();
      ApiChecker.checkApi(response);
      showCustomSnackBar(response.body["message"]);
    }
    _isLoading = false;
    update();
  }

  /// 1
  // await authRepo.saveUserFirstName(loginResponse!.data!.user!.firstName!);
  // await authRepo.saveUserLastName(loginResponse!.data!.user!.lastName!);
  // await authRepo.saveUserEmail(loginResponse!.data!.user!.email!);
  // await authRepo.saveUserPhone(loginResponse!.data!.user!.phone!);

  /// 2
  /*     await authRepo.saveUserToken(loginResponse!.data!.accessToken!).then((value) {
        if(isfromCart!){
          Get.back();
        }else{
          update();
          Get.offAll(Dashboard(pageIndex: 0,));
        }
        showCustomSnackBar("Login Successfully",isError: false);
      });*/

  /// 3
  /*   if(userSelectValue==AppConstants.STUDENT){
        // Get.offNamed(RouteHelper.getStudentPanelRoute());
      }else{
        // Get.offNamed(RouteHelper.getTeacherPanelRoute());
      }*/

  /// for login Code
  Future<void> guestLogin() async {
    _isLoading = true;
    update();
    Response response = await authRepo.guestLogin();
    if (response.statusCode == 201) {
      guestLoginResponse =GuestLoginResponse.fromJson(response.body);
      await authRepo.saveUserIdGuest(guestLoginResponse!.data!.user!.id!.toString());
      await authRepo.saveGestToken(guestLoginResponse!.data!.accessToken!);
      log('==========@ Guest Access Token : ${guestLoginResponse!.data!.accessToken!}');
      // await authRepo.saveUserRToken(loginResponse!.data!.refreshToken!);
      showCustomSnackBar(response.body["message"], isError: false);
    }else{
      _isLoading = false;
      update();
      ApiChecker.checkApi(response);
      showCustomSnackBar(response.body["message"]);
    }
    _isLoading = false;
    update();
  }

  Future<String> getDeviceID() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    try {
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        return androidInfo.androidId; // Use androidId for Android devices
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        return iosInfo.identifierForVendor; // Use identifierForVendor for iOS devices
      }
    } catch (e) {
      print("Error getting device ID: $e");
    }

    return ""; // Return an empty string in case of an error
  }
  bool isEmailValid(String input) {
    return RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
    ).hasMatch(input);
  }

  void loginVerification(bool isFromCart) async {
    String user = emailCtr.text.trim();
    String password = passCtr.text.trim();

    if (user.isNotEmpty && isEmailValid(user)) {
      // If the email field is not empty and contains a valid email address
      log('Email: $user');
      Get.find<AuthController>().login(password: password, email: user, isfromCart: isFromCart);
    }  else if (user.isEmpty) {
      showCustomSnackBar('Enter User ID');
    } else if (password.isEmpty) {
      showCustomSnackBar('Enter Password'.tr);
    } else if (password.length < 4) {
      showCustomSnackBar('The Password must be at least 5 Characters');
    } else {
      // Handle case when neither email nor phone is provided
      log('Phone: $user');
      Get.find<AuthController>().login(password: password, phone: user, isfromCart: isFromCart);
    }
  }


  bool isLoggedIn() {
    print(authRepo.isLoggedIn());
    return authRepo.isLoggedIn();
  }
  ///
  bool isLoggedInGuest() {
    print(authRepo.isGuestLoggedIn());
    return authRepo.isGuestLoggedIn();
  }

  String getUserPermission() {
    return authRepo.getUserName() ?? "";
  }

  String getUserType() {
    return authRepo.getUserType() ?? "";
  }
  String getUserId() {
    return authRepo.getUserId() ?? "";
  }
  /// guest
  String getUserIdGuest() {
    return authRepo.getUserIdGuest() ?? "";
  }
  String getUserFirstName() {
    return authRepo.getUserFirstName() ?? "";
  }
  String getUserLastName() {
    return authRepo.getUserLastName() ?? "";
  }
  String getUserEmail() {
    return authRepo.getUserEmail() ?? "";
  }
  String getUserPhone() {
    return authRepo.getUserPhone() ?? "";
  }
  String getUserToken() {
    return authRepo.getUserToken();
  }
  ///
  String getUserGuestToken() {
    return authRepo.getUserGuestToken();
  }

  void saveUserNameAndPassword(
      String UserName,
      String password){
    authRepo.saveUserNameAndPassword(UserName, password);
  }

  String getUserName() {
    return authRepo.getUserName() ?? "";
  }

  String getUserPassword() {
    return authRepo.getUserPassword() ?? "";
  }

  Future<bool> clearUserNumberAndPassword() async {
    return authRepo.clearUserNumberAndPassword();
  }


  Future<void> signOut() async {
    isLoading=true;
    update();
    await authRepo.clearUserSigningInfo();
    Get.offAll(()=>const Dashboard(pageIndex: 5));
    showCustomSnackBar("Logout Successful", isPosition: false);
    isLoading=false;
    update();
  }
  Future<void> signOutSilent() async {
    isLoading=true;
    update();
    await authRepo.clearUserSigningInfo();
    isLoading=false;
    update();
  }
  /// guest
  Future<void> signOutGuest() async {
    isLoading=true;
    update();
    await authRepo.signOutGuest();
    showCustomSnackBar("Logout Successful", isPosition: false);
    isLoading=false;
    update();
    //Get.offAll(SignIn(exitFromApp: false,));
    // Get.offNamed(RouteHelper.getInitialRoute());
  }
/*
  Future<bool> signOut() async {
    return authRepo.clearUserSigningInfo();
  }*/

}
