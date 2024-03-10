import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/auth_controller.dart';
import 'package:isletestapp/controller/cart/cart_controller.dart';
import 'package:isletestapp/controller/product%20details/product_details_controller.dart';
import 'package:isletestapp/controller/product/product_controller.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/constants.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/auth/login-register.dart';
import 'package:isletestapp/view/base/custom_Image_cached.dart';
import 'package:isletestapp/view/base/custom_alert_dialog_for_permission.dart';
import 'package:isletestapp/view/base/custom_only_textfield_with_border.dart';
import 'package:isletestapp/view/base/custom_snackbar.dart';
import 'package:isletestapp/view/base/my_text_field.dart';
import 'package:isletestapp/view/screens/all_popup/custom%20popup%20messages/for_checkout_page_custom_popup.dart';
import 'package:isletestapp/view/screens/all_popup/info_popup.dart';
import 'package:isletestapp/view/screens/checkout/checkout_page.dart';
import 'package:isletestapp/view/screens/custom%20logo/custom_logo_widget.dart';
import 'package:isletestapp/view/screens/home/home_page.dart';
import 'package:isletestapp/view/screens/product%20details/product_details_page.dart';
import 'package:isletestapp/view/screens/product%20page/product_page.dart';
import 'package:isletestapp/view/screens/universal_bottom_nav/universal_bottom_nav.dart';
import 'package:isletestapp/view/screens/wish_list/custom_wish_item_count_widget.dart';
import '../../../controller/category/category_page_controller.dart';
import '../../base/custom_button.dart';

class CartPage extends StatefulWidget {
  final bool? isbottomSheet;
  CartPage({Key? key, this.isbottomSheet,
  }) : super(key: key);

  ///
  bool isExpanded1 = false;
  bool isExpanded2 = false;
  bool isExpanded3 = false;
  bool isExpanded4 = false;
  bool isExpanded5 = false;
  bool isExpanded6 = false;
  bool isExpanded7 = false;

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  TextEditingController searchCtr = TextEditingController();
  bool isSearchClick = false;

  FocusNode msgFcs = FocusNode();
  FocusNode islecouponFcs = FocusNode();
  FocusNode brandcouponFcs = FocusNode();
  FocusNode rewardFcs = FocusNode();

  bool indicatorcolor = true;
  TextEditingController msgboxCtr = TextEditingController();
  FocusNode msgboxFcs = FocusNode();

  bool isChecked = false;

