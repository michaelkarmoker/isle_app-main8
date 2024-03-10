import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/profile/product%20feedback/product_feedback_controller.dart';
import 'package:isletestapp/helper/date_converter.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/ProgressHUD.dart';
import 'package:isletestapp/view/screens/custom%20logo/custom_logo_widget.dart';
import 'package:isletestapp/view/screens/profile/feedback/view_product_feedback.dart';
import 'package:isletestapp/view/screens/search/search_screen.dart';
import 'package:isletestapp/view/screens/universal_bottom_nav/universal_bottom_nav.dart';
import 'package:isletestapp/view/screens/wish_list/custom_wish_item_count_widget.dart';

class ProductFeedback extends StatefulWidget {
  ProductFeedback({Key? key,
  }) : super(key: key);
  @override
  State<ProductFeedback> createState() => _WishListPageState();
}

class _WishListPageState extends State<ProductFeedback> {
  
  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
          Get.find<ProductFeedbackController>().dataInitialize();

        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductFeedbackController>(
        builder: (controller) {
          return Scaffold(
            bottomNavigationBar: const UniversalBottomNav(),
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
              leadingWidth: Get.width / 3.5,
              title: const CustomLogo(),
            ),
            // backgroundColor: Color(0xffEBEFF3),
            backgroundColor: const Color(0xffFFFFFF),
            body: controller.accountProductFeedbackResponse!=null?
            ProgressHUD(
              inAsyncCall: controller.isLoading,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(
                        height: 1,
                        thickness: 1,
                        color: gold,
                      ),
                      ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics:  NeverScrollableScrollPhysics(),
                          // scrollDirection: Axis.vertical,
                          itemCount: 1,
                          // itemCount: controller.jobCardResponse!.cardDetails!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 40,
                              decoration: BoxDecoration(
                                // color: controller.getColorByStatus(controller.jobCardResponse!.cardDetails![index].statusClass!),
                              ),

                              child: Padding(
                                padding: EdgeInsets.only(top: 0, bottom: 0),
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 1,
                                      color: gold,
                                      child: Text(""),
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: Center(
                                          child: Text(
                                            'Order ID',
                                            style: railwaybold.copyWith(
                                                color: Colors.black,
                                                fontSize: 11),
                                          ),
                                        )),
                                    Container(
                                      height: 40,
                                      width: 1,
                                      color: gold,
                                      child: Text(""),
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: Center(
                                          child: Text('Order Date',
                                            style: railwaybold.copyWith(
                                                fontSize: 11),
                                          ),
                                        )),
                                    Container(
                                      height: 40,
                                      width: 1,
                                      color: gold,
                                      child: Text(""),
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: Center(
                                          child: Text('Product/Details',
                                            style: railwaybold.copyWith(
                                                fontSize: 11),
                                          ),
                                        )),
                                    Container(
                                      height: 40,
                                      width: 1,
                                      color: gold,
                                      child: Text(""),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                      Divider(
                        height: 1,
                        thickness: 1,
                        color: gold,
                      ),
                      // SizedBox(height: 4),
                      controller.accountProductFeedbackResponse!=null?
                      ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics:  NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: controller.accountProductFeedbackResponse!.data!.length??0,
                          itemBuilder: (context, index) {
                            print("IP INDEx${controller.accountProductFeedbackResponse?.data?[index]?.orderNo??""}");
                            return Container(
                              decoration: BoxDecoration(
                                color: Color(0xffF2F0EB),
                                // color: controller.getColorByStatus(controller.jobCardResponse!.cardDetails![index].statusClass!),
                              ),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 40,
                                    width: 1,
                                    color: gold,
                                    child: Text(""),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                        height: 40,
                                        child: Center(
                                          child: Text(
                                            '${controller.accountProductFeedbackResponse!.data![index]!.orderNo??""}',
                                            style: poppins.copyWith(
                                                fontSize: 10
                                            ),
                                          ),
                                        ),
                                      )),
                                  Container(
                                    height: 40,
                                    width: 1,
                                    color: gold,
                                    child: Text(""),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                        height: 40,
                                        child: Center(
                                          child: Text(
                                            '${DateConverter.stringToLocalDateOnly(controller.accountProductFeedbackResponse!.data![index]!.createdAt??"")}',
                                            style: poppins.copyWith(
                                                color: Colors.black,
                                                // color: textPurpale,
                                                fontSize: 10),
                                          ),
                                        ),
                                      )),
                                  Container(
                                    height: 40,
                                    width: 1,
                                    color: gold,
                                    child: Text(""),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: Center(
                                        child: GestureDetector(
                                            onTap: (){
                                              print("dghdfghdf");
                                              print(controller.accountProductFeedbackResponse?.data?[index]?.orderNo);
                                              print("ffffffffff");
                                              Get.to(()=>ViewProductFeedback(orderNo: controller.accountProductFeedbackResponse?.data?[index]?.orderNo??"",));
                                              // Get.to(()=>ViewProductFeedback(orderId: controller.accountProductFeedbackResponse?.data?[index]?.id!.toString()??"",));
                                            },
                                            child: Icon(Icons.menu_rounded, color: black,)),
                                      )),
                                  Container(
                                    height: 40,
                                    width: 1,
                                    color: gold,
                                    child: Text(""),
                                  ),
                                ],
                              ),
                            );
                          })
                          : SizedBox(height: 60,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 150, top: 8),
                          child: Text('Data Empty'),
                        ),),
                      Divider(
                        height: 1,
                        thickness: 1,
                        color: gold,
                      ),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            )
            : SizedBox(child: Center(child: Text("Data Empty")),),
          );
        }
    );
  }

















}
