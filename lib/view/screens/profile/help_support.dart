
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/auth_controller.dart';
import 'package:isletestapp/controller/footer%20type%20controller/footer_type_wise_controller.dart';
import 'package:isletestapp/util/constants.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/screens/FAQ/faq_page.dart';
import 'package:isletestapp/view/auth/login-register.dart';
import 'package:isletestapp/view/screens/contact%20us/contact_us.dart';
import 'package:isletestapp/view/screens/custom%20logo/custom_logo_widget.dart';
import 'package:isletestapp/view/screens/multi%20screen/custom_footer_page_widget.dart';
import 'package:isletestapp/view/screens/order%20track/order_track_page.dart';
import 'package:isletestapp/view/screens/profile/landing%20pages/about_isle_rewards.dart';
import 'package:isletestapp/view/screens/profile/shipping_delivery.dart';
import 'package:isletestapp/view/screens/search/search_screen.dart';
import 'package:isletestapp/view/screens/universal_bottom_nav/universal_bottom_nav.dart';
import 'package:isletestapp/view/screens/wish_list/custom_wish_item_count_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpNSupport extends StatefulWidget {
  const HelpNSupport({Key? key}) : super(key: key);

  @override
  State<HelpNSupport> createState() => _UserInfoState();
}

class _UserInfoState extends State<HelpNSupport> {
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<FooterTypeWiseController>().dataInitialize();
    }
    );
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return GetBuilder<FooterTypeWiseController>(
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: UniversalBottomNav(),
          backgroundColor: Color(0xffF2F6F9),
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Color(0xff000000)),
            titleSpacing: 0,
            backgroundColor: const Color(0xffFFFFFF),
            centerTitle: true,
            elevation: 0,
            toolbarHeight: 62,
            actions: [
              InkWell(
                  onTap: (){
                    Get.to(SearchScreen());
                  },
                  // child: Icon(Icons.search,color: Color(0xff000000),size: 25,)):SizedBox(),
                  child: Image.asset(Images.search, height: 22, width: 22,)),
              SizedBox(width: 2),
              WishButtonWidget(),
              SizedBox(width: 4),
            ],
            leadingWidth: Get.width/3.5,
            title: const CustomLogo(),
          ),
          body: Container(
            child: ListView(
              children: [
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text("Help & Support", style: railwaybold.copyWith(fontSize: 14, color: Colors.black),),
                ),
                SizedBox(height: 8),
                Divider(
                  thickness: 5,
                  height: 5,
                  color: Color(0xffF2F6F9),
                ),

ListView.builder(
    itemCount: controller.mainPageFooterTypeWiseResponse?.data?.customerCare?.length??0,
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemBuilder: (BuildContext context, int index) {
      return  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: InkWell(
          onTap: (){

            print("edfgsdg");
            print(controller?.mainPageFooterTypeWiseResponse?.data?.customerCare?[index]?.pageUrlType);
            print(controller.mainPageFooterTypeWiseResponse?.data?.customerCare?[index]?.video);
            print("tgsgt");
            if( controller?.mainPageFooterTypeWiseResponse?.data?.customerCare?[index]?.pageUrlType == "faq")
            {
              Get.to(()=> FAQPage());
            } else  if(controller?.mainPageFooterTypeWiseResponse?.data?.customerCare?[index]?.pageUrlType == "contact-us") {
              Get.to(()=> Contactus());
            }  else  if(controller?.mainPageFooterTypeWiseResponse?.data?.customerCare?[index]?.pageUrlType == "isle-reward") {
              Get.to(()=> AboutIsleRewards());
            } else  if(controller?.mainPageFooterTypeWiseResponse?.data?.customerCare?[index]?.pageUrlType == "track-order") {
              Get.to(()=> OrderTrack());
            }
            else {
              Get.to(()=> CustomFooterView(
                image: controller.mainPageFooterTypeWiseResponse?.data?.customerCare?[index]?.cover??"",
                video: controller.mainPageFooterTypeWiseResponse?.data?.customerCare?[index]?.video?.toString()??"",
                head: controller.mainPageFooterTypeWiseResponse?.data?.customerCare?[index]?.type??"",
                title: controller.mainPageFooterTypeWiseResponse?.data?.customerCare?[index]?.pageTitle??"",
                desc: controller.mainPageFooterTypeWiseResponse?.data?.customerCare?[index]?.details??"",
              ));
            }
          },
          child: Card(
            elevation: 0.5,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12,15,8,15),
              child: Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        // Icon(Icons.star_border_purple500_sharp, size: 30, color: Colors.black,),
                  /*      Image.asset(Images.whatsapp, height: 30, width: 30, color: Colors.black,),
                        SizedBox(width: 15),*/
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${controller.mainPageFooterTypeWiseResponse?.data?.customerCare?[index]?.pageTitle??""}", style: railway.copyWith(fontWeight: FontWeight.w700,fontSize: 13,),),
                            // SizedBox(height: 8),
                            // Text("Contact us, Shipping, RAQ, Returns...", style: railway.copyWith(fontWeight: FontWeight.w300,fontSize: 12,),),
                          ],
                        )
                      ],),
                      Icon(Icons.arrow_forward_ios, size: 18, color: Colors.black87,),
                    ],
                  )
                ],
              ),
            ),),
        ),
      );
    }
),







