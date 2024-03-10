import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/auth_controller.dart';
import 'package:isletestapp/controller/cart/cart_controller.dart';
import 'package:isletestapp/controller/checkOut/checkout_controller.dart';
import 'package:isletestapp/controller/profile/user/user_profile_controller.dart';
import 'package:isletestapp/controller/thank%20you%20controller/thank_you_controller.dart';
import 'package:isletestapp/data/model/response/profile/get_profile_response.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/constants.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/coustom_searching.dart';
import 'package:isletestapp/view/base/custom_Image_cached.dart';
import 'package:isletestapp/view/base/custom_button.dart';
import 'package:isletestapp/view/base/custom_dropdown.dart';
import 'package:isletestapp/view/base/custom_snackbar.dart';
import 'package:isletestapp/view/base/my_text_field.dart';
import 'package:isletestapp/view/screens/all_popup/delivery_type_vendor_product_popup.dart';
import 'package:isletestapp/view/screens/all_popup/info_popup.dart';
import 'package:isletestapp/view/screens/custom%20logo/custom_logo_widget.dart';
import 'package:isletestapp/view/screens/feedback/feedback_page.dart';
import 'package:isletestapp/view/screens/order%20track/order_track_page.dart';
import 'package:isletestapp/view/screens/profile/view_profile.dart';
import 'package:isletestapp/view/screens/universal_bottom_nav/universal_bottom_nav.dart';
import '../../../controller/order track/order_track_controller.dart';
import '../../../data/model/request model/order_place_request.dart';
import '../../../data/model/response/profile/address book/user_addressbook_response.dart';
import '../all_popup/product_feedback_popup.dart';
import '../profile/orders returns/order_returns_track.dart';
import '../profile/orders returns/orders_returns_details.dart';

class CheckOutPage extends StatefulWidget {
  final String? orderNumber;
  final String? isleCoupon;
  final String? brandCoupon;
  final OrderPlaceRequest? orderPlaceRequest;
// final String
  final int? pageIndex;
  CheckOutPage({Key? key,
    this.pageIndex,
    this.isleCoupon,
    this.brandCoupon,
    this.orderPlaceRequest, this.orderNumber,

  }) : super(key: key);
  bool isExpanded1 = false;
  bool isExpanded2 = false;
  bool isExpanded3 = false;

  bool isExpanded4 = false;
  bool isExpanded5 = false;
  bool isExpanded6 = false;
  bool isExpanded7 = false;
  bool isExpandedSize = false;

