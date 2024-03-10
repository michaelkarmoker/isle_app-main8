import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/profile/orders%20refunds/orders_and_retunds_controller.dart';
import 'package:isletestapp/helper/date_converter.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/constants.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/ProgressHUD.dart';
import 'package:isletestapp/view/base/custom_button.dart';
import 'package:isletestapp/view/screens/custom%20logo/custom_logo_widget.dart';
import 'package:isletestapp/view/screens/product%20page/product_page.dart';
import 'package:isletestapp/view/screens/profile/orders%20returns/exchange/exchange_details.dart';
import 'package:isletestapp/view/screens/profile/orders%20returns/exchange/exchange_track.dart';
import 'package:isletestapp/view/screens/profile/orders%20returns/exchange/returns_details.dart';
import 'package:isletestapp/view/screens/profile/orders%20returns/order_returns_track.dart';
import 'package:isletestapp/view/screens/profile/orders%20returns/orders_returns_details.dart';
import 'package:isletestapp/view/screens/search/search_screen.dart';
import 'package:isletestapp/view/screens/universal_bottom_nav/universal_bottom_nav.dart';
import 'package:isletestapp/view/screens/wish_list/custom_wish_item_count_widget.dart';


class OrdersReturns extends StatefulWidget {
  OrdersReturns({Key? key,
  }) : super(key: key);
  bool isExpanded1 = false;
  bool isExpanded2 = false;
  bool isExpanded3 = false;
  bool isExpanded4 = false;
  /// exchange
  bool isExpanded5 = false;
  bool isExpanded6 = false;

  @override
  State<OrdersReturns> createState() => _WishListPageState();
}

