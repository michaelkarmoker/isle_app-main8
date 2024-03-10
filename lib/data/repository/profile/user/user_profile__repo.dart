import 'dart:developer';
import 'dart:io';
import 'package:get/get.dart' hide MultipartFile hide FormData;
import 'package:image_picker/image_picker.dart';
import 'package:isletestapp/controller/auth_controller.dart';
import 'package:isletestapp/data/api/api_client.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart' hide Response;

class UserProfileRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  UserProfileRepo({required this.apiClient, required this.sharedPreferences});

  ///
  Future<Response> getCustomerUserMeData() async {
    Response _response = await apiClient.getData(AppConstants.PROFILE_EDIT_URI);
    return _response;
  }

  /// footer
  Future<Response> getFooterByTypeData() async {
    Response _response = await apiClient.getData(AppConstants.FOOTER_BY_TYPES_URI);
    return _response;
  }

  /// feedback
  Future<Response> getFeedBackData() async {
    String customerID = await Get.find<AuthController>().getUserId();
    Response _response = await apiClient.getData("${AppConstants.FEEDBACK_URI}/$customerID");
    return _response;
  }

  /// get profle
  Future<Response> getProfileData() async {
    String customerID = await Get.find<AuthController>().getUserId();
    Response _response = await apiClient.getData("${AppConstants.PROFILE_URI}/$customerID");
    return _response;
  }

  /// communication preferences
  Future<Response> updateCommunicationPreference({
    String? isEmail,
    String? isSms,
  }) async {
    String customerID = await Get.find<AuthController>().getUserId();

    Response response = await apiClient.putData("${AppConstants.PROFILE_URI}/$customerID/comuncation", {} ,
        query: {
          'is_email': isEmail?.toString() ?? '',
          'is_sms': isSms?.toString() ?? '',
        }
    );

    log('====/@ Api: ${response.request?.url ?? ''}');
    return response;
  }

  /// refer a friend
  Future<Response> getReferCodeData() async {
    String customerID = await Get.find<AuthController>().getUserId();
    Response _response = await apiClient.getData("${AppConstants.REFER_CODE_URI}/$customerID");
    return _response;
  }

  /// apply refer code
  Future<Response> applyReferCode({
    required String customer_id,
    required String refer_code,
  }) async {
    Response _response = await apiClient.postData(AppConstants.APPLY_REFER_CODE_URI, {
      "customer_id":customer_id,
      "refer_code":refer_code,
    });
    print("API: ${_response.request?.url ?? ''}");
    return _response;
  }


  Future<Response> getPr() async {
    String customerID = await Get.find<AuthController>().getUserId();
    Response _response = await apiClient.getData("${AppConstants.PROFILE_URI}/$customerID");
    return _response;
  }

  /// user address book
  Future<Response> getAddressBookData() async {
    Response _response = await apiClient.getData(AppConstants.USER_ADDRESSBOOK_URI);
    log('====/@ Api Url Update: ${_response.request?.url ?? ''}');
    return _response;
  }

  /// load edit data
  Future<Response> getEditLoadData(int id) async {
    Response _response = await apiClient.getData("${AppConstants.USER_ADDRESSBOOK_URI}/$id");
    log('====/@ Api Url: ${_response.request?.url ?? ''}');
    return _response;
  }

  /// delete addressbook
  Future<Response> deleteAddressBook(String id) async {
    Response _response = await apiClient.deleteData("${AppConstants.DELETE_ADDRESSBOOK_URI}/$id");
    return _response;
  }

  // ///Profile Edit form
  // Future<Response> userProfileEdit({
  //   required String first_name,
  //   required String last_name,
  //   required String phone,
  //   required String email,
  //   required String gender,
  //   required String date_of_birth,
  //   // required String state_id,
  //   // required String district_id,
  //   // required String sub_district_id,
  //   required String address,
  //   required File? photo,
  // })
  // async {
  //   String? token = sharedPreferences.getString(AppConstants.TOKEN);
  //
  //   var multipartFile = photo != null ? await di.MultipartFile.fromFile(photo.path) : null;
  //
  //   log('Photo: ${photo?.path}');
  //   // var multipartFile2 = photo!=null?await di.MultipartFile.fromFile(photo.path!):null;
  //   di.FormData formData =  di.FormData.fromMap({
  //     "first_name":first_name,
  //     "last_name":last_name,
  //     "phone":phone,
  //     "email":email,
  //     "gender":gender,
  //     "date_of_birth":date_of_birth,
  //     "address":address,
  //     "photo":multipartFile,
  //
  //   });
  //   di.Dio dio = di.Dio();
  //
  //   final responses = await dio.put(
  //     '${AppConstants.BASE_URL}${AppConstants.PROFILE_EDIT_URI}',
  //     data: formData,
  //     options: di.Options(
  //         contentType: 'multipart/form-data',
  //         headers: {
  //           'Authorization': token.toString()
  //         },
  //         followRedirects: false,
  //         validateStatus: (status) {
  //           return status! <= 500;
  //         }),
  //   );
  //   return Response(body: responses.data, statusCode: responses.statusCode!);
  //
  // }

  Future<Response> userProfileEdit({
    required String firstName,
    required String lastName,
    required String phone,
    required String email,
    required String gender,
    required String dateOfBirth,
    required String address,
    required File? profileImg,
  }) async {

    try{

      String? fileName = profileImg?.path.split('/').last;
      log('Photo: $fileName');

      MultipartFile? profileImgMul = profileImg != null ? await MultipartFile.fromFile(profileImg.path, filename: fileName) : null;

      // final profileImgMul = await di.MultipartFile.fromFile(profileImg?.path ?? '');
      String? token = sharedPreferences.getString(AppConstants.TOKEN);

      log('Photo: ${profileImg?.path}');
      log('Photo: ${profileImgMul?.filename}');

      Map<String, dynamic> preams = {};
      //
      // di.FormData formData = di.FormData.fromMap({
      //   "first_name": firstName,
      //   "last_name": lastName,
      //   "phone": phone,
      //   "email": email,
      //   "gender": gender,
      //   "date_of_birth": dateOfBirth,
      //   "address": address,
      //   "photo": profileImg?.path,
      // });

      preams['first_name'] = firstName;
      preams['last_name'] = lastName;
      preams['phone'] = phone;
      preams['email'] = email;
      preams['gender'] = gender;
      preams['date_of_birth'] = dateOfBirth;
      preams['address'] = address;
      preams['photo'] = profileImg?.path;

      // final formData2 = FormData.fromMap(preams);

      // log('FormData: ${formData2.fields}');

      Response response = await apiClient.putData(AppConstants.PROFILE_EDIT_URI, preams,
          headers: {'Authorization': token.toString()},
          // contentType: 'multipart/form-data',
      );

      log('====/@ Token Need: ${response.request?.url ?? ''}');
      log('====/@ Query Api 1: ${response.request?.url ?? ''}');
      log('=============@ Response: ${response.body}');
      // return Response(body: response.data, statusCode: response.statusCode!);
      return response;
    } catch(e, s){
      log('Error: ', error: e, stackTrace: s);
      throw '';
    }
  }

  ///Profile Edit form
  Future<Response> userChangePassword({
    required String email,
    required String phone,
    required String password,
    required String newPassword,
  })
  async {
    // String? token = sharedPreferences.getString(AppConstants.TOKEN);

    Map<String, dynamic> preams = {};
    if(phone.isNotEmpty){
      preams['phone'] = phone;
    }
    preams['email'] = email;
    preams['password'] = password;
    preams['new_password'] = newPassword;
    
    Response response = await apiClient.putData('/users/customers/change-password', preams);
    log('Change Response: ${response.request?.url ?? ''}');
    return response;

  }


  /// add new addressbook
  Future<Response> createNewAddressbook({
    required String address_type,
    required String first_name,
    required String last_name,
    required String phone,
    required String state_id,
    required String district_id,
    required String sub_district_id,
    required String address,
    required String is_primary,
  }) async {
    Response _response = await apiClient.postData(AppConstants.CREATE_NEW_ADDRESSBOOK_URI,{
      "address_type":address_type,
      "first_name":first_name,
      "last_name":last_name,
      "phone":phone,
      "state_id":state_id,
      "district_id":district_id,
      "sub_district_id":sub_district_id,
      "address":address,
      "is_primary":is_primary,
    });
    log('Api : ${_response.request?.url ?? ''}');
    return _response;
  }

  /// add new addressbook
  Future<Response> updateAddressbook({
    required String id,
    required String address_type,
    required String first_name,
    required String last_name,
    required String phone,
    required String state_id,
    required String district_id,
    required String sub_district_id,
    required String address,
    required String is_primary,
  }) async {
    Response _response = await apiClient.putData("${AppConstants.CREATE_NEW_ADDRESSBOOK_URI}/$id",{
      "address_type":address_type,
      "first_name":first_name,
      "last_name":last_name,
      "phone":phone,
      "state_id":state_id,
      "district_id":district_id,
      "sub_district_id":sub_district_id,
      "address":address,
      "is_primary":is_primary,
    });
    log('Update Address Api: ${_response.request?.url ?? ''}');
    return _response;
  }

  /// add new addressbook
  Future<Response> updateIsPrimary({
    required String id,
    required String isPrimary,
  }) async {
    Response _response = await apiClient.putData("${AppConstants.CREATE_NEW_ADDRESSBOOK_URI}/$id/status", {}, query: {"is_primary": isPrimary});
    log('Update Address Api: ${_response.request?.url ?? ''}');
    return _response;
  }

  /// thana
  Future<Response> getThanaData(String id) async {
    Response _response = await apiClient.getData("${AppConstants.GET_THANA_URI}/$id");

    return _response;
  }

  /// division
  Future<Response> getDivisionData() async {
    // Response _response = await apiClient.getData(AppConstants.CATEGORY_PRODUCT_PAGE_URI);
    Response _response = await apiClient.getData(AppConstants.GET_DIVISION_URI);
    return _response;
  }

  /// district
  Future<Response> getDistrictData(String id) async {
    Response _response = await apiClient.getData("${AppConstants.GET_DISTRICT_URI}/$id");
    log('District Response: ${_response.request?.url ?? ''}');
    return _response;
  }

  /// social
  Future<Response> getSocialData() async {
    Response _response = await apiClient.getData(AppConstants.SOCIAL_URI);
    return _response;
  }







}