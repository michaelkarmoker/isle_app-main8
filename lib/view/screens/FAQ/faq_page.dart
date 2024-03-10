import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/profile/FAQ/faq_controller.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/constants.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/ProgressHUD.dart';
import 'package:isletestapp/view/base/custom_only_textfield_with_border.dart';
import 'package:isletestapp/view/base/custom_snackbar.dart';
import 'package:isletestapp/view/screens/custom%20logo/custom_logo_widget.dart';
import 'package:isletestapp/view/screens/home/home_page.dart';
import 'package:isletestapp/view/screens/main_page/main_screen.dart';
import 'package:isletestapp/view/screens/search/search_screen.dart';
import 'package:isletestapp/view/screens/universal_bottom_nav/universal_bottom_nav.dart';
import 'package:isletestapp/view/screens/wish_list/custom_wish_item_count_widget.dart';
import 'package:isletestapp/view/screens/wish_list/wish_list.dart';
import 'package:isletestapp/view/auth/login-register.dart';
import 'package:isletestapp/view/screens/design%20backup/search_sunny.dart';


class FAQPage extends StatefulWidget {
  bool isExpanded1=false;
  bool isExpanded2=false;
  bool isExpanded3=false;
  bool isExpanded4=false;
  bool isExpanded5=false;
  bool isExpanded6=false;
  bool isExpanded7=false;


  bool childexp1=false;
  bool childexp2=false;
  bool childexp3=false;
  bool childexp4=false;
  bool childexp5=false;
  bool childexp6=false;




  @override
  State<FAQPage> createState() => _IsleDrawerState();
}

class _IsleDrawerState extends State<FAQPage> {
  Color tabColor= gold;

  Color button1Color = gold;
  Color button2Color = gold;
  Color button3Color = gold;

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


  TextEditingController searchCtr = TextEditingController();
  FocusNode searchFcs=FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<FAQController>().dataInitialize();
      // Get.find<PurchaseController>().dataInitializeForProductList();
    });
  }



  @override
  Widget build(BuildContext context) {
    return Container(

      // width: Get.width/1.18,
      child: GetBuilder<FAQController>(
        builder: (controller) {
          return SafeArea(
            child: Scaffold(
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
              // backgroundColor: Color(0xffEBEFF3),
              // backgroundColor: Color(0xffFFFFFF),
              body:  SingleChildScrollView(
                child : controller.faqTabResponse!=null?
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text("Frequently asked Questions", style: railwaybold.copyWith(fontSize: 14, color: Colors.black),),
                    ),
                    SizedBox(height: 8),
                    /// Tab Bar Part
                    Container(
                      // color: Colors.yellow,
                      height: 55,
                      // color: tabColor,
                      // color: Color(0xffFFFFFF),
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          itemCount: controller.faqTabResponse!.data!.length,
                          itemBuilder: (BuildContext context , int index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 8, top: 8, bottom: 8),
                              child: InkWell(
                                onTap: (){
                                  controller.faqTabResponse!.data![index].isDrop1=!controller.faqTabResponse!.data![index].isDrop1;
                                  controller.getFAQTabClickData(controller.faqTabResponse?.data?[index]?.id!.toString()??"");
                                  setState(() {
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    // color: Colors.grey.shade200,
                                    border: Border.all(
                                      color: Colors.grey, // Set the border color
                                      width: 0.3, // Set the border width
                                    ),
                                    borderRadius: BorderRadius.circular(4)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15, right: 15, top: 8, bottom: 8),
                                    child: Center(
                                      child:
                                     controller.faqTabResponse!=null? controller.faqTabResponse!.data!.length>0?
                                      Text(
                                        "${controller.faqTabResponse!.data![index].title!}",
                                        style: TextStyle(
                                          // Add style for the text within the container
                                        ),
                                      )
                                      : SizedBox() : SizedBox(),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }

                      ),
                    ),
SizedBox(height: 15),
                    SingleChildScrollView(
                      child: controller.isLoading?Container(): controller.faqTabClickDataResponse!=null? controller.faqTabClickDataResponse!.data!=null?
                      Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(15.0),
                              child:
                              ListView.builder(
                                  // reverse: true,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: controller.faqTabClickDataResponse!.data!.length,
                                  itemBuilder: (BuildContext context, int index){
                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          onTap: (){
                                            setState((){
                                              controller.faqTabClickDataResponse!.data![index].isDrop=!controller.faqTabClickDataResponse!.data![index].isDrop;
                                            });
                                          },
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  flex: 7,
                                                  child: Text(
                                                    "${
                                                        controller.faqTabClickDataResponse!.data![index].question!
                                                    }",
                                                    style: poppins.copyWith(
                                                        fontSize: 14, fontWeight: FontWeight.w500),
                                                  )),
                                              Expanded(
                                                  flex: 2,
                                                  child: Icon(
                                                    Icons.add,
                                                    size: 30,
                                                    color: gold,
                                                  ))
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        controller.faqTabClickDataResponse!.data![index].isDrop?
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8,top: 5,right: 20,bottom: 5),
                                          child: HtmlWidget("${
                                              controller.faqTabClickDataResponse!.data![index].answer!
                                          }",
                                            textStyle: railway.copyWith(fontSize: 12),
                                          ),
                                        ):Container(),
                                        Divider(
                                          thickness: 1,
                                          color: Color(0xffF3F3F3),
                                        ),
                                      ],
                                    );
                                  }
                              )
                          ),
                          SizedBox(height: 50)
                        ],
                      ):Container(
                        height: Get.height,
                        width: Get.width,
                        child: Center(child: Padding(
                          padding: const EdgeInsets.only(top: 0),
                          child: Image.asset(Images.result_not_found, height: 80, width: 80,),
                        ),),)  : SizedBox(),
                    )
                  ],
                )
                : SizedBox(),
              ),
            ),
          );
        }
      ),
    );
  }
}
