import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/profile/user/user_profile_controller.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/custom_alert_dialog_for_permission.dart';
import 'package:isletestapp/view/screens/checkout/manual_shipping_form.dart';
import 'package:isletestapp/view/screens/profile/addressbook%20edit/addressbook_edit.dart';
import 'package:isletestapp/view/screens/universal_bottom_nav/universal_bottom_nav.dart';

import '../../../data/model/response/profile/address book/user_addressbook_response.dart';

class ViewProfile extends StatefulWidget {
  const ViewProfile({Key? key}) : super(key: key);
  @override
  State<ViewProfile> createState() => _ViewProfileState();
}
class _ViewProfileState extends State<ViewProfile> {

  PageController? pageController;
  bool isOpen=false;
  List<bool>? isCheckedList;

  final GlobalKey<_ViewProfileState> _key = GlobalKey<_ViewProfileState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<UserProfileController>().dataInitializeForViewProfile();
      Get.find<UserProfileController>().getAddressBookData();
    });
    // Initialize isCheckedList here
    // Initialize isCheckedList only if it's null
    updateCheckedList();
  }

  final userProfileCon = Get.find<UserProfileController>()..getAddressBookData();

  void updateCheckedList() {

    List<UserAddressBookData> userAddressBookList = Get.find<UserProfileController>().userAddressBookList;

    // Find the address book entry where isPrimary is true
    // UserAddressBookData? primaryAddressBook = userAddressBookList.firstWhere(
    //         (addressBook) => addressBook.isPrimary == true);

    // Initialize isCheckedList here
    isCheckedList = List.generate(userProfileCon.userAddressBookList.length, (index) {
      return userAddressBookList[index].isPrimary ?? false;
    });
  }

  // Function to handle checkbox state changes
  void onCheckboxChanged(int index) async{

    setState(() {
      for (int i = 0; i < isCheckedList!.length; i++) {
        isCheckedList![i] = (i == index); // Check only the selected index
      }
    });

    int isPrimaryValue = isCheckedList![index] ? 1 : 0;

    await Get.find<UserProfileController>().updateIsPrimary(
      id: userProfileCon.userAddressBookList[index].id.toString() ?? '',
      isPrimary: isPrimaryValue.toString(),
    );

    log('Is Check Value: $isPrimaryValue');
    log("isCheckedList: $isCheckedList");

  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserProfileController>(
        builder: (controller) {
          log('Image : ${controller.userProfileResponse?.data?.photo}');
          // isCheckedList = List.generate(controller.userAddressBookResponse?.data?.length ?? 0, (index) => false);
          return DefaultTabController(
            length: 1,
            child: Scaffold(
              key: _key,
              bottomNavigationBar: const UniversalBottomNav(),
              appBar: AppBar(
                /// prev
                // title: Text("Personal information", style: railway.copyWith(fontSize: 18, color: Colors.black),),
                title :   controller.userAddressBookList!=null? controller.userAddressBookList.isNotEmpty?
                Text('My Address Book (${controller.userAddressBookList.length??0})',
                  style: poppins.copyWith(
                      color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
                ) : const Text("( 0 )") : const Text("( 0 )"),
                // title: Text("My Address Book", style: railway.copyWith(fontSize: 18, color: Colors.black),),
                iconTheme: const IconThemeData(color: Color(0xff000000)),
                titleSpacing: 0,
                backgroundColor: const Color(0xffFFFFFF),
                centerTitle: true,
                elevation: 0,
                leadingWidth: Get.width / 3.5,
              ),
              // backgroundColor: Color(0xffEBEFF3),
              backgroundColor: const Color(0xffFFFFFF),
              body: Column(
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 8, right: 8),
                  //   child: SizedBox(
                  //     // color: Color(0xffFFFFFF),
                  //     /// prev
                  //     /*   height: 35,*/
                  //     height: 1,
                  //     child: TabBar(
                  //         indicatorPadding: const EdgeInsets.symmetric(horizontal: 120),
                  //         indicatorColor: Colors.transparent,
                  //         indicatorWeight: 2.5,
                  //         tabs: [
                  //           Tab(
                  //               child:
                  //               controller.userAddressBookResponse!=null? controller.userAddressBookResponse!.data!.isNotEmpty?
                  //               Text('',
                  //                 style: poppins.copyWith(
                  //                     color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
                  //               ) : const Text("") : const Text("")
                  //           ),
                  //         ]),
                  //   ),
                  // ),

                  Expanded(
                    child: TabBarView(children: [
                      /// 1st TAB
                      RefreshIndicator(
                          onRefresh: () async {
                            // showCustomSnackBar("2");
                          },
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                const Divider(
                                  height: 10,
                                  thickness: 10,
                                  color: Color(0xffF2F6F9),
                                  // color: Colors.pink,
                                ),
                                Column(
                                  children: [
                                    controller.userAddressBookList!=null?
                                    controller.userAddressBookList.isNotEmpty ?
                                    ListView.builder(
                                        itemCount: controller.userAddressBookList.length ?? 0,
                                        shrinkWrap: true,
                                        reverse: true,
                                        physics: const NeverScrollableScrollPhysics(),
                                        itemBuilder: (BuildContext context, int index) {
                                          // isCheckedList = List.generate(controller.userAddressBookResponse?.data?.length ?? 0, (index) => false);
                                          return  Padding(
                                            padding: const EdgeInsets.only(left: 12, top: 5, right: 12,bottom: 5),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                border: Border.all(
                                                  color: gold,
                                                  width: 0.5,
                                                  // style: BorderStyle.solid,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 12, top: 0, right: 6,bottom: 8),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(height: 8),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text("Address Type: ${controller.userAddressBookList[index].addressType??""}", style: railwaybold.copyWith(fontSize: 14)),
                                                        Row(
                                                          children: [
                                                            InkWell(
                                                              onTap: () {
                                                                Get.to(()=> EditAddressBook(id: controller.userAddressBookList[index].id!,));
                                                              },
                                                              child: Text("Edit",
                                                                  style: railwaybold.copyWith(fontSize: 12,
                                                                      color: gold,
                                                                      decoration: TextDecoration.underline
                                                                  )),
                                                            ),
                                                            const SizedBox(width: 8),
                                                            InkWell(
                                                              onTap: (){
                                                                Get.dialog(CustomAlerDialogForPermission(
                                                                  iconString: Images.delete,
                                                                  title: 'Remove Item',
                                                                  description: 'Do you really want to remove from address Book?',
                                                                  yesBtntap: () {
                                                                    Get.back();
                                                                  },
                                                                  noBtntap: (){
                                                                    Get.back();
                                                                    controller.deleteAddressBook(controller.userAddressBookList[index].id?.toString()??"");
                                                                  },
                                                                  noBtnText: "YES",
                                                                  yesBtnText: "NO",
                                                                ));
                                                                // controller.getDeleteItemList(controller.teacherHomeWorkResponse!.homeworks![int.parse(widget.passindex)].id.toString());
                                                              },
                                                              child: Text("Delete",
                                                                  style: railwaybold.copyWith(fontSize: 12,
                                                                      color: gold,
                                                                      decoration: TextDecoration.underline
                                                                  )),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(height: 6),
                                                    Row(
                                                      children: [
                                                        Text("Name: ", style: railwaybold.copyWith(fontSize: 11)),
                                                        Text("${controller.userAddressBookList[index].firstName??""} ${controller.userAddressBookList[index].lastName??""}", style: railway.copyWith(fontSize: 11)),
                                                      ],
                                                    ),
                                                    const SizedBox(height: 4),
                                                    Row(
                                                      children: [
                                                        Text("Phone Number: ", style: railwaybold.copyWith(fontSize: 11)),
                                                        Text(controller.userAddressBookList[index].phone??"", style: railway.copyWith(fontSize: 11)),
                                                      ],
                                                    ),
                                                    const SizedBox(height: 4),
                                                    Row(
                                                      children: [
                                                        Text("Address: ", style: railwaybold.copyWith(fontSize: 11)),
                                                        Text(controller.userAddressBookList[index].address??"", style: railway.copyWith(fontSize: 11)),
                                                      ],
                                                    ),
                                                    const SizedBox(height: 4),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                      children: [
                                                        Text("Make Shipping Address", style: railway.copyWith(fontSize: 11)),
                                                        const SizedBox(width: 8),

                                                        SizedBox(
                                                          height: 20,
                                                          width: 20,
                                                          child: Checkbox(
                                                            activeColor: gold, // Set the color based on the isCheckedList value
                                                            checkColor: Colors.white,
                                                            value: (){
                                                              if(controller.userAddressBookList.length > (isCheckedList?.length ?? 0)){
                                                                final depresnse = controller.userAddressBookList.length - isCheckedList!.length;
                                                                isCheckedList?.addAll(List.generate(depresnse, (index) => false));
                                                              }
                                                              return isCheckedList?[index];
                                                            }(),
                                                            onChanged: (val) {
                                                              onCheckboxChanged(index);
                                                            },
                                                          ),
                                                        ),

                                                        const SizedBox(width: 8),
                                                      ],
                                                    ),


                                                    const SizedBox(height: 4),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                    )
                                        :   SizedBox(
                                        height: 120,
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 15),
                                              child: Text("There are no saved Address",
                                                textAlign: TextAlign.center,
                                                style: railway.copyWith(fontSize: 15, color: Colors.black),),
                                            ),
                                          ],
                                        ))
                                        : const SizedBox(),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                /*       Divider(
                                height: 2,
                                thickness: 2,
                                color: Color(0xffF2F6F9),
                                // color: Colors.pink,
                              ),*/
                                Padding(
                                  padding: const EdgeInsets.only(left: 12, right: 12),
                                  child: InkWell(
                                    onTap: () async{
                                      await Get.to(()=> const ManualForm(isFromProfile: false ));
                                      setState(() {
                                        controller.getAddressBookData();
                                      });
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: const Color(0xffF2F6F9),
                                            borderRadius: BorderRadius.circular(8)
                                        ),
                                        // color: Color(0xffFFFFFF),
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              /*    Expanded(
                                                    flex: 2,
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(left: 0),
                                                      child: Image.asset(Images.addnew, height: 22, width: 22, color: Colors.black54,),
                                                    )
                                                ),*/
                                              Text("Add new Address",  style: railway.copyWith(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),),
                                              const Icon(Icons.add, size: 22,  color: Colors.black,)
                                            ],
                                          ),
                                        )
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 15),
                              ],
                            ),
                          )),

                    ]),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}



// SizedBox(
//   height: 20, width: 20,
//   child: Checkbox(
//     checkColor: Colors.white,
//     activeColor: Colors.grey,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(2.0),
//     ),
//     side: MaterialStateBorderSide.resolveWith(
//           (states) =>
//       const BorderSide(width: 1.0, color: Colors.grey),
//     ),
//     value: selectedSizes[sizedId] ?? false,
//     // Inside the ListView.builder in the onChanged callback of Checkbox
//     // Inside the ListView.builder in the onChanged callback of Checkbox
//     // Inside the ListView.builder in the onChanged callback of Checkbox
//     // Inside the ListView.builder in the onChanged callback of Checkbox
//     onChanged: (val) {
//       setState(() {
//         selectedSizes[sizedId] = val ?? false;
//       });
//
//       bool isPrimaryValue = val ?? false;
//
//       // Update the isPrimary value for the corresponding item in the userAddressBookResponse
//       controller.userAddressBookResponse!.data![index].isPrimary = isPrimaryValue;
//
//       // Call the method to update isPrimary in your controller
//       Get.find<UserProfileController>().updateAddressbook(
//         id: controller.userAddressBookResponse?.data?[index].id.toString() ?? '',
//         first_name: controller.userAddressBookResponse?.data?[index].firstName ?? "",
//         last_name: controller.userAddressBookResponse?.data?[index].lastName ?? "",
//         phone: controller.userAddressBookResponse?.data?[index].phone ?? "",
//         address_type: controller.userAddressBookResponse?.data?[index].addressType ?? "",
//         state_id: controller.userAddressBookResponse?.data?[index].stateId.toString() ?? "",
//         district_id: controller.userAddressBookResponse?.data?[index].districtId.toString() ?? "",
//         sub_district_id: controller.userAddressBookResponse?.data?[index].subDistrictId.toString() ?? "",
//         address: controller.userAddressBookResponse?.data?[index].address ?? "",
//         is_primary: isPrimaryValue.toString(),
//       );
//     },
//
//
//
//
//   ),
// ),

// SizedBox(
//   height: 20,
//   width: 20,
//   child: Checkbox(
//     activeColor: isCheckedList[index] ? Colors.red : Colors.grey, // Set the color based on the isCheckedList value
//     checkColor: Colors.black,
//     value: isCheckedList[index],
//     onChanged: (val) {
//       setState(() {
//         // Update the isCheckedList for the clicked index
//         isCheckedList[index] = val ?? false;
//       });
//
//       // Update the isMakeShipping separately
//       isMakeShipping = isCheckedList[index];
//
//       // Send 1 to is_primary if the checkbox is checked, otherwise send 0
//       int isPrimaryValue = isCheckedList[index] ? 1 : 0;
//
//       // Call the method to update is_primary in your controller
//       Get.find<UserProfileController>().updateAddressbook(
//         id: controller.userAddressBookResponse?.data?[index].id.toString() ?? '',
//         first_name: controller.userAddressBookResponse?.data?[index].firstName ?? "",
//         last_name: controller.userAddressBookResponse?.data?[index].lastName ?? "",
//         phone: controller.userAddressBookResponse?.data?[index].phone ?? "",
//         address_type: controller.userAddressBookResponse?.data?[index].addressType ?? "",
//         state_id: controller.userAddressBookResponse?.data?[index].stateId.toString() ?? "",
//         district_id: controller.userAddressBookResponse?.data?[index].districtId.toString() ?? "",
//         sub_district_id: controller.userAddressBookResponse?.data?[index].subDistrictId.toString() ?? "",
//         address: controller.userAddressBookResponse?.data?[index].address ?? "",
//         is_primary: isPrimaryValue.toString(),
//       );
//
//       print('Is Check Value: $isPrimaryValue');
//       print("isCheckedList: $isCheckedList");
//       print("isMakeShipping: $isMakeShipping");
//     },
//   ),
// ),
