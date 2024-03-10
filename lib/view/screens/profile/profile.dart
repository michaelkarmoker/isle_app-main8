import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/auth_controller.dart';
import 'package:isletestapp/controller/profile/user/user_profile_controller.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/auth/login-register.dart';
import 'package:isletestapp/view/base/custom_Image_cached.dart';
import 'package:isletestapp/view/screens/Notification/notification_screen.dart';
import 'package:isletestapp/view/screens/custom%20logo/custom_logo_widget.dart';
import 'package:isletestapp/view/screens/multi%20screen/custom_footer_page_widget.dart';
import 'package:isletestapp/view/screens/multi%20screen/multi_screen_design.dart';
import 'package:isletestapp/view/screens/order%20track/order_track_page.dart';
import 'package:isletestapp/view/screens/profile/feedback/feedback.dart';
import 'package:isletestapp/view/screens/profile/feedback/product_feedback.dart';
import 'package:isletestapp/view/screens/profile/help_support.dart';
import 'package:isletestapp/view/screens/profile/landing%20pages/about_isle_rewards.dart';
import 'package:isletestapp/view/screens/profile/landing%20pages/communications_preferences.dart';
import 'package:isletestapp/view/screens/profile/landing%20pages/favorite_brands.dart';
import 'package:isletestapp/view/screens/profile/landing%20pages/my_rewards.dart';
import 'package:isletestapp/view/screens/profile/orders%20returns/orders_and_returns.dart';
import 'package:isletestapp/view/screens/profile/profile_details_and_edit.dart';
import 'package:isletestapp/view/screens/profile/landing%20pages/refer_a_friend.dart';
import 'package:isletestapp/view/screens/profile/view_profile.dart';
import 'package:isletestapp/view/screens/universal_bottom_nav/universal_bottom_nav.dart';
import 'package:url_launcher/url_launcher.dart';

class UserInfo extends StatefulWidget {
  final bool? isbottomSheet;
   UserInfo({Key? key, this.isbottomSheet}) : super(key: key);
  bool isExpanded1=false;
   bool isExpanded2=false;


