import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/auth_controller.dart';
import 'package:isletestapp/controller/product%20details/product_details_controller.dart';
import 'package:isletestapp/controller/wishlist/wishlist_controller.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/auth/login-register.dart';
import 'package:isletestapp/view/base/custom_Image_cached.dart';
import 'package:isletestapp/view/base/custom_button.dart';
import 'package:isletestapp/view/base/custom_snackbar.dart';
import 'package:isletestapp/view/screens/all_popup/info_popup.dart';
import 'package:isletestapp/view/screens/all_popup/product_review_popup.dart';
import 'package:isletestapp/view/screens/all_popup/zoom_image_popup.dart';
import 'package:isletestapp/view/screens/custom%20logo/custom_logo_widget.dart';
import 'package:isletestapp/view/screens/product%20details/product_details_shimmer.dart';
import 'package:isletestapp/view/screens/product%20page/product_page.dart';
import 'package:isletestapp/view/screens/search/search_screen.dart';
import 'package:isletestapp/view/screens/shop%20the%20look/shop_the_look.dart';
import 'package:isletestapp/view/screens/all_popup/add-to_cart_bottomsheet.dart';
import 'package:isletestapp/view/screens/universal_bottom_nav/universal_bottom_nav.dart';
import 'package:isletestapp/view/screens/all_popup/similar_product_popup.dart';
import 'package:isletestapp/view/screens/wish_list/custom_wish_item_count_widget.dart';
import 'package:isletestapp/view/screens/wish_list/wish_list.dart';
import 'package:share_plus/share_plus.dart';

class ProductDetailsPage extends StatefulWidget {
  final String productId;
  List<int>? childCategorieId;
  final List<int>? page;
  final String? pageId;
  final String? brandId;
  final String? cartdetailsimage;
  ProductDetailsPage({Key? key, this.childCategorieId, this.cartdetailsimage, required this.productId, this.pageId, this.brandId, this.page}) : super(key: key);
  bool isExpanded1=false;
  bool isExpanded2=false;
  bool isExpanded3=false;
  bool isExpanded4=false;
  bool isExpanded5=false;
  bool isExpandedSize=false;

  @override
  State<ProductDetailsPage> createState() => _IsleHomeScreenState();
}

class _IsleHomeScreenState extends State<ProductDetailsPage> {
  int clickCount = 0;

  TextEditingController searchCtr = TextEditingController();
  bool isSearchClick=false;
  TextEditingController subscribeCtr = TextEditingController();
  FocusNode subscribeFcs = FocusNode();
  bool indicatorcolor= true;

  @override
  void initState() {
    // TODO: implement initState

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Get.find<ProductDetailsController>().getGeneralSettingData();
      Get.find<ProductDetailsController>().getProductDetailsData(widget.productId);
      Get.find<ProductDetailsController>().dataInitialize();
      Get.find<ProductDetailsController>().getMoreFromBrandsData(widget.productId, widget.pageId!, widget.brandId!);
      Get.find<ProductDetailsController>().getGenderPageData();
      // Get.find<ProductDetailsController>().getYouMayAlsoLike(widget.productId, '1', widget.pageId!, widget.brandId!);
      ///r
      //  Get.find<ProductDetailsController>().getYouMayAlsoLike();
      // Get.find<ProductDetailsController>().getYouMayAlsoLike(id: '40', childCat: [1, 2], page: [1, 3], brand: '20');
      Get.find<ProductDetailsController>().getYouMayAlsoLike(id: widget.productId, childCat: widget.childCategorieId ?? [], page: widget.page ?? [], brand: widget.brandId ?? '');
      log('Child Category Id: ${widget.childCategorieId}');
      print("Product id: ${widget.productId}");
      print("Page id: ${widget.pageId}");
      print("Brand id: ${widget.brandId}");
      print("Customer id: ${Get.find<AuthController>().getUserId()}");
      print("Guest id: ${Get.find<AuthController>().getUserIdGuest()}");
      print("Debuggggggggggggggg");
      // print(Get.find<ProductDetailsController>().moreBrandDetailsPageResponse!.data!.length);
      // print("AAAAA");
      // print(Get.find<ProductDetailsController>().productDetailsResponse!.data!.productWarehouses!.length);
      //     print("BBBB");
    }
    );
    super.initState();
