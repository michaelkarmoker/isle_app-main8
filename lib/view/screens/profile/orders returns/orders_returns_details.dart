import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/profile/orders%20refunds/orders_and_retunds_controller.dart';
import 'package:isletestapp/helper/date_converter.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/custom_Image_cached.dart';
import 'package:isletestapp/view/base/custom_button.dart';
import 'package:isletestapp/view/screens/custom%20logo/custom_logo_widget.dart';
import 'package:isletestapp/view/screens/notification/custom_notification_dialog.dart';
import 'package:isletestapp/view/screens/product%20page/product_page.dart';
import 'package:isletestapp/view/screens/universal_bottom_nav/universal_bottom_nav.dart';

class OrdersReturnsDetails extends StatefulWidget {
  final String id;
  OrdersReturnsDetails({Key? key, required this.id,
  }) : super(key: key);
  @override
  _trackparcelState createState() => _trackparcelState();
}
class _trackparcelState extends State<OrdersReturnsDetails> {
  @override
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<OrdersReturnsController>().dataInitializeForDetails();
      Get.find<OrdersReturnsController>().getRecentOrdersReturnDetailsData(id: widget.id!.toString());
    });
    super.initState();
  }
/*  @override
  void dispose() {
    super.dispose();
    Get.find<OrdersReturnsController>().dataClose();
  }*/

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersReturnsController>(
        builder: (controller) {
          return Scaffold(
            backgroundColor: Color(0xffFAFBFB),
            bottomNavigationBar: UniversalBottomNav(),
            appBar: AppBar(
              iconTheme: IconThemeData(color: Color(0xff000000)),
              titleSpacing: 0,
              // backgroundColor: Colors.green,
              backgroundColor: Color(0xffFFFFFF),
              centerTitle: true,
              elevation: 0,
              toolbarHeight: 62,
/*        actions: [
              !isSearchClick?InkWell(
                  onTap: (){
                    Get.to(SearchScreen());
                    *//*   isSearchClick=!isSearchClick;
                          setState(() {
                          });*//*
                  },
                  // child: Icon(Icons.search,color: Color(0xff000000),size: 25,)):SizedBox(),
                  child: Image.asset(Images.search, height: 22, width: 22,)):SizedBox(),
              SizedBox(width: 15),

            ],*/
              title: CustomLogo(),
            ),
            body: SingleChildScrollView(
              child:
              controller.ordersAndReturnsDetailsResponse!=null?
              Column(
                children: [
                  controller.invoiceTopBottomPhotoResponse!=null?
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                      // color: Colors.red,
                      child: CustomImageCached(
                          height: Get.height/13,
                          isRound: false,
                          width: Get.width,
                          fit: BoxFit.fill,
                          image: "${AppConstants.BASE_URL}${controller.invoiceTopBottomPhotoResponse?.data?.topImage??""}"
                      ),
                    ),
                  )
                      : SizedBox(),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Bill To: dfsd", style: railwaybold.copyWith(fontSize: 11),),
                              SizedBox(height: 2),
                              Text("${controller.ordersAndReturnsDetailsResponse?.data?.firstName} ${controller.ordersAndReturnsDetailsResponse?.data?.lastName}", style: railwaybold.copyWith(fontSize: 11),),
                              SizedBox(height: 2),
                              Row(
                                children: [
                                  Text("Membership Status: ", style: railwaybold.copyWith(fontSize: 9.5),),
                                  Text("${controller.ordersAndReturnsDetailsResponse?.data?.customer?.membershipTier?.tiersName??""}", style: railway.copyWith(fontSize: 9.5),),
                                ],
                              ),
                              SizedBox(height: 2),
                              Row(
                                children: [
                                  Text("Reward Points: ", style: railwaybold.copyWith(fontSize: 9.5),),
                                  Text("${rewardpointcalculation(controller.ordersAndReturnsDetailsResponse?.data?.customer?.point?.toDouble()??0, controller.ordersAndReturnsDetailsResponse?.data?.customer?.usePoint?.toDouble()??0).toStringAsFixed(0)} Points", style: poppins.copyWith(fontSize: 9.5),),
                                ],
                              ),
                              SizedBox(height: 2),
                              Row(
                                /*        mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,*/
                                children: [
                                  Text("Earned Points In This Invoice: ", style: railwaybold.copyWith(fontSize: 9.5),),
                                  Expanded(child: Text("${earnedPointCalculation(controller.ordersAndReturnsDetailsResponse?.data?.price?.toDouble()??0,).toStringAsFixed(0)} Points", style: poppins.copyWith(fontSize: 9),)),
                                ],
                              ),
                              SizedBox(height: 2),
                              Row(
                                /*                  mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,*/
                                children: [
                                  Text("Delivery Address: ", style: railwaybold.copyWith(fontSize: 9.5),),
                                  Expanded(child: Text("${controller.ordersAndReturnsDetailsResponse?.data?.address??""}", style: poppins.copyWith(fontSize: 9.5),)),
                                ],
                              ),
                              SizedBox(height: 2),
                              Row(
                                /*                  mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,*/
                                children: [
                                  Text("Email: ", style: railwaybold.copyWith(fontSize: 9.5),),
                                  Expanded(child: Text("${controller.ordersAndReturnsDetailsResponse?.data?.email??""}", style: poppins.copyWith(fontSize: 9.5),)),
                                ],
                              ),
                              SizedBox(height: 2),
                              Row(
                                /*                  mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,*/
                                children: [
                                  Text("Phone: ", style: railwaybold.copyWith(fontSize: 9.5),),
                                  Expanded(child: Text("${controller.ordersAndReturnsDetailsResponse?.data?.phone??""}", style: poppins.copyWith(fontSize: 9),)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("INVOICE", style: railwaybold.copyWith(fontSize: 11),),
                              SizedBox(height: 2),
                              Text("Order No: ${controller.ordersAndReturnsDetailsResponse?.data?.orderNo}", style: poppins.copyWith(fontSize: 9),),
                              SizedBox(height: 2),
                              Text("DATE", style: railwaybold.copyWith(fontSize: 9.5),),
                              SizedBox(height: 2),
                              Text("${DateConverter.stringToLocalDateOnly(controller.ordersAndReturnsDetailsResponse?.data?.createdAt??"")}", style: poppins.copyWith(fontSize: 9),),
                              SizedBox(height: 2),
                              SizedBox(height: 2),
                              Text("PAYMENT METHOD", style: railwaybold.copyWith(fontSize: 9.5),),
                              SizedBox(height: 2),
                              Text("${controller.ordersAndReturnsDetailsResponse?.data?.paymentMethod??""}".toUpperCase(), style: poppins.copyWith(fontSize: 9.5),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12),

                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Container(
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
                                                    'Sl',
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
                                                flex: 2,
                                                child: Center(
                                                  child: Text(
                                                    'Image',
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
                                                flex: 2,
                                                child: Center(
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 1, right: 1),
                                                    child: Text(
                                                      'Product Code',
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
                                                flex: 2,
                                                child: Center(
                                                  child: Text(
                                                    'Name',
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
                                                flex: 2,
                                                child: Center(
                                                  child: Text(
                                                    'Brand',
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
                                                flex: 2,
                                                child: Center(
                                                  child: Text(
                                                    'Color',
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
                                                    "Size",
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
                                                flex: 2,
                                                child: Center(
                                                  child: Text(
                                                    'Quantity',
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
                                                flex: 2,
                                                child: Center(
                                                  child: Text(
                                                    'MRP Price',
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
                                                flex: 2,
                                                child: Center(
                                                  child: Text(
                                                    'Brand Discount',
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
                                                flex: 2,
                                                child: Center(
                                                  child: Text(
                                                    'Final Price',
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
                              controller.ordersAndReturnsDetailsResponse!=null?
                              ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  physics:  NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  // itemCount: controller.ordersAndReturnsDetailsResponse!.data!.length>4? 5 : controller.recentOrdersReturnsListResponse!.data!.length??0,
                                  itemCount: controller.ordersAndReturnsDetailsResponse?.data?.orderPackages?.length??0,
                                  itemBuilder: (context, index) {
                                    final orderPackage = controller.ordersAndReturnsDetailsResponse?.data?.orderPackages?[index];
                                    final cumulativeIndex = controller.ordersAndReturnsDetailsResponse?.data?.orderPackages?.take(index)?.fold(0, (sum, package) => sum + orderPackage!.orderDetails!.length ?? 0) ?? 0;
                                    return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        physics:  NeverScrollableScrollPhysics(),
                                        scrollDirection: Axis.vertical,
                                        // itemCount: controller.ordersAndReturnsDetailsResponse!.data!.length>4? 5 : controller.recentOrdersReturnsListResponse!.data!.length??0,
                                        itemCount: controller.ordersAndReturnsDetailsResponse?.data?.orderPackages?[index]!.orderDetails!.length??0,
                                        itemBuilder: (context, index2) {
                                          final currentIndex = cumulativeIndex + (index2 + 1);
                                          final orderDetail = orderPackage?.orderDetails?[index2];
                                          return Padding(
                                            padding: EdgeInsets.only(left: 0, top: 1.5, bottom: 1.5),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xffF2F0EB),
                                                // color: controller.getColorByStatus(controller.jobCardResponse!.cardDetails![index].statusClass!),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.only(left: 0, top: 0, bottom: 0),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                        flex: 1,
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(left: 8),
                                                          child: Text(
                                                            // '$indexx',
                                                            '$currentIndex',
                                                            style: railwaybold.copyWith(
                                                                color: Colors.black,
                                                                // color: textPurpale,
                                                                fontSize: 11),
                                                          ),
                                                        )),
                                                    Expanded(
                                                        flex: 2,
                                                        child: CustomImageCached(
                                                          image: "${AppConstants.BASE_URL}${controller.ordersAndReturnsDetailsResponse?.data?.orderPackages?[index]?.orderDetails?[index2]?.productColorVariant?.profilePhoto??""}",
                                                          height: 60,
                                                          width: 55,
                                                        )
                                                    ),
                                                    Expanded(
                                                        flex: 2,
                                                        child: Center(
                                                          child: Padding(
                                                            padding: const EdgeInsets.only(right: 1),
                                                            child: Text(
                                                              '${controller.ordersAndReturnsDetailsResponse?.data?.orderPackages?[index]?.orderDetails?[index2]?.product?.productCode??""}',
                                                              textAlign: TextAlign.left,
                                                              style: poppins.copyWith(
                                                                // color: Colors.yellow,
                                                                  fontSize: 9
                                                              ),
                                                            ),
                                                          ),
                                                        )),
                                                    Expanded(
                                                        flex: 2,
                                                        child: Center(
                                                          child: Text(
                                                            '${controller.ordersAndReturnsDetailsResponse?.data?.orderPackages?[index]?.orderDetails?[index2]?.product?.name??""}',
                                                            style: poppins.copyWith(
                                                                fontSize: 9),
                                                          ),
                                                        )),
                                                    Expanded(
                                                        flex: 2,
                                                        child: Center(
                                                          child: Text(
                                                            '${controller.ordersAndReturnsDetailsResponse?.data?.orderPackages?[index]?.orderDetails?[index2]?.product?.brand?.name??""}',
                                                            style: poppins.copyWith(
                                                                fontSize: 9),
                                                          ),
                                                        )),
                                                    Expanded(
                                                        flex: 2,
                                                        child: Center(
                                                          child: Text(
                                                            '${controller.ordersAndReturnsDetailsResponse?.data?.orderPackages?[index]?.orderDetails?[index2]?.productColorVariant?.color?.name??""}',
                                                            style: poppins.copyWith(
                                                              // color: Colors.yellow,
                                                                fontSize: 9),
                                                          ),
                                                        )),
                                                    Expanded(
                                                        flex: 1,
                                                        child: Center(
                                                          child: Text(
                                                            "${controller.ordersAndReturnsDetailsResponse?.data?.orderPackages?[index]?.orderDetails?[index2]?.productInventory?.size?.sizeCode??""}",
                                                            style: poppins.copyWith(
                                                                fontSize: 9),
                                                          ),
                                                        )),
                                                    Expanded(
                                                        flex: 2,
                                                        child: Center(
                                                          child: Text(
                                                            "${controller.ordersAndReturnsDetailsResponse?.data?.orderPackages?[index]?.orderDetails?[index2]?.quantity??""}",
                                                            style: poppins.copyWith(
                                                                fontSize: 9),
                                                          ),
                                                        )),
                                                    Expanded(
                                                        flex: 2,
                                                        child: Center(
                                                          child: Text(
                                                            "${controller.ordersAndReturnsDetailsResponse?.data?.orderPackages?[index]?.orderDetails?[index2]?.price??""}",
                                                            style: poppins.copyWith(
                                                                fontSize: 9),
                                                          ),
                                                        )),
                                                    Expanded(
                                                        flex: 2,
                                                        child: Center(
                                                          child: Text(
                                                            "${controller.ordersAndReturnsDetailsResponse?.data?.orderPackages?[index]?.orderDetails?[index2]?.calculatedDiscount??""}",
                                                            style: poppins.copyWith(
                                                                fontSize: 9),
                                                          ),
                                                        )),
                                                    Expanded(
                                                        flex: 2,
                                                        child: Center(
                                                          child: Text(
                                                            "${detailsFinalPricecalculation(controller.ordersAndReturnsDetailsResponse!.data!.orderPackages![index]!.orderDetails![index2]!.price!.toDouble(), controller.ordersAndReturnsDetailsResponse!.data!.orderPackages![index]!.orderDetails![index2]!.calculatedDiscount!.toDouble())}",
                                                            style: poppins.copyWith(
                                                                fontSize: 9),
                                                          ),
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        });
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
                              ),

                              SizedBox(height: 0),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12),

                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Container(
                      width: Get.width,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey.shade400),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Special Note", style: railwaybold.copyWith(fontSize: 11),),
                            SizedBox(height: 4),
                            Text("${controller.ordersAndReturnsDetailsResponse?.data?.specialNote??""}", style: railway.copyWith(fontSize: 9.5),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Terms & Policies:", style: railwaybold.copyWith(fontSize: 10),),
                        SizedBox(height: 8),
                        ListView.builder(
                            itemCount: controller.invoiceTermsAndConditionsResponse?.data?.length??0,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 4, bottom: 4),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("${controller.invoiceTermsAndConditionsResponse?.data?[index]?.sortOrder??""}.  ", style: railwaybold.copyWith(fontSize: 10),),
                                    Flexible(child: Text("${controller.invoiceTermsAndConditionsResponse?.data?[index]?.termsCondition??""}", style: railway.copyWith(fontSize: 10),)),
                                  ],
                                ),
                              );
                            }


                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Container(
                      width: Get.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
                          color:  Color(0xffE5E7EB)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          children: [
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text("Total:",
                                    style: railwaybold.copyWith( fontWeight: FontWeight.bold, fontSize: 11,),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  flex: 2,
                                  child: Text("${total(controller.ordersAndReturnsDetailsResponse!.data!.price!.toDouble()??0, controller.ordersAndReturnsDetailsResponse!.data!.calculatedDiscount!.toDouble()??0)} BDT",
                                    textAlign: TextAlign.right,
                                    overflow: TextOverflow.ellipsis,
                                    style: poppins.copyWith( fontWeight: FontWeight.bold, fontSize: 10.5),),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text("ISLE Discount / Coupon:",
                                    style: railwaybold.copyWith( fontWeight: FontWeight.bold, fontSize: 11,),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  flex: 2,
                                  child: Text("${controller.ordersAndReturnsDetailsResponse!.data!.couponOrIsleDiscount!.toDouble()??0} BDT",
                                    textAlign: TextAlign.right,
                                    overflow: TextOverflow.ellipsis,
                                    style: poppins.copyWith( fontWeight: FontWeight.bold, fontSize: 10.5),),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text("Brand Discount / Coupon:",
                                    style: railwaybold.copyWith( fontWeight: FontWeight.bold, fontSize: 11,),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  flex: 2,
                                  child: Text("${controller.ordersAndReturnsDetailsResponse!.data!.brandCouponDiscount!.toDouble()??0} BDT",
                                    textAlign: TextAlign.right,
                                    overflow: TextOverflow.ellipsis,
                                    style: poppins.copyWith( fontWeight: FontWeight.bold, fontSize: 10.5),),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text("Reward Point Redeem:",
                                    style: railwaybold.copyWith( fontWeight: FontWeight.bold, fontSize: 11,),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  flex: 2,
                                  child: Text("${controller.ordersAndReturnsDetailsResponse!.data!.redeemReward!.toDouble()??0} BDT",
                                    textAlign: TextAlign.right,
                                    overflow: TextOverflow.ellipsis,
                                    style: poppins.copyWith( fontWeight: FontWeight.bold, fontSize: 10.5),),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text("Minimum Purchase Discount:",
                                    style: railwaybold.copyWith( fontWeight: FontWeight.bold, fontSize: 11,),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  flex: 2,
                                  child: Text("${controller.ordersAndReturnsDetailsResponse!.data!.minimumPurchaseDiscount!.toDouble()??0} BDT",
                                    textAlign: TextAlign.right,
                                    overflow: TextOverflow.ellipsis,
                                    style: poppins.copyWith( fontWeight: FontWeight.bold, fontSize: 10.5),),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text("Sub Total:",
                                    style: railwaybold.copyWith( fontWeight: FontWeight.bold, fontSize: 11,),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  flex: 2,
                                  child: Text("${subTotal(controller.ordersAndReturnsDetailsResponse!.data!.price!.toDouble()??0, controller.ordersAndReturnsDetailsResponse!.data!.calculatedDiscount!.toDouble()??0,
                                      controller.ordersAndReturnsDetailsResponse!.data!.couponOrIsleDiscount!.toDouble()??0, controller.ordersAndReturnsDetailsResponse!.data!.brandCouponDiscount!.toDouble()??0,
                                      controller.ordersAndReturnsDetailsResponse!.data!.redeemReward!.toDouble()??0, controller.ordersAndReturnsDetailsResponse!.data!.minimumPurchaseDiscount!.toDouble()??0)} BDT",
                                    textAlign: TextAlign.right,
                                    overflow: TextOverflow.ellipsis,
                                    style: poppins.copyWith( fontWeight: FontWeight.bold, fontSize: 10.5),),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text("VAT:",
                                    style: railwaybold.copyWith( fontWeight: FontWeight.bold, fontSize: 11,),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  flex: 2,
                                  child: Text("${controller.ordersAndReturnsDetailsResponse!.data!.calculatedVat!.toStringAsFixed(2)??0} BDT",
                                    textAlign: TextAlign.right,
                                    overflow: TextOverflow.ellipsis,
                                    style: poppins.copyWith( fontWeight: FontWeight.bold, fontSize: 10.5),),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text("Shipping Cost:",
                                    style: railwaybold.copyWith( fontWeight: FontWeight.bold, fontSize: 11,),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  flex: 2,
                                  child: Text("${controller.ordersAndReturnsDetailsResponse!.data!.deliveryCharge!.toStringAsFixed(2)??0} BDT",
                                    textAlign: TextAlign.right,
                                    overflow: TextOverflow.ellipsis,
                                    style: poppins.copyWith( fontWeight: FontWeight.bold, fontSize: 10.5),),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text("Grand Total:",
                                    style: railwaybold.copyWith( fontWeight: FontWeight.bold, fontSize: 12, color: gold),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  flex: 2,
                                  child: Text("${grandTotal(controller.ordersAndReturnsDetailsResponse!.data!.price!.toDouble()??0, controller.ordersAndReturnsDetailsResponse!.data!.calculatedDiscount!.toDouble()??0,
                                      controller.ordersAndReturnsDetailsResponse!.data!.couponOrIsleDiscount!.toDouble()??0, controller.ordersAndReturnsDetailsResponse!.data!.brandCouponDiscount!.toDouble()??0,
                                      controller.ordersAndReturnsDetailsResponse!.data!.redeemReward!.toDouble()??0, controller.ordersAndReturnsDetailsResponse!.data!.minimumPurchaseDiscount!.toDouble()??0,
                                      controller.ordersAndReturnsDetailsResponse!.data!.calculatedVat!.toDouble()??0, controller.ordersAndReturnsDetailsResponse!.data!.deliveryCharge!.toDouble()??0
                                  )} BDT",
                                    textAlign: TextAlign.right,
                                    overflow: TextOverflow.ellipsis,
                                    style: poppins.copyWith( color: gold, fontWeight: FontWeight.bold, fontSize: 11.5),),
                                ),
                              ],
                            ),

                            SizedBox(height: 8),



                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  controller.invoiceTopBottomPhotoResponse!=null?
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                      // color: Colors.red,
                      child: CustomImageCached(
                          height: Get.height/12,
                          isRound: false,
                          width: Get.width,
                          fit: BoxFit.fill,
                          image: "${AppConstants.BASE_URL}${controller.invoiceTopBottomPhotoResponse?.data?.footerImage??""}"
                      ),
                    ),
                  )
                      : SizedBox(),
                ],
              )
                  : SizedBox(),
            ),
          );
        }
    );
  }
  double rewardpointcalculation(double point, double userpoint){
    return point-userpoint;
  }

  double earnedrewardpointcalculation(double mrp,){
    return (mrp)/2;
  }

// Updated earned point calculation
  double earnedPointCalculation(double price) {
    return price / 100;
  }

  double detailsFinalPricecalculation(double price, double brandDis){
    return price-brandDis;
  }


  double total(double price, double calculatedDis){
    return price-calculatedDis;
  }

  double subTotal(double price, double calculatedDis, double isleCoupon, double brandCoupon, double redeemPoint, double miniPoint,){
    return (price-calculatedDis)-isleCoupon-brandCoupon-redeemPoint-miniPoint;
  }

  double grandTotal(double price, double calculatedDis, double isleCoupon, double brandCoupon, double redeemPoint, double miniPoint, double vat, double shippingCharge){
    return (price-calculatedDis)-isleCoupon-brandCoupon-redeemPoint-miniPoint + (vat + shippingCharge);
  }






}