  bool isExpanded3=false;
  bool isExpanded4=false;
  bool isExpanded5=false;
  bool isExpanded6=false;
  @override
  State<UserInfo> createState() => _UserInfoState();
}
class _UserInfoState extends State<UserInfo> {
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<UserProfileController>().dataInitialize();
    }
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: widget.isbottomSheet== true ? UniversalBottomNav() : SizedBox.shrink(),
      backgroundColor: Color(0xffF2F6F9),
      // drawer: IsleDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xff000000)),
        titleSpacing: 0,
        backgroundColor: Color(0xffFFFFFF),
        centerTitle: true,
        elevation: 0,
        leadingWidth: Get.width / 3.5,
        toolbarHeight: 62,
        title: CustomLogo(),
      ),
      body: GetBuilder<UserProfileController>(
        builder: (controller) {
          return Container(
            child: ListView(
              children: [
                SizedBox(height: 0),
                Get.find<AuthController>().isLoggedIn() || Get.find<AuthController>().isLoggedInGuest() ?
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 8),
                  child:
                  controller.userProfileResponse!=null?
                  InkWell(
                    onTap: () {
                      // Get.to(()=>ViewProfile());
                      Get.to(UserProfileDtails());
                    },
                    child: Card(
                      margin: EdgeInsets.zero,
                        elevation: 0,
                        color: Colors.white,
                        child: Container(
                          width: Get.width,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15, right:0,top: 20, bottom: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 4, right: 4),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(300),
                                        child: CustomImageCached(
                                          placeholder: Images.profile,
                                          image: '${AppConstants.BASE_URL}${controller.userProfileResponse?.data?.photo??""}',
                                          height: 65,
                                          width: 65,
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 10, ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('${controller.userProfileResponse?.data?.firstName??""}',
                                              maxLines: 2,overflow: TextOverflow.ellipsis,
                                              style: railway.copyWith(fontSize: 16, fontWeight: FontWeight.w600),),

                                            SizedBox(height: 2),
                                            Text('${controller.userProfileResponse?.data?.email??""}',
                                              maxLines: 2,overflow: TextOverflow.ellipsis,
                                              style: robotoMedium.copyWith(fontSize: 12),),
                                            SizedBox(height: 2),
                                            RichText(
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              text: TextSpan(
                                                style: robotoMedium.copyWith(fontSize: 8),
                                                children: [
                                                  TextSpan(
                                                    text: "Membership Tier Status-",
                                                    style: railwaybold.copyWith(fontSize: 10, color: Colors.black),
                                                  ),
                                                  TextSpan(
                                                    text: " ${controller.customerUserMeResponse?.data?.membershipTier?.tiersName ?? ""}",
                                                    style: railwaybold.copyWith(fontSize: 10, color: gold),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 3),
                                            RichText(
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              text: TextSpan(
                                                style: robotoMedium.copyWith(fontSize: 8),
                                                children: [
                                                  TextSpan(
                                                    text: "Reward Point-",
                                                    style: railwaybold.copyWith(fontSize: 10, color: Colors.black),
                                                  ),
                                                  TextSpan(
                                                    text: " ${rewardpointcalculation(controller.customerUserMeResponse?.data?.point?.toDouble()??0, controller.customerUserMeResponse?.data?.usePoint?.toDouble()??0).toStringAsFixed(0)}",
                                                    style: poppins.copyWith(fontSize: 10, color: gold, fontWeight: FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ),
                                              ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child:     Icon(Icons.arrow_forward_ios, size: 20, color: Colors.black87,),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )),
                  )
                  : SizedBox(),
                )
                :Padding(
                  padding: const EdgeInsets.only(left: 10, right: 8),
                  child: InkWell(
                    onTap: () {
                      Get.to(LoginRegisterPage(isFromCart: false,));
                      // showCustomSnackBar("Please Sign in to continue");
                    },
                    child: Card(
                        margin: EdgeInsets.zero,
                        elevation: 0,
                        color: Colors.white,
                        child: Container(
                          width: Get.width,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15, right:0,top: 20, bottom: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child:   Padding(
                                        padding: const EdgeInsets.only(left: 4, right: 4),
                                        child: Image.asset(
                                          Images.profile,
                                          height: 70,
                                          width: 70
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 10, ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Log in / Register',
                                              maxLines: 2,overflow: TextOverflow.ellipsis,
                                              style: railway.copyWith(fontSize: 20, fontWeight: FontWeight.w600),),
                                            SizedBox(height: 2),
                                            Text('For faster checkout',
                                              maxLines: 2,overflow: TextOverflow.ellipsis,
                                              style: robotoMedium.copyWith(fontSize: 13),),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child:     Icon(Icons.arrow_forward_ios, size: 20, color: Colors.black87,),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )),
                  ),
                ),
                SizedBox(height: Get.height/70),
                /// 2nd part
            /*    Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: InkWell(
                    onTap: (){
                      Get.to(LoginRegisterPage());
                    },
                    child: Card(
                      elevation: 0.5,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8,20,8,20),
                        child: Column(
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  // Icon(Icons.edit, size: 20),
                                  SizedBox(width: 8),
                                  Text("My Profile", style: railway.copyWith(fontSize: 17,),)
                                ],),
                                Icon(Icons.arrow_forward_ios, size: 17, color: Colors.black87,),
                              ],
                            )
                          ],
                        ),
                      ),),
                  ),
                ),*/
                /// notification
          /*      Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: InkWell(
                    onTap: (){
                      Get.to(NotificationScreen());
                    },
                    child: Card(
                      elevation: 0.5,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12,20,8,20),
                        child: Column(
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  // Icon(Icons.edit, size: 25),
                                  Image.asset(Images.notification, height: 30, width: 30,),
                                  SizedBox(width: 15),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Notifications", style: railway.copyWith(fontWeight: FontWeight.w700,fontSize: 15,),),
                                      SizedBox(height: 8),
                                      Text("Stay up to date on latest offers and more.", style: railway.copyWith(fontWeight: FontWeight.w300,fontSize: 12,),),
                                    ],
                                  )
                                ],),
                                Icon(Icons.arrow_forward_ios, size: 20, color: Colors.black87,),
                              ],
                            )
                          ],
                        ),
                      ),),
                  ),
                ),*/
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: InkWell(
                    onTap: (){
                      widget.isExpanded1=! widget.isExpanded1;
                      setState(() {
                      });
                    },
                    child: Card(
                      elevation: 0.5,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12,20,8,20),
                        child: Column(
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  // Icon(Icons.star_border_purple500_sharp, size: 30, color: Colors.black,),
                                  Image.asset(Images.card, height: 30, width: 30,),
                                  SizedBox(width: 15),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("ISLE Rewards", style: railway.copyWith(fontWeight: FontWeight.w700,fontSize: 15,),),
                                      SizedBox(height: 8),
                                      Text("Earn and Redeem", style: railway.copyWith(fontWeight: FontWeight.w300,fontSize: 12,),),
                                    ],
                                  )
                                ],),
                                widget.isExpanded1?
                                Padding(
                                  padding: const EdgeInsets.only(right : 2),
                                  child: Image.asset(Images.up, color: Colors.black, height: 22, width: 17,),
                                )
                                    : Padding(
                                  padding: const EdgeInsets.only(right : 2),
                                  child: Image.asset( Images.drop, color: Colors.black, height: 22, width: 22,),
                                )
                                // Icon(Icons.arrow_forward_ios, size: 20, color: Colors.black87,),
                              ],
                            )
                          ],
                        ),
                      ),),
                  ),
                ),
                widget.isExpanded1?
                // controller.topBrandResponse != null && controller.topBrandResponse!.data != null ?
                Container(
                  // color: Colors.red,
                  padding: const EdgeInsets.only(left: 0,right: 0,top: 0, bottom: 0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: InkWell(
                          onTap: (){
                            Get.to(MyRewards());
                          },
                          child: Card(
                            elevation: 0.5,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(12,20,8,20),
                              child: Column(
                                children: [
                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(children: [
                                        // Icon(Icons.star_border_purple500_sharp, size: 30, color: Colors.black,),
                                        Image.asset(Images.reward, height: 30, width: 30,),
                                        SizedBox(width: 15),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("My Rewards", style: railway.copyWith(fontWeight: FontWeight.w700,fontSize: 15,),),
                                            SizedBox(height: 8),
                                            Text("Your Current ISLE Reward Point", style: railway.copyWith(fontWeight: FontWeight.w300,fontSize: 12,),),
                                          ],
                                        )
                                      ],),
                                      Icon(Icons.arrow_forward_ios, size: 20, color: Colors.black87,),
                                    ],
                                  )
                                ],
                              ),
                            ),),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: InkWell(
                          onTap: (){
                            Get.to(()=>AboutIsleRewards());
                          },
                          child: Card(
                            elevation: 0.5,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(12,20,8,20),
                              child: Column(
                                children: [
                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(children: [
                                        Icon(Icons.info_outline, size: 30, color: Colors.black,),
                                        // Image.asset(Images.reward, height: 30, width: 30,),
                                        SizedBox(width: 15),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("About ISLE Rewards", style: railway.copyWith(fontWeight: FontWeight.w700,fontSize: 15,),),
                                            SizedBox(height: 8),
                                            Text("Everytime you shop you earn points", style: railway.copyWith(fontWeight: FontWeight.w300,fontSize: 12,),),
                                          ],
                                        )
                                      ],),
                                      Icon(Icons.arrow_forward_ios, size: 20, color: Colors.black87,),
                                    ],
                                  )
                                ],
                              ),
                            ),),
                        ),
                      ),
                      //Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
                    ],
                  ),
                )
                // : SizedBox()
                    :Container(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: InkWell(
                    onTap: (){
                      Get.to(OrdersReturns());
                    },
                    child: Card(
                      elevation: 0.5,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12,20,8,20),
                        child: Column(
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  // Icon(Icons.edit, size: 25),
                                  Image.asset(Images.box, height: 30, width: 30,),
                                  SizedBox(width: 15),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Orders & Returns", style: railway.copyWith(fontWeight: FontWeight.w700,fontSize: 15,),),
                                      SizedBox(height: 8),
                                      Text("Track My orders & Returns.", style: railway.copyWith(fontWeight: FontWeight.w300,fontSize: 12,),),
                                    ],
                                  )
                                ],),
                                Icon(Icons.arrow_forward_ios, size: 20, color: Colors.black87,),
                              ],
                            )
                          ],
                        ),
                      ),),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: InkWell(
                    onTap: (){
                      Get.to(()=>FavoriteBrands());
                    },
                    child: Card(
                      elevation: 0.5,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12,20,8,20),
                        child: Column(
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  Icon(Icons.star_border_purple500_sharp, size: 30, color: Colors.black,),
                                  // Image.asset(Images.star, height: 30, width: 30,),
                                  SizedBox(width: 15),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("My Favorite Brands", style: railway.copyWith(fontWeight: FontWeight.w700,fontSize: 15,),),
                                      SizedBox(height: 8),
                                      Text("Add brands to follow.", style: railway.copyWith(fontWeight: FontWeight.w300,fontSize: 12,),),
                                    ],
                                  )
                                ],),
                                Icon(Icons.arrow_forward_ios, size: 20, color: Colors.black87,),
                              ],
                            )
                          ],
                        ),
                      ),),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: InkWell(
                    onTap: (){
                      Get.to(CommunicationPreferences());
                    },
                    child: Card(
                      elevation: 0.5,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12,20,8,20),
                        child: Column(
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  // Icon(Icons.star_border_purple500_sharp, size: 30, color: Colors.black,),
                                  Image.asset(Images.settings, height: 30, width: 30,),
                                  SizedBox(width: 15),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Communication Preferences", style: railway.copyWith(fontWeight: FontWeight.w700,fontSize: 15,),),
                                      SizedBox(height: 8),
                                      Text("Subscribe to be the first with our new arrivals,", style: railway.copyWith(fontWeight: FontWeight.w300,fontSize: 12,),),
                                    ],
                                  )
                                ],),
                                Icon(Icons.arrow_forward_ios, size: 20, color: Colors.black87,),
                              ],
                            )
                          ],
                        ),
                      ),),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: InkWell(
                    onTap: (){
                      Get.to(ReferFriend());
                    },
                    child: Card(
                      elevation: 0.5,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12,20,8,20),
                        child: Column(
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  // Icon(Icons.star_border_purple500_sharp, size: 30, color: Colors.black,),
                                  Image.asset(Images.refer, height: 30, width: 30,),
                                  SizedBox(width: 15),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Refer A Friend", style: railway.copyWith(fontWeight: FontWeight.w700,fontSize: 15,),),
                                      SizedBox(height: 8),
                                      Text("Refer A Friend", style: railway.copyWith(fontWeight: FontWeight.w300,fontSize: 12,),),
                                    ],
                                  )
                                ],),
                                Icon(Icons.arrow_forward_ios, size: 20, color: Colors.black87,),
                              ],
                            )
                          ],
                        ),
                      ),),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: InkWell(
                    onTap: (){
                      Get.to(()=>OrderTrack());
                    },
                    child: Card(
                      elevation: 0.5,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12,20,8,20),
                        child: Column(
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    // Icon(Icons.edit, size: 25),
                                    Image.asset(Images.car, height: 30, width: 30,),
                                    SizedBox(width: 15),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Track Order", style: railway.copyWith(fontWeight: FontWeight.w700,fontSize: 15,),),
                                        SizedBox(height: 8),
                                        Text("Please enter the order number we sent..",
                                          style: railway.copyWith(fontWeight: FontWeight.w300,fontSize: 12,),),
                                      ],
                                    )
                                  ],),
                                Icon(Icons.arrow_forward_ios, size: 20, color: Colors.black87,),
                              ],
                            )
                          ],
                        ),
                      ),),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: InkWell(
                    onTap: (){
                      Get.to(()=>FeedBack());
                    },
                    child: Card(
                      elevation: 0.5,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12,20,8,20),
                        child: Column(
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  // Icon(Icons.star_border_purple500_sharp, size: 30, color: Colors.black,),
                                  Image.asset(Images.feedback, height: 30, width: 30,),
                                  SizedBox(width: 15),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("FeedBack", style: railway.copyWith(fontWeight: FontWeight.w700,fontSize: 15,),),
                                      SizedBox(height: 8),
                                      // Text("Learn more about ISLE", style: railway.copyWith(fontWeight: FontWeight.w300,fontSize: 12,),),
                                    ],
                                  )
                                ],),
                                Icon(Icons.arrow_forward_ios, size: 20, color: Colors.black87,),
                              ],
                            )
                          ],
                        ),
                      ),),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: InkWell(
                    onTap: (){
                      Get.to(()=>ProductFeedback());
                    },
                    child: Card(
                      elevation: 0.5,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12,20,8,20),
                        child: Column(
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  // Icon(Icons.star_border_purple500_sharp, size: 30, color: Colors.black,),
                                  Image.asset(Images.feedback_p, height: 30, width: 30,),
                                  SizedBox(width: 15),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Product Feedback", style: railway.copyWith(fontWeight: FontWeight.w700,fontSize: 15,),),
                                 /*     SizedBox(height: 8),
                                      Text("Learn more about ISLE", style: railway.copyWith(fontWeight: FontWeight.w300,fontSize: 12,),),*/
                                    ],
                                  )
                                ],),
                                Icon(Icons.arrow_forward_ios, size: 20, color: Colors.black87,),
                              ],
                            )
                          ],
                        ),
                      ),),
                  ),
                ),

                /// isle
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: InkWell(
                    onTap: (){
                      widget.isExpanded2=! widget.isExpanded2;
                      setState(() {
                      });
                    },
                    child: Card(
                      elevation: 0.5,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12,20,8,20),
                        child: Column(
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  // Icon(Icons.star_border_purple500_sharp, size: 30, color: Colors.black,),
                                  Image.asset(Images.logo, height: 30, width: 30,),
                                  SizedBox(width: 15),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("ISLE", style: railway.copyWith(fontWeight: FontWeight.w700,fontSize: 15,),),
                                      SizedBox(height: 8),
                                      Text("Learn more about ISLE", style: railway.copyWith(fontWeight: FontWeight.w300,fontSize: 12,),),
                                    ],
                                  )
                                ],),
                                widget.isExpanded2?
                                Padding(
                                  padding: const EdgeInsets.only(right : 2),
                                  child: Image.asset(Images.up, color: Colors.black, height: 22, width: 17,),
                                )
                                    : Padding(
                                  padding: const EdgeInsets.only(right : 2),
                                  child: Image.asset( Images.drop, color: Colors.black, height: 22, width: 22,),
                                )
                                // Icon(Icons.arrow_forward_ios, size: 20, color: Colors.black87,),
                              ],
                            )
                          ],
                        ),
                      ),),
                  ),
                ),
                widget.isExpanded2?
                // controller.topBrandResponse != null && controller.topBrandResponse!.data != null ?
                Container(
                  // color: Colors.red,
                  padding: const EdgeInsets.only(left: 0,right: 0,top: 0, bottom: 0),
                  child: InkWell(
                      onTap: (){
                        print(controller.mainPageFooterTypeWiseResponse?.data?.company?.length);
                      },
                      child: ListView.builder(
                          itemCount: controller.mainPageFooterTypeWiseResponse?.data?.company?.length??0,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return     Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: InkWell(
                                onTap: (){
                                  Get.to(()=> CustomFooterView(
                                    image: controller.mainPageFooterTypeWiseResponse?.data?.company?[index]?.cover??"",
                                    video: controller.mainPageFooterTypeWiseResponse?.data?.company?[index]?.video?.toString()??"",
                                    head: controller.mainPageFooterTypeWiseResponse?.data?.company?[index]?.type??"",
                                    title: controller.mainPageFooterTypeWiseResponse?.data?.company?[index]?.pageTitle??"",
                                    desc: controller.mainPageFooterTypeWiseResponse?.data?.company?[index]?.details??"",
                                  ));
                                },
                                child: Card(
                                  elevation: 0.5,
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(12,20,8,20),
                                    child: Column(
                                      children: [
                                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(children: [
                                              // Icon(Icons.star_border_purple500_sharp, size: 30, color: Colors.black,),
                                              // Image.asset(Images.legal, height: 30, width: 30,),
                                              Container(child: SizedBox(), height: 30, width: 30,),
                                              SizedBox(width: 15),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text("${controller.mainPageFooterTypeWiseResponse?.data?.company?[index]?.pageTitle??""}", style: railway.copyWith(fontWeight: FontWeight.w700,fontSize: 15,),),
                                                  SizedBox(height: 8),
                                           /*       HtmlWidget(controller.mainPageFooterTypeWiseResponse?.data?.company?[index]?.subtitle??"",
                                                      textStyle: railway.copyWith( fontWeight: FontWeight.w200,color: Colors.white,
                                                          fontSize: Get.width < 430 ? Get.width < 360 ? 9 : 11 : 12)),*/

                                                   //    Text("${controller.mainPageFooterTypeWiseResponse?.data?.company?[index]?.subtitle??""}", maxLines: 1, overflow: TextOverflow.ellipsis, style: railway.copyWith(fontWeight: FontWeight.w300,fontSize: 12,),),
                                                ],
                                              )
                                            ],),
                                            Icon(Icons.arrow_forward_ios, size: 20, color: Colors.black87,),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),),
                              ),
                            );
                          }

                      )
                  ),
                )
                    :Container(),

