import 'dart:developer';
import 'dart:io';
import 'package:get/get.dart';
import 'package:isletestapp/data/api/api_checker.dart';
import 'package:isletestapp/view/base/custom_snackbar.dart';
import 'profile_image_repo.dart';


class ProfileImageController extends GetxController implements GetxService {
  final ProfileImageRepo profileImageRepo;
  ProfileImageController({required this.profileImageRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> userProfileEdit({
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
      _isLoading = true;
      update();
      Response response = await profileImageRepo.userProfileEdit(
        firstName: firstName,
        lastName: lastName,
        phone: phone,
        email: email,
        gender: gender,
        dateOfBirth: dateOfBirth,
        address: address,
        profileImg: profileImg,
      );

      log('Profile Response: ${response.request?.url ?? ''}');
      log('Profile Image: ${profileImg?.path ?? ''}');
      if (response.statusCode == 200) {

        showCustomSnackBar("Updated successfully");
        // update();
        //Get.to(QuestionForm( grade: grade, name: name,email: email,phone: phone, address: address,seconds: totalDuration,));
      } else {
        ApiChecker.checkApi(response);
        // showCustomSnackBar(response.statusCode!.toString());
      }
      _isLoading = false;
      update();
    } catch(e, s){
      log('Error: ', error: e, stackTrace: s);
    }
  }

}
