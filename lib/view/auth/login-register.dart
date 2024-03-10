import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:isletestapp/controller/auth_controller.dart';
import 'package:isletestapp/controller/main%20page/main_page_controller.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/dimensions.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/custom_Image_cached.dart';
import 'package:isletestapp/view/base/custom_button.dart';
import 'package:isletestapp/view/screens/all_popup/otp/custom_popup_design.dart';
import 'package:isletestapp/view/base/custom_snackbar.dart';
import 'package:isletestapp/view/base/my_text_field.dart';
import 'package:isletestapp/view/screens/universal_bottom_nav/universal_bottom_nav.dart';
import '../screens/dashboard/dashboard.dart';

class LoginRegisterPage extends StatefulWidget {
  final bool isFromCart;
  final bool? isbottomSheet;
  final bool isBack;
  const LoginRegisterPage({Key? key, required this.isFromCart, this.isBack = true,  this.isbottomSheet,}) : super(key: key);

  @override
  State<LoginRegisterPage> createState() => _LoginRegisterPageState();
}

class _LoginRegisterPageState extends State<LoginRegisterPage>  with SingleTickerProviderStateMixin {
  TabController? _tabController;
  // late TabController tabController;
  /// for login
  bool isSearchClick=false;
  FocusNode emailFcs = FocusNode();
  FocusNode passFcs = FocusNode();

