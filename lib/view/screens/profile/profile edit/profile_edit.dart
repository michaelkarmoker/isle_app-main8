import 'dart:developer';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:isletestapp/controller/profile/user/user_profile_controller.dart';
import 'package:isletestapp/data/model/response/profile/get_profile_response.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/ProgressHUD.dart';
import 'package:isletestapp/view/base/custom_Image_cached.dart';
import 'package:isletestapp/view/base/custom_button.dart';
import 'package:isletestapp/view/base/custom_date_picker.dart';
import 'package:isletestapp/view/base/custom_snackbar.dart';
import 'package:isletestapp/view/base/my_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../controller/profile/profile_image/profile_image_controller.dart';
import '../../../../util/text_SIZE.dart';

class UserProfileEdit extends StatefulWidget {
  UserProfileEdit({Key? key}) : super(key: key);
  @override
  State<UserProfileEdit> createState() => _TProfileEditFormState();
}

class _TProfileEditFormState extends State<UserProfileEdit> {
  String? selectedGender = 'male';
  // List<String> gender = [];
  TextEditingController fromdateController = TextEditingController();
  DateTime currentDate = DateTime.now();

  Future<void> _selectfromDate(BuildContext context,) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(1980),
        lastDate: DateTime(2030));
    if (pickedDate != null && pickedDate != currentDate) {
      setState(() {
        fromdateController.text = pickedDate.toString().substring(0, 10);
      });
    }
  }

  // int? selectedValue;

  TextEditingController firstnameCtr = TextEditingController();
  TextEditingController lastnameCtr = TextEditingController();
  TextEditingController phoneCtr = TextEditingController();
  TextEditingController emailCtr = TextEditingController();
  TextEditingController addressCtr = TextEditingController();

  TextEditingController currentPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  FocusNode firstnameFcs = FocusNode();
  FocusNode lastnameFcs = FocusNode();
  FocusNode phonenameFcs = FocusNode();
  FocusNode emailnameFcs = FocusNode();
  FocusNode addressFcs = FocusNode();

  // FocusNode currentPasswordFcs = FocusNode();
  // FocusNode newPasswordFcs = FocusNode();
  // FocusNode confirmPasswordFcs = FocusNode();

  File? pickFIleImage;

  String? isEmail;
  String? isPhone;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) =>  Get.find<UserProfileController>().getProfileData().then((value) => {
      setProfileInfo(Get.find<UserProfileController>().userProfileResponse!)}
    ));
    final userResponse = Get.find<UserProfileController>().userProfileResponse;
    // isEmail = userResponse?.data?.email ?? '';
    SharedPreferences.getInstance().then((SharedPreferences prefs) {
      isEmail = prefs.getString(AppConstants.USER_NAME);
      log('Is Email: $isEmail');
    });
  }

  void setProfileInfo(UserProfileResponse userProfileResponse) {
    firstnameCtr.text = userProfileResponse.data!.firstName ?? "";
    lastnameCtr.text = userProfileResponse.data!.lastName ?? "";
    phoneCtr.text = userProfileResponse.data!.phone ?? "";
    emailCtr.text = userProfileResponse.data!.email ?? "";
    fromdateController.text = userProfileResponse.data!.dateOfBirth!.substring(0,10) ?? "";
    addressCtr.text = userProfileResponse.data!.address ?? "";
    selectedGender = userProfileResponse.data?.gender ?? '';
    // selectedGender = gender[teacherProfileResponse.teacher!.gender!];
    // selectedMaritStatus = bia[teacherProfileResponse.teacher!.maritalStatus!];
    // selectedBlood = teacherProfileResponse.teacher!.bloodGroup!;
  }

  bool isEmailValid(String input) {
    return RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
    ).hasMatch(input);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileImageController>(builder: (userProfileController){
      return GetBuilder<UserProfileController>(builder: (controller) {
        return Scaffold(
          // backgroundColor: Colors.red,
          appBar: AppBar(
            title: Text("Edit Profile", style: railway.copyWith(fontSize: 18, color: Colors.black),),
            iconTheme: const IconThemeData(color: Color(0xff000000)),
            titleSpacing: 0,
            backgroundColor: const Color(0xffFFFFFF),
            centerTitle: true,
            elevation: 0,
            leadingWidth: Get.width / 3.5,
            // toolbarHeight: 62,
            /*   title: Container(
            // color: Colors.red,
              height: 35, width: 100,
              child: Image.asset(Images.logo, height: 35, width: 100)),*/
          ),
          // backgroundColor: Color(0xffEBEFF3),
          backgroundColor: const Color(0xffFFFFFF),
          body:  ProgressHUD(
            inAsyncCall: controller.isLoading,
            child: SingleChildScrollView(
              child: Container(
                color: const Color(0xffF2F3F9),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 150.0,
                            width: 150.0,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                const BorderRadius.all(Radius.circular(300)),
                                border:
                                Border.all(width: 5, color: Colors.white)),
                            alignment: Alignment.center,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(300),
                              child: pickFIleImage == null
                                  ? CustomImageCached(
                                placeholder: "assets/image/placeholder.png",
                                // image: "",
                                image: '${AppConstants.BASE_URL}${controller.userProfileResponse!.data!.photo??""}',
                                // '${AppConstants.MERCHANT_IMAGE_URL} ${controller.teacherProfileResponse!.teacher!.photo??""}',
                                fit: BoxFit.fill,
                              )
                                  : Image.file(
                                File(pickFIleImage!.path),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Positioned(
                              bottom: 4,
                              right: 6,
                              child: InkWell(
                                onTap: () async {
                                  try {
                                    FilePickerResult? selectImg = await FilePicker.platform.pickFiles(
                                      type: FileType.custom,
                                      allowCompression: true,
                                      allowedExtensions: ['jpg', 'png', 'jpeg' , 'webp'],
                                      allowMultiple: false, );
                                    if(selectImg?.files.first.path != null) {
                                      setState(() {
                                        pickFIleImage = File(selectImg!.files.first.path!);
                                      });
                                    }
                                    log('Image Url: ${selectImg?.files.first.path}');
                                  } catch (e, s) {
                                    log('Error: ', error: e, stackTrace: s);
                                    showCustomSnackBar("Something Error");
                                  }
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey[400],
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(30))),
                                    padding: const EdgeInsets.all(8),
                                    child: const Icon(
                                      Icons.camera_alt,
                                      color: Colors.black,
                                      size: 18,
                                    )),
                              ))
                        ],
                      ),
                      const SizedBox(height: 20),
                      /*            Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: gold,
                          borderRadius: BorderRadius.circular(2)),
                      child: Center(
                        child: Text(
                          'personal_info'.tr,
                          style: robotoMedium.copyWith(
                              fontSize: 16, color: btntext),
                        ),
                      ),
                    ),*/
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: gold,
                            width: 1,
                            // style: BorderStyle.solid,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 12),
                            MyTextField(
                              isPadding: true,
                              title: 'First Name',
                              controller: firstnameCtr,
                              focusNode: firstnameFcs,
                              isRequired: true,
                              hintText: 'Enter your first name',
                            ),
                            const SizedBox(height: 12),
                            MyTextField(
                              isPadding: true,
                              title: 'Last Name',
                              controller: lastnameCtr,
                              focusNode: lastnameFcs,
                              isRequired: true,
                              hintText: 'Enter your last name',
                            ),
                            const SizedBox(height: 12),
                            MyTextField(
                              isPadding: true,
                              title: 'Phone',
                              controller: phoneCtr,
                              focusNode: phonenameFcs,
                              isRequired: true,
                              hintText: 'Enter your phone number',
                            ),
                            const SizedBox(height: 12),
                            MyTextField(
                              title: 'Email',
                              controller: emailCtr,
                              focusNode: emailnameFcs,
                              hintText: 'Enter your Email',
                            ),
                            const SizedBox(height: 12),
                            CustomDatePickerWithTitle(
                              height: 47,
                              controller: fromdateController,
                              title: 'Date',
                              onpressed: () => _selectfromDate(context),
                            ),
                            const SizedBox(height: 12),
                            MyTextField(
                              title: 'Address',
                              controller: addressCtr,
                              focusNode: addressFcs,
                              hintText: 'Enter your address',
                            ),
                            const SizedBox(height: 12),
                            Text('Gender', style: railway.copyWith(fontSize: 14)),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Radio(
                                      value: 'male',
                                      groupValue: selectedGender,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedGender = value as String;
                                        });
                                      },
                                    ),
                                    const Text('Male'),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio(
                                      value: 'female',
                                      groupValue: selectedGender,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedGender = value as String;
                                        });
                                      },
                                    ),
                                    const Text('Female'),
                                  ],
                                ),
                              ],
                            )


                          ],
                        ),
                      ),

                      const SizedBox(height: 30),

                      CustomButton(
                          onPressed: () {
                            validationEdit(controller);
                          },
                          buttoncolor: gold,
                          fontSize: 15,
                          myfontweight: FontWeight.bold,
                          buttonText: "SUBMIT"),

                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: gold,
                            width: 1,
                            // style: BorderStyle.solid,
                          ),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 12),
                            MyTextField(
                              title: 'Current Password',
                              controller: currentPassword,
                              hintText: 'Enter your Current Password',
                              isPassword: true,
                            ),
                            const SizedBox(height: 12),
                            MyTextField(
                              title: 'New Password',
                              controller: newPassword,
                              hintText: 'Enter your new password',
                              isPassword: true,
                            ),
                            const SizedBox(height: 12),
                            MyTextField(
                              title: 'Confirm Password',
                              controller: confirmPassword,
                              hintText: 'Enter your confirm password',
                              isPassword: true,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 30),

                      CustomButton(
                          onPressed: () {
                            if (currentPassword.text.toString().isNotEmpty) {
                              if (newPassword.text.toString().isNotEmpty) {
                                if (confirmPassword.text.toString().isNotEmpty) {
                                  if(newPassword.text.toString() == confirmPassword.text.toString()){
                                    // Check if the input is a valid email
                                    if (isEmailValid(isEmail!)) {
                                      // Input is an email
                                      controller.userChangePassword(
                                        email: isEmail,
                                        password: currentPassword.text.trim() ?? '',
                                        newPassword: newPassword.text.trim() ?? '',
                                      ).whenComplete((){
                                        currentPassword.clear();
                                        newPassword.clear();
                                        confirmPassword.clear();
                                      });
                                    } else {
                                      // Input is a phone number
                                      controller.userChangePassword(
                                        phone: isEmail,
                                        password: currentPassword.text.trim() ?? '',
                                        newPassword: newPassword.text.trim() ?? '',
                                      ).whenComplete((){
                                        currentPassword.clear();
                                        newPassword.clear();
                                        confirmPassword.clear();
                                      });
                                    }
                                  } else {
                                    showCustomSnackBar("This Password Not Match".tr);
                                  }
                                } else {
                                  showCustomSnackBar("Enter Your Confirm Password".tr);
                                }
                              } else {
                                showCustomSnackBar("Enter Your New Password".tr);
                              }
                            } else {
                              showCustomSnackBar("Enter Your Current Password".tr);
                            }

                          },
                          buttoncolor: gold,
                          fontSize: 15,
                          myfontweight: FontWeight.bold,
                          buttonText: "UPDATE PASSWORD"),
                      // SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      });
    });
  }

  void validationEdit(UserProfileController controller) {
    print("dsfdsgfsdgdsfg");
    if (firstnameCtr.text.toString().isNotEmpty) {
      if (lastnameCtr.text.toString().isNotEmpty) {
        if (phoneCtr.text.toString().isNotEmpty) {
          if (emailCtr.text.toString().isNotEmpty) {
            // if (selectedGender != null) {
              // if (fromdateController.text.toString().isNotEmpty) {
                // if (selectedBlood != null) {

            controller.userProfileEdit(
                    firstName: firstnameCtr.text,
                    lastName: lastnameCtr.text,
                    phone: phoneCtr.text,
                    email: emailCtr.text,
                    address: addressCtr.text,
                    dateOfBirth: fromdateController.text,
                    profileImg: pickFIleImage,
                    gender: selectedGender.toString(),
                  );

                  // controller.userProfileEdit(
                  //   first_name: firstnameCtr.text,
                  //   last_name: lastnameCtr.text,
                  //   phone: phoneCtr.text,
                  //   email: emailCtr.text,
                  //   address: addressCtr.text,
                  //   date_of_birth: fromdateController.text,
                  //   // state_id: "",
                  //   // district_id: "",
                  //   // sub_district_id: "",
                  //   photo: result,
                  //   // gender: gender.indexOf(selectedGender!).toString(),
                  //   gender: "",
                  //
                  //
                  //
                  // /*  birthdate: fromdateController.text,
                  //   gender: gender.indexOf(selectedGender!).toString(),
                  //   blood_group: selectedBlood!,*/
                  //
                  // );
                // }
                // else {
                //   showCustomSnackBar("blood_snack".tr);
                // }
              // }
              // else {
              //   showCustomSnackBar("marit_snack".tr);
              // }
            // }
            // else {
            //   showCustomSnackBar("gender_snack".tr);
            // }
          } else {
            showCustomSnackBar("phone_snack".tr);
          }
        } else {
          showCustomSnackBar("phone_snack".tr);
        }
      } else {
        showCustomSnackBar("email_snack".tr);
      }
    } else {
      showCustomSnackBar("name_snack".tr);
    }
  }
}