/*controller.mainPageFooterTypeWiseResponse!=null? controller.mainPageFooterTypeWiseResponse!.data!.customerCare!.length>0?



                ListView.builder(
                    itemCount: controller.mainPageFooterTypeWiseResponse?.data?.customerCare?.length??0,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          InkWell(
                            onTap: (){
                              print("edfgsdg");
                              print("edfgsdg");
                              print(controller.mainPageFooterTypeWiseResponse?.data?.customerCare?[index]?.video);
                              print("tgsgt");
                              // if(controller?.mainPageFooterTypeWiseResponse?.data?.customerCare?[index]?.pageTitle)
                              Get.to(()=> CustomFooterView(
                                image: controller.mainPageFooterTypeWiseResponse?.data?.customerCare?[index]?.cover??"",
                                video: controller.mainPageFooterTypeWiseResponse?.data?.customerCare?[index]?.video?.toString()??"",
                                head: controller.mainPageFooterTypeWiseResponse?.data?.customerCare?[index]?.type??"",
                                title: controller.mainPageFooterTypeWiseResponse?.data?.customerCare?[index]?.pageTitle??"",
                                desc: controller.mainPageFooterTypeWiseResponse?.data?.customerCare?[index]?.details??"",
                              ));
                            },
                            child: Container(
                              alignment: Alignment.centerLeft,
                              //  color: Colors.green,
                              height: 45,
                              width: Get.width,
                              child: Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  "${controller.mainPageFooterTypeWiseResponse?.data?.customerCare?[index]?.pageTitle??""}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white60
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
                        ],
                      );
                    }
                )
                : SizedBox.shrink() : SizedBox.shrink(),*/

















      /*          Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: InkWell(
                    onTap: (){
                      Get.to(Contactus());
                    },
                    child: Card(
                      elevation: 0.5,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12,30,8,30),
                        child: Column(
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  // Icon(Icons.star_border_purple500_sharp, size: 30, color: Colors.black,),
                                  Image.asset(Images.whatsapp, height: 30, width: 30, color: Colors.black,),
                                  SizedBox(width: 15),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Contact us", style: railway.copyWith(fontWeight: FontWeight.w700,fontSize: 15,),),
                                      // SizedBox(height: 8),
                                      // Text("Contact us, Shipping, RAQ, Returns...", style: railway.copyWith(fontWeight: FontWeight.w300,fontSize: 12,),),
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
                      // Get.to(FAQ());
                      Get.to(FAQPage());
                    },
                    child: Card(
                      elevation: 0.5,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12,30,8,30),
                        child: Column(
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  // Icon(Icons.star_border_purple500_sharp, size: 30, color: Colors.black,),
                                  Image.asset(Images.info, height: 30, width: 30, color: Colors.black,),
                                  SizedBox(width: 15),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Frequently asked Questions", style: railway.copyWith(fontWeight: FontWeight.w700,fontSize: 15,),),
                                      // SizedBox(height: 8),
                                      // Text("Contact us, Shipping, RAQ, Returns...", style: railway.copyWith(fontWeight: FontWeight.w300,fontSize: 12,),),
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
                      Get.to(ShippingNDelivery());
                    },
                    child: Card(
                      elevation: 0.5,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12,30,8,30),
                        child: Column(
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  // Icon(Icons.star_border_purple500_sharp, size: 30, color: Colors.black,),
                                  Image.asset(Images.car, height: 30, width: 30, color: Colors.black,),
                                  SizedBox(width: 15),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Shipping and Delivery", style: railway.copyWith(fontWeight: FontWeight.w700,fontSize: 15,),),
                                      // SizedBox(height: 8),
                                      // Text("Contact us, Shipping, RAQ, Returns...", style: railway.copyWith(fontWeight: FontWeight.w300,fontSize: 12,),),
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
                      // Get.to(LoginRegisterPage());
                    },
                    child: Card(
                      elevation: 0.5,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12,30,8,30),
                        child: Column(
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  // Icon(Icons.star_border_purple500_sharp, size: 30, color: Colors.black,),
                                  Image.asset(Images.load, height: 30, width: 30, color: Colors.black,),
                                  SizedBox(width: 15),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Online Returns", style: railway.copyWith(fontWeight: FontWeight.w700,fontSize: 15,),),
                                      // SizedBox(height: 8),
                                      // Text("Contact us, Shipping, RAQ, Returns...", style: railway.copyWith(fontWeight: FontWeight.w300,fontSize: 12,),),
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
                      // Get.to(LoginRegisterPage());
                    },
                    child: Card(
                      elevation: 0.5,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12,30,8,30),
                        child: Column(
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  // Icon(Icons.star_border_purple500_sharp, size: 30, color: Colors.black,),
                                  Image.asset(Images.card, height: 30, width: 30, color: Colors.black,),
                                  SizedBox(width: 15),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Payment", style: railway.copyWith(fontWeight: FontWeight.w700,fontSize: 15,),),
                                      // SizedBox(height: 8),
                                      // Text("Contact us, Shipping, RAQ, Returns...", style: railway.copyWith(fontWeight: FontWeight.w300,fontSize: 12,),),
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

              ],
            ),
          ),
        );
      }
    );
  }
}