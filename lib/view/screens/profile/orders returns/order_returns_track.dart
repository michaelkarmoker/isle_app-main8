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

import '../../../../controller/order track/order_track_controller.dart';

class OrdersReturnsDetailsTrack extends StatefulWidget {
  final String? orderNo;
  final String? id;
  OrdersReturnsDetailsTrack({Key? key,  this.id, this.orderNo,
  }) : super(key: key);
  @override
  _trackparcelState createState() => _trackparcelState();
}
class _trackparcelState extends State<OrdersReturnsDetailsTrack> {

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<OrdersReturnsController>().dataInitializeForDetails();
      Get.find<OrdersReturnsController>().getRecentOrdersReturnDetailsTrackData(id: widget.orderNo!);
      Get.find<OrdersReturnsController>().getRecentOrdersReturnDetailsData(id: widget.id!);
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
              controller.accountOrderReturnTrackResponse!=null? controller.accountOrderReturnTrackResponse!.data!.length>0?
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    Text("Track Your Order", style: railwaybold.copyWith(fontSize: 13),),
                    SizedBox(height: 6),
                    Container(
                      decoration: BoxDecoration(
                        color: gold,
                        borderRadius: BorderRadius.circular(0)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8, top: 12, bottom: 12),
                        child: Row(
                          children: [
                            Text("Order Number:  ", style: railwaybold.copyWith(fontSize: 11, color: Colors.white),),
                            Text("${controller.accountOrderReturnTrackResponse?.data?[0]?.order?.orderNo??""}", style: poppins.copyWith(fontWeight: FontWeight.bold,fontSize: 12, color: Colors.white),),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    controller.accountOrderReturnTrackResponse!=null? controller.accountOrderReturnTrackResponse!.data!.length>0?
                    ListView.builder(
                      shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.accountOrderReturnTrackResponse?.data?.length??0,
                        itemBuilder: (BuildContext context, int index){
                        return  Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xffE5E7EB),
                                borderRadius: BorderRadius.circular(0)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(Images.box, height: 18, width: 18,),
                                      SizedBox(width: 8),
                                      Text("${controller.accountOrderReturnTrackResponse?.data?[index]?.packageName??""}", style: poppins.copyWith(fontSize: 11, fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                  SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Text("Seller:", style: railway.copyWith(fontSize: 11),),
                                      SizedBox(width: 8),
                                      Text("${controller.accountOrderReturnTrackResponse?.data?[index]?.vendor?.name??""}", style: railwaybold.copyWith(fontSize: 11),),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text("Order Date:", style: railwaybold.copyWith(fontSize: 11),),
                                          SizedBox(width: 4),
                                          Text("${DateConverter.stringToLocalDateOnly(controller.accountOrderReturnTrackResponse!.data![index]!.createdAt??"")}", style: poppins.copyWith(fontSize: 11),),
                                        ],
                                      ),
                                      SizedBox(width: 4),
                                      Text("Delivery Type", style: railwaybold.copyWith(fontSize: 11),),  ],
                                  ),
                                  SizedBox(height: 4),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Image.asset(Images.car, height: 15, width: 15,),
                                      SizedBox(width: 4),
                                      Text("${controller.accountOrderReturnTrackResponse?.data?[index]?.deliveryType?.name??""}", style: railwaybold.copyWith(fontSize: 9),),
                                    ],
                                  ),
                                  SizedBox(height: 8),
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
                                                Expanded(
                                                    flex: 2,
                                                    child: Center(
                                                      child: Text(
                                                        'Image',
                                                        style: railwaybold.copyWith(
                                                            color: Colors.black,
                                                            fontSize: 11),
                                                      ),
                                                    )),
                                                Expanded(
                                                    flex: 3,
                                                    child: Center(
                                                      child: Text(
                                                        'Description',
                                                        style: railwaybold.copyWith(
                                                            fontSize: 11),
                                                      ),
                                                    )),
                                                Expanded(
                                                    flex: 2,
                                                    child: Center(
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 1, right: 1),
                                                        child: Text(
                                                          'Brand',
                                                          // textAlign: TextAlign.left,
                                                          style: railwaybold.copyWith(
                                                            // color: Colors.yellow,
                                                              fontSize: 11
                                                          ),
                                                        ),
                                                      ),
                                                    )),
                                                Expanded(
                                                    flex: 2,
                                                    child: Center(
                                                      child: Text(
                                                        'Amount',
                                                        style: railwaybold.copyWith(
                                                          fontSize: 11,
                                                        ),
                                                      ),
                                                    )),
                                                Expanded(
                                                    flex: 2,
                                                    child: Center(
                                                      child: Text(
                                                        'Quantity',
                                                        style: railwaybold.copyWith(
                                                            fontSize: 11
                                                        ),
                                                      ),
                                                    )),
                                                Expanded(
                                                    flex: 1,
                                                    child: Center(
                                                      child: Text(
                                                        'Size',
                                                        style: railwaybold.copyWith(
                                                          // color: Colors.yellow,
                                                            fontSize: 11
                                                        ),
                                                      ),
                                                    )),
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                  ListView.builder(
                                      itemCount: controller.accountOrderReturnTrackResponse?.data?[index]?.orderDetails?.length??0,
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (BuildContext context, int index2){
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 2),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                  flex: 2,
                                                  child: Container(
                                                    alignment: Alignment.topLeft,
                                                    // color: Colors.red,
                                                    child: CustomImageCached(
                                                      isRound: false,
                                                      image: "${AppConstants.BASE_URL}${controller.accountOrderReturnTrackResponse?.data?[index]?.orderDetails?[index2]?.productColorVariant?.profilePhoto??""}",
                                                      height: 60,
                                                      width: 50,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  )
                                              ),
                                              Expanded(
                                                  flex: 3,
                                                  child: Center(
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(right: 2, left: 2),
                                                      child: Text(
                                                        '${controller.accountOrderReturnTrackResponse?.data?[index]?.orderDetails?[index2]?.product?.name??""}',
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
                                                      '${controller.accountOrderReturnTrackResponse?.data?[index]?.orderDetails?[index2]?.product?.brand?.name??""}',
                                                      style: poppins.copyWith(
                                                          fontSize: 9),
                                                    ),
                                                  )),
                                              Expanded(
                                                  flex: 2,
                                                  child: Center(
                                                    child: Text(
                                                      '${controller.accountOrderReturnTrackResponse?.data?[index]?.orderDetails?[index2]?.price??""}',
                                                      style: poppins.copyWith(
                                                          fontSize: 9),
                                                    ),
                                                  )),
                                              Expanded(
                                                  flex: 2,
                                                  child: Center(
                                                    child: Text(
                                                      '${controller.accountOrderReturnTrackResponse?.data?[index]?.orderDetails?[index2]?.quantity??""}',
                                                      style: poppins.copyWith(
                                                        // color: Colors.yellow,
                                                          fontSize: 9),
                                                    ),
                                                  )),
                                              Expanded(
                                                  flex: 1,
                                                  child: Center(
                                                    child: Text(
                                                      "${controller.accountOrderReturnTrackResponse?.data?[index]?.orderDetails?[index2]?.productInventory?.size?.sizeCode??""}",
                                                      style: poppins.copyWith(
                                                          fontSize: 9),
                                                    ),
                                                  )),
                                            ],
                                          ),
                                        );
                                      }

                                  ),
                                  SizedBox(height: 6),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Container(
                                      color: Color(0xffFFFFFF),
                                      padding: const EdgeInsets.only(left: 0,right: 0,top: 0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SizedBox(height: 8),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 8,right: 8),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [

                                                Column(
                                                  children: [
                                                    controller.accountOrderReturnTrackResponse != null
                                                        ? controller.accountOrderReturnTrackResponse!.data != null &&
                                                        controller.accountOrderReturnTrackResponse!.data!.length > 0
                                                        ? CircleAvatar(
                                                      backgroundColor: controller.accountOrderReturnTrackResponse!.data![index].packageStatus == "pending" ? gold :
                                                      controller.accountOrderReturnTrackResponse!.data![index].packageStatus == "rejected" ? gold :
                                                      controller.accountOrderReturnTrackResponse!.data![index].packageStatus == "confirmed" ? gold :
                                                      controller.accountOrderReturnTrackResponse!.data![index].packageStatus == "in-process" ? gold :
                                                      controller.accountOrderReturnTrackResponse!.data![index].packageStatus == "shipped" ? gold :
                                                      controller.accountOrderReturnTrackResponse!.data![index].packageStatus == "delivered" ? gold :
                                                      silvercolor,
                                                      radius: 25,
                                                      child: Image.asset(Images.orderlist, color: Colors.black, height: 32, width: 32),
                                                    )
                                                        : SizedBox(child: Text('No data available'))
                                                        : SizedBox(child: Text('Loading...')),

                                                    SizedBox(height: 5),
                                                    Text("Received",
                                                      // textAlign: TextAlign.center,
                                                      style: railway.copyWith(color: Colors.black, fontSize: 9, fontWeight: FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                                controller.accountOrderReturnTrackResponse!.data![index].packageStatus == "rejected" ?
                                                Padding(
                                                  padding: const EdgeInsets.fromLTRB(2,25, 2, 0),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        color:  gold,
                                                        height: 4,
                                                        width: 25,
                                                      )
                                                    ],
                                                  ),
                                                ):
                                                controller.accountOrderReturnTrackResponse!.data![index].packageStatus == "confirmed" ?
                                                Padding(
                                                  padding: const EdgeInsets.fromLTRB(2,25, 2, 0),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        color:  gold,
                                                        height: 4,
                                                        width: 25,
                                                      )
                                                    ],
                                                  ),
                                                ) :
                                                controller.accountOrderReturnTrackResponse!.data![index].packageStatus == "in-process" ?
                                                Padding(
                                                  padding: const EdgeInsets.fromLTRB(2,25, 2, 0),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        color:  gold,
                                                        height: 4,
                                                        width: 25,
                                                      )
                                                    ],
                                                  ),
                                                ):
                                                controller.accountOrderReturnTrackResponse!.data![index].packageStatus == "shipped" ?
                                                Padding(
                                                  padding: const EdgeInsets.fromLTRB(2,25, 2, 0),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        color:  gold,
                                                        height: 4,
                                                        width: 25,
                                                      )
                                                    ],
                                                  ),
                                                ):
                                                controller.accountOrderReturnTrackResponse!.data![index].packageStatus == "delivered" ?
                                                Padding(
                                                  padding: const EdgeInsets.fromLTRB(2,25, 2, 0),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        color:  gold,
                                                        height: 4,
                                                        width: 25,
                                                      )
                                                    ],
                                                  ),
                                                )
                                                    :      Padding(
                                                  padding: const EdgeInsets.fromLTRB(1,25, 1, 0),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 1),
                                                        child: CircleAvatar(
                                                          radius: 2.5,
                                                          backgroundColor: silvercolor,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 1),
                                                        child: CircleAvatar(
                                                          radius: 2.5,
                                                          backgroundColor: silvercolor,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 1),
                                                        child: CircleAvatar(
                                                          radius: 2.5,
                                                          backgroundColor: silvercolor,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 1),
                                                        child: CircleAvatar(
                                                          radius: 2.5,
                                                          backgroundColor: silvercolor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                controller.accountOrderReturnTrackResponse!.data![index].packageStatus == "rejected" ?
                                                Column(
                                                  children: [
                                                    controller.accountOrderReturnTrackResponse != null
                                                        ? controller.accountOrderReturnTrackResponse!.data != null &&
                                                        controller.accountOrderReturnTrackResponse!.data!.length > 0
                                                        ? CircleAvatar(
                                                      backgroundColor: Colors.red,
                                                      radius: 25,
                                                      child: Image.asset(Images.box, color: Colors.black, height: 23, width: 23),
                                                    )
                                                        : SizedBox(child: Text('No data available'))
                                                        : SizedBox(child: Text('Loading...')),
                                                    SizedBox(height: 5),
                                                    Text("Rejected",
                                                      // textAlign: TextAlign.center,
                                                      style: railway.copyWith(color: Colors.black, fontSize: 9, fontWeight: FontWeight.bold),
                                                    ),
                                                  ],
                                                ):
                                                Column(
                                                  children: [
                                                    controller.accountOrderReturnTrackResponse != null
                                                        ? controller.accountOrderReturnTrackResponse!.data != null &&
                                                        controller.accountOrderReturnTrackResponse!.data!.length > 0
                                                        ? CircleAvatar(
                                                      backgroundColor: controller.accountOrderReturnTrackResponse!.data![index].packageStatus == "confirmed" ? gold :
                                                      controller.accountOrderReturnTrackResponse!.data![index].packageStatus == "in-process" ? gold :
                                                      controller.accountOrderReturnTrackResponse!.data![index].packageStatus == "shipped" ? gold :
                                                      controller.accountOrderReturnTrackResponse!.data![index].packageStatus == "delivered" ? gold
                                                          : silvercolor,
                                                      radius: 25,
                                                      child: Image.asset(Images.box, color: Colors.black, height: 25, width: 25),
                                                    )
                                                        : SizedBox(child: Text('No data available'))
                                                        : SizedBox(child: Text('Loading...')),
                                                    SizedBox(height: 5),
                                                    Text("Confirmed",
                                                      // textAlign: TextAlign.center,
                                                      style: railway.copyWith(color: Colors.black, fontSize: 9, fontWeight: FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                                controller.accountOrderReturnTrackResponse!.data![index].packageStatus == "in-process" ?
                                                Padding(
                                                  padding: const EdgeInsets.fromLTRB(2,25, 2, 0),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        color:  gold,
                                                        height: 4,
                                                        width: 25,
                                                      )
                                                    ],
                                                  ),
                                                ) :
                                                controller.accountOrderReturnTrackResponse!.data![index].packageStatus == "shipped" ?
                                                Padding(
                                                  padding: const EdgeInsets.fromLTRB(2,25, 2, 0),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        color:  gold,
                                                        height: 4,
                                                        width: 25,
                                                      )
                                                    ],
                                                  ),
                                                ):
                                                controller.accountOrderReturnTrackResponse!.data![index].packageStatus == "delivered" ?
                                                Padding(
                                                  padding: const EdgeInsets.fromLTRB(2,25, 2, 0),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        color:  gold,
                                                        height: 4,
                                                        width: 25,
                                                      )
                                                    ],
                                                  ),
                                                )
                                                    :      Padding(
                                                  padding: const EdgeInsets.fromLTRB(1,25, 1, 0),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 1),
                                                        child: CircleAvatar(
                                                          radius: 2.5,
                                                          backgroundColor: silvercolor,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 1),
                                                        child: CircleAvatar(
                                                          radius: 2.5,
                                                          backgroundColor: silvercolor,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 1),
                                                        child: CircleAvatar(
                                                          radius: 2.5,
                                                          backgroundColor: silvercolor,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 1),
                                                        child: CircleAvatar(
                                                          radius: 2.5,
                                                          backgroundColor: silvercolor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Column(
                                                  children: [
                                                    controller.accountOrderReturnTrackResponse != null
                                                        ? controller.accountOrderReturnTrackResponse!.data != null &&
                                                        controller.accountOrderReturnTrackResponse!.data!.length > 0
                                                        ? CircleAvatar(
                                                      backgroundColor: controller.accountOrderReturnTrackResponse!.data![index].packageStatus == "in-process" ?
                                                      gold : controller.accountOrderReturnTrackResponse!.data![index].packageStatus == "shipped" ? gold
                                                          : controller.accountOrderReturnTrackResponse!.data![index].packageStatus == "delivered" ? gold : silvercolor,
                                                      radius: 25,
                                                      child: Image.asset(Images.car3, color: Colors.black, height: 23, width: 23),
                                                    )
                                                        : SizedBox(child: Text('No data available'))
                                                        : SizedBox(child: Text('Loading...')),
                                                    SizedBox(height: 5),
                                                    Text("In-process",
                                                      // textAlign: TextAlign.center,
                                                      style: railway.copyWith(color: Colors.black, fontSize: 9, fontWeight: FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                                controller.accountOrderReturnTrackResponse!.data![index].packageStatus == "shipped" ?
                                                Padding(
                                                  padding: const EdgeInsets.fromLTRB(2,25, 2, 0),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        color:  gold,
                                                        height: 4,
                                                        width: 25,
                                                      )
                                                    ],
                                                  ),
                                                )

                                                    :
                                                controller.accountOrderReturnTrackResponse!.data![index].packageStatus == "delivered" ?
                                                Padding(
                                                  padding: const EdgeInsets.fromLTRB(2,25, 2, 0),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        color:  gold,
                                                        height: 4,
                                                        width: 25,
                                                      )
                                                    ],
                                                  ),
                                                ):
                                                Padding(
                                                  padding: const EdgeInsets.fromLTRB(1,25, 1, 0),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 1),
                                                        child: CircleAvatar(
                                                          radius: 2.5,
                                                          backgroundColor: silvercolor,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 1),
                                                        child: CircleAvatar(
                                                          radius: 2.5,
                                                          backgroundColor: silvercolor,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 1),
                                                        child: CircleAvatar(
                                                          radius: 2.5,
                                                          backgroundColor: silvercolor,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 1),
                                                        child: CircleAvatar(
                                                          radius: 2.5,
                                                          backgroundColor: silvercolor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),

                                                Column(
                                                  children: [
                                                    controller.accountOrderReturnTrackResponse != null
                                                        ? controller.accountOrderReturnTrackResponse!.data != null &&
                                                        controller.accountOrderReturnTrackResponse!.data!.length > 0
                                                        ? CircleAvatar(
                                                      backgroundColor: controller.accountOrderReturnTrackResponse!.data![index].packageStatus == "shipped" ?
                                                      gold :
                                                      controller.accountOrderReturnTrackResponse!.data![index].packageStatus == "delivered" ? gold
                                                          : silvercolor,
                                                      radius: 25,
                                                      child: Image.asset(Images.car, color: Colors.black, height: 23, width: 23),
                                                    )
                                                        : SizedBox(child: Text('No data available'))
                                                        : SizedBox(child: Text('Loading...')),
                                                    SizedBox(height: 5),
                                                    Text("Shipped",
                                                      // textAlign: TextAlign.center,
                                                      style: railway.copyWith(color: Colors.black, fontSize: 9, fontWeight: FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                                controller.accountOrderReturnTrackResponse!.data![index].packageStatus == "delivered" ?
                                                Padding(
                                                  padding: const EdgeInsets.fromLTRB(2,25, 2, 0),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        color:  gold,
                                                        height: 4,
                                                        width: 25,
                                                      )
                                                    ],
                                                  ),
                                                )
                                                    :      Padding(
                                                  padding: const EdgeInsets.fromLTRB(1,25, 1, 0),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 1),
                                                        child: CircleAvatar(
                                                          radius: 2.5,
                                                          backgroundColor: silvercolor,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 1),
                                                        child: CircleAvatar(
                                                          radius: 2.5,
                                                          backgroundColor: silvercolor,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 1),
                                                        child: CircleAvatar(
                                                          radius: 2.5,
                                                          backgroundColor: silvercolor,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 1),
                                                        child: CircleAvatar(
                                                          radius: 2.5,
                                                          backgroundColor: silvercolor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Column(
                                                  children: [
                                                    controller.accountOrderReturnTrackResponse != null
                                                        ? controller.accountOrderReturnTrackResponse!.data != null &&
                                                        controller.accountOrderReturnTrackResponse!.data!.length > 0
                                                        ? CircleAvatar(
                                                      backgroundColor: controller.accountOrderReturnTrackResponse!.data![index].packageStatus == "delivered" ?
                                                      gold
                                                          : silvercolor,
                                                      radius: 25,
                                                      child: Image.asset(Images.delivered, color: Colors.black, height: 28, width: 28),
                                                    )
                                                        : SizedBox(child: Text('No data available'))
                                                        : SizedBox(child: Text('Loading...')),
                                                    SizedBox(height: 5),
                                                    Text("Delivered",
                                                      // textAlign: TextAlign.center,
                                                      style: railway.copyWith(color: Colors.black, fontSize: 9, fontWeight: FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                ],
                              ),
                            ),
                          ),
                        );
                        }
                    )
                    : SizedBox() : SizedBox(),
                    SizedBox(height: 8),

                    controller.ordersAndReturnsDetailsResponse!=null?
                    Container(
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
                    )
                    : SizedBox(),
                    SizedBox(height: 0),
                  ],
                ),
              )
                  : SizedBox() : SizedBox(),
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

  double detailsFinalPricecalculation(double price, double brandDis){
    return price-brandDis;
  }


  double total(double price, double calculatedDis){
    return price-calculatedDis;
  }

  double subTotal(double price, double calculatedDis, double isleCoupon, double brandCoupon, double redeemPoint, double miniPoint){
    return (price-calculatedDis)-isleCoupon-brandCoupon-redeemPoint-miniPoint;
  }

  double grandTotal(double price, double calculatedDis, double isleCoupon, double brandCoupon, double redeemPoint, double miniPoint, double vat, double shippingCharge){
    return (price-calculatedDis)-isleCoupon-brandCoupon-redeemPoint-miniPoint + (vat + shippingCharge);
  }






}