/// Isle
             /*   Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: InkWell(
                    onTap: (){
                      // Get.to(LoginRegisterPage());
                    },
                    child: Card(
                      elevation: 0.5,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12,20,8,20),
                        child: Column(
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  // Icon(Icons.star_border_purple500_sharp, size: 30, color: Colors.black,),
                                  Image.asset(Images.logo, height: 30, width: 30,),
                                  SizedBox(width: 15),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("ISLE", style: railway.copyWith(fontWeight: FontWeight.w700,fontSize: 15,),),
                                      SizedBox(height: 8),
                                      Text("Learn more about ISLE", style: railway.copyWith(fontWeight: FontWeight.w300,fontSize: 12,),),
                                    ],
                                  )
                                ],),
                                Icon(Icons.arrow_forward_ios, size: 20, color: Colors.black87,),
                              ],
                            )
                          ],
                        ),
                      ),),
                  ),
                ),*/
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: InkWell(
                    onTap: (){
                      Get.to(HelpNSupport());
                    },
                    child: Card(
                      elevation: 0.5,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12,20,8,20),
                        child: Column(
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  // Icon(Icons.star_border_purple500_sharp, size: 30, color: Colors.black,),
                                  Image.asset(Images.helpsupport, height: 30, width: 30,),
                                  SizedBox(width: 15),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Help & Support", style: railway.copyWith(fontWeight: FontWeight.w700,fontSize: 15,),),
                                      SizedBox(height: 8),
                                      Text("Contact us, Order & Delivery, FAQ, Returns...", style: railway.copyWith(fontWeight: FontWeight.w300,fontSize: 12,),),
                                    ],
                                  )
                                ],),
                                Icon(Icons.arrow_forward_ios, size: 20, color: Colors.black87,),
                              ],
                            )
                          ],
                        ),
                      ),),
                  ),
                ),
                /// legal
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: InkWell(
                    onTap: (){
                      widget.isExpanded3=! widget.isExpanded3;
                      setState(() {
                      });
                    },
                    child: Card(
                      elevation: 0.5,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12,20,8,20),
                        child: Column(
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  // Icon(Icons.star_border_purple500_sharp, size: 30, color: Colors.black,),
                                  Image.asset(Images.legal, height: 30, width: 30,),
                                  SizedBox(width: 15),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("LEGAL", style: railway.copyWith(fontWeight: FontWeight.w700,fontSize: 15,),),
                                           SizedBox(height: 8),
                                      // Text("Earn and Redeem", style: railway.copyWith(fontWeight: FontWeight.w300,fontSize: 12,),),
                                    ],
                                  )
                                ],),
                                widget.isExpanded3?
                                Padding(
                                  padding: const EdgeInsets.only(right : 2),
                                  child: Image.asset(Images.up, color: Colors.black, height: 22, width: 17,),
                                )
                                    : Padding(
                                  padding: const EdgeInsets.only(right : 2),
                                  child: Image.asset( Images.drop, color: Colors.black, height: 22, width: 22,),
                                )
                                // Icon(Icons.arrow_forward_ios, size: 20, color: Colors.black87,),
                              ],
                            )
                          ],
                        ),
                      ),),
                  ),
                ),
                widget.isExpanded3?
                // controller.topBrandResponse != null && controller.topBrandResponse!.data != null ?
                Container(
                  // color: Colors.red,
                  padding: const EdgeInsets.only(left: 0,right: 0,top: 0, bottom: 0),
                  child: InkWell(
                      onTap: (){
                        print(controller.mainPageFooterTypeWiseResponse?.data?.legal?.length);
                      },
                      child: ListView.builder(
                          itemCount: controller.mainPageFooterTypeWiseResponse?.data?.legal?.length??0,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return     Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: InkWell(
                                onTap: (){
                                  Get.to(()=> CustomFooterView(
                                    image: controller.mainPageFooterTypeWiseResponse?.data?.legal?[index]?.cover??"",
                                    video: controller.mainPageFooterTypeWiseResponse?.data?.legal?[index]?.video?.toString()??"",
                                    head: controller.mainPageFooterTypeWiseResponse?.data?.legal?[index]?.type??"",
                                    title: controller.mainPageFooterTypeWiseResponse?.data?.legal?[index]?.pageTitle??"",
                                    desc: controller.mainPageFooterTypeWiseResponse?.data?.legal?[index]?.details??"",
                                  ));
                                },
                                child: Card(
                                  elevation: 0.5,
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(12,20,8,20),
                                    child: Column(
                                      children: [
                                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(children: [
                                              // Icon(Icons.star_border_purple500_sharp, size: 30, color: Colors.black,),
                                              // Image.asset(Images.legal, height: 30, width: 30,),
                                              Container(child: SizedBox(), height: 30, width: 30,),
                                              SizedBox(width: 15),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text("${controller.mainPageFooterTypeWiseResponse?.data?.legal?[index]?.pageTitle??""}", style: railway.copyWith(fontWeight: FontWeight.w700,fontSize: 15,),),
                                                  SizedBox(height: 8),
                                                  Text("${controller.mainPageFooterTypeWiseResponse?.data?.legal?[index]?.subtitle??""}", maxLines:1,style: railway.copyWith(fontWeight: FontWeight.w300,fontSize: 12,),),
                                                ],
                                              )
                                            ],),
                                            Icon(Icons.arrow_forward_ios, size: 20, color: Colors.black87,),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),),
                              ),
                            );
                          }

                      )
                  ),
                )
                    :Container(),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Card(
                    elevation: 0.5,
                    // color: Colors.yellowAccent.shade100,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8,6,0,6),
                      child: Column(
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
                                /*       // Icon(Icons.star_border_purple500_sharp, size: 30, color: Colors.black,),

                                SizedBox(width: 8),*/
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      // color: Colors.red,
                                        child: Image.asset(Images.follow, height: 40, width: 40,)),
                                    SizedBox(height: 0),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Text("Follow ISLE", style: railway.copyWith(fontWeight: FontWeight.w700,fontSize: 12,),),
                                    ),
                                    SizedBox(height: 8),
                                    //  Text("Contact us, Shipping, RAQ, Returns...", style: railway.copyWith(fontWeight: FontWeight.w300,fontSize: 12,),),
                                  ],
                                )
                              ],),
                              SizedBox(width: 8),
                              Expanded(
                                child: Container(
                                  height: 35,
                                  child:
                                  controller.socialResponse != null
                                      ? controller.socialResponse!.data!.length > 0
                                      ?
                                  ListView.builder(
                                      itemCount: controller.socialResponse!.data!.length > 6 ? 6 : controller.socialResponse!.data!.length!,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      // physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (BuildContext context, int index) {
                                        return   Padding(
                                          padding: const EdgeInsets.only(left: 1, right: 1),
                                          child: InkWell(
                                            onTap: () {
                                              String linkUrl = controller.socialResponse!.data![index].url ?? "";
                                              launch(linkUrl);
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius: BorderRadius.circular(8)),
                                              width: 35,
                                              height: 35,
                                              // margin: EdgeInsets.all(10),
                                              // padding: EdgeInsets.all(5),
                                              child: CustomImageCached(
                                                placeholder: Images.placeholder,
                                                isRound: false,
                                                image: '${AppConstants.BASE_URL}${controller.socialResponse!.data![index].icon ?? ""}',
                                                height: 35,
                                                width: 35,
                                                fit: BoxFit.fill,
                                              ),
                                              // child: Image.asset(Images.facebook, height: 35, width: 35, color: Colors.black,),
                                            ),
                                          ),
                                        );
                                      }
                                  )
                                      : SizedBox(child: Text("no-data"))
                                      : SizedBox(child: Text("result not found")),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),),
                ),