/*    retrieveButtonState(); // Retrieve the stored state of the button when the page loads
    // Load the stored wish statuses when the page loads
    retrieveWishStatus();*/
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Get.find<ProductDetailsController>().dataClear();
  }
  int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsController>(
        builder: (controller) {
          bool isWished = Get.find<WishlistController>().getCheckWishlisted(controller.productDetailsResponse?.data?.id?.toString()??"");
          bool isFollow = Get.find<WishlistController>().getCheckBranded(controller.productDetailsResponse?.data?.brandId?.toString() ?? "");
          print({"start api call${isFollow}"});
          print({"start api call${isWished}"});
          print({"start api call${controller.productDetailsResponse?.data?.id?.toString() ?? ""}"});
          print({"start api call${controller.productDetailsResponse?.data?.brandId?.toString() ?? ""}"});
          List<String> productImage=[];
          String? pic1=controller.productDetailsResponse?.data?.productColorVariants?[controller.sectedColorVAriantIndex]?.frontPhoto;
          String? pic2=controller.productDetailsResponse?.data?.productColorVariants?[controller.sectedColorVAriantIndex]?.backsidePhoto;
          String? pic3=controller.productDetailsResponse?.data?.productColorVariants?[controller.sectedColorVAriantIndex]?.outfitPhoto;
          String? pic4=controller.productDetailsResponse?.data?.productColorVariants?[controller.sectedColorVAriantIndex]?.profilePhoto;
          String? pic5=controller.productDetailsResponse?.data?.productColorVariants?[controller.sectedColorVAriantIndex]?.details1Photo;
          String? pic6=controller.productDetailsResponse?.data?.productColorVariants?[controller.sectedColorVAriantIndex]?.details2Photo;

          if(pic1!=null){
            productImage.add(pic1!);
          }
          if(pic2!=null){
            productImage.add(pic2!);
          }
          if(pic3!=null){
            productImage.add(pic3!);
          }
          if(pic4!=null){
            productImage.add(pic4!);
          }
          if(pic5!=null){
            productImage.add(pic5!);
          }
          if(pic6!=null){
            productImage.add(pic6!);
          }
          return Scaffold(
            bottomNavigationBar: const UniversalBottomNav(),
            backgroundColor: const Color(0xffFAFBFB),
            // drawer: IsleDrawer(),
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
            body: SingleChildScrollView(
              child:
              controller.productDetailsResponse!=null?
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // color: Colors.red,
                    color: const Color(0xffFBFBFB),
                    height: Get.height/2.2,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Container(
                          child: CarouselSlider(
                            // options: CarouselOptions(height: 400.0),
                            items: productImage.map((i) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return GestureDetector(
                                    onTap: (){
                                      Get.dialog(
                                          // barrierDismissible: false,
                                          ZoomCarusalPopUp(clickImage: "${AppConstants.BASE_URL}$i"));
                                    },
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        // color: Theme.of(context).cardColor,
                                        color: Color(0xffFBFBFB),
                                        // color: Colors.tealAccent,
                                      ),
                                      child: ClipRRect(
                                          child: CustomImageCached(
                                            image: '${AppConstants.BASE_URL}$i',
                                            // image: widget.cartdetailsimage,
                                            fit: BoxFit.contain,
                                          )
                                      ),
                                    ),
                                  );
                                },
                              );
                            }).toList(),
                            options: CarouselOptions(
                              autoPlay: true,
                              disableCenter: true,
                              viewportFraction: 1,
                              autoPlayInterval: const Duration(seconds: 7),
                              height: Get.height/2.4,
                              scrollDirection: Axis.horizontal,
                              onPageChanged: (carouselIndex, reason) {
                                setState((){
                                  currentIndex=carouselIndex;
                                });
                              },
                            ),
                          ),
                        ),
                        Positioned(
                          top: 20,
                          right: 10,
                          child:  GestureDetector(
                            onTap: () async{
                              print( "Share Product Link is ==> ${AppConstants.SHARE_PRODUCT_LINK_URL}${controller.productDetailsResponse?.data?.id}");
                              await Share.share(
                                  "${AppConstants.SHARE_PRODUCT_LINK_URL}${controller.productDetailsResponse?.data?.id}"
                              );
                            },
                            child: Icon(Icons.share, color: gold,

                            ),
                          ),),
                        Positioned(
                          bottom: 3,
                          // left: 15,
                          child:  Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                /// orginal color
                                // color: Color(0xffF2F2F2),
                                color: Colors.grey.shade300,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 12, right: 12, top: 3, bottom: 3),
                                  child: controller.productDetailsResponse!.data!.season!=null? Text((controller.productDetailsResponse!.data!.season!.seasonName??"").toUpperCase(),
                                    style: robotoRegular.copyWith(color: Colors.black, fontSize: 9),): const SizedBox(),
                                ),
                              ),
                            ],
                          ),),
                        Positioned(
                          bottom: 20,
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            children: [
                              for (int i = 0; i < productImage.length; i++)
                                TabPageSelectorIndicator(
                                  backgroundColor: i == currentIndex ? gold : silvercolor,
                                  borderColor: i == currentIndex ? gold : silvercolor,
                                  size: 7,
                                ),
                            ],
                          ),
                        ),

                        Positioned(
                          bottom: 5,
                          right: 10,
                          child:  Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () async {
                                  try {
                                    var deviceID = await Get.find<AuthController>().getDeviceID();
                                    var customerId = Get.find<AuthController>().isLoggedIn()?await Get.find<AuthController>().getUserId():null;
                                    await Get.find<WishlistController>().AddtoWishlist(
                                      product_id: controller.productDetailsResponse!.data!.id!.toString(),
                                      customer_id: customerId,
                                      corelation_id: deviceID,
                                    );
                                    setState(() {
                                      isWished = !isWished;
                                    });
                                  } catch (e) {
                                    print("Error: $e");
                                  }
                                },
                                child: CircleAvatar(
                                  radius: 24,
                                  // backgroundColor: Colors.grey.shade100,
                                  backgroundColor: Colors.grey.shade100,
                                  child: isWished ? Image.asset(Images.unwished, height: 26, color: gold , // Change color based on 'isHeartRed' variable
                                  )
                                      :  Image.asset(Images.wish, height: 26, color: silvercolor, // Change color based on 'isHeartRed' variable
                                  ),
                                ),
                              )
                            ],
                          ),)
                      ],
                    ),
                  ),

                  SizedBox(
                    width: Get.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 4),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text((controller.productDetailsResponse?.data?.brand?.brandName??"").toUpperCase(),
                              style: railway.copyWith( height: 1.5, fontSize: 20, fontWeight: FontWeight.w700),),
                          ),
                          const SizedBox(height: 4),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(controller.productDetailsResponse!.data!.name??"",
                              style: railway.copyWith( height: 1.5, fontSize: 16, fontWeight: FontWeight.w700),),
                          ),
                          const SizedBox(height: 8),


                          controller.productDetailsResponse?.data?.discount == null || controller.productDetailsResponse?.data?.discount == 0   ?
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${controller.productDetailsResponse!.data!.price!.toStringAsFixed(0)} BDT",
                                  style: poppins.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: gold,
                                      fontSize: 15
                                  ),
                                ),
                                const SizedBox(width: 2),
                                Text(
                                  "(+ VAT)",
                                  style: poppins.copyWith(
                                      fontWeight: FontWeight.w200,
                                      color: silvercolor,
                                      fontSize: 11
                                  ),
                                ),
                              ],
                            ),
                          )
                              :
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Row(  mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${controller.productDetailsResponse!.data!.price!.toStringAsFixed(0)} BDT",
                                  style: poppins.copyWith(
                                      decoration: TextDecoration.lineThrough,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.red,
                                      fontSize: 15
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "${controller.productDetailsResponse!.data!.discountedPrice!.toStringAsFixed(0)} BDT",
                                  style: poppins.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: gold,
                                      fontSize: 15),
                                ),
                                const SizedBox(width: 2),
                                Text(
                                  "(10% off) (+ VAT)",
                                  style: poppins.copyWith(
                                      fontWeight: FontWeight.w200,
                                      color: silvercolor,
                                      fontSize: 11),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 8),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Image.asset(Images.info, height: 16, width: 20, color: Colors.black,),
                              const SizedBox(width: 5),
                              Text(" Earn", style: poppins.copyWith(fontSize: 11, ),),
                              const SizedBox(width: 2),
                              // Your Widget code using getPriceText function:
                              controller.productDetailsResponse?.data?.discount == null ||
                                  controller.productDetailsResponse?.data?.discount == 0
                                  ? Text(
                                islepoint(double.parse(controller.productDetailsResponse!.data!.price!.toString())),
                                style: poppins.copyWith(fontSize: 12, fontWeight: FontWeight.bold),
                              )
                                  : Text(
                                islepoint(controller.productDetailsResponse!.data!.discountedPrice!),
                                style: poppins.copyWith(fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 2),
                              Text(" Points", style: poppins.copyWith(fontSize: 11, )),
                              const SizedBox(width: 2),
                            ],
                          ),

                          const SizedBox(height: 12),
                          Padding(
                            padding: const EdgeInsets.only(left: 0,right: 0,top: 5,bottom: 5),
                            child: Container(
                              width: Get.width,
                              decoration: BoxDecoration(
                                // color: Colors.deepPurple,
                                  borderRadius: BorderRadius.circular(0),
                                  border: Border.all(color: Colors.grey)),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, left: 8, right: 8,bottom: 10),
                                child: Column(
                                  children: [
                                    Row(  crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [

                                              Container(
                                                alignment: Alignment.center,
                                                // color: Colors.yellow,
                                                // height: 60,
                                                width: 100,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left: 8, bottom: 6,top: 6),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.only(left: 0),
                                                        child: Text(
                                                          "Color".toUpperCase(),
                                                          style: robotoMedium.copyWith(
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w600,
                                                            color: Colors.black54,
                                                          ),
                                                        ),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Expanded(child: Text('${controller.productDetailsResponse?.data?.productColorVariants?[controller.sectedColorVAriantIndex]?.color?.colorName??""}')),
                                                          Icon(Icons.arrow_drop_down_sharp,
                                                            color: Colors.black54,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        // Add a Divider here
                                        Container(
                                          color: Colors.black,
                                          width: 0.5,
                                          height: 60,
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    context: context,
                                                    builder: (BuildContext context) {
                                                      return  const PopupSizeOrColor( );
                                                    },
                                                  );
                                                  // fullscreenDialog: true
                                                },
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  // color: Colors.yellow,
                                                  // height: 60,
                                                  width: 100,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 8, bottom: 6,top: 6),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 0),
                                                          child: Text(
                                                            "Size".toUpperCase(),
                                                            style: robotoMedium.copyWith(
                                                              fontSize: 14,
                                                              fontWeight: FontWeight.w600,
                                                              color: Colors.black54,
                                                            ),
                                                          ),
                                                        ),
                                                        Row(
                                                          children: [
                                                            controller.sectedSize == null?
                                                            Text("Select") :
                                                            Expanded(child: Text(controller.sectedSize.toString()??"",)),
                                                            Icon(Icons.arrow_drop_down_sharp,
                                                              color: Colors.black54,
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 12),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Image.asset(Images.car, height: 16, width: 20, color: Colors.black,),
                                const SizedBox(width: 8),
                                Text("Shipping From BD", style: poppins.copyWith( fontWeight: FontWeight.bold ,fontSize: 12, ),),
                              ]),
                          const SizedBox(height: 8),

                          /// trying
                    /*      controller.productDetailsResponse!.data!.productWarehouses!.length>0? controller.productDetailsResponse!.data!.productVendorWarehouses!.length>0? controller.productDetailsResponse!.data!.productWarehouses![0]!.productWarehouseDeliveryTypes![0]!.deliveryType!.name!=null && controller.productDetailsResponse!.data!.productWarehouses![0]!.productWarehouseDeliveryTypes![0]!.deliveryType!.shortDescription!=null?
                          ListView.builder(
                              itemCount: controller.vendorWiseData!.length,
                              shrinkWrap: true,
                              // scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return ListView.builder(
                                    itemCount: controller.vendorWiseData[index].deliveryType.length,
                                    shrinkWrap: true,
                                    // scrollDirection: Axis.horizontal,
                                    physics: BouncingScrollPhysics(),
                                    itemBuilder: (BuildContext context, int index2) {
                                      return
                                      Container(
                                        width: Get.width/2.5,
                                        child: Card(
                                          elevation: 0.5,
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                    flex: 2,
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text("${controller.vendorWiseData[index].deliveryType[index2].name}".toUpperCase(), style: railwaybold.copyWith(fontSize: 9),),
                                                          // SizedBox(height: 0),
                                                          // // Text("${controller.vendorWiseData[index].deliveryType[index2].availableOutsideCity}", style: poppins.copyWith(fontSize: 9),),
                                                          // Text("${controller.vendorWiseData[index].deliveryType[index2].deliveryChargeCity} BDT", style: poppins.copyWith(fontSize: 9),),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              *//* Divider(height: 8, thickness: 8, color: Color(0xffF2F6F9),),*//*
                                            ],
                                          ),
                                        ),
                                      );
                                    }
                                );
                              }
                          )
                              : SizedBox() :    SizedBox() : SizedBox(),*/


                          controller.deliveryType.length>0?
                          ListView.builder(
                            itemCount:   controller.deliveryType.length??0,
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
                                        child: Text("${   controller.deliveryType[index]!.name??""}: ".toUpperCase(), style: railwaybold.copyWith(fontSize: 11)),
                                      ),
                                      SizedBox(width: 4),
                                      Expanded(child: Text("${      controller.deliveryType![index]!.shortDescription??""}", style: railway.copyWith(fontSize: 12),)),
                                    ],
                                  ),
                                );
                            },
                          )
                              :SizedBox() ,
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              Expanded(
                                child: CustomButton(
                                  height: 40,
                                  radius: 0,
                                  buttontextcolor: Colors.white,
                                  fontSize: 12.5,
                                  onPressed: (){
                                    print("GGGGGGGGGGGGGGGGGGGGGG");
                                    Get.to(
                                        ShopTheLook(
                                          genderid: 1,
                                          productId: controller.productDetailsResponse!.data!.id!,
                                          childCategoryId: controller.productDetailsResponse!.data!.childCategories![0]!.childCategoryProduct!.childCategoryId!,
                                        ));
                                    print("GGGGGGGGGGGGGGGGGGGGGG");
                                  },
                                  buttonText: "Shop The Look".toUpperCase(),
                                  buttoncolor: Colors.grey.shade700,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: CustomButton(
                                  height: 40,
                                  radius: 0,
                                  buttontextcolor: Colors.white,
                                  fontSize: 12.5,
                                  onPressed: (){
                                    Get.to(
                                        showModalBottomSheet(
                                          isScrollControlled: true,
                                          context: context,
                                          builder: (BuildContext context) {
                                            return  const PopupSizeOrColor( );
                                          },
                                        ),
                                        fullscreenDialog: true
                                    );
                                  },
                                  buttonText: "Add to Bag".toUpperCase(),
                                  buttoncolor: gold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),


                          /// Drop Work
                          Padding(
                            padding: const EdgeInsets.only(left: 0,right: 0),
                            child: InkWell(
                              onTap: (){
                                widget.isExpanded1=! widget.isExpanded1;
                                setState(() {
                                });
                              },
                              child: SizedBox(
                                // color: Color(0xff20243D),
                                height: 35,
                                width: Get.width,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 0, bottom: 6,top: 6),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 8),
                                              child: Text(
                                                "ISLE Advice",
                                                style: railway.copyWith(
                                                  fontSize: 13,
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
                          const SizedBox(height: 8),
                          widget.isExpanded1?
                          controller.productDetailsResponse != null && controller.productDetailsResponse!.data != null ?
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                                child: Text(
                                  "ISLE Advice",
                                  style: robotoRegular.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey.shade800
                                  ),
                                ),
                              ),
                              ListView.builder(
                                // reverse: true,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: controller.productDetailsResponse!.data!.isleAdvices!.length,
                                  itemBuilder: (BuildContext context, int index){
                                    return Container(
                                      // color: Colors.red,
                                      padding: const EdgeInsets.only(left: 0,right: 0,top: 0),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                                        child: Text.rich(
                                            TextSpan(
                                                text: '•  ${controller.productDetailsResponse!.data!.isleAdvices![index].fieldName??""}: ',
                                                style: railway.copyWith(fontSize: 11, height: 1.6, fontWeight: FontWeight.w600),
                                                children: <InlineSpan>[
                                                  TextSpan(
                                                    text: controller.productDetailsResponse!.data!.isleAdvices![index].value??"",
                                                    style: railway.copyWith(fontSize: 11, height: 1.6, fontWeight: FontWeight.w500),
                                                  )
                                                ]
                                            )
                                        ),
                                      ),
                                    );
                                  }
                              ),
                            ],
                          ) : const SizedBox()
                              :Container(),
                          const Divider(thickness: 0.8,color: Color(0xffD1D2D2)),

                          Padding(
                            padding: const EdgeInsets.only(left: 0,right: 0),
                            child: InkWell(
                              onTap: (){
                                widget.isExpanded2=! widget.isExpanded2;
                                setState(() {
                                });
                              },
                              child: SizedBox(
                                // color: Color(0xff20243D),
                                height: 35,
                                width: Get.width,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 0, bottom: 6,top: 6),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 8),
                                              child: Text(
                                                "Design Detail",
                                                style: railway.copyWith(
                                                  fontSize: 13,
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
                          const SizedBox(height: 8),
                          widget.isExpanded2?
                          controller.productDetailsResponse != null && controller.productDetailsResponse!.data != null ?
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                                child: Text(
                                  "Design Detail",
                                  style: robotoRegular.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey.shade800
                                  ),
                                ),
                              ),
                              ListView.builder(
                                // reverse: true,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: controller.productDetailsResponse!.data!.designDetails!.length,
                                  itemBuilder: (BuildContext context, int index){
                                    return Container(
                                      // color: Colors.red,
                                      padding: const EdgeInsets.only(left: 0,right: 0,top: 0),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                                        child: Text.rich(
                                            TextSpan(
                                                text: '•  ${controller.productDetailsResponse!.data!.designDetails![index].fieldName??""}: ',
                                                style: railway.copyWith(fontSize: 11, height: 1.6, fontWeight: FontWeight.w600),
                                                children: <InlineSpan>[
                                                  TextSpan(
                                                    text: controller.productDetailsResponse!.data!.designDetails![index].value??"",
                                                    style: railway.copyWith(fontSize: 11, height: 1.6, fontWeight: FontWeight.w500),
                                                  )
                                                ]
                                            )
                                        ),
                                      ),
                                    );
                                  }
                              ),
                            ],
                          ) : const SizedBox()
                              :Container(),
                          const Divider(thickness: 0.8,color: Color(0xffD1D2D2)),

                          Padding(
                            padding: const EdgeInsets.only(left: 0,right: 0),
                            child: InkWell(
                              onTap: (){
                                widget.isExpanded3=! widget.isExpanded3;
                                setState(() {
                                });
                              },
                              child: SizedBox(
                                // color: Color(0xff20243D),
                                height: 35,
                                width: Get.width,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 0, bottom: 6,top: 6),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 8),
                                              child: Text(
                                                "Material Composition",
                                                style: railway.copyWith(
                                                  fontSize: 13,
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
                          const SizedBox(height: 8),
                          widget.isExpanded3?
                          controller.productDetailsResponse != null && controller.productDetailsResponse!.data != null ?
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                                child: Text(
                                  "Material Composition",
                                  style: robotoRegular.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey.shade800
                                  ),
                                ),
                              ),
                              ListView.builder(
                                // reverse: true,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: controller.productDetailsResponse!.data!.materialCompositions!.length,
                                  itemBuilder: (BuildContext context, int index){
                                    return Container(
                                      // color: Colors.red,
                                      padding: const EdgeInsets.only(left: 0,right: 0,top: 0),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                                        child: Text.rich(
                                            TextSpan(
                                                text: '•  ${controller.productDetailsResponse!.data!.materialCompositions![index].fieldName??""}: ',
                                                style: railway.copyWith(fontSize: 11, height: 1.6, fontWeight: FontWeight.w600),
                                                children: <InlineSpan>[
                                                  TextSpan(
                                                    text: controller.productDetailsResponse!.data!.materialCompositions![index].value??"",
                                                    style: railway.copyWith(fontSize: 11, height: 1.6, fontWeight: FontWeight.w500),
                                                  )
                                                ]
                                            )
                                        ),
                                      ),
                                    );
                                  }
                              ),
                            ],
                          ) : const SizedBox()
                              :Container(),
                          const Divider(thickness: 0.8,color: Color(0xffD1D2D2)),

                          Padding(
                            padding: const EdgeInsets.only(left: 0,right: 0),
                            child: InkWell(
                              onTap: (){
                                widget.isExpanded4=! widget.isExpanded4;
                                setState(() {
                                });
                              },
                              child: SizedBox(
                                // color: Color(0xff20243D),
                                height: 35,
                                width: Get.width,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 0, bottom: 6,top: 6),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 8),
                                              child: Text(
                                                "Care Instruction",
                                                style: railway.copyWith(
                                                  fontSize: 13,
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
                          const SizedBox(height: 8),
                          widget.isExpanded4?
                          controller.productDetailsResponse != null && controller.productDetailsResponse!.data != null ?
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                                child: Text(
                                  "Care Instruction",
                                  style: robotoRegular.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey.shade800
                                  ),
                                ),
                              ),
                              ListView.builder(
                                // reverse: true,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: controller.productDetailsResponse!.data!.careInstructions!.length,
                                  itemBuilder: (BuildContext context, int index){
                                    return Container(
                                      // color: Colors.red,
                                      padding: const EdgeInsets.only(left: 0,right: 0,top: 0),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                                        child: Text.rich(
                                            TextSpan(
                                                text: '•  ${controller.productDetailsResponse!.data!.careInstructions![index].fieldName??""}: ',
                                                style: railway.copyWith(fontSize: 11, height: 1.6, fontWeight: FontWeight.w600),
                                                children: <InlineSpan>[
                                                  TextSpan(
                                                    text: controller.productDetailsResponse!.data!.careInstructions![index].value??"",
                                                    style: railway.copyWith(fontSize: 11, height: 1.6, fontWeight: FontWeight.w500),
                                                  )
                                                ]
                                            )
                                        ),
                                      ),
                                    );
                                  }
                              ),
                            ],
                          ) : const SizedBox()
                              :Container(),
                          const Divider(thickness: 0.8,color: Color(0xffD1D2D2)),

                          Padding(
                            padding: const EdgeInsets.only(left: 0,right: 0),
                            child: InkWell(
                              onTap: (){
                                widget.isExpanded5=! widget.isExpanded5;
                                setState(() {
                                });
                              },
                              child: SizedBox(
                                // color: Color(0xff20243D),
                                height: 35,
                                width: Get.width,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 0, bottom: 6,top: 6),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 8),
                                              child: Text(
                                                "Delivery & Returns",
                                                style: railway.copyWith(
                                                  fontSize: 13,
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
                          const SizedBox(height: 8),
                          widget.isExpanded5?
                          controller.allDeliveryTypeResponse != null && controller.allDeliveryTypeResponse!.data != null ?
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                                child: Text(
                                  "Delivery & Returns",
                                  style: robotoRegular.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey.shade800
                                  ),
                                ),
                              ),
                              ListView.builder(
                                // reverse: true,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: controller.allDeliveryTypeResponse!.data!.length,
                                  itemBuilder: (BuildContext context, int index){
                                    return Container(
                                      // color: Colors.red,
                                      padding: const EdgeInsets.only(left: 0,right: 0,top: 0),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text.rich(
                                              TextSpan(
                                                  text: '•  ${controller.allDeliveryTypeResponse!.data![index].name??""}: ',
                                                  style: railway.copyWith(fontSize: 11, height: 1.6, fontWeight: FontWeight.w600),
                                                  children: <InlineSpan>[
                                                    TextSpan(
                                                      text: controller.allDeliveryTypeResponse!.data![index].shortDescription??"",
                                                      style: railway.copyWith(fontSize: 11, height: 1.6, fontWeight: FontWeight.w500),
                                                    )
                                                  ]
                                              ),
                                            ),
                                            SizedBox(height: 8),
                                            HtmlWidget(controller.allDeliveryTypeResponse?.data?[index].description ?? "",
                                                textStyle: poppins.copyWith( fontWeight: FontWeight.w200,color: Colors.black,
                                                    fontSize: Get.width < 430 ? Get.width < 360 ? 9 : 11 : 12)),
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                              ),
                            ],
                          ) : const SizedBox()
                              :Container(),
                          const Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
                        ],
                      ),
                    ),
                  ),
                  Container(
                      height: 55,
                      width: Get.width,
                      // thickness: 15,
                      color: const Color(0xffF2F6F9),
                      // color: Colors.pink,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 28),
                            child: Text("Seller Product Code: ${controller.productDetailsResponse!.data!.productCode??""}",    style: robotoRegular.copyWith(
                                fontSize: 10,
                                // fontWeight: FontWeight.w600,
                                color: Colors.black
                            ),),
                          ),
                          const SizedBox(height: 4),
                          Padding(
                            padding: const EdgeInsets.only(left: 28),
                            child: Text("Seller Name: ${controller.productDetailsResponse?.data?.vendor?.vendorName??""}",    style: robotoRegular.copyWith(
                                fontSize: 10,
                                // fontWeight: FontWeight.w600,
                                color: Colors.black
                            ),),
                          ),
                        ],
                      )
                  ),
                  /// Need Help Part
                  InkWell(
                    onTap: (){
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return InfoPopup();
                        },
                      );
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
                                      child: Image.asset(Images.whatsapp, height: 22, width: 22, color: Colors.black54,),
                                    ),
                                  ],
                                )
                            ),

                            Expanded(
                                flex: 9,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Need Help?",  style: railway.copyWith(
                                        fontSize: 12.5,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),),
                                      const SizedBox(height: 2),
                                      Text("call whatsApp or email us",    style: robotoRegular.copyWith(
                                          fontSize: 10,
                                          // fontWeight: FontWeight.w600,
                                          color: Colors.grey.shade700
                                      ),),
                                    ],
                                  ),
                                )
                            ),
                            
                            Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Image.asset(Images.drop, height: 22, width: 22, color: Colors.black54,),
                                )
                            )
                          ],
                        )
                    ),
                  ),

                  /// Offer Price
                  /*   const Divider(
                    height: 10,
                    thickness: 10,
                    color: Color(0xffF2F6F9),
                    // color: Colors.pink,
                  ),
                  InkWell(
                    onTap: (){
                      Get.to(
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return OfferPopup();
                          },
                        ),
                      );
                    },
                    child: Container(
                        color: const Color(0xffFFFFFF),
                        child: Row(
                          children: [

                            Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 0),
                                  child: Image.asset(Images.tag, height: 22, width: 22, color: Colors.black54,),
                                )
                            ),
                            Expanded(
                                flex: 9,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 0, right: 0, top: 15, bottom: 15),
                                  child: Row(
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("We offer",  style: railway.copyWith(
                                        fontSize: 11,
                                        // fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),),
                                      const SizedBox(width: 2),
                                      Text("Price Match",  style: railway.copyWith(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),),

                                    ],
                                  ),
                                )
                            ),

                            Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Image.asset(Images.drop, height: 22, width: 22, color: Colors.black54,),
                                )
                            )
                          ],
                        )
                    ),
                  ),*/

                  const Divider(
                    thickness: 10,
                    height: 10,
                    color: Color(0xffF2F6F9),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomButton(
                      onPressed: (){
                        print(controller.productDetailsResponse!.data!.id!);
                        print("AFDDDD");
                        showModalBottomSheet(
                          context: context,
                          builder: (
                              BuildContext context) {
                            // return ProductReviewPopup(id: controller?.sectionHomepageList[index]!.childCategories![0]?.childCategoryProduct!.childCategoryId ?? 0,);
                            return ProductReviewPopup(id: controller.productDetailsResponse!.data!.id!,);
                          },
                        );

                      },
                      buttonText: "Product Review",
                      buttoncolor: gold,
                      buttontextcolor: Colors.white,
                      fontSize: 14,
                      myfontweight: FontWeight.bold,
                      radius: 0,
                    ),
                  ),
                  /// Follower
            ListView.builder(
              itemCount: 1,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
            //    bool isFollowed = Get.find<WishlistController>().getCheckBranded(brandId: controller.productDetailsResponse?.data?.brandId?.toString() ?? "");

                return Container(
                  color: const Color(0xffFFFFFF),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            controller.followWriteUpResponse != null
                                ? Text(
                              '${controller.productDetailsResponse?.data?.brand?.brandName ?? ""}'.toUpperCase(),
                              style: railway.copyWith(fontSize: 13, fontWeight: FontWeight.w700),
                            )
                                : SizedBox(),
                            const SizedBox(width: 8),
                            InkWell(
                              onTap: () async {
                                print("balll 1111111");
                                try {
                                  var deviceID = await Get.find<AuthController>().getDeviceID();
                                  var customerId = Get.find<AuthController>().isLoggedIn() ? await Get.find<AuthController>().getUserId() : null;
                                if(Get.find<AuthController>().isLoggedIn()) {
                                  await Get.find<WishlistController>().createFollow(
                                    brandId: controller.productDetailsResponse!.data!.brandId!.toString(),
                                  );
                                  print("balll 2222222");
                                } else {
                                  Get.to(LoginRegisterPage(isFromCart: false, isbottomSheet: true,));
                                }
                                } catch (e) {
                                  print("Error: $e");
                                }
                              },
                              child: Container(
                                height: 25,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 4, right: 8, top: 0, bottom: 0),
                                  child: Center(
                                    child: Row(
                                      children: [
                                        isFollow?  Container(
                                          height: 20,
                                          width: 20,
                                          child: const Icon(Icons.star_border_purple500_sharp, color: Colors.white, size: 16),
                                        ):
                                        Container(
                                          height: 20,
                                          width: 20,
                                          child: const Icon(Icons.star_border_purple500_sharp, color: Colors.black87, size: 16),
                                        ),
                                        const SizedBox(width: 2),
                                        isFollow?
                                        Text(
                                          'Following',
                                          style: poppins.copyWith(color: Colors.white, fontSize: 9.5, fontWeight: FontWeight.w600),
                                        )
                                        :    Text(
                                          'Favourite',
                                          style: poppins.copyWith(color: Colors.black87, fontSize: 9.5, fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: isFollow ? gold : Colors.transparent, // Set gold color when isFollowed is true
                                  borderRadius: BorderRadius.circular(3),
                                  border: Border.all(
                                    color: isFollow? gold : silvercolor, // Set silver color when isFollowed is false
                                    width: 1,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text("${controller.followWriteUpResponse?.data?[0].follow ?? ""}", style: railway.copyWith(fontSize: 10, fontWeight: FontWeight.w500)),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                );
              },
            ),

                  const Divider(
                    thickness: 10,
                    height: 10,
                    color: Color(0xffF2F6F9),
                  ),

                  const SizedBox(height: 0),

                  /// Shop 1 part
                  Container(
                    // color: Colors.orangeAccent,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 4, right: 8, top: 15, bottom: 8),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: Text("You May Also Like",   style: railway.copyWith( fontSize: 15, fontWeight: FontWeight.w600),),
                              ),
                              InkWell(
                                  onTap: (){
                                    print("HHHHHHHHHHHHHHHHHHHHH");
                                    print(controller.productDetailsResponse?.data?.childCategories?[0]?.childCategoryProduct?.childCategoryId!.toString());
                                    print("BBBBBBBBBBBBBBBBBBBBBBBBB");
                                    Get.to(()=> ProductPage(
                                      page: AppConstants.CHILDCATEGORY,
                                      id: controller.productDetailsResponse?.data?.childCategories?[0]?.childCategoryProduct?.childCategoryId!.toString()??"",
                                    ));
                                  },
                                  child: Text("Shop All".toUpperCase(), style: poppins.copyWith(decoration: TextDecoration.underline,color: gold,fontSize: 9.5),)),
                            ],
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                  controller.youmayAlsoLikeList != null? controller.youmayAlsoLikeList!.isNotEmpty?
                  Padding(
                    padding: const EdgeInsets.only(left: 4, right: 8, top: 0, bottom: 8),
                    child:  SizedBox(
                      // color: Colors.red,
                      height: Get.height/2.5,
                      // width: Get.width,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0, right: 0),
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.youmayAlsoLikeList.length??0,
                          itemBuilder:  (BuildContext context, int index) {
                            bool isWished=Get.find<WishlistController>().getCheckWishlisted(controller.youmayAlsoLikeList[index].id?.toString()??"");
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 6),
                              child: InkWell(
                                onTap: () {
                                  Get.find<ProductDetailsController>().dataInitialize();
                                  Get.find<ProductDetailsController>().getProductDetailsData(
                                      controller.youmayAlsoLikeList[index].id?.toString() ?? '');
                                  Get.find<ProductDetailsController>().getMoreFromBrandsData(
                                      controller.youmayAlsoLikeList[index].id?.toString() ?? '',
                                      controller.youmayAlsoLikeList[index].pages?[index]?.pageProduct?.pageId?.toString() ?? '', controller.youmayAlsoLikeList[index].brandId?.toString() ?? '');
                                  Get.find<ProductDetailsController>().getGenderPageData();
                                  setState(() {
                                    // controller.update();
                                  });
                                },
                                /*               onTap: () {
                                  print("afdsafsadf");
                                  Get.off(ProductDetailsPage(
                                    productId: controller.youMayAlsoLikeResponse!.data![index]!.id!.toString(),
                                    pageId: controller.youMayAlsoLikeResponse!.data![index]!.pages![controller.sectedColorVAriantIndex]!.pageProduct!.pageId!.toString(),
                                    brandId: controller.youMayAlsoLikeResponse!.data![index]!.brandId!.toString(),
                                  ) );
                                  print("ddddddddddd");
                                },*/
                                child: Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      Container(
                                        // color:  Colors.cyan,
                                        color: const Color(0xffFAFAFC),
                                        width: Get.width/2.7,
                                        // height: Get.height,
                                        child: Column(
                                            children: [
                                              SizedBox(
                                                // color:  Color(0xff424242),
                                                // color:  Colors.blue,
                                                width: Get.width/2.7,
                                                height: Get.height/3.8,
                                                child: Stack(
                                                    alignment: Alignment.topCenter,
                                                    children: [
                                                      Container(
                                                        height: Get.height/3.8,
                                                        child: CustomImageCached(
                                                          image: '${AppConstants.BASE_URL}${controller.youmayAlsoLikeList[index].productColorVariants![controller.sectedColorVAriantIndex].frontPhoto}',
                                                          // image: widget.cartdetailsimage,
                                                          fit: BoxFit.fill,
                                                          height: Get.height/3.8,
                                                          isRound: false,
                                                        ),
                                                      ),
                                                      /*                            Image.network(
                                                        "https://isle.vercel.app/_next/image?url=%2Fimages%2Fcard%2Fimg2.webp&w=256&q=75",
                                                        height: Get.height/3.8,
                                                        fit: BoxFit.fill,
                                                      ),*/
                                                      Positioned(
                                                          bottom: 0,
                                                          child: Align(
                                                            alignment: Alignment.bottomCenter,
                                                            child: Container(
                                                              /// orginal color
                                                              // color: Color(0xffF2F2F2),
                                                              color: Colors.grey.shade300,
                                                              child: Padding(
                                                                padding: const EdgeInsets.only(left: 12, right: 12, top: 3, bottom: 3),
                                                                child: Text((controller.youmayAlsoLikeList[index].season?.seasonName??"").toUpperCase(),
                                                                  style: robotoRegular.copyWith(color: Colors.black, fontSize: 9),),
                                                              ),
                                                            ),
                                                          )

                                                      )
                                                    ]
                                                ),
                                              ),
                                              const SizedBox(height: 8),

                                              Text((controller.youmayAlsoLikeList[index].brand?.brandName??"").toUpperCase(),
                                                style: railway.copyWith( fontSize: 16, fontWeight: FontWeight.w700),),
                                              const SizedBox(height: 5),

                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 4),
                                                child: Text(controller.youmayAlsoLikeList[index].name??"",
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: poppins.copyWith( fontSize: 12, fontWeight: FontWeight.w700),),
                                              ),
                                              const SizedBox(height: 5),

                                              controller.youmayAlsoLikeList[index].discount == null || controller.youmayAlsoLikeList[index].discount == 0   ?
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 4),
                                                child: Text(
                                                  "${controller.youmayAlsoLikeList[index].price} BDT",
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
                                                      "${controller.youmayAlsoLikeList[index].discountedPrice} BDT",
                                                      style: poppins.copyWith(
                                                          fontWeight: FontWeight.w600,
                                                          color: gold,
                                                          fontSize: 12
                                                      ),
                                                    ),
                                                    const SizedBox(height: 4),
                                                    Text(
                                                      "${controller.youmayAlsoLikeList[index].price} BDT",
                                                      style: poppins.copyWith(
                                                          fontWeight: FontWeight.w600,
                                                          decoration: TextDecoration.lineThrough,
                                                          color: Colors.red,
                                                          fontSize: 12),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ]
                                        ),
                                      ),
                                      Positioned(
                                        top: 10,
                                        right: 10,
                                        /* child :  buildProductWishButton2(controller.youmayAlsoLikeList[index].id?.toString() ?? '', 20),*/
                                        child: InkWell(
                                          onTap: () async {
                                            try {
                                              var deviceID = await Get.find<AuthController>().getDeviceID();
                                              var customerId = Get.find<AuthController>().isLoggedIn()?await Get.find<AuthController>().getUserId():null;
                                              await Get.find<WishlistController>().AddtoWishlist(
                                                product_id: controller.youmayAlsoLikeList[index].id?.toString()??"",
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
                                      Positioned(
                                        top: 10,
                                        left: 10,
                                        child: InkWell(
                                          onTap: () {
                                            showModalBottomSheet(
                                              context: context,
                                              builder: (
                                                  BuildContext context) {
                                                return SimilarPopup(id: controller.youmayAlsoLikeList[index].childCategories![0]?.childCategoryProduct!.childCategoryId ?? 0,);
                                              },
                                            );
                                          },

                                          child: SizedBox(
                                            // color: Colors.black,
                                            height: 30,
                                            width: 30,
                                            child: Padding(
                                              padding: const EdgeInsets.all(5),
                                              child: Image.asset(Images.similar, color: silvercolor, height: 20, width: 20,),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]
                                ),
                              ),
                            );
                          },

                        ),
                      ),
                    ),
                  ): const SizedBox()
                      : const SizedBox(),

                  /// Shop 2 part
                  controller.moreBrandDetailsPageResponse!= null? controller.moreBrandDetailsPageResponse!.data!.isNotEmpty?
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("More From ${controller.productDetailsResponse?.data?.brand?.brandName??""}",   style: railway.copyWith( fontSize: 15, fontWeight: FontWeight.w600),),
                        InkWell(
                            onTap: (){
                              Get.to(  ProductPage(
                                page: AppConstants.BRAND,
                                id: controller.productDetailsResponse?.data?.brandId?.toString()??"",
                              ));
                            },
                            child: Text("Shop All".toUpperCase(), style: poppins.copyWith(decoration: TextDecoration.underline,color: gold,fontSize: 9.5),)),
                      ],

                    ),
                  )
                      : const SizedBox() : const SizedBox(),
                  const SizedBox(height: 15),
                  controller.moreBrandDetailsPageResponse!= null? controller.moreBrandDetailsPageResponse!.data!.isNotEmpty?
                  Padding(
                    padding: const EdgeInsets.only(left: 4, right: 8, top: 0, bottom: 8),
                    child:  SizedBox(
                      // color: Colors.red,
                      height: Get.height/2.5,
                      // width: Get.width,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0, right: 0),
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.moreBrandDetailsPageResponse!.data!.length??0,
                          itemBuilder:  (BuildContext context, int index) {
                            /*           child :  buildProductWishButton2(controller.moreBrandDetailsPageResponse!.data![index]!.id!.toString(), 20),*/
                            bool isWished=Get.find<WishlistController>().getCheckWishlisted(controller.moreBrandDetailsPageResponse?.data?[index]?.id?.toString()??"");
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 6),
                              child: InkWell(
                                onTap: () {
                                  Get.find<ProductDetailsController>().dataInitialize();
                                  Get.find<ProductDetailsController>().getProductDetailsData(controller.moreBrandDetailsPageResponse!.data![index]!.id!.toString());
                                  Get.find<ProductDetailsController>().getMoreFromBrandsData(controller.moreBrandDetailsPageResponse!.data![index]!.id!.toString(), controller.moreBrandDetailsPageResponse!.data![index]!.pages![controller.sectedColorVAriantIndex]!.pageProduct!.pageId!.toString(), controller.moreBrandDetailsPageResponse!.data![index]!.brandId!.toString());
                                  Get.find<ProductDetailsController>().getGenderPageData();
                                  setState(() {
                                    // controller.update();
                                  });
                                },

                                child: Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      Container(
                                        // color:  Colors.cyan,
                                        color: const Color(0xffFAFAFC),
                                        width: Get.width/2.7,
                                        // height: Get.height,
                                        child: Column(
                                            children: [
                                              SizedBox(
                                                // color:  Color(0xff424242),
                                                // color:  Colors.blue,
                                                width: Get.width/2.7,
                                                height: Get.height/3.8,
                                                child: Stack(
                                                    alignment: Alignment.topCenter,
                                                    children: [
                                                      CustomImageCached(
                                                        image: '${AppConstants.BASE_URL}${controller.moreBrandDetailsPageResponse!.data![index]!.productColorVariants![controller.sectedColorVAriantIndex].frontPhoto}',
                                                        // image: widget.cartdetailsimage,
                                                        fit: BoxFit.fill,
                                                        isRound: false,
                                                      ),
                                                      Positioned(
                                                          bottom: 0,
                                                          child: Align(
                                                            alignment: Alignment.bottomCenter,
                                                            child: Container(
                                                              /// orginal color
                                                              // color: Color(0xffF2F2F2),
                                                              color: Colors.grey.shade300,
                                                              child: Padding(
                                                                padding: const EdgeInsets.only(left: 12, right: 12, top: 3, bottom: 3),
                                                                child: Text((controller.moreBrandDetailsPageResponse?.data?[index]?.season?.seasonName??"").toUpperCase(),
                                                                  style: railway.copyWith(color: Colors.black, fontSize: 9),),
                                                              ),
                                                            ),
                                                          )

                                                      )
                                                    ]
                                                ),
                                              ),
                                              const SizedBox(height: 8),

                                              Text((controller.moreBrandDetailsPageResponse?.data?[index]?.brand?.name??"").toUpperCase(),
                                                style: railway.copyWith( fontSize: 16, fontWeight: FontWeight.w700),),
                                              const SizedBox(height: 5),

                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 4),
                                                child: Text(controller.moreBrandDetailsPageResponse?.data?[index]?.name??"",
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: poppins.copyWith( fontSize: 12, fontWeight: FontWeight.w700),),
                                              ),
                                              const SizedBox(height: 5),

                                              controller.moreBrandDetailsPageResponse?.data?[index]?.discount == null || controller.moreBrandDetailsPageResponse?.data?[index]?.discount == 0   ?
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 4),
                                                child: Text(
                                                  "${controller.moreBrandDetailsPageResponse?.data?[index]?.price} BDT",
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
                                                      "${controller.moreBrandDetailsPageResponse?.data?[index]?.discountedPrice} BDT",
                                                      style: poppins.copyWith(
                                                          fontWeight: FontWeight.w600,
                                                          color: gold,
                                                          fontSize: 12
                                                      ),
                                                    ),
                                                    const SizedBox(height: 4),
                                                    Text(
                                                      "${controller.moreBrandDetailsPageResponse?.data?[index]?.price} BDT",
                                                      style: poppins.copyWith(
                                                          fontWeight: FontWeight.w600,
                                                          decoration: TextDecoration.lineThrough,
                                                          color: Colors.red,
                                                          fontSize: 12),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ]
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
                                                product_id: controller.moreBrandDetailsPageResponse!.data![index]!.id!.toString()??"",
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
                                      Positioned(
                                        top: 10,
                                        left: 10,
                                        child: InkWell(
                                          onTap: () {
                                            showModalBottomSheet(
                                              context: context,
                                              builder: (
                                                  BuildContext context) {
                                                return SimilarPopup(id: controller.moreBrandDetailsPageResponse!.data![index]!.childCategories![0]?.childCategoryProduct!.childCategoryId ?? 0,);
                                              },
                                            );
                                          },

                                          child: SizedBox(
                                            // color: Colors.black,
                                            height: 30,
                                            width: 30,
                                            child: Padding(
                                              padding: const EdgeInsets.all(5),
                                              child: Image.asset(Images.similar, color: silvercolor, height: 20, width: 20,),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]
                                ),
                              ),
                            );
                          },

                        ),
                      ),
                    ),
                  ): const SizedBox()
                      : const SizedBox(),
                  const SizedBox(height: 0),
                ],
              )
                  : const ProductDetailsShimmer(),
            ),);
        }
    );
  }


  /* double islepoint(double price) {
    return price/100;
  }*/

  String islepoint(double price) {
    // Divide the price by 100 and format it without decimal places
    int formattedPrice = (price / 100).toInt();
    return "$formattedPrice Isle"; // Format the price without decimal places
  }


}