  bool childexp1 = false;
  bool childexp2 = false;
  bool childexp3 = false;
  bool childexp4 = false;
  bool childexp5 = false;
  bool childexp6 = false;
  @override
  State<CheckOutPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<CheckOutPage> with SingleTickerProviderStateMixin{
  bool _showProgress = true;
  bool isCashTapped = true; // Add this variable to track the tap state
  late TabController _tabController;
  FocusNode addressFcs = FocusNode();
  FocusNode firstNameFcs = FocusNode();
  FocusNode lastNameFcs = FocusNode();
  FocusNode phoneFcs = FocusNode();
  FocusNode emailFcs = FocusNode();
  FocusNode specialnoteFcs = FocusNode();
  FocusNode addressTypeFcs = FocusNode();
  bool isOpen=false;

  bool isBiling = false;

  UserAddressBookData? primaryAddressBook;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
          _tabController = TabController(vsync: this, length: 3);
          Get.find<UserProfileController>().getAddressBookData();
          Get.find<CheckOutController>().getGeneralSettingData();
          Get.find<CheckOutController>().getBagPageCartData();
          Get.find<CheckOutController>().getAllDeliveryTypeData();
          Get.find<CheckOutController>().orderPlaceRequest = widget.orderPlaceRequest!;
          Get.find<CheckOutController>().dataInitialize();
          Get.find<CheckOutController>().getBagPageCartDataForVendorType();
          //
          // List<UserAddressBookData> userAddressBookList = Get.find<UserProfileController>().userAddressBookList;
          //
          // // // Find the address book entry where isPrimary is true
          // UserAddressBookData? primaryAddressBook = userAddressBookList.firstWhere(
          //         (addressBook) => addressBook.isPrimary == true);
          //
          // // Set selectedDivision to the district name if found, otherwise set it to an empty string
          // Get.find<CheckOutController>().selectedDivision = primaryAddressBook?.state?.name ?? '';
          // Get.find<CheckOutController>().selectedDistrict = primaryAddressBook?.district?.name ?? '';
          // Get.find<CheckOutController>().selectedThana = primaryAddressBook?.subDistrict?.name ?? '';
          // Get.find<CheckOutController>().addressCtr.text = primaryAddressBook?.address ?? "";
          Get.find<UserProfileController>().getAddressBookData().then((value){
            List<UserAddressBookData> userAddressBookList = Get.find<UserProfileController>().userAddressBookList;

            primaryAddressBook = userAddressBookList.firstWhere(
                    (addressBook) => addressBook.isPrimary == true);
            Get.find<CheckOutController>().selectedDivision = primaryAddressBook?.state?.name ?? '';
            Get.find<CheckOutController>().selectedDistrict = primaryAddressBook?.district?.name ?? '';
            Get.find<CheckOutController>().selectedThana = primaryAddressBook?.subDistrict?.name ?? '';
            Get.find<CheckOutController>().addressCtr.text = primaryAddressBook?.address ?? "";
          });

          Get.find<UserProfileController>().getProfileData().then((value) {
            UserProfileResponse? userProfileResponse = Get.find<UserProfileController>().userProfileResponse;
            if (userProfileResponse != null) {
              setProfileInfo(userProfileResponse);
            }
          });

          Future.delayed(const Duration(seconds: 10), () {
            if (mounted) {
              // Check if the widget is still mounted before updating the state
              setState(() {
                _showProgress = false;
              });
            }
          });


        });
  }

  void setProfileInfo(UserProfileResponse userProfileResponse) {
    // Get.find<CheckOutController>().selectedDivision = Get.find<UserProfileController>().userAddressBookList.map((item) => item.isPrimary) == true ? Get.find<UserProfileController>().userAddressBookList[0].district?.name ?? '' : '';
    Get.find<CheckOutController>().firstNameCtr.text = userProfileResponse.data?.firstName ?? "";
    Get.find<CheckOutController>().lastNameCtr.text = userProfileResponse.data?.lastName ?? "";
    Get.find<CheckOutController>().phoneCtr.text = userProfileResponse.data?.phone ?? "";
    Get.find<CheckOutController>().emailCtr.text = userProfileResponse.data?.email ?? "";
    // Get.find<CheckOutController>().addressCtr.text = userProfileResponse.data?.address ?? "";
    //  Get.find<CheckOutController>().specialnoteCtr.text = userProfileResponse.data?.s ?? "";
    // addressCtr.text = userProfileResponse.data?.address ?? "";
    // fromdateController.text = userProfileResponse.data?.dateOfBirth?.substring(0, 10) ?? "";
    // Perform null checks for other properties if needed
    // selectedGender = gender[userProfileResponse.teacher?.gender ?? ""];
    // selectedMaritStatus = bia[userProfileResponse.teacher?.maritalStatus ?? ""];
    // selectedBlood = userProfileResponse.teacher?.bloodGroup ?? "";
  }
  // Color tabColor = Color(0xff0b1d6f);
  Color tabColor = gold;
  Color button1Color = gold;
  Color button2Color = gold;
  Color button3Color = gold;
  // Color button3Color = Colors.grey;
  void changeColor(int buttonNumber) {
    setState(() {
      switch (buttonNumber) {
        case 1:
          button1Color = gold;
          button2Color = gold;
          button3Color = gold;
          break;
        case 2:
          button1Color = gold;
          button2Color = gold;
          button3Color = gold;
          break;
        case 3:
          button1Color = gold;
          button2Color = gold;
          button3Color = gold;
          break;
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    Get.find<UserProfileController>().getAddressBookData();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (cartController) {
        return GetBuilder<OrderTrackController>(
            builder: (orderController){
              return GetBuilder<ThankYouController>(builder: (thankController){
                return GetBuilder<UserProfileController>(
                    builder: (userController){
                      return GetBuilder<CheckOutController>(
                          builder: (controller) {
                            return Container(
                              // width: Get.width/1.18,
                              child: DefaultTabController(
                                length: 3,
                                child: Scaffold(
                                  bottomNavigationBar: const UniversalBottomNav(),
                                  appBar: AppBar(
                                    iconTheme: const IconThemeData(color: Color(0xff000000)),
                                    titleSpacing: 0,
                                    backgroundColor: const Color(0xffFFFFFF),
                                    centerTitle: true,
                                    elevation: 0,
                                    leadingWidth: Get.width / 3.5,
                                    actions: [
                                      InkWell(
                                          onTap: () {
                                            Get.to(
                                              showModalBottomSheet(
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return InfoPopup();
                                                },
                                              ),
                                            );
                                          },
                                          child: Image.asset(Images.info, height: 20, width: 20, color: const Color(0xff000000),)),
                                      const SizedBox(width: 10),
                                    ],
                                    title: const CustomLogo(),
                                  ),
                                  // backgroundColor: Color(0xffEBEFF3),
                                  backgroundColor: const Color(0xffFFFFFF),
                                  body: Column(
                                    children: [
                                      const SizedBox(height: 5),
                                      Column(
                                        children: [
                                          Text("Shipping Address",  style: railway.copyWith(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),),
                                          const SizedBox(height: 3),
                /*                          Text("Steps 1/3",  style: poppins.copyWith(
                                            fontSize: 9,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey.shade600,
                                          ),),*/
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      /// Tab Bar Part
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8, right: 8),
                                        child: Container(
                                          // color: Color(0xffFFFFFF),
                                          height: 45,
                                          child: Container(
                                            // color: tabColor,
                                            // color: Color(0xffFFFFFF),
                                            child: TabBar(
                                                isScrollable: false,
                                                controller: _tabController,
                                                indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
                                                onTap: (index) {
                                                  setState(() {
                                                    if (index == 0) {
                                                      tabColor = gold;
                                                      _tabController.animateTo(0);
                                                    }
                                                    if (index == 1) {
                                                      tabColor = gold;
                                                      _tabController.animateTo(1);
                                                    }
                                                    if (index == 2) {
                                                      tabColor = gold;
                                                      _tabController.animateTo(2);
                                                    }
                                                  });
                                                  print(index);
                                                },
                                                indicatorColor: tabColor,
                                                indicatorWeight: 2.5,
                                                tabs: [
                                                  Tab(
                                                      child: Image.asset(
                                                        Images.car,

                                                        color: Colors.black, height: 25,width: 25,
                                                      )),
                                                  Tab(
                                                      child: Image.asset(
                                                        Images.bankcard,

                                                        color: Colors.black, height: 25,width: 25,
                                                      )),
                                                  Tab(
                                                      child: Image.asset(
                                                        Images.like,

                                                        color: Colors.black, height: 25,width: 25,
                                                      )),
                                                ]),
                                          ),
                                        ),
                                      ),
                                      const Divider(
                                        height: 10,
                                        thickness: 10,
                                        color: Color(0xffF2F6F9),
                                        // color: Colors.pink,
                                      ),
                                      Expanded(
                                        child: TabBarView(
                                            physics: const NeverScrollableScrollPhysics(),
                                            controller: _tabController,
                                            children: [
                                              /// 1 st TAB
                                              RefreshIndicator(
                                                onRefresh: () async {
                                                  // showCustomSnackBar("2");
                                                },
                                                child: SingleChildScrollView(
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 8, right: 8),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        /*     // Image.asset(Images.map),
                                          Divider(
                                            thickness: 15,
                                            height: 15,
                                            color: Color(0xffF2F6F9),
                                          ),*/
                                                        const SizedBox(height: 8),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Text("Shipping Address", style: railwaybold.copyWith(fontSize: 16,  fontWeight: FontWeight.w700,),),
                                                            GestureDetector(
                                                                onTap: () {
                                                                  /* Get.back();*/
                                                                  Get.to(()=> ViewProfile(/*userProfileCon: userController*/));
                                                                },
                                                                child: Text("Change Primary Address", style: railwaybold.copyWith( decoration: TextDecoration.underline,fontSize: 12,  fontWeight: FontWeight.w700,),)),
                                                            /*                Container(
                                                color: Colors.black,
                                                height: 30,
                                                width: 120,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Image.asset(Images.location, height: 15, width: 15,
                                                      color: Colors.white,
                                                    ),
                                                    const SizedBox(width: 10),
                                                    Text("Find Me on Map".toUpperCase(),
                                                      style: railway.copyWith(fontSize: 8, color: Colors.white),
                                                    ),
                                                  ],
                                                ),
                                              ),*/
                                                          ],
                                                        ),
                                                        const SizedBox(height: 20),
                                                        Container(
                                                          height: 30,
                                                          color: Colors.grey.shade200,
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Padding(
                                                                padding: const EdgeInsets.only(left: 8),
                                                                child: Text("Location".toUpperCase(), style: railwaybold.copyWith(color: Colors.black54 ,fontSize: 9,  fontWeight: FontWeight.w700,),),
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsets.only(right: 8),
                                                                child: Text("*Required fields", style: railwaybold.copyWith( color: Colors.black87 ,fontSize: 9,  fontWeight: FontWeight.w700,),),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        const SizedBox(height: 12),
                                                        InkWell(
                                                            onTap: () {
                                                              //contoller.setFilteredDealerList();
                                                              Get.dialog(
                                                                barrierDismissible: false,
                                                                CustomSearching(
                                                                  title: 'Search Division',
                                                                  hint: 'Searching...',
                                                                  datalist: controller.divisions!,
                                                                  onSelect: (value) async {
                                                                    Get.back();
                                                                    controller.selectedDivisionIndex=value;
                                                                    controller.selectedDivision = controller.divisions![value];
                                                                    await controller.getDistrict(controller.divisionResponse!.data![controller.selectedDivisionIndex].id.toString());
                                                                    //await controller.getDistrict();
                                                                    //clear all data
                                                                    controller.selectedDistrict = "Choose District";
                                                                    controller.selectedDistrictIndex=-1;
                                                                    controller.selectedThanaIndex=-1;
                                                                    controller.selectedThana = "Choose Thana";
                                                                  },
                                                                  onClose: () {
                                                                    Get.back();
                                                                    // Get.to(controller.coverageAreas);
                                                                  },
                                                                ),
                                                              );
                                                            },
                                                            child: CustomDropDown(
                                                                isRequired: true,
                                                                text: controller.selectedDivision!,
                                                                title: "Division")),
                                                        const SizedBox(height: 12),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              child: InkWell(
                                                                  onTap: () {
                                                                    //contoller.setFilteredDealerList();
                                                                    Get.dialog(
                                                                      barrierDismissible: false,
                                                                      CustomSearching(
                                                                        title: 'Search District',
                                                                        hint: 'Searching...',
                                                                        datalist: controller.districts!,
                                                                        onSelect: (value) {
                                                                          setState(() async {
                                                                            controller.selectedDistrictIndex=value;
                                                                            Get.back();
                                                                            controller.selectedDistrict = controller.districts![value];
                                                                            //  await controller.getDistrict(controller.divisionResponse!.data![selectedDivisionIndex].id.toString());
                                                                            await controller.getThana(controller.districtResponse!.data![value]!.id.toString());

                                                                            print('District Se: ${controller.districts![value]}');
                                                                            print('District Se: ${controller.districtResponse!.data![value]!.id.toString()}');
                                                                          });
                                                                        },
                                                                        onClose: () {
                                                                          Get.back();
                                                                          // Get.to(controller.coverageAreas);
                                                                        },
                                                                      ),
                                                                    );
                                                                  },
                                                                  child: CustomDropDown(
                                                                    isRequired: true,
                                                                    text: controller.selectedDistrict,
                                                                    title: 'District',
                                                                  )),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(height: 12),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              child: InkWell(
                                                                  onTap: () {
                                                                    //contoller.setFilteredDealerList();
                                                                    Get.dialog(
                                                                      barrierDismissible: false,
                                                                      CustomSearching(
                                                                        title: 'Search Thana',
                                                                        hint: 'Searching...',
                                                                        datalist: controller.thanas!,
                                                                        onSelect: (value) {
                                                                          setState(() {
                                                                            controller.selectedThanaIndex=value;
                                                                            Get.back();
                                                                            controller.selectedThana = controller.thanas![value];
                                                                          });
                                                                        },
                                                                        onClose: () {
                                                                          Get.back();
                                                                          // Get.to(controller.coverageAreas);
                                                                        },
                                                                      ),
                                                                    );
                                                                  },
                                                                  child: CustomDropDown(
                                                                    isRequired: true,
                                                                    text: controller.selectedThana,
                                                                    title: 'Thana',
                                                                  )),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(height: 12),
                                                        Stack(
                                                          children: [
                                                            MyTextField(
                                                              controller: controller.addressCtr,
                                                              focusNode: addressFcs,
                                                              nextFocus: firstNameFcs,
                                                              title: "Delivery Address",
                                                              isRequired: true,
                                                              titlesize: 13,
                                                              // hintStyle: railway.copyWith(fontWeight: FontWeight.bold),
                                                              myfontWeight: FontWeight.bold,
                                                            ),
                                                            Positioned(
                                                              right: 0,
                                                              child: Row(
                                                                children: [
                                                                  SizedBox(
                                                                    height: 20,
                                                                    width: 20,
                                                                    child: Checkbox(
                                                                      activeColor: gold,
                                                                      checkColor: Colors.white,
                                                                      value: isBiling,
                                                                      onChanged: (val) {
                                                                        setState(() {
                                                                          isBiling = val!;
                                                                          log('Is Billing: $isBiling');
                                                                        });
                                                                      },
                                                                    ),
                                                                  ),
                                                                  const SizedBox(width: 4),
                                                                  const Text('Use as billing address'),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(height: 25),
                                                        Container(
                                                          height: 30,
                                                          color: Colors.grey.shade200,
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Padding(
                                                                padding: const EdgeInsets.only(left: 8),
                                                                child: Text("Personal Information", style: railwaybold.copyWith(color: Colors.black54 ,fontSize: 10.5,  fontWeight: FontWeight.w700,),),
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsets.only(right: 8),
                                                                child: Text("*Required fields", style: railwaybold.copyWith( color: Colors.black87 ,fontSize: 9,  fontWeight: FontWeight.w700,),),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        const SizedBox(height: 12),
                                                        MyTextField(
                                                          controller: controller.firstNameCtr,
                                                          focusNode: firstNameFcs,
                                                          nextFocus: lastNameFcs,
                                                          title: "First Name",
                                                          isRequired: true,
                                                          titlesize: 13,
                                                          // hintStyle: railway.copyWith(fontWeight: FontWeight.bold),
                                                          myfontWeight: FontWeight.bold,
                                                        ),
                                                        const SizedBox(height: 12),
                                                        MyTextField(
                                                          controller: controller.lastNameCtr,
                                                          focusNode: lastNameFcs,
                                                          nextFocus: phoneFcs,
                                                          title: "Last Name",
                                                          isRequired: true,
                                                          titlesize: 13,
                                                          // hintStyle: railway.copyWith(fontWeight: FontWeight.bold),
                                                          myfontWeight: FontWeight.bold,
                                                        ),
                                                        const SizedBox(height: 12),
                                                        MyTextField(
                                                          controller: controller.phoneCtr,
                                                          focusNode: phoneFcs,
                                                          nextFocus: emailFcs,
                                                          title: "Phone Number",
                                                          hintText: "+88017XXXXXXXX",
                                                          isRequired: true,
                                                          titlesize: 14,
                                                          // hintStyle: railway.copyWith(fontWeight: FontWeight.bold),
                                                          myfontWeight: FontWeight.bold,
                                                        ),
                                                        const SizedBox(height: 12),
                                                        MyTextField(
                                                          controller: controller.emailCtr,
                                                          focusNode: emailFcs,
                                                          nextFocus: specialnoteFcs,
                                                          title: "Email",
                                                          hintText: "isle@gmail.com",
                                                          // isRequired: true,
                                                          titlesize: 14,
                                                          // hintStyle: railway.copyWith(fontWeight: FontWeight.bold),
                                                          myfontWeight: FontWeight.bold,
                                                        ),
                                                        const SizedBox(height: 12),
                                                        MyTextField(
                                                          height: 80,
                                                          maxLines: 3,
                                                          minLines: 2,
                                                          controller: controller.specialnoteCtr,
                                                          focusNode: specialnoteFcs,
                                                          title: "Special Note",
                                                          // isRequired: true,
                                                          titlesize: 13,
                                                          // hintStyle: railway.copyWith(fontWeight: FontWeight.bold),
                                                          // myfontWeight: FontWeight.bold,
                                                        ),
                                                        const SizedBox(height: 20),
                                                        InkWell(
                                                          hoverColor: gold,
                                                          highlightColor: gold,
                                                          splashColor: gold,
                                                          onTap: () {
                                                            showModalBottomSheet(
                                                              context: context,
                                                              isDismissible: false,
                                                              isScrollControlled: true,
                                                              builder: (BuildContext context) {
                                                                return const DeliveryTypePopup();
                                                              },
                                                            );
                                                          },
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                              border: Border.all(
                                                                color: gold,
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding: const EdgeInsets.all(8.0),
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: [
                                                                  Image.asset(Images.car, height: 22, width: 22),
                                                                  const SizedBox(width: 8),
                                                                  const Text("Select Delivery Type"),
                                                                  Text("*", style: poppins.copyWith(color: Colors.red, fontSize: 17)),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(height: 20),
                                                        CustomButton(
                                                            height: 45,
                                                            width: Get.width ,
                                                            buttoncolor: gold,
                                                            color: Colors.white,
                                                            buttontextcolor: Colors.white,
                                                            radius: 0,
                                                            fontSize: 11,
                                                            myfontweight: FontWeight.bold,
                                                            onPressed: () {
                                                              bool notSelect = false;
                                                              // print(controller.orderPlaceRequest.paymentMethod!);
                                                              // print(widget.address!.text.toString());
                                                              // print("aaaaa");
                                                              // print(widget.address!.text);

                                                              /*List<UserAddressBookData> userAddressBookList = Get.find<UserProfileController>().userAddressBookList;

                                                              // Find the address book entry where isPrimary is true
                                                              UserAddressBookData? primaryAddressBook = userAddressBookList.firstWhere(
                                                                      (addressBook) => addressBook.isPrimary == true);*/

                                                              // log('Select Division: ${controller.selectedDivisionIndex}');
                                                              // log('Select District: ${controller.selectedDistrict}');
                                                              //
                                                              // log('Select Division: ${controller.divisionResponse!.data![controller.selectedDivisionIndex].id}');
                                                              // log('Select District: ${controller.districtResponse!.data![controller.selectedDistrictIndex].id}');

                                                              log('Firest Name: ${controller.firstNameCtr.text}');
                                                              log('Last Name: ${controller.lastNameCtr.text}');
                                                              log('Phone Name: ${controller.phoneCtr.text}');
                                                              log('Phone Name: ${controller.phoneCtr.text}');
                                                              log('State Id Name: ${controller.phoneCtr.text}');


                                                              if (controller.selectedDivisionIndex > -1 || primaryAddressBook?.stateId != null) {
                                                                if (controller.selectedDistrictIndex > -1 || primaryAddressBook?.districtId != null) {
                                                                  if (controller.selectedThanaIndex > -1 || primaryAddressBook?.subDistrictId != null) {
                                                                    if (controller.addressCtr!.text.toString().isNotEmpty) {
                                                                      if (controller.addressCtr!.text.trim().length > 11) {
                                                                        if (controller.firstNameCtr!.text.toString().isNotEmpty) {
                                                                          if (controller.lastNameCtr!.text.toString().isNotEmpty) {
                                                                            if (controller.phoneCtr!.text.toString().isNotEmpty) {
                                                                              for (int i = 0; i < controller.vendorWiseData.length; i++) {
                                                                                if (controller.vendorWiseData[i].selectedDeliveryValue == 0) {
                                                                                  log('First Name1: ${controller.firstNameCtr.text}');
                                                                                  log('Last Name1: ${controller.lastNameCtr.text}');
                                                                                  log('Phone Name1: ${controller.phoneCtr.text}');
                                                                                  log('Phone Name1: ${controller.phoneCtr.text}');
                                                                                  notSelect = true;
                                                                                  break;
                                                                                }
                                                                              }
                                                                              if (notSelect) {
                                                                                showCustomSnackBar("Please select delivery type");
                                                                              } else {
                                                                                _tabController.animateTo(1);
                                                                              }
                                                                            } else {
                                                                              showCustomSnackBar("Please Enter your Phone Number");
                                                                            }
                                                                          } else {
                                                                            showCustomSnackBar("Please Enter your Last Name");
                                                                          }
                                                                        } else {
                                                                          showCustomSnackBar("Please Enter your First Name");
                                                                        }
                                                                      } else {
                                                                        showCustomSnackBar("Please Enter at least 11 characters");
                                                                      }
                                                                    } else {
                                                                      showCustomSnackBar("Please Enter your Address");
                                                                    }
                                                                  } else {
                                                                    showCustomSnackBar("Please Select Thana");
                                                                  }
                                                                } else {
                                                                  showCustomSnackBar("Please Select District");
                                                                }
                                                              } else {
                                                                showCustomSnackBar("Please Select Division");
                                                              }
                                                            },
                                                            buttonText: "Continue".toUpperCase()),
                                                        const SizedBox(height: 20),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              /// 2nd TAB
                                              RefreshIndicator(
                                                onRefresh: () async {
                                                  // showCustomSnackBar("2");
                                                },
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    children: [
                                                      const Divider(
                                                        thickness: 5,
                                                        height: 5,
                                                        color: Color(0xffF2F6F9),
                                                      ),

                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 15, right: 15, top: 20,),
                                                            child: Text("Select Payment Method", style: railway.copyWith(fontSize: 16,  fontWeight: FontWeight.w700,),),
                                                          ),
                                                          const SizedBox(height: 25),
                                                          Padding(
                                                            padding: const EdgeInsets.symmetric(horizontal: 15),
                                                            child: Row(
                                                              children: [
                                                                Expanded(
                                                                  child: Padding(
                                                                    padding: const EdgeInsets.only(right: 8),
                                                                    child: InkWell(
                                                                      onTap: (){
                                                                        controller.selectedPayntMethod="cod";
                                                                        controller.update();
                                                                      },
                                                                      child: Container(
                                                                          height: Get.height/13,
                                                                          // width: 120,
                                                                          decoration:  BoxDecoration(
                                                                              color:  gold ,
                                                                              border: Border.all(
                                                                                width: 1,
                                                                                color:  gold ,
                                                                              ),
                                                                              // color: Colors.pink,
                                                                              borderRadius: BorderRadius.circular(8)
                                                                          ),
                                                                          child: Padding(
                                                                            padding: const EdgeInsets.all(0),
                                                                            child: Column(
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                // Image.asset(Images.facebook),
                                                                                Image.asset(Images.cod, color: Colors.black87, height: 26, width: 26, ),
                                                                                const SizedBox(height: 3),
                                                                                Text("Cash on Delivery", style: robotoRegular.copyWith(color: Colors.black87,fontSize: 9),)
                                                                              ],
                                                                            ),
                                                                          )),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child: Padding(
                                                                    padding: const EdgeInsets.only(right: 8),
                                                                    child: InkWell(
                                                                      onTap: (){
                                                                        controller.selectedPayntMethod="credit card";
                                                                        controller.update();
                                                                      },
                                                                      child: Container(
                                                                          height: Get.height/13,
                                                                          // width: 120,
                                                                          decoration:  BoxDecoration(
                                                                              border: Border.all(
                                                                                width: 1,
                                                                                color: const Color(0xff20243D),
                                                                              ),
                                                                              // color: Colors.pink,
                                                                              borderRadius: BorderRadius.circular(8)
                                                                          ),
                                                                          child: Padding(
                                                                            padding: const EdgeInsets.all(0),
                                                                            child: Column(
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                // Image.asset(Images.facebook),
                                                                                Image.asset(Images.card, color: Colors.black87, height: 26, width: 26, ),
                                                                                const SizedBox(height: 3),
                                                                                Text("Credit card", style: robotoRegular.copyWith(color: Colors.black87,fontSize: 9),)
                                                                              ],
                                                                            ),
                                                                          )),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child: Padding(
                                                                    padding: const EdgeInsets.only(right: 8),
                                                                    child: InkWell(
                                                                      onTap: (){
                                                                        controller.selectedPayntMethod="bkash";
                                                                        controller.update();
                                                                      },
                                                                      child: Container(
                                                                          height: Get.height/13,
                                                                          // width: 120,
                                                                          decoration:  BoxDecoration(
                                                                              border: Border.all(
                                                                                width: 1,
                                                                                color: const Color(0xff20243D),
                                                                              ),
                                                                              // color: Colors.pink,
                                                                              borderRadius: BorderRadius.circular(8)
                                                                          ),
                                                                          child: Padding(
                                                                            padding: const EdgeInsets.all(0),
                                                                            child: Column(
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                // Image.asset(Images.facebook),
                                                                                Image.asset(Images.bkash,  height: 26, width: 26, ),
                                                                                const SizedBox(height: 3),
                                                                                Text("Bkash", style: robotoRegular.copyWith(color: Colors.black87,fontSize: 9),)
                                                                              ],
                                                                            ),
                                                                          )),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child: Padding(
                                                                    padding: const EdgeInsets.only(right: 0),
                                                                    child: InkWell(
                                                                      onTap: (){
                                                                        controller.selectedPayntMethod="paypal";
                                                                        controller.update();
                                                                      },
                                                                      child: Container(
                                                                          height: Get.height/13,
                                                                          // width: 120,
                                                                          decoration:  BoxDecoration(
                                                                              border: Border.all(
                                                                                width: 1,
                                                                                color: const Color(0xff20243D),
                                                                              ),
                                                                              // color: Colors.pink,
                                                                              borderRadius: BorderRadius.circular(8)
                                                                          ),
                                                                          child: Padding(
                                                                            padding: const EdgeInsets.all(0),
                                                                            child: Column(
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                // Image.asset(Images.facebook),
                                                                                Image.asset(Images.paypal,  height: 26, width: 26, ),
                                                                                const SizedBox(height: 3),
                                                                                Text("Paypal", style: robotoRegular.copyWith(color: Colors.black87,fontSize: 9),)
                                                                              ],
                                                                            ),
                                                                          )),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          /// prev
                                                          /*                           controller.selectedPayntMethod=="cash"?
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(height: 30),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 15, right: 15,),
                                                  child: Text("Cash on Delivery", style: railway.copyWith(fontSize: 18),),
                                                ),
                                                SizedBox(height: 12),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 15, right: 15,),
                                                  child: Text("Note: Please pay the invoice amount upon receiving the product", style: railway.copyWith(fontSize: 11),),
                                                ),

                                              ],
                                            ) : SizedBox() ,*/
                                                          const SizedBox(height: 50),
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 15, right: 15,),
                                                            child: Container(
                                                                color: const Color(0xffFFFFFF),
                                                                child: Column(
                                                                  children: [
                                                                    Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      children: [
                                                                        Expanded(
                                                                          flex: 1,
                                                                          child: Text("Sub Total",
                                                                            style: poppins.copyWith( fontWeight: FontWeight.bold, fontSize: 11),),
                                                                        ),
                                                                        const SizedBox(width: 8),
                                                                        Expanded(
                                                                          flex: 1,
                                                                          child: Text("${controller.orderPlaceRequest.subtotal.toStringAsFixed(2)} BDT",
                                                                            textAlign: TextAlign.right,
                                                                            overflow: TextOverflow.ellipsis,
                                                                            style: poppins.copyWith( color: gold ,fontWeight: FontWeight.bold, fontSize: 11),),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    cartController.isleCouponDis > 0 ? const SizedBox(height: 5) : const SizedBox.shrink(),
                                                                    cartController.redeemPoint > 0 ?  Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      children: [
                                                                        Expanded(
                                                                          flex: 1,
                                                                          child: Text("Isle Coupon",
                                                                            style: poppins.copyWith( fontWeight: FontWeight.bold, fontSize: 11),),
                                                                        ),
                                                                        const SizedBox(width: 8),
                                                                        Expanded(
                                                                          flex: 1,
                                                                          child: Text("${controller.orderPlaceRequest.isleCouponAmount.toStringAsFixed(2)}",
                                                                            textAlign: TextAlign.right,
                                                                            overflow: TextOverflow.ellipsis,
                                                                            style: poppins.copyWith( color: gold ,fontWeight: FontWeight.bold, fontSize: 11),),
                                                                        ),
                                                                      ],
                                                                    )
                                                                    :const SizedBox.shrink(),
                                                                    cartController.brandCouponDis > 0 ? const SizedBox(height: 5) : const SizedBox.shrink(),
                                                                    cartController.brandCouponDis > 0 ?
                                                                    Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      children: [
                                                                        Expanded(
                                                                          flex: 1,
                                                                          child: Text("Brand Coupon",
                                                                            style: poppins.copyWith( fontWeight: FontWeight.bold, fontSize: 11),),
                                                                        ),
                                                                        const SizedBox(width: 8),
                                                                        Expanded(
                                                                          flex: 1,
                                                                          child: Text("${controller.orderPlaceRequest.brandCouponAmount.toStringAsFixed(2)}",
                                                                            textAlign: TextAlign.right,
                                                                            overflow: TextOverflow.ellipsis,
                                                                            style: poppins.copyWith( color: gold ,fontWeight: FontWeight.bold, fontSize: 11),),
                                                                        ),
                                                                      ],
                                                                    )
                                                                   : const SizedBox.shrink(),
                                                                    cartController.firstOrderDiscount > 0 ? const SizedBox(height: 5) : const SizedBox.shrink(),
                                                                    cartController.firstOrderDiscount>0? Row(
                                                                      children: [
                                                                        Expanded(
                                                                          flex: 2,
                                                                          child: Row(
                                                                            children: [
                                                                              Text("First Order Discount",
                                                                                style: poppins.copyWith(
                                                                                    fontWeight: FontWeight.bold,
                                                                                    fontSize: 11),),
                                                                            ],
                                                                          ),
                                                                        ),

                                                                        const SizedBox(width: 8),
                                                                        Expanded(
                                                                          flex: 2,
                                                                          child: Text("${cartController.firstOrderDiscount!.toStringAsFixed(0) ?? ""} BDT",
                                                                            textAlign: TextAlign.right,
                                                                            overflow: TextOverflow.ellipsis,
                                                                            style: poppins.copyWith(color: gold,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: 11),),
                                                                        ),
                                                                      ],
                                                                    ): const SizedBox.shrink(),
                                                                    cartController.firstOrderDiscount > 0 ? const SizedBox(height: 5) : const SizedBox.shrink(),
                                                                    cartController.redeemPoint>0? Row(
                                                                      children: [
                                                                        Expanded(
                                                                          flex: 2,
                                                                          child: Row(
                                                                            children: [
                                                                              Text("Redeem reward",
                                                                                style: poppins.copyWith(
                                                                                    fontWeight: FontWeight.bold,
                                                                                    fontSize: 11),),
                                                                            ],
                                                                          ),
                                                                        ),

                                                                        const SizedBox(width: 8),
                                                                        Expanded(
                                                                          flex: 2,
                                                                          child: Text("${cartController.redeemPoint!.toStringAsFixed(0) ?? ""} BDT",
                                                                            textAlign: TextAlign.right,
                                                                            overflow: TextOverflow.ellipsis,
                                                                            style: poppins.copyWith(color: gold,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: 11),),
                                                                        ),
                                                                      ],
                                                                    ): const SizedBox.shrink(),
                                                                    cartController.redeemPoint > 0 ? const SizedBox(height: 5) : const SizedBox.shrink(),
                                                                    cartController.minimumPurchaseDiscount>0? Row(
                                                                      children: [
                                                                        Expanded(
                                                                          flex: 2,
                                                                          child: Row(
                                                                            children: [
                                                                              Expanded(
                                                                                child: Text("Minimum Purchase Order Discount",
                                                                                  style: poppins.copyWith(
                                                                                      fontWeight: FontWeight.bold,
                                                                                      fontSize: 11),),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),

                                                                        const SizedBox(width: 8),
                                                                        Expanded(
                                                                          flex: 2,
                                                                          child: Text("${cartController.minimumPurchaseDiscount!.toStringAsFixed(0) ?? ""} BDT",
                                                                            textAlign: TextAlign.right,
                                                                            overflow: TextOverflow.ellipsis,
                                                                            style: poppins.copyWith(color: gold,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: 11),),
                                                                        ),
                                                                      ],
                                                                    ): const SizedBox.shrink(),
                                                                    const SizedBox(height: 5),
                                                                    cartController.calculatedDis > 0 ? const SizedBox(height: 5) : const SizedBox.shrink(),
                                                                    Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      children: [
                                                                        Expanded(
                                                                          flex: 1,
                                                                          child: Text("VAT",
                                                                            style: poppins.copyWith( fontWeight: FontWeight.bold, fontSize: 11),),
                                                                        ),
                                                                        const SizedBox(width: 8),
                                                                        Expanded(
                                                                          flex: 1,
                                                                          child: Text("${cartController.calculatedDis.toStringAsFixed(2)} BDT",
                                                                            // child: Text("${controller.orderPlaceRequest.vat.toStringAsFixed(2)}",
                                                                            textAlign: TextAlign.right,
                                                                            overflow: TextOverflow.ellipsis,
                                                                            style: poppins.copyWith( color: gold ,fontWeight: FontWeight.bold, fontSize: 11),),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    const SizedBox(height: 5),
                                                                  /*  Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      children: [
                                                                        Expanded(
                                                                          flex: 1,
                                                                          child: Text("Shipping Cost",
                                                                            style: poppins.copyWith( fontWeight: FontWeight.bold, fontSize: 11),),
                                                                        ),
                                                                        const SizedBox(width: 8),
                                                                        Expanded(
                                                                          flex: 1,
                                                                          child: Text("${controller.orderPlaceRequest.shippingCost}",
                                                                            textAlign: TextAlign.right,
                                                                            overflow: TextOverflow.ellipsis,
                                                                            style: poppins.copyWith( color: gold ,fontWeight: FontWeight.bold, fontSize: 11),),
                                                                        ),
                                                                      ],
                                                                    ),*/

                                                                    Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      children: [
                                                                        Expanded(
                                                                          flex: 1,
                                                                          child: Text("Shipping Cost",
                                                                            style: poppins.copyWith( fontWeight: FontWeight.bold, fontSize: 11),),
                                                                        ),
                                                                        const SizedBox(width: 8),
                                                                        Expanded(
                                                                          flex: 1,
                                                                          child: Text("${controller.orderPlaceRequest.shippingCost} BDT",
                                                                            textAlign: TextAlign.right,
                                                                            overflow: TextOverflow.ellipsis,
                                                                            style: poppins.copyWith( color: gold ,fontWeight: FontWeight.bold, fontSize: 11),),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    const SizedBox(height: 5),
                                                                    Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      children: [
                                                                        Expanded(
                                                                          flex: 1,
                                                                          child: Text("Free Shipping Cost (only standard)",
                                                                            style: poppins.copyWith( fontWeight: FontWeight.bold, fontSize: 11),),
                                                                        ),
                                                                        const SizedBox(width: 8),
                                                                        Expanded(
                                                                          flex: 1,
                                                                          child: Text("${controller.orderPlaceRequest.shippingCost} BDT",
                                                                            textAlign: TextAlign.right,
                                                                            overflow: TextOverflow.ellipsis,
                                                                            style: poppins.copyWith( color: gold ,fontWeight: FontWeight.bold, fontSize: 11),),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    const SizedBox(height: 5),
                                                                    Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      children: [
                                                                        Expanded(
                                                                          flex: 2,
                                                                          child: Text("Grand Total",
                                                                            style: poppins.copyWith( color: Colors.black , fontWeight: FontWeight.bold, fontSize: 13),),
                                                                        ),
                                                                        const SizedBox(width: 8),
                                                                        Expanded(
                                                                          flex: 2,
                                                                          child: Text("${cartController.grandTotal??"0.0"} BDT",
                                                                         // child: Text("${(controller.orderPlaceRequest.subtotal+controller.orderPlaceRequest.vat+controller.orderPlaceRequest.shippingCost)-(controller.orderPlaceRequest.brandCouponAmount+controller.orderPlaceRequest.isleCouponAmount)} BDT",
                                                                            textAlign: TextAlign.right,
                                                                            overflow: TextOverflow.ellipsis,
                                                                            style: poppins.copyWith( color: Colors.black ,fontWeight: FontWeight.bold, fontSize: 13),),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    const SizedBox(height: 20),
                                                                    ElevatedButton(
                                                                      // style: raisedButtonStyle,
                                                                      style: ElevatedButton.styleFrom(
                                                                        shape: const RoundedRectangleBorder(
                                                                            borderRadius: BorderRadius.zero
                                                                        ),
                                                                        primary: gold,
                                                                        // primary: Color(0xff2D2D2D),
                                                                        minimumSize: const Size.fromHeight(45),
                                                                      ),
                                                                      onPressed: () async {
                                                                        /*List<UserAddressBookData> userAddressBookList = Get.find<UserProfileController>().userAddressBookList;

                                                                        // Find the address book entry where isPrimary is true
                                                                        UserAddressBookData? primaryAddressBook = userAddressBookList.firstWhere(
                                                                                (addressBook) => addressBook.isPrimary == true);*/

                                                                        // log('User Address: ${primaryAddressBook.stateId}');
                                                                        // log('User Address: ${primaryAddressBook.districtId}');
                                                                        // log('User Address: ${primaryAddressBook.subDistrictId}');

                                                                        if(controller.selectedPayntMethod!=null) {
                                                                          print("For Checkout Print");
                                                                          String deviceID = await Get.find<AuthController>().getDeviceID();
                                                                          String customerID = await Get.find<AuthController>().getUserId();
                                                                          String customerID2 = await Get.find<AuthController>().getUserIdGuest();
                                                                          controller.orderPlaceRequest.customerId = Get.find<AuthController>().isLoggedInGuest()? customerID2 : customerID;
                                                                          controller.orderPlaceRequest.clientCorelationId = deviceID;
                                                                          controller.orderPlaceRequest.firstName = controller.firstNameCtr.text;
                                                                          controller.orderPlaceRequest.lastName = controller.lastNameCtr.text;
                                                                          controller.orderPlaceRequest.phone = controller.phoneCtr.text;
                                                                          controller.orderPlaceRequest.email = controller.emailCtr!.text;
                                                                          controller.orderPlaceRequest.address = controller.addressCtr.text;
                                                                          // controller.orderPlaceRequest.stateId = controller.divisionResponse!.data![controller.selectedDivisionIndex].id;
                                                                          // controller.orderPlaceRequest.districtId = controller.districtResponse!.data![controller.selectedDistrictIndex].id;
                                                                          // controller.orderPlaceRequest.subDistrictId = controller.thanaResponse!.data![controller.selectedThanaIndex].id;
                                                                          controller.orderPlaceRequest.stateId = controller.selectedDivisionIndex>-1 ? controller.divisionResponse!.data![controller.selectedDivisionIndex].id : primaryAddressBook?.stateId;
                                                                          controller.orderPlaceRequest.districtId = controller.selectedDistrictIndex>-1 ? controller.districtResponse!.data![controller.selectedDistrictIndex].id : primaryAddressBook?.districtId;
                                                                          controller.orderPlaceRequest.subDistrictId = controller.selectedThanaIndex>-1 ?  controller.thanaResponse!.data![controller.selectedThanaIndex].id : primaryAddressBook?.subDistrictId;
                                                                          controller.orderPlaceRequest.giftNote = "";
                                                                          controller.orderPlaceRequest.specialNote = controller.specialnoteCtr!.text;
                                                                          controller.orderPlaceRequest.coupon = widget.isleCoupon;
                                                                          controller.orderPlaceRequest.brandCoupon = widget.brandCoupon;
                                                                          controller.orderPlaceRequest.paymentMethod = "cod";
                                                                          // controller.orderPlaceRequest.paymentMethod = controller.selectedPayntMethod ?? "";
                                                                          controller.orderPlaceRequest.isGuest = Get.find<AuthController>().isLoggedInGuest()? true : false;
                                                                          controller.orderPlaceRequest.billAddress = Get.find<AuthController>().isLoggedInGuest() ? isBiling : true;
                                                                          controller.PlaceOrder().whenComplete((){
                                                                            Get.find<CartController>().getCartPageData(isPop: false);
                                                                            Get.find<ThankYouController>().getOrderTrackData(id: controller.orderNumber.toString()).then((value) => Get.find<ThankYouController>().getGeneralSettingData());
                                                                            Get.find<OrderTrackController>().getOrderTrackData(id: controller.orderNumber.toString() ?? '');

                                                                            print('Order Numbera${controller.orderNumber.toString()}');
                                                                          });

                                                                          log('State Id: ${controller.orderPlaceRequest.stateId}');
                                                                          log('Dis Id: ${controller.orderPlaceRequest.districtId}');
                                                                          log('SubDis Id: ${controller.orderPlaceRequest.subDistrictId}');

                                                                          _tabController.animateTo(2);
                                                                          /*                showModalBottomSheet(
                                                              context: context,
                                                              builder: (
                                                                  BuildContext context) {
                                                                return ProductFeedbackPopup();
                                                                // return FeedbackPopup(id: controller.productDetailsResponse!.data!.id!,);
                                                              },
                                                            );*/
                                                                        }else{
                                                                          showCustomSnackBar("select your payment method");
                                                                        }
                                                                        // Get.to(ThankYou());
                                                                      },
                                                                      child: Text('Place Order'.toUpperCase(), style: railwaybold.copyWith(fontSize: 12),),
                                                                    ),
                                                                    const SizedBox(height: 4),

                                                                  ],
                                                                )
                                                            ),
                                                          ),
                                                          const SizedBox(height: 8),
                                                          Container(
                                                              color: const Color(0xffF2F6F9),
                                                              child: Column(
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsets.only(left: 12, right: 12),
                                                                    child: Container(
                                                                      // color: Colors.pinkAccent,
                                                                      height: 40,
                                                                      child: Row(
                                                                        children: [
                                                                          Expanded(
                                                                            child: ListView.builder(
                                                                              scrollDirection: Axis.horizontal,
                                                                              itemCount: bankcard.length,
                                                                              itemBuilder: (context, index) {
                                                                                return Container(
                                                                                  // color: Colors.green,
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsets.only(left: 5, right: 5), // Add some spacing between items
                                                                                    child: InkWell(
                                                                                      child: Container(
                                                                                        width: 35,
                                                                                        height: 25,
                                                                                        // margin: EdgeInsets.all(10),
                                                                                        // padding: EdgeInsets.all(5),
                                                                                        child: Image.asset("${bankcard[index]}", height: 40, width: 60,),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  const SizedBox(height: 30),
                                                                  Padding(
                                                                    padding: const EdgeInsets.fromLTRB(
                                                                        30, 0, 30, 0),
                                                                    child: Row(
                                                                      children: [
                                                                        CustomImageCached(
                                                                          isRound: false,
                                                                          image: "${AppConstants.BASE_URL}${controller.shopWithConfidenceResponse?.data?.icon??""}",
                                                                          height: 30,
                                                                          width: 30,
                                                                        ),
                                                                        /*            Image.asset(
                                              Images.like, height: 30, width: 30,),*/
                                                                        const SizedBox(width: 12),
                                                                        Column(
                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text("${controller.shopWithConfidenceResponse?.data?.title??""}",
                                                                              style: poppins.copyWith(
                                                                                  color: gold,
                                                                                  fontWeight: FontWeight.bold,
                                                                                  fontSize: 9),),
                                                                            const SizedBox(height: 4),
                                                                            Text(
                                                                              "${controller.shopWithConfidenceResponse?.data?.description??""}",
                                                                              style: poppins.copyWith(
                                                                                  color: Colors.black,
                                                                                  fontSize: 9),),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  const SizedBox(height: 40),
                                                                ],
                                                              )
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              /// 3rd Tab
                                              RefreshIndicator(
                                                onRefresh: () async {
                                                  // showCustomSnackBar("2");
                                                },
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      /// previous chilo
                                                      /*                  Center(
                                                child: _showProgress
                                                    ? CircularProgressIndicator(
                                                  valueColor: AlwaysStoppedAnimation<Color>(gold),
                                                )
                                                    : Container(),
                                              ),*/

                                                      Container(
                                                        // color: Colors.green,
                                                          child: Image.asset(Images.thank, height: 200,)),
                                                      Padding(
                                                        padding: const EdgeInsets.only(left: 15, right: 15),
                                                        child: Card(
                                                          elevation: 1,
                                                          child: Padding(
                                                            padding: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
                                                            child: Container(
                                                              child: Column(
                                                                children: [
                                                                  Row(
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                    children: [
                                                                      Text("Your Order Number is: ",
                                                                        textAlign: TextAlign.center,
                                                                        style: railwaybold.copyWith(fontSize: 14,  fontWeight: FontWeight.w400,),),
                                                                      GestureDetector(
                                                                        onTap: () {
                                                                          // print(widget.orderId);
                                                                          // print(controller.confirmOrdersReturnsListResponse!.data![index].orderNo!);
                                                                          // Get.to(() => OrdersReturnsDetails(id: int.parse(widget.orderId!.toString(), )));
                                                                          Get.to(() => OrdersReturnsDetails(id: orderController.orderNumver.toString() ??"" ));

                                                                          print('Order Id Nu: ${orderController.orderNumver.toString()}');
                                                                        },
                                                                        child: Text("${controller.orderNumber}",
                                                                          textAlign: TextAlign.center,
                                                                          style: poppins.copyWith(fontSize: 13,  color: gold, fontWeight: FontWeight.bold),),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  SizedBox(height: 8),
                                                                  Text("Your order Delivery Type",
                                                                    textAlign: TextAlign.center,
                                                                    style: railwaybold.copyWith(fontSize: 14,),),
                                                                  SizedBox(height: 8),
                                                                  ListView.builder(
                                                                      itemCount: thankController.placeOrderTrackResponse?.data?.length??0,
                                                                      shrinkWrap: true,
                                                                      physics: NeverScrollableScrollPhysics(),
                                                                      itemBuilder: (BuildContext context, int index) {
                                                                        return Column(
                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                          children: [
                                                                            // Text("Seller Name: ",
                                                                            Text("Seller Name: ${thankController.placeOrderTrackResponse?.data?[index]?.vendor?.name??""}",
                                                                              textAlign: TextAlign.center,
                                                                              style: railwaybold.copyWith(fontSize: 11,  ),),
                                                                            SizedBox(height: 4),
                                                                            // Text("Delivery Type: ",
                                                                            Text("Delivery Type: ${thankController.placeOrderTrackResponse?.data?[index]?.deliveryType?.name??""}",
                                                                              textAlign: TextAlign.center,
                                                                              style: railwaybold.copyWith(fontSize: 11,  ),),
                                                                            SizedBox(height: 5),
                                                                          ],
                                                                        );
                                                                      }
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(height: 15),
                                                      Padding(
                                                        padding: const EdgeInsets.only(left: 25, right: 25, top: 0,),
                                                        child: Text("We'll get started your order right away",
                                                          textAlign: TextAlign.center,
                                                          style: railway.copyWith(fontSize: 14,  fontWeight: FontWeight.w400,),),
                                                      ),
                                                      SizedBox(height: 8),
                                                      Padding(
                                                        padding: const EdgeInsets.only(left: 25, right: 25, top: 0,),
                                                        child: Text("You should be receiving an order confirmation Email/SMS shortly.",
                                                          textAlign: TextAlign.center,
                                                          style: railway.copyWith(fontSize: 14,  fontWeight: FontWeight.w400,),),
                                                      ),
                                                      SizedBox(height: 12),
                                                      Padding(
                                                        padding: const EdgeInsets.only(left: 25, right: 25, top: 0,),
                                                        child: Text("If you have any question call us at ${controller.generalSettingResponse?.data?.phone??""}",
                                                          textAlign: TextAlign.center,
                                                          style: poppins.copyWith(fontSize: 13,  fontWeight: FontWeight.w300, color: Colors.black87),),
                                                      ),
                                                      SizedBox(height: 2),
                                                      Padding(
                                                        padding: const EdgeInsets.only(left: 25, right: 25, top: 0,),
                                                        child: Text("Email: ${controller.generalSettingResponse?.data?.email??""}",
                                                          textAlign: TextAlign.center,
                                                          style: railway.copyWith(fontSize: 14,  fontWeight: FontWeight.w400,),),
                                                      ),

                                                      SizedBox(height: 40),

                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 15),
                                                        child: CustomButton(
                                                            height: 45,
                                                            width: Get.width / 1,
                                                            buttoncolor: gold,
                                                            color: Colors.white,
                                                            buttontextcolor: Colors.white,
                                                            radius: 0,
                                                            fontSize: 12.5,
                                                            onPressed: () {
                                                              Get.to(OrdersReturnsDetailsTrack(orderNo: controller.orderNumber, id: orderController.orderTrackresponse?.data?[0].orderId.toString(), ));
                                                              // Get.to(PlaceOrderTrack(orderNumber: widget.orderNumber!,));
                                                            },
                                                            buttonText: "Track your Order".toUpperCase()),
                                                      ),
                                                      SizedBox(height: 20),

                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 15),
                                                        child: CustomButton(
                                                            height: 45,
                                                            width: Get.width / 1,
                                                            buttoncolor: gold,
                                                            color: Colors.white,
                                                            buttontextcolor: Colors.white,
                                                            radius: 0,
                                                            fontSize: 12.5,
                                                            onPressed: () {
                                                              showModalBottomSheet(
                                                                isScrollControlled: true,
                                                                context: context,
                                                                builder: (
                                                                    BuildContext context) {
                                                                  // return ProductReviewPopup(id: controller?.sectionHomepageList[index]!.childCategories![0]?.childCategoryProduct!.childCategoryId ?? 0,);
                                                                  return ProductFeedbackPopup();
                                                                  // return FeedbackPopup(id: controller.productDetailsResponse!.data!.id!,);
                                                                },
                                                              );
                                                              /*        Get.to(
                                    showModalBottomSheet(
                                      isScrollControlled: true,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return FeedbackScreen();
                                      },
                                    ),
                                    fullscreenDialog: true
                                );*/
                                                            },
                                                            buttonText: "Share Your Feedback".toUpperCase()),
                                                      ),

                                                      SizedBox(height: 50),
                                                    ],
                                                  ),
                                                ),
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
                );
              });
            }
        );
      }
    );
  }









}