/// settings
             /*   Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: InkWell(
                    onTap: (){
                      // Get.to(LoginRegisterPage());
                    },
                    child: Card(
                      elevation: 0.5,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12,20,8,20),
                        child: Column(
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  // Icon(Icons.star_border_purple500_sharp, size: 30, color: Colors.black,),
                                  Image.asset(Images.setting, height: 30, width: 30,),
                                  SizedBox(width: 15),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Settings", style: railway.copyWith(fontWeight: FontWeight.w700,fontSize: 15,),),
                                      SizedBox(height: 8),
                                      Text("Language, Country, Notifications..", style: railway.copyWith(fontWeight: FontWeight.w300,fontSize: 12,),),
                                    ],
                                  )
                                ],),
                                Icon(Icons.arrow_forward_ios, size: 20, color: Colors.black87,),
                              ],
                            )
                          ],
                        ),
                      ),),
                  ),
                ),*/
          /*      Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: InkWell(
                    onTap: (){
                      Get.to(MultiScreen(title: "Privecy & Cookies", page: AppConstants.PRIVECY));
                    },
                    child: Card(
                      elevation: 0.5,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12,20,8,20),
                        child: Column(
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  // Icon(Icons.star_border_purple500_sharp, size: 30, color: Colors.black,),
                                  Image.asset(Images.privacy, height: 30, width: 30, color: Colors.black,),
                                  SizedBox(width: 15),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Privacy and Policy", style: railway.copyWith(fontWeight: FontWeight.w700,fontSize: 15,),),
                                      SizedBox(height: 8),
                                      Text("Language, Country, Notifications..", style: railway.copyWith(fontWeight: FontWeight.w300,fontSize: 12,),),
                                    ],
                                  )
                                ],),
                                Icon(Icons.arrow_forward_ios, size: 20, color: Colors.black87,),
                              ],
                            )
                          ],
                        ),
                      ),),
                  ),
                ),*/

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: InkWell(
                    onTap: (){
                        if(Get.find<AuthController>().isLoggedIn()){
                          Get.find<AuthController>().signOut();
                        } else if(Get.find<AuthController>().isLoggedInGuest()) {
                          Get.find<AuthController>().signOutGuest();
                        }
                      },
                    child: Card(
                      elevation: 0.5,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12,20,8,20),
                        child: Column(
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  Icon(Icons.logout, size: 30, color: Colors.black,),
                                  // Image.asset(Images.logout, height: 30, width: 30,),
                                  SizedBox(width: 15),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Logout", style: railway.copyWith(fontWeight: FontWeight.w700,fontSize: 15,),),
                                      /*     SizedBox(height: 8),
                                      Text("Learn more about ISLE", style: railway.copyWith(fontWeight: FontWeight.w300,fontSize: 12,),),*/
                                    ],
                                  )
                                ],),
                                Icon(Icons.arrow_forward_ios, size: 20, color: Colors.black87,),
                              ],
                            )
                          ],
                        ),
                      ),),
                  ),
                ),
          /// log out
    /*            Get.find<AuthController>().isLoggedIn()?
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12, top: 4),
                  child:
                  InkWell(
                    onTap: (){
                      if (Get.find<AuthController>().isLoggedIn()) {
                        Get.find<AuthController>().signOut();
                      } else {
                        Get.to(LoginRegisterPage(isFromCart: false,));
                      }
                    },
                    child: Container(
                      color: Color(0xffFFFFFF),
                      child: ListTile(
                        // contentPadding: EdgeInsets.zero,
                        leading: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(Images.person, color: Colors.black, height: 29,width: 29,),
                          ],
                        ),
                        title:  Get.find<AuthController>().isLoggedIn()? Text("Log out", style: robotoMedium.copyWith(fontSize: 15, color: Colors.black87),) : Text("Register", style: robotoMedium.copyWith(fontSize: 15, color: Colors.black87),),
                        // subtitle: Text("For faster checkout", style: robotoRegular.copyWith(fontSize: 12.5, color: Colors.black87),),
                        trailing:   Icon(Icons.arrow_forward_ios, size: 20, color: Colors.black87,),
                      ),
                    ),
                  ),
                ) :
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12, top: 4),
                  child:
                  InkWell(
                    onTap: (){
                      if (Get.find<AuthController>().isLoggedInGuest()) {
                        Get.find<AuthController>().signOutGuest();
                      } else {
                        showCustomSnackBar("There is no Login credential", isPosition: false, isError: true);
                      }
                    },
                    child: Container(
                      color: Color(0xffFFFFFF),
                      child: ListTile(
                        // contentPadding: EdgeInsets.zero,
                        leading: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(Images.person, color: Colors.black, height: 29,width: 29,),
                          ],
                        ),
                        title:   Text("Log out", style: robotoMedium.copyWith(fontSize: 15, color: Colors.black87)),
                        // subtitle: Text("For faster checkout", style: robotoRegular.copyWith(fontSize: 12.5, color: Colors.black87),),
                        trailing:   Icon(Icons.arrow_forward_ios, size: 20, color: Colors.black87,),
                      ),
                    ),
                  ),
                ),*/


              /*  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: InkWell(
                    onTap: (){
                      // Get.to(ChangePassword());
                    },
                    child: Card(
                      elevation: 0.5,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8,20,8,20),
                        child: Column(
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  Icon(Icons.password, size: 20),
                                  SizedBox(width: 8),
                                  Text("Change Password")
                                ],),
                                Icon(Icons.arrow_forward_ios, size: 17),
                              ],
                            )
                          ],
                        ),
                      ),),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: InkWell(
                    onTap: (){
                      Get.find<AuthController>().signOut();
                    },
                    child: Card(
                      elevation: 0.5,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8,20,8,20),
                        child: Column(
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  Icon(Icons.logout, size: 20),
                                  SizedBox(width: 8),
                                  Text("Logout")
                                ],),
                                Icon(Icons.arrow_forward_ios, size: 17),
                              ],
                            )
                          ],
                        ),
                      ),),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Card(
                    elevation: 0.5,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8,20,8,20),
                      child: Column(
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
                                Icon(Icons.mobile_screen_share, size: 20),
                                SizedBox(width: 8),
                                Text("Hotline")
                              ],),
                              Icon(Icons.call, size: 20),
                            ],
                          )
                        ],
                      ),
                    ),),
                ),
*/
                SizedBox(height: Get.height/12),
              ],
            ),
          );
        }
      ),
    );
  }


  double rewardpointcalculation(double point, double userpoint){
    return point-userpoint;
  }

}