  /// for register
  TextEditingController phoneCtr2 = TextEditingController();
  FocusNode phoneFcs2 = FocusNode();
  TextEditingController emailCtr2 = TextEditingController();
  FocusNode emailFcs2 = FocusNode();
  TextEditingController passCtr2 = TextEditingController();
  FocusNode passFcs2 = FocusNode();
  TextEditingController conpassCtr2 = TextEditingController();
  FocusNode conpassFcs2 = FocusNode();
  TextEditingController firstnameCtr2 = TextEditingController();
  FocusNode firstnameFcs2 = FocusNode();
  TextEditingController lastnameCtr2 = TextEditingController();
  FocusNode lastnameFcs2 = FocusNode();
  TextEditingController cityCtr2 = TextEditingController();
  FocusNode cityFcs2 = FocusNode();
  TextEditingController stateCtr2 = TextEditingController();
  FocusNode stateFcs2 = FocusNode();
  TextEditingController zipCtr2 = TextEditingController();
  FocusNode zipFcs2 = FocusNode();
  TextEditingController countryCtr2 = TextEditingController();
  FocusNode countryFcs2 = FocusNode();
  TextEditingController addressCtr2 = TextEditingController();
  FocusNode addressFcs2 = FocusNode();
  XFile? result_profile_pic=null;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback(
          (_) {
        if (mounted) {
          _tabController = TabController(vsync: this, length: 2);
          Get.find<MainPageController>().memberShipInfo();
          Get.find<MainPageController>().memberShipBenifitInfo();
          Get.find<AuthController>().setuserName();
          Get.find<AuthController>().getUserName().isNotEmpty
              ? Get.find<AuthController>().isActiveRememberMe = true
              : Get.find<AuthController>().isActiveRememberMe = false;
          Get.find<AuthController>().update();
        }
      },
    );
  }
  // Color tabColor= Colors.redAccent;
  // Color tabColor= Color(0xff0b1d6f);
  bool isChecked = false;

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (controller) {
        return DefaultTabController(
          length: 2,
          child: SafeArea(
            child: Scaffold(
              bottomNavigationBar: widget.isbottomSheet== true ? const UniversalBottomNav() : const SizedBox.shrink(),
              appBar: AppBar(
                elevation: 0,
                iconTheme: const IconThemeData(color: Color(0xff000000)),
                backgroundColor: const Color(0xffFFFFFF),
              ),
              // backgroundColor: Color(0xffEBEFF3),
              backgroundColor: const Color(0xffFFFFFF),
              body:  Column(
                children: [
                  /// Tab Bar Part
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Container(
                      // color: Colors.green,
                      height: 35,
                      child: Container(
                        // color: tabColor,
                        // color: Color(0xffFFFFFF),
                        child: TabBar(
                            controller: _tabController,
                            indicatorColor: const Color(0xffb89600),
                            indicatorWeight: 2.5,
                            tabs: [
                              Tab(
                                  child: Text(
                                    'Login'.toUpperCase(),
                                    style: robotoBlack.copyWith(
                                        color: Colors.black54, fontSize: 13),
                                  )),
                              Tab(
                                  child: Text(
                                    'Register'.toUpperCase(),
                                    style: robotoBlack.copyWith(
                                        color: Colors.black54, fontSize: 13),
                                  )),
                            ]),
                      ),
                    ),
                  ),

                  Expanded(
                    child: TabBarView(
                        controller: _tabController,
                        children: [
                          /// 1 st TAB
                          RefreshIndicator(
                              onRefresh: () async{
                                // showCustomSnackBar("1");
                              },
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    const SizedBox(height: 20),
                                    Text("Welcome".toUpperCase(), style: robotoBold.copyWith(fontSize: 25),),
                                    const SizedBox(height: 1),
                                    Text("Login your Account", style: robotoRegular.copyWith(fontSize: 15),),
                                    const SizedBox(height: 30),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                      child: MyTextField(
                                        isPadding: true,
                                        inputType: TextInputType.emailAddress,
                                        hintText: 'Enter your number or email',
                                        controller: controller.emailCtr,
                                        nextFocus: passFcs,
                                        onSubmit: () {},
                                        focusNode: emailFcs,
                                        height: 45,
                                        // color: Colors.grey,
                                        title: " Number or E-mail",
                                        isRequired: true,
                                        hintStyle: railway.copyWith(fontSize: 12),

                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                      child: MyTextField(
                                        hintText: 'Enter your password',
                                        controller: controller.passCtr,
                                        nextFocus: null,
                                        inputAction: TextInputAction.done,
                                        onSubmit: () {},
                                        focusNode: passFcs,
                                        height: 45,
                                        title: "Password",
                                        isRequired: true,
                                        isPassword: true,
                                        hintStyle: robotoRegular.copyWith(fontSize: 12),
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Transform.scale(
                                            scale: 0.8,
                                            child: CupertinoSwitch(
                                              activeColor: gold,
                                              value: controller.isActiveRememberMe,
                                              thumbColor: Theme.of(context).primaryColor,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  controller.isActiveRememberMe = value;
                                                });
                                              },
                                            ),
                                          ),
                                          Text(
                                            'Save Me',
                                            style: robotoRegular.copyWith(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),

                                    const SizedBox(height: 30),

                                    Padding(
                                      padding: const EdgeInsets.only(left: 20, right: 20),
                                      child: InkWell(
                                        onTap: () {
                                          controller.loginVerification(false);
                                          // loginVerification(controller, widget.isFromCart);
                                        },
                                        child: controller.isLoading?
                                        Center(child: CircularProgressIndicator(color: gold,))
                                            :
                                        CustomButton(
                                          height: Dimensions.BUTTON_HEIGHT,
                                          width: Get.width,
                                          buttonText: 'LOG IN',
                                          myfontweight: FontWeight.bold,
                                          buttontextcolor: Colors.white,
                                          buttoncolor: Colors.black,
                                          fontSize: 14,
                                          radius: 0,
                                          onPressed: () {
                                              if (widget.isFromCart) {
                                                controller.loginVerification(true);
                                              } else {
                                                controller.loginVerification(false);
                                              }
                                              // controller.loginVerification();
                                              // loginVerification(controller, widget.isFromCart);
                                          },
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8, right: 20),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          InkWell(
                                              onTap: () {
                                                Get.dialog(const CustomDialog());
                                                // Get.toNamed(RouteHelper.getForgotPassRoute());
                                              },
                                              child: Text(
                                                'Forgot Password'.tr,
                                                style: robotoRegular.copyWith(
                                                    color: gold),
                                              )),
                                        ],
                                      ),
                                    ),
                             /// guest
                                    Get.find<AuthController>().isLoggedInGuest()? const SizedBox() :
                                    const SizedBox(height: 15),
                                    widget.isFromCart ?
                                    Get.find<AuthController>().isLoggedInGuest()? const SizedBox() :
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20, right: 20),
                                      child: CustomButton(
                                        height: Dimensions.BUTTON_HEIGHT,
                                        width: Get.width,
                                        buttonText: 'GUEST LOGIN',
                                        myfontweight: FontWeight.bold,
                                        buttontextcolor: Colors.white,
                                        buttoncolor: Colors.black,
                                        fontSize: 14,
                                        radius: 0,
                                        onPressed: () {
                                          controller.guestLogin();
                                          Get.back();
                                      /*    Get.to(()=>CheckOutPage(
                                            orderPlaceRequest:controller.orderPlaceRequest,
                                            isleCoupon: controller.islecouponCtr.text, brandCoupon: controller.brandcouponCtr.text,));*/
                                          // controller.loginVerification();
                                        },
                                      ),
                                    )
                                    : const SizedBox(),
                                    const SizedBox(height: 30),
                                    Get.find<MainPageController>().membershipInfoResponse!= null ?
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                          child: Column(
                                            // crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              /// previous
                                        /*      Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: Get.height/8,
                                                    width: Get.width/4,
                                                    // color: Colors.purple,
                                                    child: CustomImageCached(
                                                      isRound: true,
                                                      image: '${AppConstants.BASE_URL}${Get.find<MainPageController>().membershipInfoResponse?.data?.banner ?? ""}',
                                                      // fit: BoxFit.fitHeight,
                                                      // height: 70, width: 110,
                                                      fit: BoxFit.fill,
                                                      // height: Get.height/5.5,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 12),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 4, right: 8, top: 8),
                                                          child: Text(Get.find<MainPageController>().membershipInfoResponse?.data?.rawTitle??"",
                                                              // textAlign: TextAlign.center,
                                                              style: railwaybold.copyWith(fontSize: 15)),
                                                        ),
                                                        const SizedBox(height: 10),
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 4, right: 8, top: 0),
                                                          child: Text(Get.find<MainPageController>().membershipInfoResponse?.data?.subRawTitle??"",
                                                              // textAlign: TextAlign.center,
                                                              style: railway.copyWith(fontSize: 12)),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),*/
                                              Get.find<MainPageController>().isleMemberShipResponse!= null?
                                              Row(
                                                children: [
                                                  Container(
                                                    height: Get.height/7,
                                                    width: Get.width/3,
                                                    // color: Colors.purple,
                                                    child: CustomImageCached(
                                                      isRound: false,
                                                      image: '${AppConstants.BASE_URL}${Get.find<MainPageController>().isleMemberShipResponse?.data?.banner ?? ""}',
                                                      // fit: BoxFit.fitHeight,
                                                      // height: 70, width: 110,
                                                      fit: BoxFit.fill,
                                                      // height: Get.height/5.5,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 20),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 8, right: 8),
                                                          child: Text(Get.find<MainPageController>().isleMemberShipResponse?.data?.shortDescription??"",
                                                              textAlign: TextAlign.center,
                                                              style: railway.copyWith(fontSize: 15)),
                                                        ),
                                                        const SizedBox(height: 12),
                                                        CustomButton(
                                                            onPressed: () {
                                                              // Get.to(const LoginRegisterPage(isFromCart: false, ));
                                                            },
                                                            buttonText: "${Get.find<MainPageController>().isleMemberShipResponse?.data?.buttonTxt??""}".toUpperCase(),
                                                          radius: 0,
                                                          buttoncolor: gold,
                                                          buttontextcolor: Colors.white,
                                                          myfontweight: FontWeight.bold,
                                                          fontSize: 11,
                                                        ),
                                               /*         ElevatedButton(
                                                          // style: raisedButtonStyle,
                                                          style: ElevatedButton.styleFrom(
                                                            shape: const RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.zero
                                                            ), backgroundColor: const Color(0xff2D2D2D),
                                                            minimumSize: const Size.fromHeight(45),
                                                          ),
                                                          onPressed: () {
                                                            Get.to(const LoginRegisterPage(isFromCart: false, ));
                                                          },
                                                          child: Text((Get.find<MainPageController>().isleMemberShipResponse?.data?.buttonTxt??"").toUpperCase(), style: railway.copyWith(fontSize: 11),),
                                                        ),*/
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              )
                                                  : const SizedBox(),
                                              const SizedBox(height: 20),
                                              Get.find<MainPageController>().membershipBenifitInfoResponse!= null?
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text("Membership Benefits", style: railwaybold.copyWith(fontSize: 16),),
                                                  const SizedBox(height: 15),
                                                  ListView.builder(
                                                      itemCount: Get.find<MainPageController>().membershipBenifitInfoResponse!.data!.length,
                                                      shrinkWrap: true,
                                                      physics: const NeverScrollableScrollPhysics(),
                                                      itemBuilder: (BuildContext context, int index) {
                                                        return Padding(
                                                          padding: const EdgeInsets.only(top : 4, bottom: 4),
                                                          child: Row(
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children: [
                                                              CustomImageCached(
                                                                image: "${AppConstants.BASE_URL}${Get.find<MainPageController>().membershipBenifitInfoResponse!.data![index]!.img??""}",
                                                                height: 22,
                                                                width: 22,
                                                              ),
                                                              const SizedBox(width: 12),
                                                              Expanded(child: Text(Get.find<MainPageController>().membershipBenifitInfoResponse?.data?[index]?.title??"",
                                                                style: railway.copyWith(fontSize: 12),))
                                                            ],
                                                          ),
                                                        );
                                                      }
                                                  )
                                                ],
                                              )
                                                  : const SizedBox()
                                            ],
                                          ),
                                        ),
                                      ],
                                    ) : const SizedBox(),


                                    const SizedBox(height: 50)

                                  ],
                                ),


                              )

                          ),

                          /// 2nd TAB
                          RefreshIndicator(
                              onRefresh: () async{
                                // showCustomSnackBar("2");
                              },
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    const SizedBox(height: 30),
                                    Text("Hello".toUpperCase(), style: robotoBold.copyWith(fontSize: 25),),
                                    const SizedBox(height: 1),
                                    Text("Create An Account.", style: robotoRegular.copyWith(fontSize: 15),),
                                    const SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                      child: MyTextField(
                                        height: 45,
                                        inputType: TextInputType.emailAddress,
                                        controller: emailCtr2,
                                        focusNode: emailFcs2,
                                        nextFocus: passFcs2,
                                        title: "Enter your Phone Number or Email",
                                        hintText: "Enter your Phone Number or Email",
                                        // color: Colors.grey,
                                        isRequired: true,
                                        hintStyle: robotoRegular.copyWith(fontSize: 12),

                                      ),
                                    ),

                                    const SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                      child: MyTextField(
                                        height: 45,
                                        // inputType: TextInputType.,
                                        controller: passCtr2,
                                        focusNode: passFcs2,
                                        // nextFocus: conpassFcs2,
                                        title: "Create password (minimum 6 characters)",
                                        hintText: "Enter your password",
                                        // color: Colors.grey,
                                        isRequired: true,
                                        isPassword: true,
                                        hintStyle: robotoRegular.copyWith(fontSize: 12),

                                      ),
                                    ),

                                    const SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                      child: MyTextField(
                                        height: 45,
                                        // inputType: TextInputType.,
                                        controller: conpassCtr2,
                                        focusNode: conpassFcs2,
                                        // nextFocus: conpassFcs2,
                                        title: "Confirm password",
                                        hintText: "Confirm your password",
                                        // color: Colors.grey,
                                        isRequired: true,
                                        isPassword: true,
                                        hintStyle: robotoRegular.copyWith(fontSize: 12),

                                      ),
                                    ),

                                    const SizedBox(height: 40),

                                    Padding(
                                      padding: const EdgeInsets.only(left: 20, right: 20),
                                      child: controller.isLoading?
                                      const Center(child: CircularProgressIndicator())
                                          :
                                      CustomButton(
                                        height: Dimensions.BUTTON_HEIGHT,
                                        width: Get.width,
                                        buttonText: 'CREATE ACCOUNT',
                                        myfontweight: FontWeight.bold,
                                        buttontextcolor: Colors.white,
                                        buttoncolor: Colors.black,
                                        fontSize: 14,
                                        radius: 0,
                                        onPressed: () {
                                          signupValidation(controller);
                                          _tabController?.animateTo(0);
                                        },
                                      ),
                                    ),
                                    const SizedBox(height: 30),

                                    Get.find<MainPageController>().membershipInfoResponse!= null ?
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                          child: Column(
                                            // crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: Get.height/8,
                                                    width: Get.width/4,
                                                    // color: Colors.purple,
                                                    child: CustomImageCached(
                                                      isRound: true,
                                                      image: '${AppConstants.BASE_URL}${Get.find<MainPageController>().membershipInfoResponse?.data?.banner ?? ""}',
                                                      // fit: BoxFit.fitHeight,
                                                      // height: 70, width: 110,
                                                      fit: BoxFit.fill,
                                                      // height: Get.height/5.5,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 12),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 4, right: 8, top: 8),
                                                          child: Text(Get.find<MainPageController>().membershipInfoResponse?.data?.rawTitle??"",
                                                              // textAlign: TextAlign.center,
                                                              style: railwaybold.copyWith(fontSize: 15)),
                                                        ),
                                                        const SizedBox(height: 10),
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 4, right: 8, top: 0),
                                                          child: Text(Get.find<MainPageController>().membershipInfoResponse?.data?.subRawTitle??"",
                                                              // textAlign: TextAlign.center,
                                                              style: railway.copyWith(fontSize: 12)),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 20),
                                              Get.find<MainPageController>().membershipBenifitInfoResponse!= null?
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text("Membership Benefits", style: railwaybold.copyWith(fontSize: 16),),
                                                  const SizedBox(height: 15),
                                                  ListView.builder(
                                                      itemCount: Get.find<MainPageController>().membershipBenifitInfoResponse!.data!.length,
                                                      shrinkWrap: true,
                                                      physics: const NeverScrollableScrollPhysics(),
                                                      itemBuilder: (BuildContext context, int index) {
                                                        return Padding(
                                                          padding: const EdgeInsets.only(top : 4, bottom: 4),
                                                          child: Row(
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children: [
                                                              CustomImageCached(
                                                                image: "${AppConstants.BASE_URL}${Get.find<MainPageController>().membershipBenifitInfoResponse!.data![index]!.img??""}",
                                                                height: 22,
                                                                width: 22,
                                                              ),
                                                              const SizedBox(width: 12),
                                                              Expanded(child: Text(Get.find<MainPageController>().membershipBenifitInfoResponse?.data?[index]?.title??"",
                                                                style: railway.copyWith(fontSize: 12),))
                                                            ],
                                                          ),
                                                        );
                                                      }
                                                  )
                                                ],
                                              )
                                                  : const SizedBox()
                                            ],
                                          ),
                                        ),
                                      ],
                                    ) : const SizedBox(),


                                    const SizedBox(height: 50)
                                  ],
                                ),


                              )

                          ),

                        ]),
                  )
                ],
              ),
            ),
          ),
        );
      }
    );
  }

  bool isEmailValid(String input) {
    return RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
    ).hasMatch(input);
  }

  void signupValidation(AuthController controller) {
    String user = emailCtr2.text.trim();
    String password = passCtr2.text.trim();
    String confirmPass = conpassCtr2.text.trim();

    if (user.isNotEmpty) {
      if (password.isNotEmpty) {
        if(confirmPass.isNotEmpty){
          if(passCtr2.text.trim() == conpassCtr2.text.trim()){
            if (isEmailValid(user)) {
              log('Email: $user');
              controller.signup(
                email: user,
                password: passCtr2.text,
              );
              Get.off(()=> const Dashboard(pageIndex: 5, ));
            } else if (password.length < 4) {
              showCustomSnackBar('The Password must be at least 5 Characters');
            } else{
              log('Phone: $user');
              controller.signup(
                phone: user,
                password: passCtr2.text,
              );
            }
          } else {
            showCustomSnackBar("This Password Not Match".tr);
          }
        } else {
          showCustomSnackBar("Please Enter Your Confirm Password");
        }
      }
      else {
        showCustomSnackBar("Please Enter Password");
      }
    }
    else {
      showCustomSnackBar('Enter User ID');
    }
  }

}
