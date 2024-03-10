import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/forgot_password_controller/forgot_password_controller.dart';
import 'package:isletestapp/util/dimensions.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/custom_Image_cached.dart';
import 'package:isletestapp/view/base/custom_button.dart';
import 'package:isletestapp/view/base/my_text_field.dart';

class ChangePasswordDialog extends StatelessWidget {
  final String? otpToken;
  const ChangePasswordDialog({super.key,
     this.otpToken,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController subscribeCtr = TextEditingController();
    FocusNode newPasswordFcs = FocusNode();

    return GetBuilder<ForgotPasswordController>(
      builder: (controller) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4)),
          insetPadding: EdgeInsets.all(15),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.only(right: 10,top: 10),
                  alignment: Alignment.topRight,
                  child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Image.asset(Images.error,height: 20,width: 20,)),
                ) ,
                // SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text('Change Your New Password',style: robotoBlack.copyWith(fontSize: 20)),
                ),
         /*       SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Text('Enter Your OTP Get in Email/Phone',
                      style: railwaybold.copyWith(color: Colors.grey, fontSize: 11)),
                ),*/
                SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: MyTextField(
              height: 45,
              titlesize: 11,
              controller: controller.changePassCtr,
              focusNode: newPasswordFcs,
              hintText: "Enter Your New Password",
              title: "Enter Your New Password",
              // titlesize: ,
              hintStyle: robotoRegular.copyWith(fontSize: 11),
            ),
          ),


                SizedBox(height: 30),

                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: CustomButton(
                      height: 45,
                      fontSize: 13,
                      buttontextcolor: Colors.white,
                      radius: 0,
                      onPressed: () {
                        print("token==${otpToken}");
                        String token = otpToken ?? "";
                        String newPassword = controller.changePassCtr.text ?? "";
                          controller.submitNewPassword(
                              token: token,
                              new_password: newPassword
                          );
                      },
                      buttonText: "SET PASSWORD".toUpperCase()
                  ),
                ),

                SizedBox(height: 30),
              ],
            ),
          ),
        );
      }
    );
  }
}