  void toggleCheckbox() {
    setState(() {
      isChecked = !isChecked; // Toggle the checkbox state
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
            (_) {
          // Get.find<ProductDetailsController>().getBagPageCartData(widget.corelationId);
          Get.find<CartController>().getCartPageData(isPop: true);
          Get.find<CartController>().getGeneralSettingData();

          if(Get.find<AuthController>().isLoggedIn()){
            Get.find<CartController>().getCustomerUserMeData(isPop: true);
          }

          Get.find<CartController>().getShopWithConfidenceData();
          Get.find<CategoryPageController>().getNestedSectionData('1');
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryPageController>(builder: (categoryController) {
      return GetBuilder<CartController>(
          builder: (controller) {
            return Scaffold(
              bottomNavigationBar: widget.isbottomSheet== true ? const UniversalBottomNav() : const SizedBox.shrink(),
              // backgroundColor: Color(0xffFAFBFB),
              backgroundColor: const Color(0xffFAFAFA),
              // drawer: IsleDrawer(),
              appBar: AppBar(
                iconTheme: const IconThemeData(color: Color(0xff000000)),
                titleSpacing: 0,
                backgroundColor: const Color(0xffFFFFFF),
                centerTitle: true,
                elevation: 0,
                toolbarHeight: 62,
                actions: [
                  const WishButtonWidget(),
                  const SizedBox(width: 7),
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
                      child: Image.asset(Images.info, height: 20,
                        width: 20,
                        color: const Color(0xff000000),)),
                  const SizedBox(width: 10),
                ],
                leadingWidth: Get.width / 3.5,
                title: const CustomLogo(),
              ),
              body: SingleChildScrollView(
                child: RefreshIndicator(
                  onRefresh: () async {
                    await Get.find<CartController>().getCartPageData(isPop: false);
                    await Get.find<CartController>().getGeneralSettingData();
                  },
                  child: Column(
                    children: [

                      /// Top BANNER
                      Container(
                        height: 30,
                        width: Get.width,
                        color: const Color(0xffFFFFFF),
                        // width: Get.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Yours Bag" + " ( ${controller.cartPageResponse?.data?.length ?? "0"} )", style: poppins.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 16),)
                          ],
                        ),
                      ),
                      const SizedBox(height: 0),
                      controller.cartPageResponse != null ? controller.cartPageResponse!.data!.isNotEmpty ?
                      Column(
                        children: [
                          ListView.builder(
                              itemCount: controller.cartPageResponse?.data?.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                int indexx = index;
                                int sunny = controller.cartPageResponse!.data![indexx]!.productInventoryId??0;
                                print("First index==>$indexx");
                                print("Sunny index==>$sunny");
                                // controller.getAvailableStockData(sunny);
                                return InkWell(
                                  onTap: () {
                                    Get.to(ProductDetailsPage(
                                      productId: controller.cartPageResponse?.data?[index].productId?.toString() ?? "",
                                    ));
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        // color: Colors.red,
                                        color: const Color(0xffFAFAFA),
                                        height: Get.height / 4.5,
                                        child: Stack(
                                            children: [
                                              Container(
                                                decoration: const BoxDecoration(
                                                  color: Color(0xffFAFBFB),
                                                  // color: Colors.tealAccent,
                                                ),
                                                child: ClipRRect(
                                                    child: CustomImageCached(
                                                      placeholder: "assets/image/placeholder.png",
                                                      image: '${AppConstants.BASE_URL}${controller.cartPageResponse?.data?[index].productColorVariant?.frontPhoto ?? ""}',
                                                      fit: BoxFit.contain,
                                                    )
                                                ),
                                              ),
                                              Positioned(
                                                top: 20,
                                                right: 20,
                                                child: InkWell(
                                                    onTap: () {
                                                      Get.dialog(
                                                          CustomAlerDialogForPermission(
                                                            iconString: Images.delete,
                                                            title: 'Remove Item',
                                                            description: 'Do you really want to remove from bag?',
                                                            yesBtntap: () {
                                                              Get.back();
                                                            },
                                                            noBtntap: () {
                                                              Get.back();
                                                              controller.cartDelete(controller.cartPageResponse?.data?[index].id?.toString() ?? "");
                                                            },
                                                            noBtnText: "YES",
                                                            yesBtnText: "NO",
                                                          ));
                                                      // controller.getDeleteItemList(controller.teacherHomeWorkResponse!.homeworks![int.parse(widget.passindex)].id.toString());
                                                    },
                                                    child: Image.asset(
                                                      Images.delete,
                                                      color: silvercolor,
                                                      height: 28,
                                                      width: 28,)),
                                              )
                                            ]
                                        ),
                                      ),
                                      const SizedBox(height: 0),
                                      InkWell(
                                        onTap: () {
                                          // Get.to(Dashboard(pageIndex: 0));
                                          Get.to(const Home());
                                        },
                                        child: Container(

                                          /// orginal color
                                          color: Colors.white,
                                          // color: Color(0xffFEFFFF),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 12,
                                                right: 12,
                                                top: 4.5,
                                                bottom: 4.5),
                                            child: Text(
                                              "Shopping Continue".toUpperCase(),
                                              style: railway.copyWith(
                                                  color: Colors.black,
                                                  fontSize: 9.5),),
                                          ),
                                        ),
                                      ),

                                      /// title
                                      const SizedBox(height: 2),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 12,
                                            right: 12,
                                            top: 4,
                                            bottom: 4),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                              child: Text((controller.cartPageResponse?.data?[index].product?.brand?.name ?? "").toUpperCase(),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: railway.copyWith(fontWeight: FontWeight.w600,
                                                    color: Colors.black,
                                                    fontSize: 20),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      /// desc
                                      const SizedBox(height: 0),
                                      Container(
                                        // color: Colors.pinkAccent,
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 12, right: 12, top: 4, bottom: 4),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Center(
                                                  child: Text(controller.cartPageResponse?.data?[index].product?.name ?? "",
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: poppins.copyWith(
                                                        color: Colors.black,
                                                        fontSize: 16),),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 3),
                                      Container(
                                        // color: Colors.red,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 8),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            // crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Row(
                                                children: [
                                                  Text("Colour: ",
                                                    style: poppins.copyWith(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),),
                                                  Text(controller.cartPageResponse?.data?[index].productColorVariant?.color?.name ?? "",
                                                    style: railway.copyWith(color: Colors.black, fontSize: 16),),
                                                ],
                                              ),
                                              const SizedBox(width: 8),
                                              Row(
                                                children: [
                                                  Text("Size: ",
                                                    style: poppins.copyWith(
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.black,
                                                        fontSize: 16),),
                                                  Text(controller.cartPageResponse?.data?[index].productInventory?.size?.sizeCode ?? "",
                                                    // Text("${controller.bagePageCartResponse?.data?[index]?.productColorVariant?.productInventories?[0]?.size?.sizeCode??""}",
                                                    style: railway.copyWith(
                                                        color: Colors.black,
                                                        fontSize: 16),),
                                                ],
                                              ),
                                              const SizedBox(width: 8),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      controller.addQuantity(false, index);
                                                    },
                                                    child: SizedBox(
                                                        width: 30,
                                                        child: Center(
                                                            child: Text('-',
                                                              style: robotoMedium.copyWith(
                                                                  color: Colors.black,
                                                                  fontSize: 16,
                                                                  fontWeight: FontWeight.w700),))),
                                                  ),
                                                  Container(
                                                    decoration : BoxDecoration(
                                                        border : Border.all(width: 0.5, color: gold)
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(left: 6, right: 6, bottom: 0),
                                                      child: Center(child: Text("${controller.cartPageResponse?.data?[index]?.quantity??0}",
                                                        // child: Center(child: Text('${controller.bagePageCartResponse?.data?[index]?.productColorVariant?.productInventories?[0]?.stockQty??""}',
                                                        style: poppins.copyWith(color: Colors.black, fontSize: 16 ),)),
                                                      // child: Center(child: Text('${cart.productQty}')),
                                                    ),),

                                                  InkWell(
                                                    onTap: () async{
                                                      int apiStock = await controller.cartPageResponse?.data?[index]?.stock??0;
                                                      int clickStock = await controller.cartPageResponse?.data?[index]?.quantity??0;
                                                      print("view Stock==>${controller.cartPageResponse?.data?[index]?.quantity}");
                                                      print("My Api Stock==>${controller.cartPageResponse?.data?[index]?.stock}");
                                                      if(apiStock>clickStock){
                                                        controller.addQuantity(true, index);
                                                      } else {
                                                        showCustomSnackBar("Cannot increase quantity beyond stock quantity");
                                                      }
                                                    },
                                                    child: SizedBox(
                                                      // height: 20,
                                                        width: 30,
                                                        child: Center(
                                                            child: Text('+',
                                                              style: robotoMedium.copyWith(
                                                                color: Colors.black,
                                                                fontSize: 16,),))),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      controller.cartPageResponse?.data?[index].product?.discount == 0 || controller.cartPageResponse?.data?[index].product?.discount == null ?
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 4),
                                        child: Text(
                                          "${controller.cartPageResponse?.data?[index].totalPrice.toStringAsFixed(0) ?? 0} BDT",
                                          style: poppins.copyWith(
                                              fontWeight: FontWeight.w600,
                                              color: gold,
                                              fontSize: 16
                                          ),
                                        ),
                                      )
                                          :
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 4),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "${controller.cartPageResponse?.data?[index].totalPrice.toStringAsFixed(0) ?? 0} BDT",
                                              style: poppins.copyWith(
                                                  decoration: TextDecoration.lineThrough,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.red,
                                                  fontSize: 16
                                              ),
                                            ),
                                            const SizedBox(width: 15),
                                            Text(
                                              "${controller.cartPageResponse?.data?[index].totalDiscountedPrice.toStringAsFixed(0) ?? 0} BDT",
                                              style: poppins.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  color: gold,
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                      ),

                                      /*                                     controller.stockResponse!=null? controller.stockResponse!.data!.id!>0?
                                      Text("${controller.stockResponse!.data!.pendingDeliveryQty} rgfdgdf")
                                      : SizedBox(): Text("data"),
                                      Text(" rgfdgdf"),
                                      Column(
                                        children: [
                                          Text("${controller.stockResponse?.data?.stockQty}"),
                                          Text("${controller.stockResponse?.data?.stockQty??0}"),
                                          Text("${controller.stockResponse?.data?.stockQty??"0"}"),
                                          Text("${controller.stockResponse?.data?.stockQty?.toString()??"0"}"),
                                          Text("${int.parse(controller.stockResponse?.data?.pendingDeliveryQty?.toString()??"0")}")
                                        ],
                                      ),*/

                                      /// main code
                                      controller.cartPageResponse!.data![index].productInventory!.stockQty! < 6 ? const SizedBox(height: 5) : const SizedBox(),
                                      controller.cartPageResponse!.data![index].productInventory != null ?
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          controller.cartPageResponse!.data![index].productInventory!.stockQty! < 6 ?
                                          Image.asset(Images.clock, height: 15, width: 15, color: red)
                                              : const SizedBox(),
                                          const SizedBox(width: 5),
                                          Text(
                                            controller.cartPageResponse!.data![index].productInventory!.stockQty! < 6 ? "Stock is low: only ${controller.cartPageResponse!.data![index].productInventory!.stockQty!} is left"
                                                : "",
                                            style: robotoRegular.copyWith(color: Colors.red),),
                                        ],
                                      )
                                          : const SizedBox(),
                                      controller.cartPageResponse!.data![index].productInventory!.stockQty! < 6 ? const SizedBox(
                                          height: 20) : const SizedBox(),
                                      const Divider(
                                        color: Color(0xffF1F7F8),
                                        height: 5,
                                        thickness: 5,
                                      ),
                                    ],
                                  ),
                                );
                              }
                          ),
                          const Divider(
                            color: Color(0xffF1F7F8),
                            height: 5,
                            thickness: 5,
                          ),

