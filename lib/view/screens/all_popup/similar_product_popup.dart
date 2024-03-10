import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/auth_controller.dart';
import 'package:isletestapp/controller/product%20details/product_details_controller.dart';
import 'package:isletestapp/controller/product/product_controller.dart';
import 'package:isletestapp/controller/wishlist/wishlist_controller.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/custom_Image_cached.dart';
import 'package:isletestapp/view/screens/product%20details/product_details_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SimilarPopup extends StatefulWidget {
  final int id;
  SimilarPopup({
    Key? key, required this.id,
  }) : super(key: key);
  @override
  State<SimilarPopup> createState() => _SimilarPopupState();
}
class _SimilarPopupState extends State<SimilarPopup> {
  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<ProductListController>().getChildCategoryProductData(childCategoryId: widget.id.toString());
    }
    );

  }
  @override
  void dispose() {
    Get.find<ProductListController>().dataClear();
    super.dispose();
  }
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductListController>(
        builder: (controller) {
          return Container(
            // You can customize the content of the bottom sheet here
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    title: Text('Similar products', style: railway.copyWith(fontSize: 15, fontWeight: FontWeight.bold),),
                    trailing: InkWell(
                        onTap: (){
                          Get.back();
                        },
                        child: Text("Close", style: railway.copyWith(fontSize: 12, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),)),
                    onTap: () {
                      // Add functionality for sharing
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(height: 0),
                  Container(
                    // color: Colors.red,
                    height: Get.height/2.3,
                    // width: Get.width,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0, right: 0),
                      child:
                      controller.childCategoryList!.length>0?
                      ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.childCategoryList.length??0,
                        itemBuilder:  (BuildContext context, int index) {
                          bool isWished=Get.find<WishlistController>().getCheckWishlisted(controller.childCategoryList?[index]?.id?.toString()??"");
                          return Container(
                            // color: Colors.deepPurpleAccent,
                            // color: const Color(0xffFAFBFB),
                            child: InkWell(
                              onTap: () {
                                Get.to(ProductDetailsPage(productId: controller.childCategoryList[index].id!.toString(),
                                ));
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 2, right: 2),
                                    child: SizedBox(
                                      height: Get.height / 3.5,
                                      width: Get.width/2.5,
                                      // width: Get.width/2.5,
                                      child: Stack(
                                        alignment: Alignment.topCenter,
                                        children: [
                                          Container(
                                            // color: Colors.red,
                                            height: Get.height / 3.5,
                                            width: Get.width/2.5,
                                            child: CustomImageCached(
                                              image: "${AppConstants.BASE_URL}${controller.childCategoryList[index]!.productColorVariants![controller.sectedColorVAriantIndex]!.frontPhoto??""}",
                                              fit: BoxFit.fill,
                                              isRound: false,
                                            ),
                                          ),

                      /*                    Positioned(
                                            bottom: 20,
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: [
                                                for (int i = 0; i < currentIndex; i++)
                                                  TabPageSelectorIndicator(
                                                    backgroundColor: i == currentIndex ? silvercolor : gold,
                                                    borderColor: i == currentIndex ? silvercolor : gold,
                                                    size: 7,
                                                  ),
                                              ],
                                            ),
                                          ),*/
                                          Positioned(
                                            bottom: 0,
                                            child: Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Container(
                                                color: Colors.grey.shade300,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left: 12, right: 12, top: 3, bottom: 3),
                                                  child: controller.childCategoryList[index].season != null ?
                                                  Text((controller.childCategoryList[index].season!.seasonName ?? "").toUpperCase(),
                                                    style: poppins.copyWith(color: Colors.black, fontSize: 9),
                                                  )
                                                      : const SizedBox(),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: 10,
                                            right: 10,
                                            child: InkWell(
                                              onTap: () async {
                                                try {
                                                  var deviceID = await Get.find<AuthController>().getDeviceID();
                                                  var customerId = Get.find<AuthController>().isLoggedIn()?await Get.find<AuthController>().getUserId():null;
                                                  await Get.find<WishlistController>().AddtoWishlist(
                                                    product_id: controller.childCategoryList?[index]?.id?.toString()??"",
                                                    customer_id: customerId,
                                                    corelation_id: deviceID,
                                                  );
                                                  setState(() {
                                                    // Set your 'isHeartRed' variable or similar to control the button color
                                                    isWished = !isWished; // Assuming 'isHeartRed' controls the heart color
                                                  });
                                                } catch (e) {
                                                  // Handle any errors that might occur during the asynchronous operation
                                                  print("Error: $e");
                                                }
                                              },
                                              child: Container(
                                                // color: Colors.black,
                                                height: 30,
                                                width: 30,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(5),
                                                  child: isWished? Image.asset(Images.unwished, height: 20, color: gold,
                                                  )
                                                      : Image.asset(Images.wish, height: 20, color: silvercolor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 25),
                                    child: Text((controller.childCategoryList[index].brand?.brandName ?? "").toUpperCase(),
                                      maxLines: 1,
                                      style: railway.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8),
                                    child: Container(
                                      width: Get.width/2.5,
                                      child: Text(
                                        controller.childCategoryList[index].name ?? "",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: poppins.copyWith(
                                            fontWeight: FontWeight.w200,
                                            fontSize: 12
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5),

                                  /// main
                                  controller.childCategoryList[index].discount == null || controller.childCategoryList[index].discount == 0 ?
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 4),
                                    child: Text(
                                      "${controller.childCategoryList[index].price} BDT",
                                      style: poppins.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: gold,
                                          fontSize: 12
                                      ),
                                    ),
                                  )
                                      :
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 4),
                                    child: Column(
                                      children: [
                                        Text(
                                          "${controller.childCategoryList[index].discountedPrice} BDT",
                                          style: poppins.copyWith(
                                              fontWeight: FontWeight.w600,
                                              color: gold,
                                              fontSize: 12
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          "${controller.childCategoryList[index].price} BDT",
                                          style: poppins.copyWith(
                                              fontWeight: FontWeight.w600,
                                              decoration: TextDecoration.lineThrough,
                                              color: Colors.red,
                                              fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      )
                          :SizedBox(),
                    ),
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
          );
        }
    );
  }

}
