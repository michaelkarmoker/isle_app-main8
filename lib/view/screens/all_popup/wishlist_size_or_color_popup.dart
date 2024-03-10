import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/auth_controller.dart';
import 'package:isletestapp/controller/product%20details/product_details_controller.dart';
import 'package:isletestapp/controller/wishlist/wishlist_controller.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/custom_button.dart';
import 'package:isletestapp/view/screens/all_popup/add_to_cart_from_wishlist_popup.dart';
import 'package:isletestapp/view/screens/all_popup/custom%20popup%20messages/custom_popup.dart';
import 'package:isletestapp/view/screens/all_popup/size_guide_popup.dart';
import 'package:isletestapp/view/screens/dashboard/dashboard.dart';

class WishlistPopupSizeOrColor extends StatefulWidget {
   final int productIndex;
  const WishlistPopupSizeOrColor({Key? key, required this.productIndex,
  }) : super(key: key);
  @override
  State<WishlistPopupSizeOrColor> createState() => _PopupSizeOrColorState();
}
class _PopupSizeOrColorState extends State<WishlistPopupSizeOrColor> {
  int selectedIndex = 0; // Set initial index to 0
  void toggleSelection(int index) {
    setState(() {
      if (selectedIndex == index) {
        // If the same item is clicked again, deselect it
        selectedIndex = -1;
      } else {
        selectedIndex = index;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WishlistController>(
        builder: (controller) {
          return Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 15),
                Container(
                  // color: Colors.yellow,
                  height: 42,
                  child: ListTile(

                    title:   Text.rich(
                        TextSpan(
                            text: 'Select Size/Color',
                            style: railway.copyWith(color: Colors.black ,fontSize: 20, fontWeight: FontWeight.w600),
                            children: <InlineSpan>[
                              TextSpan(
                                text: '',
                                style: railway.copyWith(fontSize: 11, height: 1.6, fontWeight: FontWeight.w500),
                              )
                            ]
                        )
                    ),
                    // title: Text('Select Size', style: railway.copyWith(fontSize: 20, fontWeight: FontWeight.w600),),
                    trailing: InkWell(
                        onTap: (){
                          Get.back();
                        },
                        child: Text("Done".toUpperCase(), style: railway.copyWith(fontSize: 12, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),)),
                    onTap: () {
                      // Add functionality for sharing
                      Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(
                              TextSpan(
                                  text: 'Colour: '.toUpperCase(),
                                  style: railway.copyWith( letterSpacing: 1 ,color: Colors.grey.shade600 ,fontSize: 12, fontWeight: FontWeight.w600),
                                  children: <InlineSpan>[
                                    TextSpan(
                                      text: '${controller.getWishlistResponse?.data?[widget.productIndex].product?.productColorVariants?[controller.sectedColorVAriantIndex]?.color?.name??""}'.toUpperCase(),
                                      style: railway.copyWith( letterSpacing: 1,fontSize: 12, color: Colors.black, fontWeight: FontWeight.w600),
                                    )
                                  ]
                              )
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      SizedBox(height: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  height: 140,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    physics: BouncingScrollPhysics(),
                                    itemCount: controller.getWishlistResponse!.data![widget.productIndex]!.product!.productColorVariants?.length ?? 0,
                                    itemBuilder: (BuildContext context, int index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(right: 8),
                                        child: GestureDetector(
                                          onTap: () {
                                            toggleSelection(index);
                                            controller.sectedColorVAriantIndex = index;
                                            Get.find<WishlistController>().update();
                                          },
                                          child: Container(
                                            height: 140,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(0),
                                              border: Border.all(
                                                color: selectedIndex == index ? gold : Colors.transparent,
                                                width: 2,
                                              ),
                                            ),
                                            child: Image.network(
                                              "${AppConstants.BASE_URL}${controller.getWishlistResponse!.data![widget.productIndex]!.product!.productColorVariants?[index].profilePhoto ?? ""}",
                                              height: 140,
                                              width: 100,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    // color: Colors.pinkAccent,
                    height: 45,
                    child: Row(
                       mainAxisAlignment: MainAxisAlignment.end,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            controller.getWishlistResponse!.data![widget.productIndex]!.product!.sizeGuide == null?   Get.dialog(CustomPopUp(title: 'no-data',))
                                : Get.to(
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return FractionallySizedBox(
                                      // heightFactor: 0.5,
                                      child: PopupSizeGuide(
                                          sizedimage:  '${controller.getWishlistResponse!.data![widget.productIndex]!.product!.sizeGuide??""}'
                                        // sizedimage: controller.productDetailsResponse!.data!.sizeGuide??"",
                                      ),
                                    );
                                  },
                                ),
                                fullscreenDialog: true
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 45,
                            // color: Colors.green,
                            child: Text("Size Guide".toUpperCase(),
                              style: railway.copyWith(fontSize: 12, color: gold, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Container(
                      // color: Colors.pinkAccent,
                      height: 50,
                      child:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: controller.getWishlistResponse!.data![widget.productIndex]!.product!.productColorVariants![controller.sectedColorVAriantIndex].productInventories!.length,
                              // itemCount: sizelist.length,
                              itemBuilder: (BuildContext context, int index2) {
                                return InkWell(
                                  onTap: (){
                                    controller.sectedSize=controller.getWishlistResponse!.data![widget.productIndex]!.product!.productColorVariants![controller.sectedColorVAriantIndex].productInventories?[index2].size?.sizeCode??"";
                                    controller.stock= controller.getWishlistResponse!.data![widget.productIndex]!.product!.productColorVariants![controller.sectedColorVAriantIndex].productInventories?[index2]?.stockQty??0;
                                    controller.update();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 0, right: 12),
                                    child: Container(
                                      width: 55,
                                      height: 50,
                                      margin: EdgeInsets.all(0),
                                      padding: EdgeInsets.all(0),
                                      child: Center(
                                          child: Text(
                                            '${controller.getWishlistResponse!.data![widget.productIndex]!.product!.productColorVariants![controller.sectedColorVAriantIndex].productInventories![index2].size!.sizeCode??""}',
                                            style: robotoMedium.copyWith(fontSize: 15),
                                          )),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                          color:IsSelectedSize(index2,controller)? gold : Colors.white ,
                                          // color: Colors.yellow[100],
                                          border: Border.all(
                                            color: gold,
                                            width: 0.4,
                                          )),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                ),
                SizedBox(height: 10),
                controller.stock<6?
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      controller.stock<6?
                      Image.asset(Images.clock, height: 16, width: 16, color: red,): SizedBox(),
                      SizedBox(width: 5),
                      Text("${controller.stock<6?"Low in stock: only ${controller.stock} is left":""}",
                        style: railway.copyWith(color: Colors.red),),
                    ],
                  ),
                ) : SizedBox(),
 /*               SizedBox(height: 8),
                ListView.builder(
                    itemCount: 1,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Text("Product Quantity:"),
                            Container(
                              // color: deep,
                              // width: 100,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap:(){
                                      if (controller.stock > 0) {
                                        // Only allow updating the quantity if there is stock available
                                        controller.addQuantity(false, index);
                                      }
                                      // controller.addQuantity(false, index);
                                    },
                                    child: Container(
                                        width: 30,
                                        child: Center(child: Text('-', style: robotoMedium.copyWith(color: Colors.black, fontSize: 16,fontWeight: FontWeight.w700),))),
                                  ),
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 2, right: 2, bottom: 2),
                                      child: Center(child: Text("${controller.stockcount??0}",
                                        // child: Center(child: Text("${controller?.stock??0}",
                                        // child: Center(child: Text("${controller?.productDetailsResponse?.data?[index]?.quantity??0}",
                                        style: poppins.copyWith(color: Colors.black, fontSize: 16 ),)),
                                      // child: Center(child: Text('${cart.productQty}')),
                                    ),),
                                  InkWell(
                                    onTap: (){
                                      if (controller.stock > 0) {
                                        // Only allow updating the quantity if there is stock available
                                        controller.addQuantity(true, index);
                                      }
                                      // controller.addQuantity(true, index);
                                    },
                                    child: Container(
                                      // height: 20,
                                        width: 30,
                                        child: Center(child: Text('+', style: robotoMedium.copyWith(color: Colors.black, fontSize: 16, ),))),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                ),*/
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: CustomButton(
                      height: 45,
                      width: Get.width,
                      buttoncolor: gold,
                      color: Colors.white,
                      buttontextcolor: Colors.white,
                      radius: 0,
                      fontSize: 13,
                      onPressed: () async {
                        String deviceID = await Get.find<AuthController>().getDeviceID();
                        String customerID = await Get.find<AuthController>().getUserId();
                        print(deviceID);
                        controller.AddtoCartFromWishlist(
                          client_corelation_id: deviceID,
                          product_id: controller.getWishlistResponse!.data![widget.productIndex]!.product!.id!.toString(),
                          color_variant_id: controller.getWishlistResponse!.data![widget.productIndex]!.product!.productColorVariants![controller.sectedColorVAriantIndex]!.id!.toString(),
                          customer_id: customerID,
                          discount: controller.getWishlistResponse!.data![widget.productIndex]!.product!.discount?.toString()??"0",
                          quantity: "1",
                          size: controller.sectedSize.toString(),
                          price: controller.getWishlistResponse!.data![widget.productIndex]!.product!.price!.toString(),
                          mrp_price: controller.getWishlistResponse!.data![widget.productIndex]!.product!.mrpPrice!.toString(),
                          final_price: controller.getWishlistResponse!.data![widget.productIndex]!.product!.discountedPrice!.toString(),
                          product_inventory_id: controller.getWishlistResponse!.data![widget.productIndex]!.product!.productColorVariants![controller.sectedColorVAriantIndex]!.productInventories![0].id.toString(),
                        );
                        Get.dialog( AddtoCartFromWishlistPopup(
                          // title: 'Product added to your shopping bag',
                          brand: controller.getWishlistResponse?.data?[widget.productIndex]?.product?.brand?.name??"",
                          producttitle: controller.getWishlistResponse?.data?[widget.productIndex]?.product?.name??"",
                          color: controller.getWishlistResponse?.data?[widget.productIndex]?.product?.productColorVariants?[controller.sectedColorVAriantIndex]?.color?.name??"",
                          // size: sectedSize.toString()??"",
                          size: controller.sectedSize.toString()??"",
                          /*qty: stockcount!.toString()??"",*/
                          qty: "1",
                          // qty: productDetailsResponse?.data?.productColorVariants?[sectedColorVAriantIndex]?.productInventories?[sectedColorVAriantIndex]?.stockQty.toString()??"",
                          discount: controller.getWishlistResponse?.data?[widget.productIndex]?.product?.discount??0,
                          price: controller.getWishlistResponse?.data?[widget.productIndex]?.product?.price??0,
                          discountedprice: controller.getWishlistResponse?.data?[widget.productIndex]?.product?.discountedPrice.toString()??"",
                          image: controller.getWishlistResponse?.data?[widget.productIndex]?.product?.productColorVariants?[controller.sectedColorVAriantIndex]?.frontPhoto??"",
                          // image: "/public/uploads/happy-people-celebrating-birthday-party-260nw-2283979947-lMnUFzuhK.webp",
                          season: controller.getWishlistResponse?.data?[widget.productIndex]?.product?.season?.name??"",
                          isError: false,
                          iconString: controller.getWishlistResponse?.data?[widget.productIndex]?.product?.name??"",
                          noBtntap: ()
                          {
                            Get.back();
                            // Get.to(BagPage());
                            Get.to(()=>Dashboard(pageIndex: 4));
                          },
                          yesBtntap: () {
                            Get.back();
                            Get.back();
                          },
                          noBtnText: "GO TO BAG",
                          yesBtnText: "CONTINUE SHOPPING",

                        )
                        );
                      },
                      buttonText: "Add to Bag".toUpperCase()),
                ),
                SizedBox(height:15),

               /* Padding(
                  padding: const EdgeInsets.only(left: 25, right: 8),
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Image.asset(Images.car, height: 16, width: 20, color: Colors.black,),
                            SizedBox(width: 8),
                            Text("Shipping From BD", style: poppins.copyWith( fontWeight: FontWeight.bold ,fontSize: 12, ),),
                          ]),
                      // SizedBox(height: 8),
                      Column(
                        children: [
                          controller.getWishlistResponse!.data![widget.productIndex]!.product!.productWarehouses!.length>0? controller.productDetailsResponse!.data!.productWarehouses![0]!.productWarehouseDeliveryTypes![0]!.deliveryType!.name!=null && controller.productDetailsResponse!.data!.productWarehouses![0]!.productWarehouseDeliveryTypes![0]!.deliveryType!.shortDescription!=null?
                          ListView.builder(
                            itemCount: controller.productDetailsResponse!.data!.productWarehouses![0].productWarehouseDeliveryTypes!.length??0,
                            shrinkWrap: true,
                            // reverse: false,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return
                                Padding(
                                  padding: const EdgeInsets.only(left: 15, right: 8, top: 3, bottom: 3),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 1),
                                        child: Text("${controller.productDetailsResponse!.data!.productWarehouses![0]!.productWarehouseDeliveryTypes![index]!.deliveryType!.name??""}: ".toUpperCase(), style: railwaybold.copyWith(fontSize: 11)),
                                      ),
                                      SizedBox(width: 4),
                                      Expanded(child: Text("${controller.productDetailsResponse!.data!.productWarehouses![0]!.productWarehouseDeliveryTypes![index]!.deliveryType!.shortDescription??""}", style: railway.copyWith(fontSize: 12),)),
                                    ],
                                  ),
                                );
                            },
                          )
                              :SizedBox() : SizedBox(),
                          SizedBox(height: 8),
                          controller.productDetailsResponse!.data!.productVendorWarehouses!.length>0? controller.productDetailsResponse!.data!.productVendorWarehouses![0]!.productVendorWarehouseDeliveryTypes![0]!.deliveryType!.name!=null && controller.productDetailsResponse!.data!.productVendorWarehouses![0]!.productVendorWarehouseDeliveryTypes![0]!.deliveryType!.shortDescription!=null?
                          ListView.builder(
                            itemCount: controller.productDetailsResponse!.data!.productVendorWarehouses![0].productVendorWarehouseDeliveryTypes!.length??0,
                            shrinkWrap: true,
                            // reverse: false,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return
                                Padding(
                                  padding: const EdgeInsets.only(left: 15, right: 8, top: 0, bottom: 6),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 1),
                                        child: Text("${controller.productDetailsResponse!.data!.productVendorWarehouses![0]!.productVendorWarehouseDeliveryTypes![index]!.deliveryType!.name??""}: ".toUpperCase(), style: railwaybold.copyWith(fontSize: 11)),
                                      ),
                                      SizedBox(width: 4),
                                      Expanded(child: Text("${controller.productDetailsResponse!.data!.productVendorWarehouses![0]!.productVendorWarehouseDeliveryTypes![index]!.deliveryType!.shortDescription??""}", style: railway.copyWith(fontSize: 12),)),
                                    ],
                                  ),
                                );
                            },
                          )
                              : SizedBox() :    SizedBox(),
                        ],
                      ),
                    ],
                  ),
                ),*/

                SizedBox(height: 50),
              ],
            ),
          );
        }
    );
  }
  bool IsSelectedSize(int index,WishlistController controller){
    if(controller.sectedSize!=null){
      String mainSize=controller.getWishlistResponse!.data![widget.productIndex]!.product!.productColorVariants?[controller.sectedColorVAriantIndex]?.productInventories?[index]?.size?.sizeCode??"";
      return controller.sectedSize==mainSize;
    }else{
      return false;
    }
  }
}















/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/product%20details/product_details_controller.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/constants.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/Custom%20Popup%20Messages/custom_popup.dart';
import 'package:isletestapp/view/base/custom_Image_cached.dart';
import 'package:isletestapp/view/base/custom_button.dart';
import 'package:isletestapp/view/screens/bag_page/bag_page.dart';
import 'package:isletestapp/view/screens/size_guide/size_guide_popup.dart';
import 'package:isletestapp/view/screens/wish_list/wish_list.dart';


class PopupSizeOrColor extends StatefulWidget {
  // final String sizedimage;
  final ProductDetailsController controller;
  const PopupSizeOrColor({Key? key, required this.controller,
    // required this.sizedimage,
  }) : super(key: key);
  @override
  State<PopupSizeOrColor> createState() => _PopupSizeOrColorState();
}

class _PopupSizeOrColorState extends State<PopupSizeOrColor> {

  int selectedIndex = -1;

  void toggleSelection(int index) {
    setState(() {
      if (selectedIndex == index) {
        // If the same item is clicked again, deselect it
        selectedIndex = -1;
      } else {
        selectedIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // You can customize the content of the bottom sheet here
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[

          SizedBox(height: 15),
          Container(
            // color: Colors.yellow,
            height: 42,
            child: ListTile(

              title:   Text.rich(
                  TextSpan(
                      text: 'Select Size/Color',
                      style: railway.copyWith(color: Colors.black ,fontSize: 20, fontWeight: FontWeight.w600),
                      children: <InlineSpan>[
                        TextSpan(
                          text: '',
                          style: railway.copyWith(fontSize: 11, height: 1.6, fontWeight: FontWeight.w500),
                        )
                      ]
                  )
              ),

              // title: Text('Select Size', style: railway.copyWith(fontSize: 20, fontWeight: FontWeight.w600),),
              trailing: InkWell(
                  onTap: (){
                    Get.back();
                  },
                  child: Text("Done".toUpperCase(), style: railway.copyWith(fontSize: 12, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),)),
              onTap: () {
                // Add functionality for sharing
                Navigator.pop(context);
              },
            ),
          ),
          SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                        TextSpan(
                            text: 'Colour: '.toUpperCase(),
                            style: railway.copyWith(color: Colors.grey.shade600 ,fontSize: 12, fontWeight: FontWeight.w600),
                            children: <InlineSpan>[
                              TextSpan(
                                text: 'White'.toUpperCase(),
                                style: railway.copyWith(fontSize: 12, color: Colors.black, fontWeight: FontWeight.w600),
                              )
                            ]
                        )
                    ),
                  ],
                ),
                SizedBox(height: 15),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            height: 140,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemCount: 3,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: GestureDetector(
                                    onTap: () {
                                      toggleSelection(index);
                                    },
                                    child: Container(
                                      height: 140,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: selectedIndex == index ? gold : Colors.transparent,
                                          width: 2,
                                        ),
                                      ),
                                      child: Image.network(
                                        "https://isle.vercel.app/_next/image?url=%2Fimages%2Fwishlist%2F216580908_gry_in.webp&w=640&q=75",
                                        height: 140,
                                        width: 100,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),

                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),

          SizedBox(height: 0),

          Container(
            // color: Colors.pinkAccent,
            height: 42,
            child: ListTile(
              title:   Text.rich(
                  TextSpan(
                      text: 'Size: '.toUpperCase(),
                      style: railway.copyWith(color: Colors.grey.shade600 ,fontSize: 12, fontWeight: FontWeight.w600),
                      children: <InlineSpan>[
                        TextSpan(
                          text: 'EU',
                          style: railway.copyWith(fontSize: 12, color: Colors.black, fontWeight: FontWeight.w600),
                        )
                      ]
                  )
              ),

              // title: Text('Select Size', style: railway.copyWith(fontSize: 20, fontWeight: FontWeight.w600),),
              trailing: InkWell(
                onTap: () {

                  widget.controller.productDetailsResponse!.data!.sizeGuide == null?   Get.dialog(CustomPopUp(title: 'no-data',))

                      : Get.to(
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) {
                          return FractionallySizedBox(
                            // heightFactor: 0.5,
                            child: PopupSizeGuide(
                                sizedimage:  '${widget.controller.productDetailsResponse!.data!.sizeGuide!}'
                              // sizedimage: controller.productDetailsResponse!.data!.sizeGuide??"",
                            ),
                          );
                        },
                      ),
                      fullscreenDialog: true
                  );
                },
                  child: Text("Size Guide".toUpperCase(), style: railway.copyWith(fontSize: 12, color: gold, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),),
              ),
              onTap: () {
                // Add functionality for sharing
                Navigator.pop(context);
              },
            ),
          ),
          SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                return Container(
                  // color: Colors.pinkAccent,
                  height: 50,
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: widget.controller.productDetailsResponse!.data!.productColorVariants![index].productInventories!.length,
                          // itemCount: sizelist.length,
                          itemBuilder: (BuildContext context, int index2) {
                            return Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8, right: 8),
                                  child: Container(
                                    width: 50,
                                    height: 42,
                                    margin: EdgeInsets.all(0),
                                    padding: EdgeInsets.all(0),
                                    child: Center(
                                        child: Text(
                                          '${widget.controller.productDetailsResponse!.data!.productColorVariants![index].productInventories![index2].size!.sizeCode??""}',
                                          style: robotoMedium.copyWith(fontSize: 11),
                                        )),
                                    decoration: BoxDecoration(
                                      // color: Colors.yellow[100],
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 0.4,
                                        )),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
                }
            )
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: CustomButton(
                height: 45,
                width: Get.width,
                buttoncolor: gold,
                color: Colors.white,
                buttontextcolor: Colors.white,
                radius: 0,
                fontSize: 12,
                onPressed: () {
                  Get.to(BagPage());
                },
                buttonText: "Add to Bag".toUpperCase()),
          ),
          SizedBox(height:15),

          Padding(
            padding: const EdgeInsets.only(left: 25, right: 8),
            child: Row(
              children: [
                Image.asset(Images.car2, color: Colors.black, height: 25, width: 25,),
                SizedBox(width: 15),
                Text.rich(
                    TextSpan(
                        text: 'Shipping from UAE. ',
                        style: railway.copyWith(color: Colors.black ,fontSize: 11, fontWeight: FontWeight.w600),
                        children: <InlineSpan>[
                          TextSpan(
                            text: '2- hour and same-day delivery to ',
                            style: railway.copyWith(fontSize: 11, fontWeight: FontWeight.w500),
                          ),
                          TextSpan(
                            text: 'BD.',
                            style: railway.copyWith(fontSize: 11, color: gold, decoration: TextDecoration.underline, fontWeight: FontWeight.w500),
                          )
                        ]
                    )
                )
              ],
            ),
          ),

          SizedBox(height: 50),
        ],
      ),
    );
  }
}
*/