                          /// gift
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  widget.isExpanded1 = !widget.isExpanded1;
                                  setState(() {});
                                },
                                child: Container(
                                    color: const Color(0xffFFFFFF),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 2,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 20),
                                                  child: Image.asset(
                                                    Images.gift, height: 20,
                                                    width: 20,),
                                                ),
                                              ],
                                            )
                                        ),

                                        Expanded(
                                            flex: 9,
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 15),
                                              child: Text("Add Your Gift Note",
                                                style: railway.copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12),),
                                            )
                                        ),

                                        Expanded(
                                            flex: 2,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 8),
                                              child: Icon(
                                                widget.isExpanded1 ? Icons.minimize : Icons.add,
                                                size: 20,
                                                color: Colors.black54,),
                                            )
                                        )
                                      ],
                                    )
                                ),
                              ),
                              widget.isExpanded1 ? Container(
                                // color: Colors.red,
                                padding: const EdgeInsets.only(
                                    left: 20, right: 15, top: 8, bottom: 8),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 0, top: 5, bottom: 5),
                                      child: Text(
                                        "● Invoice will be excluded from the order, and sent to you via e-mail.",
                                        style: poppins.copyWith(
                                            fontSize: 10,
                                            // fontWeight: FontWeight.w600,
                                            color: Colors.black87
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    MyTextField(
                                      height: 40,
                                      titlesize: 10,
                                      // maxLines: 5,
                                      // minLines: 2,
                                      controller: controller.msgCtr,
                                      focusNode: msgFcs,
                                      title: "Your Message (300)",
                                      hintText: "Text here",
                                      hintStyle: railway.copyWith(fontSize: 9),
                                    ),
                                    const SizedBox(height: 4),

                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 0, right: 0),
                                      child: ElevatedButton(
                                        // style: raisedButtonStyle,
                                        style: ElevatedButton.styleFrom(
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.zero
                                          ),
                                          primary: const Color(0xff2D2D2D),
                                          minimumSize: const Size.fromHeight(35),
                                        ),
                                        onPressed: () {
                                          String giftNote = controller.msgCtr.text;
                                          if (giftNote.isNotEmpty) {
                                            showCustomSnackBar("Added your note", isError: false);
                                          } else {
                                          }
                                        },
                                        child: Text('Add Message'.toUpperCase(),
                                          style: railway.copyWith(
                                              fontSize: 12),),
                                      ),
                                    ),
                                    // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
                                  ],
                                ),
                              ) : Container(),
                            ],
                          ),
                          const Divider(
                            thickness: 10,
                            color: Color(0xffF2F6F9),
                          ),

                          /// coupon
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  widget.isExpanded2 = !widget.isExpanded2;
                                  setState(() {});
                                },
                                child: Container(
                                    color: const Color(0xffFFFFFF),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 2,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 20),
                                                  child: Image.asset(
                                                    Images.coupon, height: 20, width: 20,),
                                                ),
                                              ],
                                            )
                                        ),
                                        Expanded(
                                            flex: 9,
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 15),
                                              child: Text("Apply Coupon",
                                                style: railway.copyWith(fontWeight: FontWeight.bold, fontSize: 12),),
                                            )
                                        ),
                                        Expanded(
                                            flex: 2,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 8),
                                              child: Icon(widget.isExpanded2 ? Icons.minimize : Icons.add,
                                                size: 20,
                                                color: Colors.black54,),
                                            )
                                        )
                                      ],
                                    )
                                ),
                              ),
                              widget.isExpanded2 ? Container(
                                // color: Colors.red,
                                padding: const EdgeInsets.only(left: 20, right: 6, top: 8, bottom: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 8),
                                    Text("You can apply only one coupon",
                                      style: poppins.copyWith(fontSize: 10,
                                          // fontWeight: FontWeight.w600,
                                          color: Colors.black87
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Expanded(
                                          child: MyTextField(
                                            title: "ISLE Coupon",
                                            titlesize: 10,
                                            height: 40,
                                            controller: controller.islecouponCtr,
                                            focusNode: islecouponFcs,
                                            hintText: "Isle-xxxxxx",
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        controller.isleCouponDis!=0?
                                        GestureDetector(
                                            onTap: (){
                                              print("clear start");
                                              controller.islecouponCtr.clear();
                                              controller.isleCouponDis =0.0;
                                              // showCustomSnackBar("message");
                                              controller.clearIsleCoupon();
                                              controller.applyCouponResponse=null;
                                              controller.getTotal(isPop: false, fromCheckout: false);
                                              print("clear");
                                            },
                                            child: Container(
                                                // color: Colors.green,
                                                height: 40,
                                                width: 40,
                                                child: Center(child: Icon(Icons.close, color: Colors.red))))
                                            :
                                        InkWell(
                                            onTap: () async {
                                              String deviceID = await Get.find<AuthController>().getDeviceID();
                                              String customerID = await Get.find<AuthController>().getUserId();
                                              if(controller.condition){
                                                Get.dialog(ForCheckOutCustomPopUp(msg: "you can't use minimum purchase discount and coupon both in same order", username: "${controller.customerUserMeResponse?.data?.firstName??""} ${controller.customerUserMeResponse?.data?.lastName??""}",));
                                              } else {
                                                controller.applyIsleCoupon(
                                                    customer_id: customerID,
                                                    corelation_id: deviceID,
                                                    code: controller.islecouponCtr.text,
                                                    type: "isle",
                                                    is_guest: "false"
                                                );
                                              }
                                              },
                                            child: Container(
                                                alignment: Alignment.center,
                                                height: 40,
                                                decoration: BoxDecoration(color: gold,
                                                    borderRadius: BorderRadius.circular(0)
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 15, right: 15),
                                                  child: Text("Apply".toUpperCase(),
                                                    style: railway.copyWith(fontSize: 8,
                                                        fontWeight: FontWeight.w600),),
                                                ))
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Expanded(
                                          child: MyTextField(
                                            title: "Brand Coupon",
                                            titlesize: 10,
                                            height: 40,
                                            controller: controller.brandcouponCtr,
                                            focusNode: brandcouponFcs,
                                            hintText: "brand-xxxxx",
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        controller.brandCouponDis!=0?
                                        GestureDetector(
                                            onTap: (){
                                              print("clear start");
                                              controller.brandcouponCtr.clear();
                                              controller.brandCouponDis =0.0;
                                              // showCustomSnackBar("message");
                                              controller.clearBrandCoupon();
                                              controller.applyCouponResponse=null;
                                              controller.getTotal(isPop: false, fromCheckout: false);
                                              print("clear");
                                            },
                                            child: Container(
                                              // color: Colors.green,
                                                height: 40,
                                                width: 40,
                                                child: Center(child: Icon(Icons.close, color: Colors.red))))
                                            :
                                        InkWell(
                                            onTap: () async {
                                              String deviceID = await Get.find<AuthController>().getDeviceID();
                                              String customerID = await Get.find<AuthController>().getUserId();
                                              if(controller.condition){
                                                Get.dialog(ForCheckOutCustomPopUp(msg: "you can't use minimum purchase discount and coupon both in same order", username: "${controller.customerUserMeResponse?.data?.firstName??""} ${controller.customerUserMeResponse?.data?.lastName??""}",));
                                              } else {
                                                controller.applyIsleCoupon(
                                                    customer_id: customerID,
                                                    corelation_id: deviceID,
                                                    code: controller.brandcouponCtr.text,
                                                    type: "brand",
                                                    is_guest: "false"
                                                );
                                              }
                                            },
                                            child: Container(
                                                alignment: Alignment.center,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                    color: gold,
                                                    borderRadius: BorderRadius.circular(0)
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left: 15, right: 15),
                                                  child: Text("Apply".toUpperCase(),
                                                    style: railway.copyWith(
                                                        fontSize: 8,
                                                        fontWeight: FontWeight.w600),),
                                                ))
                                        )
                                      ],
                                    ),
                                    // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
                                  ],
                                ),
                              ) : Container(),
                            ],
                          ),
                          const Divider(
                            thickness: 10,
                            color: Color(0xffF2F6F9),
                          ),

                          /// reward
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  widget.isExpanded3 = !widget.isExpanded3;
                                  setState(() {});
                                },
                                child: Container(
                                    color: const Color(0xffFFFFFF),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 2,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 20),
                                                  child: Image.asset(Images.reward, height: 20, width: 20,),
                                                ),
                                              ],
                                            )
                                        ),
                                        Expanded(
                                            flex: 9,
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 15),
                                              child: Text("Isle Rewards - Earn & Redeem",
                                                style: railway.copyWith(fontWeight: FontWeight.bold, fontSize: 12),),
                                            )
                                        ),
                                        Expanded(
                                            flex: 2,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 8),
                                              child: Icon(widget.isExpanded3 ? Icons.minimize : Icons.add,
                                                size: 20,
                                                color: Colors.black54,),
                                            )
                                        )
                                      ],
                                    )
                                ),
                              ),
                              widget.isExpanded3 ? Container(
                                // color: Colors.red,
                                padding: const EdgeInsets.only(left: 20, right: 4, top: 8, bottom: 8),
                                child:Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("You can Redeem ${controller.minimumPoint.round()} points in this product", style: railway.copyWith(fontSize: 10)),
                                    SizedBox(height: 6),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Expanded(
                                          child: CustomOnlyTextFieldWithBorder(
                                            height: 40,
                                            controller: controller.rewardCtr,
                                            focusNode: rewardFcs,
                                            hintText: "Redeem",
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        // controller.rewardApplyCouponResponse!=null?
                                        // GestureDetector(
                                        //     onTap: (){
                                        //       // showCustomSnackBar("message");
                                        //       controller.deletRedeemDiscount();
                                        //     },
                                        //     child: Center(child: Icon(Icons.close, color: Colors.red)))
                                        //     :
                                        controller.redeemPoint!=0?
                                        GestureDetector(
                                            onTap: (){
                                              print("clear start");
                                              controller.rewardCtr.clear();
                                              controller.redeemPoint =0.0;
                                              // showCustomSnackBar("message");
                                              controller.clearRedeem();
                                              controller.rewardApplyCouponResponse=null;
                                              controller.getTotal(isPop: false, fromCheckout: false);
                                              print("clear");
                                            },
                                            child: Container(
                                              // color: Colors.green,
                                                height: 40,
                                                width: 40,
                                                child: Center(child: Icon(Icons.close, color: Colors.red))))
                                            :
                                        InkWell(
                                          onTap: () async {
                                            double input = double.parse(controller.rewardCtr.text);
                                            print("Input==>$input");
                                            int point = checkPoint(
                                                int.parse(controller.customerUserMeResponse!.data!.point!.toString()??"0"),
                                                int.parse(controller.customerUserMeResponse!.data!.usePoint!.toString()??"0")
                                            );
                                            String deviceID = await Get.find<AuthController>().getDeviceID();
                                            String customerID = await Get.find<AuthController>().getUserId();
                                            print("IIIIIInput==>$input");
                                            controller.applyRedeem(
                                                customer_id: customerID,
                                                redeem_point: controller.rewardCtr.text
                                            );
                                            controller.redeemPoint=0.0;
                                            controller.getTotal(isPop: true, fromCheckout: false);
                                            showCustomSnackBar("You can't redeem more than your existing total point");
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              color: gold,
                                              borderRadius: BorderRadius.circular(0),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 15, right: 15),
                                              child: Text(
                                                "Apply".toUpperCase(),
                                                style: railway.copyWith(fontSize: 8, fontWeight: FontWeight.w600),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ) : Container(),
                            ],
                          ),
                          const Divider(
                            thickness: 10,
                            color: Color(0xffF2F6F9),
                          ),

                          /// balance part
                          Container(
                              color: const Color(0xffFFFFFF),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 25, right: 15, top: 25, bottom: 0),
                                          child: Row(
                                            children: [
                                              Text("Sub Total",
                                                style: poppins.copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 13),),
                                              Text(" ( + VAT)",
                                                style: poppins.copyWith(
                                                    fontSize: 11,
                                                    color: Colors.grey),),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 25, right: 15, top: 25, bottom: 0),
                                          child: Text("${controller.subTotal!.toStringAsFixed(0) ?? ""} BDT",
                                            textAlign: TextAlign.right,
                                            overflow: TextOverflow.ellipsis,
                                            style: poppins.copyWith(color: gold,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13),),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  controller.isleCouponDis > 0 ? Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 25, right: 15, top: 0, bottom: 0),
                                          child: Text("Isle Coupon",
                                            style: poppins.copyWith(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13),),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 25, right: 15, top: 0, bottom: 0),
                                          child: Text(
                                            "${controller.isleCouponDis ?? ""} BDT",
                                            textAlign: TextAlign.right,
                                            overflow: TextOverflow.ellipsis,
                                            style: poppins.copyWith(color: gold,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13),),
                                        ),
                                      ),
                                    ],
                                  ) : const SizedBox.shrink(),
                                  controller.isleCouponDis > 0 ? const SizedBox(height: 5) : SizedBox.shrink(),
                                  controller.brandCouponDis > 0 ? Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 25, right: 15, top: 0, bottom: 0),
                                          child: Text("Brand Coupon",
                                            style: poppins.copyWith(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13),),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 25, right: 15, top: 0, bottom: 0),
                                          child: Text(
                                            "${controller.brandCouponDis ?? ""} BDT",
                                            textAlign: TextAlign.right,
                                            overflow: TextOverflow.ellipsis,
                                            style: poppins.copyWith(color: gold,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13),),
                                        ),
                                      ),
                                    ],
                                  ) : const SizedBox.shrink(),
                                  controller.brandCouponDis > 0 ? const SizedBox(height: 5) : const SizedBox.shrink(),
                                  controller.firstOrderDiscount>0? Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 25, right: 15, top: 0, bottom: 0),
                                          child: Row(
                                            children: [
                                              Text("First Order Discount",
                                                style: poppins.copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 13),),
                                            ],
                                          ),
                                        ),
                                      ),

                                      const SizedBox(width: 8),
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 25, right: 15, top: 0, bottom: 0),
                                          child: Text("${controller.firstOrderDiscount!.toStringAsFixed(0) ?? ""} BDT",
                                            textAlign: TextAlign.right,
                                            overflow: TextOverflow.ellipsis,
                                            style: poppins.copyWith(color: gold,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13),),
                                        ),
                                      ),
                                    ],
                                  ): const SizedBox.shrink(),
                                  controller.firstOrderDiscount > 0 ? const SizedBox(height: 5) : const SizedBox.shrink(),
                                  controller.redeemPoint>0? Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 25, right: 15, top: 0, bottom: 0),
                                          child: Row(
                                            children: [
                                              Text("Redeem reward",
                                                style: poppins.copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 13),),
                                            ],
                                          ),
                                        ),
                                      ),

                                      const SizedBox(width: 8),
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 25, right: 15, top: 0, bottom: 0),
                                          child: Text("${controller.redeemPoint!.toStringAsFixed(0) ?? ""} BDT",
                                            textAlign: TextAlign.right,
                                            overflow: TextOverflow.ellipsis,
                                            style: poppins.copyWith(color: gold,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13),),
                                        ),
                                      ),
                                    ],
                                  ): const SizedBox.shrink(),
                                  controller.redeemPoint > 0 ? const SizedBox(height: 5) : const SizedBox.shrink(),

                                  controller.condition?  controller.minimumPurchaseDiscount>0? Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 25, right: 15, top: 0, bottom: 0),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Text("Minimum Purchase Order Discount",
                                                  style: poppins.copyWith(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 13),),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),

                                      const SizedBox(width: 8),
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 25, right: 15, top: 0, bottom: 0),
                                          child: Text("${controller.minimumPurchaseDiscount!.toStringAsFixed(0) ?? ""} BDT",
                                            textAlign: TextAlign.right,
                                            overflow: TextOverflow.ellipsis,
                                            style: poppins.copyWith(color: gold,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13),),
                                        ),
                                      ),
                                    ],
                                  ): const SizedBox.shrink(): const SizedBox.shrink(),
                                  controller.minimumPurchaseDiscount > 0 ? const SizedBox(height: 5) : const SizedBox.shrink(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 25, right: 15, top: 0, bottom: 5),
                                          child:
                                          Text("Grand Total",
                                            style: poppins.copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 25, right: 15, top: 0, bottom: 5),
                                          child: Text("${controller.cartTotal!.toStringAsFixed(0) ?? ""} BDT",
                                            textAlign: TextAlign.right,
                                            overflow: TextOverflow.ellipsis,
                                            style: poppins.copyWith(color: gold,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),),
                                        ),
                                      ),
                                    ],
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(left: 25, right: 25),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "Shipping cost and VAT amount will be calculated at final checkout",
                                            style: poppins.copyWith(color: Colors.black, fontSize: 11),),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  controller.cartPageResponse!.data!.isNotEmpty ?
                                  Container(
                                    height: 80,
                                    padding: const EdgeInsets.only(left: 25, right: 25, top: 15, bottom: 15),
                                    child: GetBuilder<AuthController>(
                                        builder: (authController) {
                                          return Container(
                                            color: gold,
                                            child: InkWell(
                                                onTap: () {
                                                  if (authController.isLoggedIn() || authController.isLoggedInGuest()) {
                                                    Get.to(CheckOutPage(orderPlaceRequest: controller.orderPlaceRequest, isleCoupon: controller.islecouponCtr.text, brandCoupon: controller.brandcouponCtr.text,));
                                                  } else {
                                                    Get.to(
                                                        const LoginRegisterPage(
                                                          isFromCart: true,
                                                          isbottomSheet: true,));
                                                  }
                                                },
                                                child: Center(child: Text(
                                                  (authController.isLoggedIn() ? "Secure Checkout" : "Login to continue").toUpperCase(),
                                                  style: railwaybold.copyWith(
                                                      color: Colors.white,
                                                      fontSize: 12),))),
                                          );
                                        }
                                    ),
                                  ) : const SizedBox(),
                                  const SizedBox(height: 4),

                                ],
                              )
                          ),
                          // SizedBox(height: 8),
                          Container(
                              color: const Color(0xffF2F6F9),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 21, right: 21),
                                    child: SizedBox(
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
                                                    padding: const EdgeInsets.only(left: 5, right: 5),
                                                    // Add some spacing between items
                                                    child: InkWell(
                                                      child: SizedBox(
                                                        width: 35,
                                                        height: 25,
                                                        // margin: EdgeInsets.all(10),
                                                        // padding: EdgeInsets.all(5),
                                                        child: Image.asset(
                                                          bankcard[index],
                                                          height: 40,
                                                          width: 60,),
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
                                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
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
                      )
                          : ListView.builder(
                          itemCount: 1,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (ctx, index){
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(height: 70,),
                                Image.asset(Images.emptybag,),
                                const SizedBox(height: 20,),
                                Text("Your Shopping Bag is\n    currently empty!",
                                  style: railway.copyWith(fontSize: 18),),
                                const SizedBox(height: 30),
                                CustomButton(
                                  radius: 0,
                                  height: 45,
                                  width: 180,
                                  buttoncolor: Colors.black,
                                  buttontextcolor: Colors.white,
                                  myfontweight: FontWeight.bold,
                                  onPressed: () {
                                    Get.to(() =>
                                        ProductPage(
                                          // image: '${AppConstants.BASE_URL}${categoryController.nestedSectionResponse?.data?[2].banner ?? ""}',
                                          // title: categoryController.nestedSectionResponse?.data?[2]?.title ?? "",
                                          // details: categoryController.nestedSectionResponse?.data?[2]?.details ?? "",
                                          page: AppConstants.newIn,
                                          title: "Category",
                                          id: categoryController.nestedSectionResponse?.data?[index].id.toString() ?? '',
                                          pageId: categoryController.nestedSectionResponse?.data?[index].pageId,
                                        ));
                                  },
                                  buttonText: 'shop new in'.toUpperCase(),
                                  fontSize: 15,
                                ),
                                const SizedBox(height: 30),
                              ],
                            );
                          }
                      )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),

            );
          }
      );
    });
  }

  int checkPoint( int point, int usePoint) {
    return point - usePoint;
  }

/*int getStock(int index,CartController controller){
  String size=controller.bagePageCartResponse?.data?[index].size??"";
  int stock=0;
  controller.bagePageCartResponse?.data?[index].productColorVariant?.productInventories?.map((e) {
    if(e.size==size){
      stock=e.stockQty??0;
    }
  }).toList();
  return stock;
}*/


}