import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/auth_controller.dart';
import 'package:isletestapp/controller/cart/cart_controller.dart';
import 'package:isletestapp/controller/product%20details/product_details_controller.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/custom_button.dart';
import 'package:isletestapp/view/base/custom_snackbar.dart';
import 'package:isletestapp/view/screens/all_popup/add_to_cart_popup.dart';
import 'package:isletestapp/view/screens/all_popup/size_guide_popup.dart';
import 'package:isletestapp/view/screens/dashboard/dashboard.dart';

import 'custom popup messages/custom_popup.dart';

class ShopTheLookPopupSizeOrColor extends StatefulWidget {
   final int productIndex;
  const ShopTheLookPopupSizeOrColor({Key? key, required this.productIndex,
  }) : super(key: key);
  @override
  State<ShopTheLookPopupSizeOrColor> createState() => _ShopTheLookPopupSizeOrColorState();
}

class _ShopTheLookPopupSizeOrColorState extends State<ShopTheLookPopupSizeOrColor> {
  int stockValue = 1;
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
    return GetBuilder<ProductDetailsController>(
        builder: (controller) {
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
                                  style: railway.copyWith( letterSpacing: 1 ,color: Colors.grey.shade600 ,fontSize: 12, fontWeight: FontWeight.w600),
                                  children: <InlineSpan>[
                                    TextSpan(
                                      text: '${controller.shopTheLookResponse?.data?[widget.productIndex]!.productColorVariants?[controller.sectedColorVAriantIndex]?.color?.colorName??""}'.toUpperCase(),
                                      style: railway.copyWith( letterSpacing: 1,fontSize: 12, color: Colors.black, fontWeight: FontWeight.w600),
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
                                    itemCount: controller.shopTheLookResponse!.data![widget.productIndex]!.productColorVariants?.length ?? 0,
                                    itemBuilder: (BuildContext context, int index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(right: 8),
                                        child: GestureDetector(
                                          onTap: () {
                                            toggleSelection(index);
                                            controller.sectedColorVAriantIndex = index;
                                            Get.find<ProductDetailsController>().update();
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
                                              "${AppConstants.BASE_URL}${controller.shopTheLookResponse!.data![widget.productIndex]!.productColorVariants?[index].profilePhoto ?? ""}",
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
                            controller.shopTheLookResponse!.data![widget.productIndex]!.sizeGuide == null?   Get.dialog(CustomPopUp(title: 'no-data',))
                                : Get.to(
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return FractionallySizedBox(
                                      // heightFactor: 0.5,
                                      child: PopupSizeGuide(
                                          sizedimage:  '${controller.shopTheLookResponse!.data![widget.productIndex]!.sizeGuide??""}'
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
                              itemCount: controller.shopTheLookResponse!.data![widget.productIndex]!.productColorVariants![controller.sectedColorVAriantIndex].productInventories!.length,
                              // itemCount: sizelist.length,
                              itemBuilder: (BuildContext context, int index2) {
                                return InkWell(
                                  onTap: () async{
                                    print("Check button click");
                                    await controller.getAvailableStockData(controller.shopTheLookResponse!.data![widget.productIndex]!.productColorVariants![controller.sectedColorVAriantIndex].productInventories?[index2].id??0);
                                    print("Check button clickkkkkkkkkkkk");
                                    int stock = controller.stockResponse?.data?.stockQty??0;
                                    int pendingStock = int.parse(controller.stockResponse?.data?.pendingDeliveryQty??"0");
                                    if (stock > pendingStock){
                                      controller.sectedSizeInventoryId=controller.shopTheLookResponse!.data![widget.productIndex]!.productColorVariants![controller.sectedColorVAriantIndex].productInventories?[index2].id;
                                      controller.sectedSize=controller.shopTheLookResponse!.data![widget.productIndex]!.productColorVariants![controller.sectedColorVAriantIndex].productInventories?[index2].size?.sizeCode??"";
                                      controller.stock= controller.shopTheLookResponse!.data![widget.productIndex]!.productColorVariants![controller.sectedColorVAriantIndex].productInventories?[index2]?.stockQty??0;
                                      controller.update();
                                      stockValue=1;
                                    } else {
                                      showCustomSnackBar("Stock out", duration: 1);
                                    }
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
                                            '${controller.shopTheLookResponse!.data![widget.productIndex]!.productColorVariants![controller.sectedColorVAriantIndex].productInventories![index2].size!.sizeCode??""}',
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
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      controller.stock<6?
                      Image.asset(Images.clock, height: 15, width: 15, color: red,): SizedBox(),
                      SizedBox(width: 5),
                      int.parse(controller.stockResponse?.data?.pendingDeliveryQty??"0")>6?
                      Text("Stock Out", style: railway.copyWith(color: Colors.red),)
                          :
                      Text("${controller.stock<6?"Low in stock: only ${controller.stock} is left":""}",
                        style: railway.copyWith(color: Colors.red),),
                    ],
                  ),
                ),
                SizedBox(height: 20),
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
                                    onTap: () async {
                                      int stock = await controller.stockResponse?.data?.stockQty ?? 0;
                                      int pendingStock = await  int.parse(controller.stockResponse?.data?.pendingDeliveryQty ?? "0");
                                      // Decrement stock, but don't allow it to go below 1
                                      if (stockValue > 1) {
                                        setState(() {
                                          stockValue--;
                                          print("Stock decremented: $stockValue");
                                        });
                                      } else {
                                        showCustomSnackBar("Quantity cannot be less than 1",  isError: true, isPosition: false, duration: 4);

                                      }
                                    },
                                    child: Container(
                                        width: 30,
                                        child: Center(child: Text('-', style: robotoMedium.copyWith(color: Colors.black, fontSize: 16,fontWeight: FontWeight.w700),))),
                                  ),
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 2, right: 2, bottom: 2),
                                      child: Center(
                                        child: Text(
                                          "${stockValue}", // Assuming stockValue is the variable you want to display
                                          style: poppins.copyWith(color: Colors.black, fontSize: 16),
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () async{
                                      // int pendingStock = await int.parse(controller.stockResponse?.data?.pendingDeliveryQty ?? "0");
                                      // // int stock =  controller.stockResponse?.data?.stockQty ?? 0;
                                      // // int mypendingStock = int.parse(controller.myPendingStock);
                                      // int stock =  controller.stockResponse?.data?.stockQty ?? 0;

                                      // print("Pending Stock st == ${pendingStock}");
                                      print("My Stock == ${controller.myStock}");
                                      print("My Pending Stock == ${controller.myPendingStock}");
                                      if (controller.condition) {
                                        if(controller.myStock>stockValue){
                                          setState(() {
                                            stockValue++;
                                            print("Stock incremented: $stockValue");
                                          });
                                        } else {
                                          showCustomSnackBar("Cannot increase quantity beyond stock quantity",  isError: true, isPosition: false, duration: 4);
                                        }
                                      } else {
                                        showCustomSnackBar("Stock out",  isError: true, isPosition: false, duration: 4);
                                        // print("Stock cannot be incremented further.");
                                      }
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
                ),
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
                      fontSize: 12,
                      myfontweight: FontWeight.bold,
                      onPressed: () async {
                        String deviceID = await Get.find<AuthController>().getDeviceID();
                        String customerID = await Get.find<AuthController>().getUserId()??"";
                        int myCalprice = priceCal(controller.shopTheLookResponse?.data?[widget.productIndex].price??0);
                        double myCalfinalprice = finalpriceCal(controller.shopTheLookResponse?.data?[widget.productIndex].discountedPrice?.toDouble()??0);
                        print(deviceID);
                        print("my Calllll ${myCalprice}");
                        if (controller.sectedSize!=null){
                          // if (controller.sectedSize!=null){
                          controller.AddtoCart(
                              client_corelation_id: deviceID,
                              product_id: controller.shopTheLookResponse!.data![widget.productIndex]!.id!.toString(),
                              customer_id: customerID??"",
                              color_variant_id: controller.shopTheLookResponse!.data![widget.productIndex]!.productColorVariants![controller.sectedColorVAriantIndex]!.id!.toString(),
                              discount: controller.shopTheLookResponse!.data![widget.productIndex]!.discount?.toString()??"0",
                              /// previous  /*  quantity: controller.stockcount!.toString(),*/
                              quantity: "$stockValue",
                              size: controller.sectedSize.toString(),
                              price: controller.shopTheLookResponse!.data![widget.productIndex]!.price!.toString(),
                              mrp_price: controller.shopTheLookResponse!.data![widget.productIndex]!.mrpPrice!.toString(),
                              final_price: controller.shopTheLookResponse!.data![widget.productIndex]!.discountedPrice!.toString(),
                              product_inventory_id: controller.shopTheLookResponse!.data![widget.productIndex]!.productColorVariants![controller.sectedColorVAriantIndex]!.productInventories![0].id.toString(),
                          ).whenComplete(() {
                            Get.find<CartController>().getTotal(isPop: false, fromCheckout: false);
                            Get.find<CartController>().getCartPageData(isPop: false);
                            Get.dialog( AddtoCartPopup(
                              // title: 'Product added to your shopping bag',
                              brand: controller.shopTheLookResponse?.data?[widget.productIndex].brand?.brandName??"",
                              producttitle: controller.shopTheLookResponse?.data?[widget.productIndex].name??"",
                              color: controller.shopTheLookResponse?.data?[widget.productIndex].productColorVariants?[controller.sectedColorVAriantIndex]?.color?.colorName??"",
                              size: controller.sectedSize.toString()??"",
                              /*    qty: stockcount!.toString()??"",*/
                              qty: "${stockValue}",
                              // qty: productDetailsResponse?.data?.productColorVariants?[sectedColorVAriantIndex]?.productInventories?[sectedColorVAriantIndex]?.stockQty.toString()??"",
                              discount: controller.shopTheLookResponse?.data?[widget.productIndex].discount?.toString()??"0",
                              price: myCalprice,
                              // price: controller.productDetailsResponse!.data!.price!.toString(),
                              // finalprice: controller.productDetailsResponse!.data!.discountedPrice!.toString(),
                              finalprice: myCalfinalprice,
                              image: controller.shopTheLookResponse?.data?[widget.productIndex].productColorVariants?[controller.sectedColorVAriantIndex]?.profilePhoto??"",
                              season: controller.shopTheLookResponse?.data?[widget.productIndex].season?.seasonName??"",
                              isError: false,
                              iconString: controller.shopTheLookResponse?.data?[widget.productIndex].name??"",
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

                            ));
                          } );
                        }
                        else {
                          showCustomSnackBar("Please select a size");
                        }
                        // }
                        // else {
                        //   showCustomSnackBar("Please Update Quantity");
                        // }
                      },
                      buttonText: "Add to Bag".toUpperCase()),
                ),
                SizedBox(height:25),
              ],
            ),
          );
        }
    );
  }
  bool IsSelectedSize(int index,ProductDetailsController controller){
    if(controller.sectedSize!=null){
      String mainSize=controller.shopTheLookResponse!.data![widget.productIndex]!.productColorVariants?[controller.sectedColorVAriantIndex]?.productInventories?[index]?.size?.sizeCode??"";
      return controller.sectedSize==mainSize;
    }else{
      return false;
    }
  }

  int priceCal( int price) {
    return price*stockValue;
  }
  double finalpriceCal( double finalprice) {
    return finalprice*stockValue;
  }


}