class _WishListPageState extends State<OrdersReturns> {
  bool isOpen=false;
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<OrdersReturnsController>().dataInitialize();
    });
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
    Get.find<OrdersReturnsController>().dataClose();
  }
  Color tabColor = gold;
  Color button1Color = gold;
  Color button2Color = gold;
  // Color button3Color = gold;
  // Color button3Color = Colors.grey;
  void changeColor(int buttonNumber) {
    setState(() {
      switch (buttonNumber) {
        case 1:
          button1Color = gold;
          button2Color = gold;
          break;
        case 2:
          button1Color = gold;
          button2Color = gold;
          break;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersReturnsController>(
        builder: (controller) {
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              bottomNavigationBar: UniversalBottomNav(),
              appBar: AppBar(
                iconTheme: IconThemeData(color: Color(0xff000000)),
                titleSpacing: 0,
                backgroundColor: Color(0xffFFFFFF),
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
                title: CustomLogo(),
              ),
              // backgroundColor: Color(0xffEBEFF3),
              backgroundColor: Color(0xffFFFFFF),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 20,bottom: 15),
                    child: Text("Orders and Returns", style: railwaybold.copyWith(fontSize: 20),),
                  ),
                  SizedBox(height: 5),
                  /// Tab Bar Part
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
                        color: Colors.white, // Background color for the Container
                      ),
                      child: TabBar(
                        isScrollable: true,
                        indicator: BoxDecoration(
                          border: Border.all(color: gold, ),
                          // borderRadius: BorderRadius.circular(20), // Same as Container's borderRadius
                          color: tabColor, // Use the tabColor variable
                        ),
                        indicatorPadding: EdgeInsets.symmetric(horizontal: 0),
                        onTap: (index) {
                          setState(() {
                            if (index == 0) {
                              tabColor = gold;
                            }
                            if (index == 1) {
                              tabColor = gold;
                            }
                          });
                          print(index);
                        },
                        indicatorColor: tabColor,
                        indicatorWeight: 2.5,
                        tabs: [
                          Tab(
                            child: Text(
                              'My Orders',
                              style: railwaybold.copyWith(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Returns & Exchange',
                              style: railwaybold.copyWith(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                        children: [
                          /// 1 st TAB
                          RefreshIndicator(
                              onRefresh: () async {
                                // showCustomSnackBar("2");
                              },
                              child: SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 5),
                                        Text("My Orders", style: railwaybold.copyWith(fontSize: 17)),
                                        SizedBox(height: 15),
                                        Text("View your orders to see what you've purchased or track their delivery", style: railway.copyWith(fontSize: 12)),
                                        SizedBox(height: 10),
                                        Text("If your purchase isn't quite what you're looking for, you've got 28 days from when you received your order to have your items sent back to us for a refund or exchange.",
                                            style: railway.copyWith(fontSize: 12)),
                                        SizedBox(height: 15),
                                        /// recent
                                        Padding(
                                          padding: const EdgeInsets.only(top: 6, bottom: 6),
                                          child: InkWell(
                                            onTap: (){
                                              widget.isExpanded1=! widget.isExpanded1;
                                              setState(() {
                                              });
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(color: gold, width: 1)
                                              ),
                                              // color: Color(0xff20243D),
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 0, bottom: 8,top: 8),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 4,
                                                      child: Row(
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 8, top: 10, bottom: 10),
                                                            child: Text(
                                                              "Recent Orders",
                                                              style: railway.copyWith(
                                                                fontSize: 15,
                                                                fontWeight: FontWeight.w600,
                                                                color: Colors.black,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),),
                                                    Expanded(
                                                        flex: 1,
                                                        child: widget.isExpanded1? Image.asset(Images.up, color: Colors.black54, height: 15, width: 15,): Image.asset(Images.drop, color: Colors.black54, height: 22, width: 22,)
                                                      // child: Icon(Icons.arrow_drop_down_sharp, color: Colors.black,)
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 0),
                                        widget.isExpanded1?
                                        // controller.productDetailsResponse != null && controller.productDetailsResponse!.data != null ?
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                                              child: Text(
                                                "Last 5 Orders",
                                                style: robotoRegular.copyWith(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.grey.shade800
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Container(
                                              width: Get.width*2,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5.0),
                                                color: Colors.white,
                                              ),
                                              child: SingleChildScrollView(
                                                scrollDirection: Axis.horizontal,
                                                child: Container(
                                                  width: Get.width*2,
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
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
                                                                            'Order Number',
                                                                            // '${DateConverter.stringToLocalDateOnly( controller.jobCardResponse!.cardDetails![index].date!)
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
                                                                          child: Text(
                                                                            'Date',
                                                                            // '${controller.jobCardResponse!.cardDetails![index].inTime=="00:00"?"00:00":DateConverter.convertTimeToTime( controller.jobCardResponse!.cardDetails![index].inTime!)
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
                                                                          child: Padding(
                                                                            padding: const EdgeInsets.only(left: 1, right: 1),
                                                                            child: Text(
                                                                              'Name',
                                                                              // textAlign: TextAlign.left,
                                                                              style: railwaybold.copyWith(
                                                                                // color: Colors.yellow,
                                                                                  fontSize: 11
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
                                                                        child: Center(
                                                                          child: Text(
                                                                            'Payment\nMethod',
                                                                            style: railwaybold.copyWith(
                                                                              fontSize: 11,
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
                                                                          child: Text(
                                                                            'Payment\nStatus',
                                                                            style: railwaybold.copyWith(
                                                                                fontSize: 11
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
                                                                          child: Text(
                                                                            'Total Price\n(BDT)',
                                                                            style: railwaybold.copyWith(
                                                                              // color: Colors.yellow,
                                                                                fontSize: 12
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
                                                                          child: Text(
                                                                            "Status",
                                                                            style: railwaybold.copyWith(
                                                                                fontSize: 12
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
                                                                          child: Text(
                                                                            'Details',
                                                                            style: railwaybold.copyWith(
                                                                              fontSize: 12,
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
                                                                          child: Text(
                                                                            'Track',
                                                                            style: railwaybold.copyWith(
                                                                              fontSize: 12,
                                                                            ),
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
                                                      SizedBox(height: 4),

                                                     controller.recentOrdersReturnsListResponse!=null? controller.recentOrdersReturnsListResponse!.data!.length>0?
                                                      ListView.builder(
                                                          padding: EdgeInsets.zero,
                                                          shrinkWrap: true,
                                                          physics:  NeverScrollableScrollPhysics(),
                                                          scrollDirection: Axis.vertical,
                                                          itemCount: controller.recentOrdersReturnsListResponse!.data!.length>4? 5 : controller.recentOrdersReturnsListResponse!.data!.length??0,
                                                          itemBuilder: (context, index) {
                                                            return ProgressHUD(
                                                              inAsyncCall: controller.isLoading,
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                  color: Color(0xffF2F0EB),
                                                                  // color: controller.getColorByStatus(controller.jobCardResponse!.cardDetails![index].statusClass!),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsets.only(left: 6, top: 10, bottom: 10),
                                                                  child: Row(
                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      Expanded(
                                                                          flex: 1,
                                                                          child: Text(
                                                                            '${controller.recentOrdersReturnsListResponse!.data![index]!.orderNo??""}',
                                                                            // '${DateConverter.stringToLocalDateOnly( controller.jobCardResponse!.cardDetails![index].date!)
                                                                            style: poppins.copyWith(
                                                                                color: Colors.black,
                                                                                // color: textPurpale,
                                                                                fontSize: 9),
                                                                          )),

                                                                      Expanded(
                                                                          flex: 1,
                                                                          child: Center(
                                                                            child: Text(
                                                                              '${DateConverter.stringToLocalDateOnly(controller.recentOrdersReturnsListResponse!.data![index]!.createdAt??"")}',
                                                                              // '12/29/2023',
                                                                              // '${controller.jobCardResponse!.cardDetails![index].inTime=="00:00"?"00:00":DateConverter.convertTimeToTime( controller.jobCardResponse!.cardDetails![index].inTime!)
                                                                              style: poppins.copyWith(
                                                                                  fontSize: 9
                                                                              ),
                                                                            ),
                                                                          )),
                                                                      Expanded(
                                                                          flex: 1,
                                                                          child: Center(
                                                                            child: Padding(
                                                                              padding: const EdgeInsets.only(right: 1),
                                                                              child: Text(
                                                                                '${controller.recentOrdersReturnsListResponse!.data![index]!.firstName??""} ${controller.recentOrdersReturnsListResponse!.data![index]!.lastName??""}',
                                                                                textAlign: TextAlign.left,
                                                                                style: poppins.copyWith(
                                                                                  // color: Colors.yellow,
                                                                                    fontSize: 9
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          )),
                                                                      Expanded(
                                                                          flex: 1,
                                                                          child: Center(
                                                                            child: Text(
                                                                              '${controller.recentOrdersReturnsListResponse!.data![index]!.paymentMethod??""}',
                                                                              style: poppins.copyWith(
                                                                                  fontSize: 9),
                                                                            ),
                                                                          )),
                                                                      Expanded(
                                                                          flex: 1,
                                                                          child: Center(
                                                                            child: Text(
                                                                              '${controller.recentOrdersReturnsListResponse!.data![index]!.paymentStatus??""}',
                                                                              style: poppins.copyWith(
                                                                                  fontSize: 9),
                                                                            ),
                                                                          )),
                                                                      Expanded(
                                                                          flex: 1,
                                                                          child: Center(
                                                                            child: Text(
                                                                              // '${controller.recentOrdersReturnsListResponse!.data![index]!.price??""}',
                                                                              "${grandTotal(controller.recentOrdersReturnsListResponse!.data![index].price!.toDouble()??0, controller.recentOrdersReturnsListResponse!.data![index].calculatedDiscount!.toDouble()??0,
                                                                                  controller.recentOrdersReturnsListResponse!.data![index].couponOrIsleDiscount!.toDouble()??0, controller.recentOrdersReturnsListResponse!.data![index].brandCouponDiscount!.toDouble()??0,
                                                                                  controller.recentOrdersReturnsListResponse!.data![index].redeemReward!.toDouble()??0 , controller.recentOrdersReturnsListResponse!.data![index].minimumPurchaseDiscount!.toDouble()??0,
                                                                                  controller.recentOrdersReturnsListResponse!.data![index].calculatedVat!.toDouble()??0,
                                                                                  controller.recentOrdersReturnsListResponse!.data![index].deliveryCharge!.toDouble()??0
                                                                              )} BDT",
                                                                              style: poppins.copyWith(
                                                                                // color: Colors.yellow,
                                                                                  fontSize: 9),
                                                                            ),
                                                                          )),
                                                                      Expanded(
                                                                          flex: 1,
                                                                          child: Center(
                                                                            child: Text(
                                                                              "${controller.recentOrdersReturnsListResponse!.data![index]!.orderStatus??""}",
                                                                              style: poppins.copyWith(
                                                                                  fontSize: 9),
                                                                            ),
                                                                          )),
                                                                      Expanded(
                                                                          flex: 1,
                                                                          child: Center(
                                                                            child:  InkWell(
                                                                              onTap: () {
                                                                                print(controller.recentOrdersReturnsListResponse!.data![index].id!);
                                                                                print(controller.recentOrdersReturnsListResponse!.data![index].orderNo!);
                                                                                Get.to(()=>OrdersReturnsDetails(id: controller.recentOrdersReturnsListResponse!.data![index].id!.toString(),));
                                                                              },
                                                                              child: Container(
                                                                                  // color: Colors.green,
                                                                                  height: 15,
                                                                                  width: 35,
                                                                                  child: Icon(Icons.remove_red_eye_outlined, color: Colors.black87, size: 15,)),
                                                                            )
                                                                          )),
                                                                      Expanded(
                                                                          flex: 1,
                                                                          child: Center(
                                                                            child: InkWell(
                                                                              onTap: () {
                                                                                print(controller.recentOrdersReturnsListResponse!.data![index].orderNo!);
                                                                                Get.to(()=>OrdersReturnsDetailsTrack(orderNo: controller.recentOrdersReturnsListResponse!.data![index].orderNo!,
                                                                                  id: controller.recentOrdersReturnsListResponse!.data![index].id!.toString(),
                                                                                ));
                                                                              },
                                                                              child: Container(
                                                                                // color: Colors.green,
                                                                                  height: 15,
                                                                                  width: 35,
                                                                                  child: Icon(Icons.menu, color: Colors.black87, size: 15,)),
                                                                            )
                                                                          )),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          })
                                                          :  Container(
                                                        // color: Colors.red,
                                                        height: 150,
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(left: 85),
                                                          child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              SizedBox(height: 20),
                                                              Padding(
                                                                padding: const EdgeInsets.only(left: 65),
                                                                child: Image.asset(Images.bag, height: 45, width: 45),
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsets.only(left: 0, top: 8),
                                                                child: Text('You haven\'t placed order yet'),
                                                              ),
                                                              SizedBox(height: 8),
                                                              Padding(
                                                                padding: const EdgeInsets.only(left: 12),
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    CustomButton(
                                                                        height: 35,
                                                                        radius: 0,
                                                                        width: 150,
                                                                        buttoncolor: Colors.black,
                                                                        fontSize: 12,
                                                                        buttontextcolor: Colors.white,
                                                                        onPressed: () {
                                                                          Get.to(()=>ProductPage(
                                                                            page: AppConstants.SECTION,
                                                                            id: '3',
                                                                            pageId: 1,
                                                                          ));
                                                                          // Get.to(()=>Dashboard(pageIndex: 0));
                                                                        },
                                                                        buttonText: "SHOP NEW IN"
                                                                    ),
                                                                  ],
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ) : SizedBox(),
                                                      SizedBox(height: 0,),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ) : SizedBox() ,
                                        // :Container(),
                                        /*   Divider(thickness: 0.8,color: Color(0xffD1D2D2)),*/

                                        /// pending
                                        Padding(
                                          padding: const EdgeInsets.only(top: 6,bottom: 6),
                                          child: InkWell(
                                            onTap: (){
                                              widget.isExpanded2=! widget.isExpanded2;
                                              setState(() {
                                              });
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(color: gold, width: 1)
                                              ),
                                              // color: Color(0xff20243D),

                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 0, bottom: 8,top: 8),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 4,
                                                      child: Row(
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 8, top: 10, bottom: 10),
                                                            child: Text(
                                                              "Pending Orders",
                                                              style: railway.copyWith(
                                                                fontSize: 15,
                                                                fontWeight: FontWeight.w600,
                                                                color: Colors.black,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),),
                                                    Expanded(
                                                        flex: 1,
                                                        child: widget.isExpanded2? Image.asset(Images.up, color: Colors.black54, height: 15, width: 15,): Image.asset(Images.drop, color: Colors.black54, height: 22, width: 22,)
                                                      // child: Icon(Icons.arrow_drop_down_sharp, color: Colors.black,)
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 0),
                                        widget.isExpanded2?
                                        // controller.productDetailsResponse != null && controller.productDetailsResponse!.data != null ?
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            /*                  Padding(
                                          padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                                          child: Text(
                                            "Last 5 Orders",
                                            style: robotoRegular.copyWith(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey.shade800
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 10),*/
                                            Container(
                                              width: Get.width*2,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5.0),
                                                color: Colors.white,
                                              ),
                                              child: SingleChildScrollView(
                                                scrollDirection: Axis.horizontal,
                                                child: Container(
                                                  width: Get.width*2,
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
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
                                                                            '${tabletitle[index]}',
                                                                            // '${DateConverter.stringToLocalDateOnly( controller.jobCardResponse!.cardDetails![index].date!)
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
                                                                          child: Text(
                                                                            'Date',
                                                                            // '${controller.jobCardResponse!.cardDetails![index].inTime=="00:00"?"00:00":DateConverter.convertTimeToTime( controller.jobCardResponse!.cardDetails![index].inTime!)
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
                                                                          child: Text(
                                                                            'Name',
                                                                            // textAlign: TextAlign.left,
                                                                            style: railwaybold.copyWith(
                                                                              // color: Colors.yellow,
                                                                                fontSize: 11
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
                                                                          child: Text(
                                                                            'Payment\nMethod',
                                                                            style: railwaybold.copyWith(
                                                                              fontSize: 11,
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
                                                                          child: Text(
                                                                            'Payment\nStatus',
                                                                            style: railwaybold.copyWith(
                                                                                fontSize: 11
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
                                                                          child: Text(
                                                                            'Total Price\n(BDT)',
                                                                            style: railwaybold.copyWith(
                                                                              // color: Colors.yellow,
                                                                                fontSize: 12
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
                                                                          child: Text(
                                                                            "Status",
                                                                            style: railwaybold.copyWith(
                                                                                fontSize: 12
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
                                                                          child: Text(
                                                                            'Details',
                                                                            style: railwaybold.copyWith(
                                                                              fontSize: 12,
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
                                                                          child: Text(
                                                                            'Track',
                                                                            style: railwaybold.copyWith(
                                                                              fontSize: 12,
                                                                            ),
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
                                                      SizedBox(height: 4),
                                                      controller.pendingOrdersReturnsListResponse!.data!.length>0?
                                                      ListView.builder(
                                                          padding: EdgeInsets.zero,
                                                          shrinkWrap: true,
                                                          physics:  NeverScrollableScrollPhysics(),
                                                          scrollDirection: Axis.vertical,
                                                          itemCount: controller.pendingOrdersReturnsListResponse!.data!.length??0,
                                                          itemBuilder: (context, index) {
                                                            return Container(
                                                              decoration: BoxDecoration(
                                                                color: Color(0xffFCFAEE),
                                                                // color: controller.getColorByStatus(controller.jobCardResponse!.cardDetails![index].statusClass!),
                                                              ),

                                                              child: Padding(
                                                                padding: EdgeInsets.only(left: 6, top: 10, bottom: 10),
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Text(
                                                                          '${controller.pendingOrdersReturnsListResponse!.data![index]!.orderNo??""}',
                                                                          // '${DateConverter.stringToLocalDateOnly( controller.jobCardResponse!.cardDetails![index].date!)
                                                                          style: poppins.copyWith(
                                                                              color: Colors.black,
                                                                              // color: textPurpale,
                                                                              fontSize: 9),
                                                                        )),

                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            '${DateConverter.stringToLocalDateOnly(controller.pendingOrdersReturnsListResponse!.data![index]!.createdAt??"")}',
                                                                            // '12/29/2023',
                                                                            // '${controller.jobCardResponse!.cardDetails![index].inTime=="00:00"?"00:00":DateConverter.convertTimeToTime( controller.jobCardResponse!.cardDetails![index].inTime!)
                                                                            style: poppins.copyWith(
                                                                                fontSize: 9
                                                                            ),
                                                                          ),
                                                                        )),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Padding(
                                                                            padding: const EdgeInsets.only(right: 1),
                                                                            child: Text(
                                                                              '${controller.pendingOrdersReturnsListResponse!.data![index]!.firstName??""} ${controller.pendingOrdersReturnsListResponse!.data![index]!.lastName??""}',
                                                                              textAlign: TextAlign.left,
                                                                              style: poppins.copyWith(
                                                                                // color: Colors.yellow,
                                                                                  fontSize: 9
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        )),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            '${controller.pendingOrdersReturnsListResponse!.data![index]!.paymentMethod??""}',
                                                                            style: poppins.copyWith(
                                                                                fontSize: 9),
                                                                          ),
                                                                        )),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            '${controller.pendingOrdersReturnsListResponse!.data![index]!.paymentStatus??""}',
                                                                            style: poppins.copyWith(
                                                                                fontSize: 9),
                                                                          ),
                                                                        )),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            // '${controller.recentOrdersReturnsListResponse!.data![index]!.price??""}',
                                                                            "${grandTotal(controller.pendingOrdersReturnsListResponse!.data![index].price!.toDouble()??0, controller.pendingOrdersReturnsListResponse!.data![index].calculatedDiscount!.toDouble()??0,
                                                                                controller.pendingOrdersReturnsListResponse!.data![index].couponOrIsleDiscount!.toDouble()??0, controller.pendingOrdersReturnsListResponse!.data![index].brandCouponDiscount!.toDouble()??0,
                                                                                controller.pendingOrdersReturnsListResponse!.data![index].redeemReward!.toDouble()??0 , controller.pendingOrdersReturnsListResponse!.data![index].minimumPurchaseDiscount!.toDouble()??0,
                                                                                controller.pendingOrdersReturnsListResponse!.data![index].calculatedVat!.toDouble()??0,
                                                                                controller.pendingOrdersReturnsListResponse!.data![index].deliveryCharge!.toDouble()??0
                                                                            )} BDT",
                                                                            style: poppins.copyWith(
                                                                              // color: Colors.yellow,
                                                                                fontSize: 9),
                                                                          ),
                                                                        )),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            "${controller.pendingOrdersReturnsListResponse!.data![index]!.orderStatus??""}",
                                                                            style: poppins.copyWith(
                                                                                fontSize: 9),
                                                                          ),
                                                                        )),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                            child:  InkWell(
                                                                                onTap: () {
                                                                                  print(controller.pendingOrdersReturnsListResponse!.data![index].id!);
                                                                                  print(controller.pendingOrdersReturnsListResponse!.data![index].orderNo!);
                                                                                  Get.to(()=>OrdersReturnsDetails(id: controller.pendingOrdersReturnsListResponse!.data![index].id!.toString(),));
                                                                                },
                                                                              child: Container(
                                                                                // color: Colors.green,
                                                                                  height: 15,
                                                                                  width: 35,
                                                                                  child: Icon(Icons.remove_red_eye_outlined, color: Colors.black87, size: 15,)),
                                                                            )
                                                                        )),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                            child: InkWell(
                                                                              onTap: () {
                                                                                print(controller.pendingOrdersReturnsListResponse!.data![index].orderNo!);
                                                                                Get.to(()=>OrdersReturnsDetailsTrack(orderNo: controller.pendingOrdersReturnsListResponse!.data![index].orderNo!,
                                                                                  id: controller.pendingOrdersReturnsListResponse!.data![index].id!.toString(),
                                                                                ));
                                                                              },
                                                                              child: Container(
                                                                                // color: Colors.green,
                                                                                  height: 15,
                                                                                  width: 35,
                                                                                  child: Icon(Icons.menu, color: Colors.black87, size: 15,)),
                                                                            )
                                                                        )),
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          })
                                                          : Container(
                                                        // color: Colors.red,
                                                        height: 150,
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(left: 85),
                                                          child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              SizedBox(height: 20),
                                                              Padding(
                                                                padding: const EdgeInsets.only(left: 65),
                                                                child: Image.asset(Images.bag, height: 45, width: 45),
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsets.only(left: 0, top: 8),
                                                                child: Text('You haven\'t placed order yet'),
                                                              ),
                                                              SizedBox(height: 8),
                                                              Padding(
                                                                padding: const EdgeInsets.only(left: 12),
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    CustomButton(
                                                                        height: 35,
                                                                        radius: 0,
                                                                        width: 150,
                                                                        buttoncolor: Colors.black,
                                                                        fontSize: 12,
                                                                        buttontextcolor: Colors.white,
                                                                        onPressed: () {
                                                                          Get.to(()=>ProductPage(
                                                                            page: AppConstants.SECTION,
                                                                            id: '3',
                                                                            pageId: 1,
                                                                          ));
                                                                          // Get.to(()=>Dashboard(pageIndex: 0));
                                                                        },
                                                                        buttonText: "SHOP NEW IN"
                                                                    ),
                                                                  ],
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(height: 0,),

                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ) : SizedBox() ,
                                        // :Container(),
                                        /*       Divider(thickness: 0.8,color: Color(0xffD1D2D2)),*/
                                        /// complete orders
                                        Padding(
                                          padding: const EdgeInsets.only(top: 6, bottom: 6),
                                          child: InkWell(
                                            onTap: (){
                                              widget.isExpanded3=! widget.isExpanded3;
                                              setState(() {
                                              });
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(color: gold, width: 1)
                                              ),
                                              // color: Color(0xff20243D),

                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 0, bottom: 8,top: 8),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 4,
                                                      child: Row(
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 8, top: 10, bottom: 10),
                                                            child: Text(
                                                              "Complete Orders",
                                                              style: railway.copyWith(
                                                                fontSize: 15,
                                                                fontWeight: FontWeight.w600,
                                                                color: Colors.black,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),),
                                                    Expanded(
                                                        flex: 1,
                                                        child: widget.isExpanded3? Image.asset(Images.up, color: Colors.black54, height: 15, width: 15,): Image.asset(Images.drop, color: Colors.black54, height: 22, width: 22,)
                                                      // child: Icon(Icons.arrow_drop_down_sharp, color: Colors.black,)
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 0),
                                        widget.isExpanded3?
                                        // controller.productDetailsResponse != null && controller.productDetailsResponse!.data != null ?
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: Get.width*2,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5.0),
                                                color: Colors.white,
                                              ),
                                              child: SingleChildScrollView(
                                                scrollDirection: Axis.horizontal,
                                                child: Container(
                                                  width: Get.width*2,
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
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
                                                                            '${tabletitle[index]}',
                                                                            // '${DateConverter.stringToLocalDateOnly( controller.jobCardResponse!.cardDetails![index].date!)
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
                                                                          child: Text(
                                                                            'Date',
                                                                            // '${controller.jobCardResponse!.cardDetails![index].inTime=="00:00"?"00:00":DateConverter.convertTimeToTime( controller.jobCardResponse!.cardDetails![index].inTime!)
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
                                                                          child: Text(
                                                                            'Name',
                                                                            // textAlign: TextAlign.left,
                                                                            style: railwaybold.copyWith(
                                                                              // color: Colors.yellow,
                                                                                fontSize: 11
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
                                                                          child: Text(
                                                                            'Payment\nMethod',
                                                                            style: railwaybold.copyWith(
                                                                              fontSize: 11,
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
                                                                          child: Text(
                                                                            'Payment\nStatus',
                                                                            style: railwaybold.copyWith(
                                                                                fontSize: 11
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
                                                                          child: Text(
                                                                            'Total Price\n(BDT)',
                                                                            style: railwaybold.copyWith(
                                                                              // color: Colors.yellow,
                                                                                fontSize: 12
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
                                                                        child: Center(
                                                                          child: Text(
                                                                            "Status",
                                                                            style: railwaybold.copyWith(
                                                                                fontSize: 12
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
                                                                        child: Center(
                                                                          child: Text(
                                                                            'Details',
                                                                            style: railwaybold.copyWith(
                                                                              fontSize: 12,
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
                                                                          child: Text(
                                                                            'Track',
                                                                            style: railwaybold.copyWith(
                                                                              fontSize: 12,
                                                                            ),
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
                                                      SizedBox(height: 4),
                                                      controller.confirmOrdersReturnsListResponse!.data!.length>0?
                                                      ListView.builder(
                                                          padding: EdgeInsets.zero,
                                                          shrinkWrap: true,
                                                          physics:  NeverScrollableScrollPhysics(),
                                                          scrollDirection: Axis.vertical,
                                                          itemCount: controller.confirmOrdersReturnsListResponse!.data!.length??0,
                                                          itemBuilder: (context, index) {
                                                            return Container(
                                                              decoration: BoxDecoration(
                                                                color: Color(0xffF4FFF0),
                                                                // color: controller.getColorByStatus(controller.jobCardResponse!.cardDetails![index].statusClass!),
                                                              ),

                                                              child: Padding(
                                                                padding: EdgeInsets.only(left: 6, top: 10, bottom: 10),
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Text(
                                                                          '${controller.confirmOrdersReturnsListResponse!.data![index]!.orderNo??""}',
                                                                          // '${DateConverter.stringToLocalDateOnly( controller.jobCardResponse!.cardDetails![index].date!)
                                                                          style: poppins.copyWith(
                                                                              color: Colors.black,
                                                                              // color: textPurpale,
                                                                              fontSize: 9),
                                                                        )),

                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            '${DateConverter.stringToLocalDateOnly(controller.confirmOrdersReturnsListResponse!.data![index]!.createdAt??"")}',
                                                                            // '12/29/2023',
                                                                            // '${controller.jobCardResponse!.cardDetails![index].inTime=="00:00"?"00:00":DateConverter.convertTimeToTime( controller.jobCardResponse!.cardDetails![index].inTime!)
                                                                            style: poppins.copyWith(
                                                                                fontSize: 9
                                                                            ),
                                                                          ),
                                                                        )),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Padding(
                                                                            padding: const EdgeInsets.only(right: 1),
                                                                            child: Text(
                                                                              '${controller.confirmOrdersReturnsListResponse!.data![index]!.firstName??""} ${controller.confirmOrdersReturnsListResponse!.data![index]!.lastName??""}',
                                                                              textAlign: TextAlign.left,
                                                                              style: poppins.copyWith(
                                                                                // color: Colors.yellow,
                                                                                  fontSize: 9
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        )),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            '${controller.confirmOrdersReturnsListResponse!.data![index]!.paymentMethod??""}',
                                                                            style: poppins.copyWith(
                                                                                fontSize: 9),
                                                                          ),
                                                                        )),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            '${controller.confirmOrdersReturnsListResponse!.data![index]!.paymentStatus??""}',
                                                                            style: poppins.copyWith(
                                                                                fontSize: 9),
                                                                          ),
                                                                        )),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            // '${controller.recentOrdersReturnsListResponse!.data![index]!.price??""}',
                                                                            "${grandTotal(controller.confirmOrdersReturnsListResponse!.data![index].price!.toDouble()??0, controller.confirmOrdersReturnsListResponse!.data![index].calculatedDiscount!.toDouble()??0,
                                                                                controller.confirmOrdersReturnsListResponse!.data![index].couponOrIsleDiscount!.toDouble()??0, controller.confirmOrdersReturnsListResponse!.data![index].brandCouponDiscount!.toDouble()??0,
                                                                                controller.confirmOrdersReturnsListResponse!.data![index].redeemReward!.toDouble()??0 , controller.confirmOrdersReturnsListResponse!.data![index].minimumPurchaseDiscount!.toDouble()??0,
                                                                                controller.confirmOrdersReturnsListResponse!.data![index].calculatedVat!.toDouble()??0, controller.confirmOrdersReturnsListResponse!.data![index].deliveryCharge!.toDouble()??0
                                                                            )} BDT",
                                                                            style: poppins.copyWith(
                                                                              // color: Colors.yellow,
                                                                                fontSize: 9),
                                                                          ),
                                                                        )),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            "${controller.confirmOrdersReturnsListResponse!.data![index]!.orderStatus??""}",
                                                                            style: poppins.copyWith(
                                                                                fontSize: 9),
                                                                          ),
                                                                        )),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                            child:  InkWell(
                                                                              onTap: () {
                                                                                print(controller.confirmOrdersReturnsListResponse!.data![index].id!);
                                                                                print(controller.confirmOrdersReturnsListResponse!.data![index].orderNo!);
                                                                                Get.to(()=>OrdersReturnsDetails(id: controller.confirmOrdersReturnsListResponse!.data![index].id!.toString(),));
                                                                              },
                                                                              child: Container(
                                                                                // color: Colors.green,
                                                                                  height: 15,
                                                                                  width: 35,
                                                                                  child: Icon(Icons.remove_red_eye_outlined, color: Colors.black87, size: 15,)),
                                                                            )
                                                                        )),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                            child: InkWell(
                                                                              onTap: () {
                                                                                print(controller.confirmOrdersReturnsListResponse!.data![index].orderNo!);
                                                                                Get.to(()=>OrdersReturnsDetailsTrack(orderNo: controller.confirmOrdersReturnsListResponse!.data![index].orderNo!,
                                                                                  id: controller.confirmOrdersReturnsListResponse!.data![index].id!.toString(),
                                                                                ));
                                                                              },
                                                                              child: Container(
                                                                                // color: Colors.green,
                                                                                  height: 15,
                                                                                  width: 35,
                                                                                  child: Icon(Icons.menu, color: Colors.black87, size: 15,)),
                                                                            )
                                                                        )),
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          })
                                                          : Container(
                                                        // color: Colors.red,
                                                        height: 150,
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(left: 85),
                                                          child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              SizedBox(height: 20),
                                                              Padding(
                                                                padding: const EdgeInsets.only(left: 65),
                                                                child: Image.asset(Images.bag, height: 45, width: 45),
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsets.only(left: 0, top: 8),
                                                                child: Text('You haven\'t placed order yet'),
                                                              ),
                                                              SizedBox(height: 8),
                                                              Padding(
                                                                padding: const EdgeInsets.only(left: 12),
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    CustomButton(
                                                                        height: 35,
                                                                        radius: 0,
                                                                        width: 150,
                                                                        buttoncolor: Colors.black,
                                                                        fontSize: 12,
                                                                        buttontextcolor: Colors.white,
                                                                        onPressed: () {
                                                                          Get.to(()=>ProductPage(
                                                                            page: AppConstants.SECTION,
                                                                            id: '3',
                                                                            pageId: 1,
                                                                          ));
                                                                   /*       Get.to(()=>Dashboard(pageIndex: 0));*/
                                                                        },
                                                                        buttonText: "SHOP NEW IN"
                                                                    ),
                                                                  ],
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(height: 0,),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ) : SizedBox() ,
                                        // :Container(),
                                        /*   Divider(thickness: 0.8,color: Color(0xffD1D2D2)),*/

                                        /// reject orders
                                        Padding(
                                          padding: const EdgeInsets.only(top: 6,bottom: 6),
                                          child: InkWell(
                                            onTap: (){
                                              widget.isExpanded4=! widget.isExpanded4;
                                              setState(() {
                                              });
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(color: gold, width: 1)
                                              ),
                                              // color: Color(0xff20243D),

                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 0, bottom: 8,top: 8),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 4,
                                                      child: Row(
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 8, top: 10, bottom: 10),
                                                            child: Text(
                                                              "Rejected Orders",
                                                              style: railway.copyWith(
                                                                fontSize: 15,
                                                                fontWeight: FontWeight.w600,
                                                                color: Colors.black,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),),
                                                    Expanded(
                                                        flex: 1,
                                                        child: widget.isExpanded4? Image.asset(Images.up, color: Colors.black54, height: 15, width: 15,): Image.asset(Images.drop, color: Colors.black54, height: 22, width: 22,)
                                                      // child: Icon(Icons.arrow_drop_down_sharp, color: Colors.black,)
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 0),
                                        widget.isExpanded4?
                                        // controller.productDetailsResponse != null && controller.productDetailsResponse!.data != null ?
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: Get.width*2,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5.0),
                                                color: Colors.white,
                                              ),
                                              child: SingleChildScrollView(
                                                scrollDirection: Axis.horizontal,
                                                child: Container(
                                                  width: Get.width*2,
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
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
                                                                            '${tabletitle[index]}',
                                                                            // '${DateConverter.stringToLocalDateOnly( controller.jobCardResponse!.cardDetails![index].date!)
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
                                                                          child: Text(
                                                                            'Date',
                                                                            // '${controller.jobCardResponse!.cardDetails![index].inTime=="00:00"?"00:00":DateConverter.convertTimeToTime( controller.jobCardResponse!.cardDetails![index].inTime!)
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
                                                                          child: Text(
                                                                            'Name',
                                                                            // textAlign: TextAlign.left,
                                                                            style: railwaybold.copyWith(
                                                                              // color: Colors.yellow,
                                                                                fontSize: 11
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
                                                                          child: Text(
                                                                            'Payment\nMethod',
                                                                            style: railwaybold.copyWith(
                                                                              fontSize: 11,
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
                                                                          child: Text(
                                                                            'Payment\nStatus',
                                                                            style: railwaybold.copyWith(
                                                                                fontSize: 11
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
                                                                          child: Text(
                                                                            'Total Price\n(BDT)',
                                                                            style: railwaybold.copyWith(
                                                                              // color: Colors.yellow,
                                                                                fontSize: 12
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
                                                                          child: Text(
                                                                            "Status",
                                                                            style: railwaybold.copyWith(
                                                                                fontSize: 12
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
                                                                          child: Text(
                                                                            'Details',
                                                                            style: railwaybold.copyWith(
                                                                              fontSize: 12,
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
                                                                          child: Text(
                                                                            'Track',
                                                                            style: railwaybold.copyWith(
                                                                              fontSize: 12,
                                                                            ),
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
                                                      SizedBox(height: 4),
                                                      controller.rejectOrdersReturnsListResponse!.data!.length>0?
                                                      ListView.builder(
                                                          padding: EdgeInsets.zero,
                                                          shrinkWrap: true,
                                                          physics:  NeverScrollableScrollPhysics(),
                                                          scrollDirection: Axis.vertical,
                                                          itemCount: controller.rejectOrdersReturnsListResponse!.data!.length??0,
                                                          itemBuilder: (context, index) {
                                                            return Container(
                                                              decoration: BoxDecoration(
                                                                color: Color(0xffffeeed),
                                                                // color: controller.getColorByStatus(controller.jobCardResponse!.cardDetails![index].statusClass!),
                                                              ),

                                                              child: Padding(
                                                                padding: EdgeInsets.only(left: 6, top: 10, bottom: 10),
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Text(
                                                                          '${controller.rejectOrdersReturnsListResponse!.data![index]!.orderNo??""}',
                                                                          style: poppins.copyWith(
                                                                              color: Colors.black,
                                                                              // color: textPurpale,
                                                                              fontSize: 9),
                                                                        )),

                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            '${DateConverter.stringToLocalDateOnly(controller.rejectOrdersReturnsListResponse!.data![index]!.createdAt??"")}',
                                                                            style: poppins.copyWith(
                                                                                fontSize: 9
                                                                            ),
                                                                          ),
                                                                        )),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Padding(
                                                                            padding: const EdgeInsets.only(right: 1),
                                                                            child: Text(
                                                                              '${controller.rejectOrdersReturnsListResponse!.data![index]!.firstName??""} ${controller.rejectOrdersReturnsListResponse!.data![index]!.lastName??""}',
                                                                              textAlign: TextAlign.left,
                                                                              style: poppins.copyWith(
                                                                                // color: Colors.yellow,
                                                                                  fontSize: 9
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        )),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            '${controller.rejectOrdersReturnsListResponse!.data![index]!.paymentMethod??""}',
                                                                            style: poppins.copyWith(
                                                                                fontSize: 9),
                                                                          ),
                                                                        )),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            '${controller.rejectOrdersReturnsListResponse!.data![index]!.paymentStatus??""}',
                                                                            style: poppins.copyWith(
                                                                                fontSize: 9),
                                                                          ),
                                                                        )),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            // '${controller.recentOrdersReturnsListResponse!.data![index]!.price??""}',
                                                                            "${grandTotal(controller.rejectOrdersReturnsListResponse!.data![index].price!.toDouble()??0, controller.rejectOrdersReturnsListResponse!.data![index].calculatedDiscount!.toDouble()??0,
                                                                                controller.rejectOrdersReturnsListResponse!.data![index].couponOrIsleDiscount!.toDouble()??0, controller.rejectOrdersReturnsListResponse!.data![index].brandCouponDiscount!.toDouble()??0,
                                                                                controller.rejectOrdersReturnsListResponse!.data![index].redeemReward!.toDouble()??0 , controller.rejectOrdersReturnsListResponse!.data![index].minimumPurchaseDiscount!.toDouble()??0,
                                                                                controller.rejectOrdersReturnsListResponse!.data![index].calculatedVat!.toDouble()??0, controller.rejectOrdersReturnsListResponse!.data![index].deliveryCharge!.toDouble()??0
                                                                            )} BDT",
                                                                            style: poppins.copyWith(
                                                                              // color: Colors.yellow,
                                                                                fontSize: 9),
                                                                          ),
                                                                        )),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                          child: Text(
                                                                            "${controller.rejectOrdersReturnsListResponse!.data![index]!.orderStatus??""}",
                                                                            style: poppins.copyWith(
                                                                                fontSize: 9),
                                                                          ),
                                                                        )),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                            child:  InkWell(
                                                                              onTap: () {
                                                                                print(controller.rejectOrdersReturnsListResponse!.data![index].id!);
                                                                                print(controller.rejectOrdersReturnsListResponse!.data![index].orderNo!);
                                                                                Get.to(()=>OrdersReturnsDetails(id: controller.rejectOrdersReturnsListResponse!.data![index].id!.toString(),));
                                                                              },
                                                                              child: Container(
                                                                                // color: Colors.green,
                                                                                  height: 15,
                                                                                  width: 35,
                                                                                  child: Icon(Icons.remove_red_eye_outlined, color: Colors.black87, size: 15,)),
                                                                            )
                                                                        )),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Center(
                                                                            child: InkWell(
                                                                              onTap: () {
                                                                                print(controller.rejectOrdersReturnsListResponse!.data![index].orderNo!);
                                                                                Get.to(()=>OrdersReturnsDetailsTrack(orderNo: controller.rejectOrdersReturnsListResponse!.data![index].orderNo!,
                                                                                  id: controller.rejectOrdersReturnsListResponse!.data![index].id!.toString(),
                                                                                ));
                                                                              },
                                                                              child: Container(
                                                                                // color: Colors.green,
                                                                                  height: 15,
                                                                                  width: 35,
                                                                                  child: Icon(Icons.menu, color: Colors.black87, size: 15,)),
                                                                            )
                                                                        )),
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          })
                                                          : Container(
                                                            // color: Colors.red,
                                                            height: 150,
                                                            child: Padding(
                                                              padding: const EdgeInsets.only(left: 85),
                                                              child: Column(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  SizedBox(height: 20),
                                                                  Padding(
                                                                    padding: const EdgeInsets.only(left: 65),
                                                                    child: Image.asset(Images.bag, height: 45, width: 45),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets.only(left: 0, top: 8),
                                                                    child: Text('You haven\'t placed order yet'),
                                                                  ),
                                                                  SizedBox(height: 8),
                                                                  Padding(
                                                                    padding: const EdgeInsets.only(left: 12),
                                                                    child: Row(
                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                      children: [
                                                                        CustomButton(
                                                                          height: 35,
                                                                            radius: 0,
                                                                            width: 150,
                                                                          buttoncolor: Colors.black,
                                                                            fontSize: 12,
                                                                            buttontextcolor: Colors.white,
                                                                            onPressed: () {
                                                                              Get.to(()=>ProductPage(
                                                                                page: AppConstants.SECTION,
                                                                                id: '3',
                                                                                pageId: 1,
                                                                              ));
                                                                          /*  Get.to(()=>Dashboard(pageIndex: 0));*/
                                                                            },
                                                                            buttonText: "SHOP NEW IN"
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                      SizedBox(height: 20,),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ) : SizedBox() ,
                                        // :Container(),
                                        /*       Divider(thickness: 0.8,color: Color(0xffD1D2D2)),*/

                                        SizedBox(height: 80),
                                      ],
                                    ),
                                  )
                              )
                          ),

                          /// 2nd TAB
                          RefreshIndicator(
                              onRefresh: () async {
                                // showCustomSnackBar("2");
                              },
                              child: SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 5),
                                        Text("Returns", style: railwaybold.copyWith(fontSize: 17)),
                                        SizedBox(height: 15),
                                        Text("Check the progress of your returns, reschedule collection and print your return documents", style: railway.copyWith(fontSize: 12)),
                                        SizedBox(height: 15),
                                        /// returns
                                        Padding(
                                          padding: const EdgeInsets.only(top: 6, bottom: 6),
                                          child: InkWell(
                                            onTap: (){
                                              widget.isExpanded5=! widget.isExpanded5;
                                              setState(() {
                                              });
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(color: gold, width: 1)
                                              ),
                                              // color: Color(0xff20243D),
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 0, bottom: 8,top: 8),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 4,
                                                      child: Row(
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 8, top: 10, bottom: 10),
                                                            child: Text(
                                                              "Returns",
                                                              style: railway.copyWith(
                                                                fontSize: 15,
                                                                fontWeight: FontWeight.w600,
                                                                color: Colors.black,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),),
                                                    Expanded(
                                                        flex: 1,
                                                        child: widget.isExpanded5? Image.asset(Images.up, color: Colors.black54, height: 15, width: 15,): Image.asset(Images.drop, color: Colors.black54, height: 22, width: 22,)
                                                      // child: Icon(Icons.arrow_drop_down_sharp, color: Colors.black,)
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 0),
                                        widget.isExpanded5?
                                        // controller.productDetailsResponse != null && controller.productDetailsResponse!.data != null ?
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                 /*           Padding(
                                              padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                                              child: Text(
                                                "Last 5 Orders",
                                                style: robotoRegular.copyWith(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.grey.shade800
                                                ),
                                              ),
                                            ),*/
                                            SizedBox(height: 10),
                                            Container(
                                              width: Get.width*2,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5.0),
                                                color: Colors.white,
                                              ),
                                              child: SingleChildScrollView(
                                                scrollDirection: Axis.horizontal,
                                                child: Container(
                                                  width: Get.width*2,
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
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
                                                                            'Order Number',
                                                                            // '${DateConverter.stringToLocalDateOnly( controller.jobCardResponse!.cardDetails![index].date!)
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
                                                                          child: Text(
                                                                            'Order Date',
                                                                            // '${controller.jobCardResponse!.cardDetails![index].inTime=="00:00"?"00:00":DateConverter.convertTimeToTime( controller.jobCardResponse!.cardDetails![index].inTime!)
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
                                                                          child: Padding(
                                                                            padding: const EdgeInsets.only(left: 1, right: 1),
                                                                            child: Text(
                                                                              'Name',
                                                                              // textAlign: TextAlign.left,
                                                                              style: railwaybold.copyWith(
                                                                                // color: Colors.yellow,
                                                                                  fontSize: 11
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
                                                                        child: Center(
                                                                          child: Text(
                                                                            'Refund\nStatus',
                                                                            style: railwaybold.copyWith(
                                                                              fontSize: 11,
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
                                                                          child: Text(
                                                                            'Return\nStatus',
                                                                            style: railwaybold.copyWith(
                                                                                fontSize: 11
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
                                                                          child: Text(
                                                                            'Total Price\n(BDT)',
                                                                            style: railwaybold.copyWith(
                                                                              // color: Colors.yellow,
                                                                                fontSize: 12
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
                                                                          child: Text(
                                                                            "Return\nReason",
                                                                            style: railwaybold.copyWith(
                                                                                fontSize: 12
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
                                                                          child: Text(
                                                                            'Reject\nReason',
                                                                            style: railwaybold.copyWith(
                                                                              fontSize: 12,
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
                                                                          child: Text(
                                                                            'Details',
                                                                            style: railwaybold.copyWith(
                                                                              fontSize: 12,
                                                                            ),
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
                                                      SizedBox(height: 4),

                                                      controller.returnsResponse!=null? controller.returnsResponse!.data!.length>0?
                                                      ListView.builder(
                                                          padding: EdgeInsets.zero,
                                                          shrinkWrap: true,
                                                          physics:  NeverScrollableScrollPhysics(),
                                                          scrollDirection: Axis.vertical,
                                                          itemCount: controller.returnsResponse!.data!.length??0,
                                                          itemBuilder: (context, index) {
                                                            return ProgressHUD(
                                                              inAsyncCall: controller.isLoading,
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                  color: Color(0xffF2F0EB),
                                                                  // color: controller.getColorByStatus(controller.jobCardResponse!.cardDetails![index].statusClass!),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsets.only(left: 6, top: 10, bottom: 10),
                                                                  child: Row(
                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      Expanded(
                                                                          flex: 1,
                                                                          child: Center(
                                                                            child: Text(
                                                                             '${controller.returnsResponse!.data![index]!.orderDetail!.order!.orderNo??""}',
                                                                             style: poppins.copyWith(
                                                                                  color: Colors.black,
                                                                                  // color: textPurpale,
                                                                                  fontSize: 9),
                                                                            ),
                                                                          )),

                                                                      Expanded(
                                                                          flex: 1,
                                                                          child: Center(
                                                                            child: Text(
                                                                              '${DateConverter.stringToLocalDateOnly(controller.returnsResponse!.data![index]!.orderDetail!.createdAt??"")}',
                                                                          style: poppins.copyWith(
                                                                                  fontSize: 9
                                                                              ),
                                                                            ),
                                                                          )),
                                                                      Expanded(
                                                                          flex: 1,
                                                                          child: Center(
                                                                            child: Padding(
                                                                              padding: const EdgeInsets.only(right: 1),
                                                                              child: Text(
                                                                               '${controller.returnsResponse!.data![index]!.orderDetail!.product!.name??""}',
                                                                                textAlign: TextAlign.left,
                                                                                style: poppins.copyWith(
                                                                                  // color: Colors.yellow,
                                                                                    fontSize: 9
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          )),
                                                                      Expanded(
                                                                          flex: 1,
                                                                          child: Center(
                                                                            child: Text(
                                                                              '${controller.returnsResponse!.data![index]!.refundStatus??""}',
                                                                              style: poppins.copyWith(
                                                                                  fontSize: 9),
                                                                            ),
                                                                          )),
                                                                      Expanded(
                                                                          flex: 1,
                                                                          child: Center(
                                                                            child: Text(
                                                                              '${controller.returnsResponse!.data![index]!.returnStatus??""}',
                                                                              style: poppins.copyWith(
                                                                                  fontSize: 9),
                                                                            ),
                                                                          )),
                                                                      Expanded(
                                                                          flex: 1,
                                                                          child: Center(
                                                                            child: Text(
                                                                              "${totalPrice(double.parse(controller.returnsResponse?.data?[index]?.orderDetail?.grandTotal?.toStringAsFixed(0).toString()??"0"), double.parse(controller.returnsResponse?.data?[index]?.orderDetail?.quantity?.toStringAsFixed(0).toString()??"0"), double.parse(controller.returnsResponse?.data?[index]?.returnQuantity?.toStringAsFixed(0).toString()??""))}",
                                                                              // "${controller.returnsResponse!.data![index]!.orderDetail!.grandTotal!.toStringAsFixed(2)??"0"}",
                                                                              style: poppins.copyWith(
                                                                                // color: Colors.yellow,
                                                                                  fontSize: 9),
                                                                            ),
                                                                          )),
                                                                      Expanded(
                                                                          flex: 1,
                                                                          child: Text(
                                                                            "${controller.returnsResponse!.data![index]!.returnReason??""}",
                                                                            style: poppins.copyWith(
                                                                                fontSize: 9),
                                                                          )),
                                                                      Expanded(
                                                                          flex: 1,
                                                                          child: Center(
                                                                            child: Text(
                                                                              "${controller.returnsResponse!.data![index]!.rejectCause??""}",
                                                                              style: poppins.copyWith(
                                                                                  fontSize: 9),
                                                                            ),
                                                                          )),
                                                                      Expanded(
                                                                          flex: 1,
                                                                          child: Center(
                                                                              child: InkWell(
                                                                                onTap: () {
                                                                                  print(controller.returnsResponse!.data![index].id!);
                                                                                  print(controller.returnsResponse!.data![index].orderDetail!.order!.orderNo!);
                                                                                  Get.to(()=>ReturnsDetails(id: controller.returnsResponse!.data![index].id!.toString(),));
                                                                                },
                                                                                child: Container(
                                                                                  // color: Colors.green,
                                                                                    height: 15,
                                                                                    width: 35,
                                                                                    child: Icon(Icons.remove_red_eye_outlined, color: Colors.black87, size: 15,)),
                                                                              )
                                                                          )),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          })
                                                          :  Container(
                                                        // color: Colors.red,
                                                        height: 150,
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(left: 85),
                                                          child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              SizedBox(height: 20),
                                                              Padding(
                                                                padding: const EdgeInsets.only(left: 65),
                                                                child: Image.asset(Images.bag, height: 45, width: 45),
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsets.only(left: 0, top: 8),
                                                                child: Text('You haven\'t placed order yet'),
                                                              ),
                                                              SizedBox(height: 8),
                                                              Padding(
                                                                padding: const EdgeInsets.only(left: 12),
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    CustomButton(
                                                                        height: 35,
                                                                        radius: 0,
                                                                        width: 150,
                                                                        buttoncolor: Colors.black,
                                                                        fontSize: 12,
                                                                        buttontextcolor: Colors.white,
                                                                        onPressed: () {
                                                                          Get.to(()=>ProductPage(
                                                                            page: AppConstants.SECTION,
                                                                            id: '3',
                                                                            pageId: 1,
                                                                          ));
                                                                          // Get.to(()=>Dashboard(pageIndex: 0));
                                                                        },
                                                                        buttonText: "SHOP NEW IN"
                                                                    ),
                                                                  ],
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ) : SizedBox(),
                                                      SizedBox(height: 0,),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ) : SizedBox() ,
                                        // :Container(),
                                        /*   Divider(thickness: 0.8,color: Color(0xffD1D2D2)),*/

                                        /// Exchange
                                        SizedBox(height: 20),
                                        Text("Exchange", style: railwaybold.copyWith(fontSize: 17)),
                                        SizedBox(height: 15),
                                        Text("Check the progress of your returns, reschedule collection and print your return documents", style: railway.copyWith(fontSize: 12)),
                                        SizedBox(height: 15),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 6, bottom: 6),
                                          child: InkWell(
                                            onTap: (){
                                              widget.isExpanded6=! widget.isExpanded6;
                                              setState(() {
                                              });
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(color: gold, width: 1)
                                              ),
                                              // color: Color(0xff20243D),
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 0, bottom: 8,top: 8),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 4,
                                                      child: Row(
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 8, top: 10, bottom: 10),
                                                            child: Text(
                                                              "Exchanges",
                                                              style: railway.copyWith(
                                                                fontSize: 15,
                                                                fontWeight: FontWeight.w600,
                                                                color: Colors.black,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),),
                                                    Expanded(
                                                        flex: 1,
                                                        child: widget.isExpanded6? Image.asset(Images.up, color: Colors.black54, height: 15, width: 15,): Image.asset(Images.drop, color: Colors.black54, height: 22, width: 22,)
                                                      // child: Icon(Icons.arrow_drop_down_sharp, color: Colors.black,)
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 0),
                                        widget.isExpanded6?
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: 10),
                                            Container(
                                              width: Get.width*2,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5.0),
                                                color: Colors.white,
                                              ),
                                              child: SingleChildScrollView(
                                                scrollDirection: Axis.horizontal,
                                                child: Container(
                                                  width: Get.width*2,
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
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
                                                                            'Order Number',
                                                                            // '${DateConverter.stringToLocalDateOnly( controller.jobCardResponse!.cardDetails![index].date!)
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
                                                                          child: Text(
                                                                            'Order Date',
                                                                            // '${controller.jobCardResponse!.cardDetails![index].inTime=="00:00"?"00:00":DateConverter.convertTimeToTime( controller.jobCardResponse!.cardDetails![index].inTime!)
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
                                                                          child: Padding(
                                                                            padding: const EdgeInsets.only(left: 1, right: 1),
                                                                            child: Text(
                                                                              'Name',
                                                                              // textAlign: TextAlign.left,
                                                                              style: railwaybold.copyWith(
                                                                                // color: Colors.yellow,
                                                                                  fontSize: 11
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
                                                                        child: Center(
                                                                          child: Text(
                                                                            'Exchange\nStatus',
                                                                            style: railwaybold.copyWith(
                                                                                fontSize: 11
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
                                                                          child: Text(
                                                                            'Total Price\n(BDT)',
                                                                            style: railwaybold.copyWith(
                                                                              // color: Colors.yellow,
                                                                                fontSize: 12
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
                                                                          child: Text(
                                                                            "Exchange\nReason",
                                                                            style: railwaybold.copyWith(
                                                                                fontSize: 12
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
                                                                          child: Text(
                                                                            'Reject\nReason',
                                                                            style: railwaybold.copyWith(
                                                                              fontSize: 12,
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
                                                                          child: Text(
                                                                            'Details',
                                                                            style: railwaybold.copyWith(
                                                                              fontSize: 12,
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
                                                                          child: Text(
                                                                            'Track',
                                                                            style: railwaybold.copyWith(
                                                                              fontSize: 12,
                                                                            ),
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
                                                      SizedBox(height: 4),

                                                      controller.exchangeResponse!=null? controller.exchangeResponse!.data!.length>0?
                                                      ListView.builder(
                                                          padding: EdgeInsets.zero,
                                                          shrinkWrap: true,
                                                          physics:  NeverScrollableScrollPhysics(),
                                                          scrollDirection: Axis.vertical,
                                                          itemCount: controller.exchangeResponse?.data?.length??0,
                                                          itemBuilder: (context, index) {
                                                            // print("Grand total: ${controller.returnsResponse?.data?[index]?.orderDetail?.grandTotal}");
                                                            print("List length: ${controller.exchangeResponse?.data?.length}");
                                                            print("List length: ${index}");
                                                            return ProgressHUD(
                                                              inAsyncCall: controller.isLoading,
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                  color: Color(0xffF2F0EB),
                                                                  // color: controller.getColorByStatus(controller.jobCardResponse!.cardDetails![index].statusClass!),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsets.only(left: 6, top: 10, bottom: 10),
                                                                  child: Row(
                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      Expanded(
                                                                          flex: 1,
                                                                          child: Center(
                                                                            child: Text(
                                                                              '${controller.exchangeResponse!.data![index]!.orderDetail!.order!.orderNo??""}',
                                                                              style: poppins.copyWith(
                                                                                  color: Colors.black,
                                                                                  // color: textPurpale,
                                                                                  fontSize: 9),
                                                                            ),
                                                                          )),

                                                                      Expanded(
                                                                          flex: 1,
                                                                          child: Center(
                                                                            child: Text(
                                                                             '${DateConverter.stringToLocalDateOnly(controller.exchangeResponse!.data![index]!.orderDetail!.createdAt??"")}',
                                                                              style: poppins.copyWith(
                                                                                  fontSize: 9
                                                                              ),
                                                                            ),
                                                                          )),
                                                                      Expanded(
                                                                          flex: 1,
                                                                          child: Padding(
                                                                            padding: const EdgeInsets.only(right: 1),
                                                                            child: Text(
                                                                              '${controller.exchangeResponse!.data![index]!.orderDetail!.product!.name??""}',
                                                                              textAlign: TextAlign.left,
                                                                              style: poppins.copyWith(
                                                                                // color: Colors.yellow,
                                                                                  fontSize: 9
                                                                              ),
                                                                            ),
                                                                          )),
                                                                      Expanded(
                                                                          flex: 1,
                                                                          child: Center(
                                                                            child: Text(
                                                                              '${controller.exchangeResponse!.data![index]!.exchangeStatus??""}',
                                                                              style: poppins.copyWith(
                                                                                  fontSize: 9),
                                                                            ),
                                                                          )),
                                                                      Expanded(
                                                                          flex: 1,
                                                                          child: Center(
                                                                            child: Text(
                                                                              "${totalPrice(double.parse(controller.exchangeResponse?.data?[index]?.orderDetail?.grandTotal?.toStringAsFixed(0).toString()??"0"), double.parse(controller.exchangeResponse?.data?[index]?.orderDetail?.quantity?.toStringAsFixed(0).toString()??"0"), double.parse(controller.exchangeResponse?.data?[index]?.exchangeQuantity?.toStringAsFixed(0).toString()??""))}",
                                                                              // "${controller.exchangeResponse?.data?[index]?.orderDetail?.grandTotal?.toStringAsFixed(2)?? "0.0"}",
                                                                              //  "54654",
                                                                              style: poppins.copyWith(
                                                                                // color: Colors.yellow,
                                                                                  fontSize: 9),
                                                                            ),
                                                                          )),
                                                                      Expanded(
                                                                          flex: 1,
                                                                          child: Center(
                                                                            child: Text(
                                                                              "${controller.exchangeResponse!.data![index]!.exchangeReason??""}",
                                                                              style: poppins.copyWith(
                                                                                  fontSize: 9),
                                                                            ),
                                                                          )),
                                                                      Expanded(
                                                                          flex: 1,
                                                                          child: Center(
                                                                            child: Text(
                                                                              "${controller.exchangeResponse!.data![index]!.orderDetail!.order!.rejectCause??""}",
                                                                              style: poppins.copyWith(
                                                                                  fontSize: 9),
                                                                            ),
                                                                          )),
                                                                      Expanded(
                                                                          flex: 1,
                                                                          child: Center(
                                                                              child: InkWell(
                                                                                onTap: () {
                                                                                  print(controller.exchangeResponse!.data![index].id!);
                                                                                  print(controller.exchangeResponse!.data![index].orderDetail!.order!.orderNo!);
                                                                                  Get.to(()=>ExchangeDetails(id: controller.exchangeResponse!.data![index].id!.toString(),));
                                                                                },
                                                                                child: Container(
                                                                                  // color: Colors.green,
                                                                                    height: 15,
                                                                                    width: 35,
                                                                                    child: Icon(Icons.remove_red_eye_outlined, color: Colors.black87, size: 15,)),
                                                                              )
                                                                          )),
                                                                      Expanded(
                                                                          flex: 1,
                                                                          child: Center(
                                                                              child: InkWell(
                                                                                onTap: () {
                                                                                  print(controller.exchangeResponse!.data![index].id!);
                                                                                  Get.to(()=>ExchangeDetailsTrack(
                                                                                    id: controller.exchangeResponse!.data![index].id!.toString(),
                                                                                  ));
                                                                                },
                                                                                child: Container(
                                                                                  // color: Colors.green,
                                                                                    height: 15,
                                                                                    width: 35,
                                                                                    child: Icon(Icons.menu, color: Colors.black87, size: 15,)),
                                                                              )
                                                                          )),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          })
                                                          :  Container(
                                                        // color: Colors.red,
                                                        height: 150,
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(left: 85),
                                                          child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              SizedBox(height: 20),
                                                              Padding(
                                                                padding: const EdgeInsets.only(left: 65),
                                                                child: Image.asset(Images.bag, height: 45, width: 45),
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsets.only(left: 0, top: 8),
                                                                child: Text('You haven\'t placed order yet'),
                                                              ),
                                                              SizedBox(height: 8),
                                                              Padding(
                                                                padding: const EdgeInsets.only(left: 12),
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    CustomButton(
                                                                        height: 35,
                                                                        radius: 0,
                                                                        width: 150,
                                                                        buttoncolor: Colors.black,
                                                                        fontSize: 12,
                                                                        buttontextcolor: Colors.white,
                                                                        onPressed: () {
                                                                          Get.to(()=>ProductPage(
                                                                            page: AppConstants.SECTION,
                                                                            id: '3',
                                                                            pageId: 1,
                                                                          ));
                                                                          // Get.to(()=>Dashboard(pageIndex: 0));
                                                                        },
                                                                        buttonText: "SHOP NEW IN"
                                                                    ),
                                                                  ],
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ) : SizedBox(),
                                                      SizedBox(height: 0,),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ) : SizedBox() ,
                                        // :Container(),
                                        /*       Divider(thickness: 0.8,color: Color(0xffD1D2D2)),*/

                                        SizedBox(height: 80),
                                      ],
                                    ),
                                  )
                              )
                          ),

                        ]),
                  )
                ],
              ),
            ),
          );
        }
    );
  }



  double grandTotal(double price, double calculatedDis, double isleCoupon, double brandCoupon, double redeemPoint, double miniPoint, double vat, double shippingCharge){
    return (price-calculatedDis)-isleCoupon-brandCoupon-redeemPoint-miniPoint + (vat + shippingCharge);
  }


  double totalPrice(double grandtotal, double quantity, double returnQuentity){
    return (grandtotal/quantity)*returnQuentity;
  }













}
