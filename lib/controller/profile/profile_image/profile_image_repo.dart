import 'dart:developer';
import 'dart:io';
import 'package:isletestapp/data/api/api_client.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

class ProfileImageRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  ProfileImageRepo({required this.apiClient, required this.sharedPreferences});

  Future userProfileEdit({
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

      // String? fileName = profileImg?.path.split('/').last.replaceAll(" ", "_");
      // log('Photo: $fileName');
      //
      // MultipartFile? profileImgMul = profileImg != null ? await MultipartFile.fromFile(profileImg.path, filename: fileName) : null;

      // // final profileImgMul = await di.MultipartFile.fromFile(profileImg?.path ?? '');
      String? token = sharedPreferences.getString(AppConstants.TOKEN);

      // log('Photo: ${profileImg}');
      // log('Photo: ${profileImg?.path}');
      // log('Photo: ${profileImgMul?.filename}');


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

      Map<String, dynamic> preams = {};
      preams['first_name'] = firstName;
      preams['last_name'] = lastName;
      preams['phone'] = phone;
      preams['email'] = email;
      preams['gender'] = gender;
      preams['date_of_birth'] = dateOfBirth;
      preams['address'] = address;
      preams['photo'] = profileImg?.path;

      // // final formData = FormData.fromMap(preams);
      // final formData = FormData.fromMap({
      //   "first_name": firstName,
      //   "last_name": lastName,
      //   "phone": phone,
      //   "email": email,
      //   "gender": gender,
      //   "date_of_birth": dateOfBirth,
      //   "address": address,
      //   // "photo": profileImgMul,
      // });
      //
      // log('FormData: ${formData.fields}${formData.files.first.value.filename}');

      Dio dio = Dio();

      final response = await dio.put(AppConstants.BASE_URL + AppConstants.PROFILE_EDIT_URI,
          data: preams,
        options: Options(
          headers: {
            'Authorization': token.toString(),
            'accept': 'application/json',
          },
          contentType: 'multipart/form-data',
        ),
      );

      // final response = await apiClient.putData(AppConstants.PROFILE_EDIT_URI, formData,
      //   headers: {'Authorization': token.toString()},
      //   // contentType: 'multipart/form-data',
      // );

      // log('====/@ Token Need: ${response.request?.url ?? ''}');
      // log('====/@ Query Api 1: ${response.request?.url ?? ''}');
      // log('=============@ Response: ${response.body}');
      // return Response(body: response.data, statusCode: response.statusCode!);
      log('Response: ${response.data}');
      return response;
    } catch(e, s){
      if(e is DioError) {
        log('Response: ${e.response?.data}');
        log('Response: ${e.requestOptions.data.files.first.value.filename}');
      }
        log('Error: ', error: e, stackTrace: s);
        rethrow;
    }
  }

}