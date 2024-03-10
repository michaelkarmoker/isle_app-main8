import 'dart:convert';
import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/auth_controller.dart';
import 'package:isletestapp/controller/main%20page/main_page_controller.dart';
import 'package:isletestapp/controller/product%20details/product_details_controller.dart';
import 'package:isletestapp/controller/product/product_controller.dart';
import 'package:isletestapp/controller/wishlist/wishlist_controller.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/html_tag_remover.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/custom_Image_cached.dart';
import 'package:isletestapp/view/base/no_result_found.dart';
import 'package:isletestapp/view/screens/all_popup/feedback_popup.dart';
import 'package:isletestapp/view/screens/all_popup/sort_popup.dart';
import 'package:isletestapp/view/screens/all_popup/custom_discover_dialog.dart';
import 'package:isletestapp/view/screens/custom%20logo/custom_logo_widget.dart';
import 'package:isletestapp/view/screens/filter/people_filter_dialog.dart';
import 'package:isletestapp/view/screens/filter/sub_category_filter_dialog.dart';
import 'package:isletestapp/view/screens/product%20details/product_details_page.dart';
import 'package:isletestapp/view/screens/product%20page/product_shimmer.dart';
import 'package:isletestapp/view/screens/search/search_screen.dart';
import 'package:isletestapp/view/screens/universal_bottom_nav/universal_bottom_nav.dart';
import 'package:isletestapp/view/screens/all_popup/similar_product_popup.dart';
import 'package:isletestapp/view/screens/wish_list/custom_wish_item_count_widget.dart';
import 'package:isletestapp/view/screens/wish_list/wish_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controller/category/category_page_controller.dart';
import '../../../data/model/response/category page/nested_section_response.dart';
import '../filter/brand_type_filter_dialog.dart';
import '../filter/most_popular_filter_dialog.dart';
import '../../../data/model/response/filter/sell_product_filter_term_model.dart';
import '../filter/brand_filter_dialog.dart';
import '../filter/category_filter_dialog.dart';
import '../filter/child_category_filter_dialog.dart';
import '../filter/search_product_filter_dialog.dart';
import '../filter/section_filter_dialog.dart';
import '../filter/section_newin_filter_page_dialog.dart';
import '../filter/sell_section_filter_dialog.dart';

class MenuModel{
  final String? img;
  final String? text;

  MenuModel({required this.img, required this.text});

}

class ProductPage extends StatefulWidget {
  final MainPageController? controller2;
  final String? brandId;
  final int? newinleangth;
  final String? image;
  final String? title;
  final String? details;
  final String? sectiontype;

  final String? discountText;
  final String? brandText;
  final String? sizeText;
  final String? categoryText;


  final String? id;

  /* final String? categoryId;
  final String? subCategoryId;
  final String? childCategoryId;
  final String? sectionId;
  final String? brandId;*/
  //final String? affordId;
  final int page;
  final int? indexId;

  final String? searchCon;
  final String? mainImage;
  final String? mainTitle;
  final String? mainDesc;

  final int? pageId;
  final int? parentId;
  final List<int>? sectionId;
  final String? seasonId;
  final String? genderId;
  ProductPage({
    Key? key,
    /* this.categoryId,
     this.subCategoryId,
     this.childCategoryId,
     this.sectionId,
     this.brandId,*/
    // this.affordId,
    required this.page,
    this.indexId,
    this.searchCon,
    this.mainImage,
    this.mainTitle,
    this.mainDesc,
    this.image,
    this.title,
    this.pageId,
    this.parentId,
    this.sectionId,
    this.discountText,
    this.brandText,
    this.sizeText,
    this.categoryText,
    this.details, this.sectiontype, this.controller2, this.newinleangth, this.id, this.seasonId, this.genderId, this.brandId,

  }) : super(key: key);

  @override
  State<ProductPage> createState() => _IsleHomeScreenState();
}

class _IsleHomeScreenState extends State<ProductPage> {
  ScrollController _scrollController = ScrollController();
  bool _isVisible = true;
  int currentPage = 1; // Track current page
  int perPage = 10; // Number of items per page

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(_handleScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
/*      retrieveButtonState(); // Retrieve the stored state of the button when the page loads
      // Load the stored wish statuses when the page loads
      retrieveWishStatus();*/
      print(widget.sectiontype);
      // Get.find<ProductListController>().getGeneralSettingData();
      // Get.find<CategoryPageController>().dataInitialize();
      if (widget.page == AppConstants.SECTION ||
          widget.page == AppConstants.SUBSECTION ||
          widget.page == AppConstants.CHILDSECTION) {
        // Get.find<ProductListController>().getSectionNewInData(id: widget.id);
        /*if(widget.indexId == 2){
          Get.find<ProductListController>().getSectionNewInData(id: widget.id, limit: '50', pageId: widget.pageId,);
          Get.find<ProductListController>().getSectionNewInFilter(id: widget.id, pageId: widget.pageId);
        }*/ /*if(widget.indexId == 4){
          Get.find<ProductListController>().getSellProductData(
            pageId: widget.pageId,
            genderId: widget.pageId,
            discount: widget.discountText ?? '',
            brandText: widget.brandText ?? '',
            sizeText: widget.sizeText ?? '',
            categoryText: widget.categoryText ?? '',
            limit: '50'
          );
          Get.find<ProductListController>().getSellProductFilterTerm(genderId: widget.pageId.toString());
        } else{
          Get.find<ProductListController>().getSectionProductData(id: widget.id, pageId: widget.pageId);
          Get.find<ProductListController>().getSectionProductFilter(id: widget.id, parentId: widget.parentId.toString());
        }*/
        log('Print Load.. 0');
        Get.find<ProductListController>().getSectionProductData(id: widget.id, pageId: widget.pageId, limit: '100', page: currentPage.toString());
        Get.find<ProductListController>().getSectionProductFilter(id: widget.id, parentId: widget.parentId.toString());
        // if(widget.page == AppConstants.newIn){
        //   Get.find<ProductListController>().getSectionNewInData(id: widget.id);
        //   // Get.find<ProductListController>().getSectionProductFilter(id: widget.id, parentId: widget.parentId.toString());
        // }
        // else{
        //   Get.find<ProductListController>().getSectionNewInData(id: widget.id);
        //   Get.find<ProductListController>().getSectionProductData(id: widget.id);
        //   Get.find<ProductListController>().getSectionProductFilter(id: widget.id, parentId: widget.parentId.toString());
        // }

      } else if (widget.page == AppConstants.newIn) {
        Get.find<ProductListController>().getSectionNewInData(id: widget.id, limit: '100', pageId: widget.pageId,);
        Get.find<ProductListController>().getSectionNewInFilter(id: widget.id, pageId: widget.pageId);
      } else if (widget.page == AppConstants.CATEGORY) {
        Get.find<ProductListController>().getCategoryProductData(categoryId: widget.id, limit: '100', pageId: widget.pageId);
        // Get.find<ProductListController>().getCategoryProductFilter(id: widget.id, parentId: widget.parentId.toString());
        Get.find<ProductListController>().getCategoryProductFilter(id: widget.id, parentId: widget.parentId.toString());
      } else if (widget.page == AppConstants.search) {
        Get.find<ProductListController>().getSearchProductData(searchTerm: widget.searchCon, pageId: 1, limit: '100');
        Get.find<ProductListController>().getSearchProductFilterTerm(pageId: 1.toString(), searchTerm: widget.searchCon);
      } else if (widget.page == AppConstants.SUBCATEGORY) {
        Get.find<ProductListController>().getSubCategoryProductData(subCategoryId: widget.id);
        Get.find<ProductListController>().getSubCategoryProductFilter(id: widget.id, parentId: widget.parentId.toString());
      } else if (widget.page == AppConstants.CHILDCATEGORY) {
        Get.find<ProductListController>().getChildCategoryProductData(childCategoryId: widget.id, pageId: widget.pageId);
        Get.find<ProductListController>().getChildCategoryProductFilter(id: widget.id, parentId: widget.parentId.toString());
      } else if (widget.page == AppConstants.brandType) {
        Get.find<ProductListController>().getBrandTypeProductData(id: widget.id, pageId: widget.pageId, genderId: widget.pageId, limit: '100');
        Get.find<ProductListController>().getBrandTypeProductFilterTerm(id: widget.id, genderId: widget.pageId);
      } else if (widget.page == AppConstants.mostPopular) {
        Get.find<ProductListController>().getMostPopularProductData(id: widget.id, pageId: widget.pageId);
        Get.find<ProductListController>().getMostPopularFilter(id: widget.id);
      }
      else if (widget.page == AppConstants.SHOPBYOCCATION) {
        Get.find<ProductListController>().getOccassionProductDetailsData(seasonId: widget.seasonId!.toString(), genderId: widget.genderId);
      }
      else if (widget.page == AppConstants.sellPro) {
        Get.find<ProductListController>().getSellProductData(
            pageId: widget.pageId,
            genderId: widget.pageId,
            discount: widget.discountText ?? '',
            brandText: widget.brandText ?? '',
            sizeText: widget.sizeText ?? '',
            categoryText: widget.categoryText ?? '',
            limit: '100'
        );
        Get.find<ProductListController>().getSellProductFilterTerm(genderId: widget.pageId.toString());
      } else if (widget.page == AppConstants.BRAND) {
        Get.find<ProductListController>().getBrandsLandingImageData(brandId: widget.brandId);
        Get.find<ProductListController>().getBrandProductData(id: widget.id, pageId: widget.pageId, genderId: widget.pageId, limit: '100');
        Get.find<ProductListController>().getBrandProductFilter(id: widget.id, genderId: widget.pageId.toString());
      } /* else if (widget.page == AppConstants.NEW_IN) {
        Get.find<MainPageController>().dataInitializeForHome();
      }*/ else if (widget.page == AppConstants.menShop) {
        Get.find<MainPageController>().getMultisectionProductFilter(sectionId: widget.sectionId!);
        Get.find<MainPageController>().getMultisectionProduct(pageId: widget.pageId!, sectionId: widget.sectionId!);
      }
    });
  }

  bool _isLoading = false; // Add this variable to track loading state


  /// ==@ Working by rakib
  // void _handleScroll() {
  //   if (!_isLoading && _scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
  //     // Only load more data if not already loading and at the bottom of the list
  //     _isLoading = true; // Set loading state to true
  //     int nextPage = currentPage + 1;
  //     if (widget.page == AppConstants.SECTION ||
  //         widget.page == AppConstants.SUBSECTION ||
  //         widget.page == AppConstants.CHILDSECTION) {
  //       log('Print Load.. 1');
  //       Get.find<ProductListController>().getSectionProductData(
  //         id: widget.id,
  //         pageId: widget.pageId,
  //         limit: '$perPage',
  //         page: '$nextPage', // Load next page
  //       ).then((_) {
  //         // After data is loaded, reset loading state
  //         _isLoading = false;
  //       }).catchError((error) {
  //         // Handle error if data loading fails
  //         _isLoading = false; // Ensure loading state is reset even if loading fails
  //         print("Error loading data: $error");
  //       });
  //     }
  //     currentPage = nextPage;
  //   }
  // }



  // void _handleScroll() {
  //   if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
  //     // User has scrolled to the bottom
  //     if (!_isLoadingMore) {
  //       // If not already loading more data, load more
  //       setState(() {
  //         _isLoadingMore = true;
  //       });
  //       // Load next set of data
  //       Get.find<ProductListController>().getSectionProductData(
  //         id: widget.id,
  //         pageId: widget.pageId,
  //         limit: '10',
  //       ).then((_) {
  //         setState(() {
  //           _isLoadingMore = false;
  //         });
  //       });
  //     }
  //   } else {
  //     // Reset _isLoadingMore if user scrolls back up
  //     if (_isLoadingMore) {
  //       setState(() {
  //         _isLoadingMore = false;
  //       });
  //     }
  //   }
  // }

  void _handleScroll() {
    if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
      // Scrolling down, show the FloatingActionButton
      if (!_isVisible) {
        setState(() {
          _isVisible = true;
        });
      }
    } else if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
      // Scrolling up, hide the FloatingActionButton
      if (_isVisible) {
        setState(() {
          _isVisible = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
    Get.find<ProductListController>().dataClear();
  }

  TextEditingController searchCtr = TextEditingController();
  bool isSearchClick = false;
  TextEditingController subscribeCtr = TextEditingController();
  FocusNode subscribeFcs = FocusNode();

  bool indicatorcolor = true;
  TextEditingController msgboxCtr = TextEditingController();
  FocusNode msgboxFcs = FocusNode();

  bool isChecked = false;

  void toggleCheckbox() {
    setState(() {
      isChecked = !isChecked; // Toggle the checkbox state
    });
  }

  bool isToggled = false;

  void toggleButton() {
    setState(() {
      isToggled = !isToggled;
    });
  }

  Color buttonColor = Colors.transparent;
  Color buttontextColor = Colors.black;

  void changeColor() {
    setState(() {
      // Change the color when the button is clicked
      buttonColor = Colors.black;
      buttontextColor = Colors.white;
    });
  }

  Color buttonColor2 = Colors.transparent;
  Color buttontextColor2 = Colors.black;

  void changeColor2() {
    setState(() {
      // Change the color when the button is clicked
      buttonColor2 = Colors.black; // Change to your desired color
      buttontextColor2 = Colors.white;
    });
  }

  Color buttonColor3 = Colors.transparent;
  Color buttontextColor3 = Colors.black;

  void changeColor3() {
    setState(() {
      // Change the color when the button is clicked
      buttonColor3 = Colors.black; // Change to your desired color
      buttontextColor3 = Colors.white;
    });
  }

  int currentIndex = 1; // Add this variable to track the current index

  int menuClick = 0;
  List<MenuModel> menuList = [
    MenuModel(img: Images.filter, text: 'Filter'),
    MenuModel(img: Images.swap, text: 'Isle Picks'),
  ];




  @override
  Widget build(BuildContext context) {

    return GetBuilder<ProductListController>(builder: (controller) {
      log('====================@ Controleler${widget.controller2}');
      return GetBuilder<MainPageController>(builder: (mainController) {
        return Scaffold(
          floatingActionButton: _isVisible
              ? Container(
            height: 42,
            width: 42,
            padding: EdgeInsets.zero,
            child: FloatingActionButton(
              backgroundColor: gold,
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (
                      BuildContext context) {
                    // return ProductReviewPopup(id: controller?.sectionHomepageList[index]!.childCategories![0]?.childCategoryProduct!.childCategoryId ?? 0,);
                    return FeedbackPopup();
                    // return FeedbackPopup(id: controller.productDetailsResponse!.data!.id!,);
                  },
                );
              },
              child: const Icon(Icons.feedback_outlined, color: Colors.white, size: 22),
            ),
          )
              : null,
          bottomNavigationBar: const UniversalBottomNav(),

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
              InkWell(
                  onTap: (){
                    Get.to(const SearchScreen());
                  },
                  // child: Icon(Icons.search,color: Color(0xff000000),size: 25,)):SizedBox(),
                  child: Image.asset(Images.search, height: 22, width: 22,)),
              const SizedBox(width: 2),
              const WishButtonWidget(),
              const SizedBox(width: 4),
            ],
            leadingWidth: Get.width / 3.5,
            title: const CustomLogo(),
          ),
          body: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              children: [

                /// Top BANNER

        /*        widget.image == "null"?
                    Text("Nulllll"):
                    Text("Imageee"),*/

                widget.page == AppConstants.BRAND?
                Column(
                  children: [
                    Container(
                      // color: Colors.red,
                      height: Get.height / 3.45,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Container(
                            alignment: Alignment.topCenter,
                            width: Get.width,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: CustomImageCached(
                                image : "${AppConstants.BASE_URL}${controller.brandsLandingImageResponse?.data?.landingBanner??""}",
                                isRound: false,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 10,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.to(WishListPage());
                                  },
                                  child: CircleAvatar(
                                    radius: 24,
                                    backgroundColor: Colors.grey.shade100,
                                    child: Icon(Icons.star_border_purple500_sharp,
                                        size: 27, color: gold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.dialog(CustomDialog(title: controller.brandsLandingImageResponse?.data?.landingTitle??"", desc: controller.brandsLandingImageResponse?.data?.landingDescription??""));
                      },
                      child: Container(
                        width: Get.width,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 25),
                                child: Text(controller.brandsLandingImageResponse?.data?.landingTitle ?? "",
                                  textAlign: TextAlign.center,
                                  style: railway.copyWith( height: 1.3,fontSize: 20, fontWeight: FontWeight.w600),
                                ),
                              ),
                              const SizedBox(height: 12),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 25),
                                child: Text(
                                  '${HtmlTags.removeTag(htmlString: controller.brandsLandingImageResponse?.data?.landingDescription ?? "")}',
                                  style: poppins.copyWith(fontSize: 14),
                                  // maxLines: 1,
                                  textAlign: TextAlign.center,
                                  // overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text("Read More".toUpperCase(),
                                style: railwaybold.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: gold,
                                    fontSize: 10,
                                    decoration: TextDecoration.underline),
                              ),
                              const SizedBox(height: 0),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                  ],
                )
                :
                widget.image == null?
                const SizedBox.shrink() :
                Column(
                  children: [
                  widget.image != "null" ?
                    Container(
                      height: Get.height / 2.5,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Container(
                            width: Get.width,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: CustomImageCached(
                                image : "${AppConstants.BASE_URL}${widget.image??""}",
                                // image: widget.image ?? "",
                                isRound: false,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 10,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.to(WishListPage());
                                  },
                                  child: CircleAvatar(
                                    radius: 24,
                                    backgroundColor: Colors.grey.shade100,
                                    child: Icon(Icons.star_border_purple500_sharp,
                                        size: 27, color: gold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                        : const SizedBox.shrink(), // Show SizedBox if widget.image is null
                    widget.image != "null" ?
                    InkWell(
                      onTap: () {
                        Get.dialog(CustomDialog(title: widget.title!, desc: widget.details!));
                      },
                      child: Container(
                        width: Get.width,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 25),
                                child: Text(widget.title ?? "",
                                  textAlign: TextAlign.center,
                                  style: railway.copyWith( height: 1.3,fontSize: 20, fontWeight: FontWeight.w600),
                                ),
                              ),
                              const SizedBox(height: 12),
                              widget.details != null ?
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 25),
                                child: Text(
                                  '${HtmlTags.removeTag(htmlString: widget.details ?? "")}',
                                  style: poppins.copyWith(fontSize: 14),
                                  // maxLines: 1,
                                  textAlign: TextAlign.center,
                                  // overflow: TextOverflow.ellipsis,
                                ),
                              )
                                  : const SizedBox(),
                              const SizedBox(height: 6),
                              Text("Read More".toUpperCase(),
                                style: railwaybold.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: gold,
                                    fontSize: 10,
                                    decoration: TextDecoration.underline),
                              ),
                              const SizedBox(height: 0),
                            ],
                          ),
                        ),
                      ),
                    )
                    : SizedBox.shrink(),
                    const SizedBox(height: 15),
                  ],
                ),

                //// =============================================

                const SizedBox(height: 10),
                GetBuilder<CategoryPageController>(
                    autoRemove: false,
                    builder: (catetoryController) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: SizedBox(
                          // color: Colors.pinkAccent,
                          height: 40,
                          child: Row(
                            children: [
                              Expanded(
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 1,
                                  itemBuilder: (context, index) {
                                    return Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 3, right: 3),
                                          // Add some spacing between items
                                          child: InkWell(
                                            onTap: () {
                                              if (widget.page == AppConstants.SECTION ||
                                                  widget.page == AppConstants.SUBSECTION ||
                                                  widget.page == AppConstants.CHILDSECTION) {
                                                showDialog(
                                                    context: context,
                                                    builder: (ctx){
                                                      return SectionFilterPageDialog(
                                                          filterModel: controller.sectionProductFilterModel,
                                                          id: widget.id,
                                                          pageId: widget.pageId,
                                                          title: widget.title
                                                      );
                                                    }
                                                );
                                              }
                                              else if (widget.page == AppConstants.sellPro) {
                                                showDialog(
                                                    context: context,
                                                    builder: (ctx){
                                                      return SellSectionFilterPageDialog(
                                                        filterModel: controller.sellProductFilterTermModel,
                                                        id: widget.id,
                                                        pageId: widget.pageId,
                                                        discountText: widget.discountText,
                                                        sizeText: widget.sizeText,
                                                        brandText: widget.brandText,
                                                        categoryText: widget.categoryText,
                                                      );
                                                    }
                                                );
                                              }

                                              else if (widget.page == AppConstants.mostPopular) {
                                                showDialog(
                                                    context: context,
                                                    builder: (ctx){
                                                      return MostPupularFilterPageDialog(
                                                        filterModel: controller.mostPopularFilterTermModel,
                                                        id: widget.id,
                                                        // pageId: widget.pageId,
                                                      );
                                                    }
                                                );
                                              }

                                              else if (widget.page == AppConstants.search) {
                                                showDialog(
                                                    context: context,
                                                    builder: (ctx){
                                                      return SearchFilterPageDialog(
                                                        filterModel: controller.searchPoductFilterTermModel,
                                                        searchCon: widget.searchCon,
                                                        // pageId: widget.pageId,
                                                      );
                                                    }
                                                );
                                              }

                                              else if (widget.page == AppConstants.newIn) {
                                                showDialog(
                                                    context: context,
                                                    builder: (ctx){
                                                      return SectionNewInFilterPageDialog(
                                                        filterModel: controller.sectionNewInProductFilterModel,
                                                        id: widget.id,
                                                        pageId: widget.pageId,
                                                        title: widget.title,
                                                      );
                                                    }
                                                );
                                              }

                                              else if (widget.page == AppConstants.CATEGORY) {
                                                showDialog(
                                                    context: context,
                                                    builder: (ctx){
                                                      return CategoryFilterPageDialog(
                                                        filterModel: controller.categoryProductFilterTermModel,
                                                        id: widget.id,
                                                        title: widget.title,
                                                        // pageId: widget.pageId,
                                                      );
                                                    }
                                                );
                                              }

                                              else if (widget.page == AppConstants.menShop) {
                                                showDialog(
                                                    context: context,
                                                    builder: (ctx){
                                                      return PeopleFilterPageDialog(
                                                        filterModel: mainController.multipleSectionProductFilterModel,
                                                        pageId: widget.pageId,
                                                        sectionId: widget.sectionId,
                                                        title: widget.title,
                                                      );
                                                    }
                                                );
                                              }

                                              else if (widget.page == AppConstants.SUBCATEGORY) {
                                                showDialog(
                                                    context: context,
                                                    builder: (ctx){
                                                      return SubCategoryFilterPageDialog(
                                                        filterModel: controller.subCategoryProductFilterModel,
                                                        id: widget.id,
                                                        title: widget.title,
                                                      );
                                                    }
                                                );
                                              }

                                              else if (widget.page == AppConstants.brandType) {
                                                showDialog(
                                                    context: context,
                                                    builder: (ctx){
                                                      return BrandTypeFilterPageDialog(
                                                        filterModel: controller.brandTypeProductFilterModel,
                                                        id: widget.id,
                                                        pageId: widget.pageId,
                                                      );
                                                    }
                                                );
                                              }

                                              else if (widget.page == AppConstants.CHILDCATEGORY) {
                                                showDialog(
                                                    context: context,
                                                    builder: (ctx){
                                                      return ChildCategoryFilterPageDialog(
                                                        filterModel: controller.childCategoryProductFilterModel,
                                                        id: widget.id,
                                                        title: widget.title,
                                                      );
                                                    }
                                                );
                                              }

                                              else if (widget.page == AppConstants.BRAND) {
                                                showDialog(
                                                    context: context,
                                                    builder: (ctx){
                                                      return BrandFilterPageDialog(
                                                        filterModel: controller.brandProductFilterTermModel,
                                                        id: widget.id,
                                                        pageId: widget.pageId,
                                                      );
                                                    }
                                                );
                                              }

                                              changeColor();
                                              setState(() {});
                                            },
                                            child: Container(
                                              // width: 80,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                // color: Colors.greenAccent,
                                                  borderRadius:
                                                  BorderRadius.circular(3),
                                                  color: buttonColor,
                                                  border: Border.all(
                                                    color: Colors.grey,
                                                    width: 1,
                                                  )),
                                              // margin: EdgeInsets.all(10),
                                              // padding: EdgeInsets.all(5),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 4,
                                                    right: 8,
                                                    top: 2,
                                                    bottom: 2),
                                                child: Center(
                                                    child: Row(
                                                      children: [
                                                        SizedBox(
                                                          // color: Colors.blue,
                                                            height: 35,
                                                            width: 35,
                                                            child: Image.asset(
                                                              Images.filter,
                                                              color: buttontextColor,
                                                            )),
                                                        const SizedBox(width: 5),
                                                        Text(
                                                          'Filter'.toUpperCase(),
                                                          style: poppins.copyWith(
                                                              color: buttontextColor,
                                                              fontSize: 12,
                                                              fontWeight:
                                                              FontWeight.w600),
                                                        ),
                                                        // Text('${brandlist[index]}'.toUpperCase(), style: robotoRegular.copyWith(color: Colors.black, fontSize: 10),),
                                                      ],
                                                    )),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 3, right: 3),
                                          // Add some spacing between items
                                          child: InkWell(
                                            onTap: () {
                                              if (widget.page == AppConstants.SECTION ||
                                                  widget.page == AppConstants.SUBSECTION ||
                                                  widget.page == AppConstants.CHILDSECTION) {
                                                showModalBottomSheet(
                                                  context: context,
                                                  builder: (BuildContext context) {
                                                    return SectionSortPopup(
                                                        id: widget.id,
                                                        pageId: widget.pageId,
                                                        sectionId: widget.sectionId
                                                    );
                                                  },
                                                );
                                              }

                                              else if (widget.page == AppConstants.newIn) {
                                                showModalBottomSheet(
                                                  context: context,
                                                  builder: (BuildContext context) {
                                                    return NewInSortPopup(
                                                      id: widget.id,
                                                      pageId: widget.pageId,
                                                    );
                                                  },
                                                );
                                              }

                                              else if (widget.page == AppConstants.sellPro) {
                                                showModalBottomSheet(
                                                  context: context,
                                                  builder: (BuildContext context) {
                                                    return SellSortPopup(
                                                      pageId: widget.pageId,
                                                    );
                                                  },
                                                );
                                              }

                                              else if (widget.page == AppConstants.menShop) {
                                                showModalBottomSheet(
                                                  context: context,
                                                  builder: (BuildContext context) {
                                                    return PeopleSortPopup(
                                                        pageId: widget.pageId,
                                                        sectionId: widget.sectionId
                                                    );
                                                  },
                                                );
                                              }

                                              else if(widget.page == AppConstants.CATEGORY){
                                                showModalBottomSheet(
                                                  context: context,
                                                  builder: (BuildContext context) {
                                                    return CategorySortPopup(
                                                      id: widget.id,
                                                    );
                                                  },
                                                );
                                              }

                                              else if(widget.page == AppConstants.mostPopular){
                                                showModalBottomSheet(
                                                  context: context,
                                                  builder: (BuildContext context) {
                                                    return MostPopularSortPopup(
                                                      id: widget.id,
                                                    );
                                                  },
                                                );
                                              }

                                              else if (widget.page == AppConstants.CHILDCATEGORY) {
                                                showModalBottomSheet(
                                                  context: context,
                                                  builder: (BuildContext context) {
                                                    return ChildCategorySortPopup(
                                                      id: widget.id,
                                                    );
                                                  },
                                                );
                                              }

                                              else if (widget.page == AppConstants.BRAND) {
                                                showModalBottomSheet(
                                                  context: context,
                                                  builder: (BuildContext context) {
                                                    return BrandCategorySortPopup(
                                                      id: widget.id,
                                                    );
                                                  },
                                                );
                                              }

                                              else if (widget.page == AppConstants.search) {
                                                showModalBottomSheet(
                                                  context: context,
                                                  builder: (BuildContext context) {
                                                    return SearchSortPopup(
                                                      searchCon: widget.searchCon,
                                                    );
                                                  },
                                                );
                                              }

                                              else if(widget.page == AppConstants.brandType){
                                                showModalBottomSheet(
                                                  context: context,
                                                  builder: (BuildContext context) {
                                                    return CategorySortPopup(
                                                      id: widget.id,
                                                    );
                                                  },
                                                );
                                              }

                                              else if(widget.page == AppConstants.SUBCATEGORY){
                                                showModalBottomSheet(
                                                  context: context,
                                                  builder: (BuildContext context) {
                                                    return SubCategorySortPopup(
                                                      id: widget.id,
                                                    );
                                                  },
                                                );
                                              }

                                              changeColor2();
                                              setState(() {});
                                            },
                                            child: Container(
                                              // width: 80,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                // color: Colors.greenAccent,
                                                  borderRadius:
                                                  BorderRadius.circular(3),
                                                  color: buttonColor2,
                                                  border: Border.all(
                                                    color: Colors.grey,
                                                    width: 1,
                                                  )),
                                              // margin: EdgeInsets.all(10),
                                              // padding: EdgeInsets.all(5),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 4,
                                                    right: 8,
                                                    top: 2,
                                                    bottom: 2),
                                                child: Center(
                                                    child: Row(
                                                      children: [
                                                        SizedBox(
                                                          // color: Colors.blue,
                                                            height: 20,
                                                            width: 30,
                                                            child: Image.asset(
                                                              Images.swap,
                                                              color: buttontextColor2,
                                                            )),
                                                        const SizedBox(width: 5),
                                                        Text(
                                                          'Sort'.toUpperCase(),
                                                          style: poppins.copyWith(
                                                              color: buttontextColor2,
                                                              fontSize: 12,
                                                              fontWeight:
                                                              FontWeight.w600),
                                                        ),
                                                        // Text('${brandlist[index]}'.toUpperCase(), style: robotoRegular.copyWith(color: Colors.black, fontSize: 10),),
                                                      ],
                                                    )),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),

                const SizedBox(height: 10),

                /// ====/@ Body

                if (widget.page == AppConstants.SECTION ||
                    widget.page == AppConstants.SUBSECTION ||
                    widget.page == AppConstants.CHILDSECTION) ...{

                  /// ====/@ Section Page View @/====

                  if(controller.isLoading) const ProductShimmer()
                  else
                    if(controller.productsFound)
                      Column(
                      children: [
                        Text(
                          "Showing ${controller?.sectionHomepageList.length ?? 0} results",
                          style: poppins.copyWith(
                              fontSize: 10, color: Colors.grey),
                        ),
                        const SizedBox(height: 12),
                        Padding(
                            padding: const EdgeInsets.only(left: 12, right: 12),
                            child: GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 15,
                                crossAxisSpacing: 10,
                                childAspectRatio: 0.5,
                              ),
                              itemCount: controller?.sectionHomepageList.length ?? 0,
                              // Since you want only one item per GridView, set itemCount to 1
                              itemBuilder: (BuildContext context, int index) {
                                bool isWished=Get.find<WishlistController>().getCheckWishlisted(controller.sectionHomepageList?[index]?.id?.toString()??"");
                                List<String> productImage=[];
                                String? pic1= controller?.sectionHomepageList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.frontPhoto;
                                String? pic2=controller?.sectionHomepageList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.backsidePhoto;
                                String? pic3=controller?.sectionHomepageList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.details1Photo;
                                String? pic4=controller?.sectionHomepageList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.details2Photo;
                                String? pic5=controller?.sectionHomepageList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.outfitPhoto;

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

                                return Container(
                                  // color: Colors.deepPurpleAccent,
                                  color: const Color(0xffFAFBFB),
                                  child: InkWell(
                                    onTap: () {
                                      Get.to(ProductDetailsPage(
                                        productId: controller!.sectionHomepageList[index].id.toString(),
                                        brandId: controller.sectionHomepageList[index]?.brandId?.toString(),
                                        childCategorieId: mainController.sectionHomepageList?.map<int>((item){
                                          return item.childCategories?[index]?.childCategoryProduct?.childCategoryId ?? 0;
                                        }).toList(),
                                        // childCategorieId: controller.sectionHomepageList[index].childCategories?[0].childCategoryProduct?.childCategoryId ?? 0,
                                        pageId: controller.sectionHomepageList[index]?.pages?[controller.sectedColorVAriantIndex]?.pageProduct?.pageId!.toString(),
                                      ));
                                    },
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: Get.height / 3.2,
                                          child: Stack(
                                            alignment: Alignment.topCenter,
                                            children: [
                                              CarouselSlider(
                                                items: productImage.map((i) {
                                                  return Builder(
                                                    builder: (BuildContextcontext) {
                                                      return Container(
                                                        decoration: const BoxDecoration(
                                                          color: Color(0xffFBFBFB),),
                                                        child: ClipRRect(
                                                          child: CustomImageCached(
                                                            image: '${AppConstants.BASE_URL}$i',
                                                            fit: BoxFit.fill,
                                                            isRound: false,),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                }).toList(),
                                                options: CarouselOptions(
                                                  disableCenter: true,
                                                  viewportFraction: 1,
                                                  autoPlayInterval:
                                                  const Duration(seconds: 7),
                                                  height: Get.height / 2.4,
                                                  scrollDirection: Axis.horizontal,
                                                  onPageChanged: (index, reason) {
                                                    setState(() {
                                                      currentIndex = index; // If you want to track carousel index separately
                                                    });
                                                  },
                                                ),
                                              ),
                                              /// required
                     /*                         Positioned(
                                                bottom: 20,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    for (int i = 0; i < productImage.length; i++)
                                                      TabPageSelectorIndicator(
                                                        backgroundColor: i == currentIndex ? gold : silvercolor,
                                                        borderColor: i == currentIndex ? gold : silvercolor,
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
                                                      child: controller?.sectionHomepageList[index].season != null ?
                                                      Center(
                                                        child: Text((controller?.sectionHomepageList[index].season?.seasonName ?? "").toUpperCase(),
                                                          style: poppins.copyWith(
                                                              color: Colors.black,
                                                              fontSize: 9
                                                          ),
                                                        ),
                                                      ) : const SizedBox(),
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
                                                          product_id: controller?.sectionHomepageList[index].id?.toString()??"",
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
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(5),
                                                    child: isWished? Image.asset(Images.unwished, height: 20, color: gold,
                                                    )
                                                    : Image.asset(Images.wish, height: 20, color: silvercolor,
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
                                                        return SimilarPopup(id: controller?.sectionHomepageList[index]!.childCategories![0]?.childCategoryProduct!.childCategoryId ?? 0,);
                                                      },
                                                    );
                                                  },
                                                  child: SizedBox(
                                                    height: 30,
                                                    width: 30,
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(5),
                                                      child: Image.asset(Images.similar,
                                                          color: silvercolor,
                                                          height: 20,
                                                          width: 20),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 5),
                                          child: Center(
                                            child: Text(controller.sectionHomepageList[index].brand?.brandName ?? "".toUpperCase(),
                                              maxLines: 1,
                                              style: railway.copyWith(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                        // Padding(
                                        //   padding: const EdgeInsets.symmetric(horizontal: 5),
                                        //   child: Center(
                                        //     child: Text((controller?.sectionHomepageList[index].brand?.brandName ?? "").toUpperCase(),
                                        //       maxLines: 1,
                                        //       style: railway.copyWith(
                                        //           fontSize: 16,
                                        //           fontWeight: FontWeight.w600),
                                        //     ),
                                        //   ),
                                        // ),
                                        const SizedBox(height: 5),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 4),
                                          child: Text(
                                            controller?.sectionHomepageList[index].name ?? "",
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: poppins.copyWith(
                                                fontWeight: FontWeight.w200,
                                                fontSize: 12,
                                                color: Colors.black
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 5),

                                        /// main
                                        controller?.sectionHomepageList[index].discount == null || controller?.sectionHomepageList[index].discount == 0
                                            ? Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 4),
                                          child: Text(
                                            "${controller?.sectionHomepageList[index].price ?? ''} BDT",
                                            style: poppins.copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: gold,
                                                fontSize: 12
                                            ),
                                          ),
                                        )
                                            : Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 4),
                                          child: Column(
                                            children: [
                                              Text(
                                                "${controller?.sectionHomepageList[index].discountedPrice ?? ''} BDT",
                                                style: poppins.copyWith(
                                                    fontWeight: FontWeight.w600,
                                                    color: gold,
                                                    fontSize: 12
                                                ),
                                              ),
                                              const SizedBox(height: 4),
                                              Text(
                                                "${controller?.sectionHomepageList[index].price ?? ''} BDT",
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
                        ),
                      ],
                    )
                    else const SizedBox(height: 100, child: Center(child: Text('Product Not Found')))
                }


                /// ====/@ Category Page View @/====
                else if (widget.page == AppConstants.CATEGORY) ...{

                  if(controller.isLoading) const ProductShimmer()
                  else if(controller.productsFound)
                    Column(
                      children: [
                        Text(
                          "Showing ${controller?.categoryProductList.length ?? 0} results",
                          style: poppins.copyWith(
                              fontSize: 10, color: Colors.grey),
                        ),
                        const SizedBox(height: 12),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 12, right: 12),
                            child: GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 15,
                                crossAxisSpacing: 10,
                                childAspectRatio: 0.5,
                              ),
                              itemCount: controller?.categoryProductList.length ?? 0,
                              // Since you want only one item per GridView, set itemCount to 1
                              itemBuilder: (BuildContext context, int index) {
                                bool isWished=Get.find<WishlistController>().getCheckWishlisted(controller.categoryProductList?[index]?.id?.toString()??"");
                                List<String> productImage=[];
                                String? pic1= controller?.categoryProductList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.frontPhoto;
                                String? pic2=controller?.categoryProductList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.backsidePhoto;
                                String? pic3=controller?.categoryProductList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.details1Photo;
                                String? pic4=controller?.categoryProductList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.details2Photo;
                                String? pic5=controller?.categoryProductList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.outfitPhoto;

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
                                return Container(
                                  // color: Colors.deepPurpleAccent,
                                  color: const Color(0xffFAFBFB),
                                  child: InkWell(
                                    onTap: () {
                                      Get.to(ProductDetailsPage(
                                        productId: controller!.categoryProductList[index].id.toString(),
                                        brandId: controller.categoryProductList[index]?.brandId?.toString(),
                                        pageId: controller.categoryProductList[index]?.pages?[controller.sectedColorVAriantIndex]?.pageProduct?.pageId!.toString(),
                                      ));
                                    },
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: Get.height / 3.2,
                                          child: Stack(
                                            alignment: Alignment.topCenter,
                                            children: [
                                              CarouselSlider(
                                                items: productImage.map((i) {
                                                  return Builder(
                                                    builder: (BuildContextcontext) {
                                                      return Container(
                                                        decoration: const BoxDecoration(
                                                          color: Color(
                                                              0xffFBFBFB),),
                                                        child: ClipRRect(
                                                          child: CustomImageCached(
                                                            image: '${AppConstants
                                                                .BASE_URL}$i',
                                                            fit: BoxFit
                                                                .fill,
                                                            isRound: false,),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                }).toList(),
                                                options: CarouselOptions(
                                                  disableCenter: true,
                                                  viewportFraction: 1,
                                                  autoPlayInterval:
                                                  const Duration(seconds: 7),
                                                  height: Get.height / 2.4,
                                                  scrollDirection: Axis.horizontal,
                                                  onPageChanged: (index, reason) {
                                                    setState(() {
                                                      currentIndex = index; // If you want to track carousel index separately
                                                    });
                                                  },
                                                ),
                                              ),
                                              /// required
                 /*                             Positioned(
                                                bottom: 20,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    for (int i = 0; i < productImage.length; i++)
                                                      TabPageSelectorIndicator(
                                                        backgroundColor: i == currentIndex ? gold : silvercolor,
                                                        borderColor: i == currentIndex ? gold : silvercolor,
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
                                                      child: controller?.categoryProductList[index].season != null ?
                                                      Text((controller?.categoryProductList[index].season?.seasonName ?? "").toUpperCase(),
                                                        style: poppins.copyWith(
                                                            color: Colors.black,
                                                            fontSize: 9
                                                        ),
                                                      ) : const SizedBox(),
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
                                                        var customerId = await Get.find<AuthController>().getUserId();
                                                        await Get.find<WishlistController>().AddtoWishlist(
                                                          product_id: widget.controller2?.sectionHomepageList[index].id?.toString()??"",
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
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(5),
                                                    child: isWished? Image.asset(Images.unwished, height: 20, color: gold,
                                                    )
                                                        : Image.asset(Images.wish, height: 20, color: silvercolor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                   /*
                                              Positioned(
                                                top: 10,
                                                right: 10,
                                                child: InkWell(
                                                  onTap: () async {
                                                    try {
                                                      var deviceID = await Get.find<AuthController>().getDeviceID();
                                                      var customerId = await Get.find<AuthController>().getUserId();
                                                      await Get.find<WishlistController>().AddtoWishlist(
                                                        product_id: widget.controller2?.sectionHomepageList[index].id?.toString()??"",
                                                        customer_id: customerId,
                                                        corelation_id: deviceID,
                                                      );
                                                    } catch (e) {
                                                      // Handle any errors that might occur during the asynchronous operation
                                                      print("Error: $e");
                                                    }
                                                  },

                                                  child: Padding(
                                                    padding: const EdgeInsets.all(5),
                                                    child: Image.asset(
                                                      Images.wish,
                                                      height: 20,
                                                      color:  gold,
                                                    ),
                                                  ),
                                                ),
                                              ),*/
                                              Positioned(
                                                top: 10,
                                                left: 10,
                                                child: InkWell(
                                                  onTap: () {
                                                    showModalBottomSheet(
                                                      context: context,
                                                      builder: (
                                                          BuildContext context) {
                                                        return SimilarPopup(id: controller?.categoryProductList[index]!.childCategories![0]?.childCategoryProduct!.childCategoryId ?? 0,);
                                                      },
                                                    );
                                                  },
                                                  child: SizedBox(
                                                    height: 30,
                                                    width: 30,
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(5),
                                                      child: Image.asset(Images.similar,
                                                          color: silvercolor,
                                                          height: 20,
                                                          width: 20),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 5),
                                          child: Center(
                                            child: Text(controller?.categoryProductList[index].brand?.brandName ?? "".toUpperCase(),
                                              maxLines: 1,
                                              style: railway.copyWith(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                    /*                    Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 25),
                                          child: Text(
                                            (controller?.categoryProductList[index].brand?.brandName ?? "").toUpperCase(),
                                            maxLines: 1,
                                            style: railway.copyWith(
                                                fontSize: 16,
                                                fontWeight: FontWeight
                                                    .w600),
                                          ),
                                        ),*/
                                        const SizedBox(height: 5),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 4),
                                          child: Text(
                                            controller?.categoryProductList[index].name ?? "",
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: poppins.copyWith(
                                                fontWeight: FontWeight.w200,
                                                fontSize: 12,
                                                color: Colors.black
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 5),

                                        /// main
                                        controller?.categoryProductList[index].discount == null || controller?.categoryProductList[index].discount == 0 ?
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 4),
                                          child: Text(
                                            "${controller?.categoryProductList[index].price ?? ''} BDT",
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
                                                "${controller?.categoryProductList[index].discountedPrice ?? ''} BDT",
                                                style: poppins.copyWith(
                                                    fontWeight: FontWeight
                                                        .w600,
                                                    color: gold,
                                                    fontSize: 12
                                                ),
                                              ),
                                              const SizedBox(height: 4),
                                              Text(
                                                "${controller?.categoryProductList[index].price ?? ''} BDT",
                                                style: poppins.copyWith(
                                                    fontWeight: FontWeight
                                                        .w600,
                                                    decoration: TextDecoration
                                                        .lineThrough,
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
                        ),
                      ],
                    )
                  else const SizedBox(height: 100, child: Center(child: Text('Product Not Found')))

                }

                /// shop by occassion
                else if (widget.page == AppConstants.SHOPBYOCCATION) ...{
                    if(controller.isLoading) const ProductShimmer()
                    else if(controller.productsFound)
                      Column(
                        children: [
                          Text(
                            "Showing ${controller.shopByOccassionDetailsResponse?.data?.result?.length ?? 0} results",
                            style: poppins.copyWith(
                                fontSize: 10, color: Colors.grey),
                          ),
                          const SizedBox(height: 12),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 12, right: 12),
                              child: GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 15,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: 0.5,
                                ),
                                // itemCount: controller.shopByOccassionDetailsResponse?.data?.result?.length ?? 0,
                                itemCount: controller.shopByOccassionDetailsResponse?.data?.result?.length??0,
                                // Since you want only one item per GridView, set itemCount to 1
                                itemBuilder: (BuildContext context, int index) {
                                  bool isWished=Get.find<WishlistController>().getCheckWishlisted(controller!.shopByOccassionDetailsResponse?.data?.result?[index].id?.toString()??"");
                                  List<String> productImage=[];
                                  String? pic1= controller.shopByOccassionDetailsResponse?.data?.result?[index].productColorVariants?[controller.sectedColorVAriantIndex]?.frontPhoto;
                                  String? pic2= controller.shopByOccassionDetailsResponse?.data?.result?[index].productColorVariants?[controller.sectedColorVAriantIndex]?.backsidePhoto;
                                  String? pic3= controller.shopByOccassionDetailsResponse?.data?.result?[index].productColorVariants?[controller.sectedColorVAriantIndex]?.details1Photo;
                                  String? pic4= controller.shopByOccassionDetailsResponse?.data?.result?[index].productColorVariants?[controller.sectedColorVAriantIndex]?.details2Photo;
                                  String? pic5= controller.shopByOccassionDetailsResponse?.data?.result?[index].productColorVariants?[controller.sectedColorVAriantIndex]?.outfitPhoto;

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
                                  return Container(
                                    // color: Colors.deepPurpleAccent,
                                    // color:  Color(0xffFAFBFB),
                                    child: InkWell(
                                      onTap: () {
                                        Get.to(ProductDetailsPage(
                                          productId: controller.shopByOccassionDetailsResponse!.data!.result![index].id.toString(),
                                          brandId: controller.shopByOccassionDetailsResponse?.data?.result?[index]?.brandId?.toString(),
                                          pageId: controller.shopByOccassionDetailsResponse?.data?.result?[index]?.pages?[controller.sectedColorVAriantIndex]?.pageProduct?.pageId!.toString(),
                                        ));
                                      },
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          // Container(height: 80, width: 80, color: Colors.red,),
                                          SizedBox(
                                            height: Get.height / 3.2,
                                            child: Stack(
                                              alignment: Alignment.topCenter,
                                              children: [
                                                CarouselSlider(
                                                  items: productImage.map((i) {
                                                    return Builder(
                                                      builder: (BuildContextcontext) {
                                                        return Container(
                                                          decoration: const BoxDecoration(
                                                            color: Color(0xffFBFBFB),),
                                                          child: ClipRRect(
                                                            child: CustomImageCached(
                                                              image: '${AppConstants.BASE_URL}$i',
                                                              fit: BoxFit.fill,
                                                              isRound: false,),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  }).toList(),
                                                  options: CarouselOptions(
                                                    disableCenter: true,
                                                    viewportFraction: 1,
                                                    autoPlayInterval:
                                                    const Duration(seconds: 7),
                                                    height: Get.height / 2.4,
                                                    scrollDirection: Axis.horizontal,
                                                    onPageChanged: (index, reason) {
                                                      setState(() {
                                                        currentIndex = index; // If you want to track carousel index separately
                                                      });
                                                    },
                                                  ),
                                                ),
                                                /// required
           /*                                     Positioned(
                                                  bottom: 20,
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      for (int i = 0; i < productImage.length; i++)
                                                        TabPageSelectorIndicator(
                                                          backgroundColor: i == currentIndex ? gold : silvercolor,
                                                          borderColor: i == currentIndex ? gold : silvercolor,
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
                                                        child: controller.shopByOccassionDetailsResponse?.data?.result?[index].season != null ?
                                                        Text((controller.shopByOccassionDetailsResponse?.data?.result?[index].season?.seasonName ?? "").toUpperCase(),
                                                          style: poppins.copyWith(
                                                              color: Colors.black,
                                                              fontSize: 9
                                                          ),
                                                        ) : const SizedBox(),
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
                                                          var customerId = await Get.find<AuthController>().getUserId();
                                                          await Get.find<WishlistController>().AddtoWishlist(
                                                            product_id: controller.shopByOccassionDetailsResponse?.data?.result?[index].id?.toString()??"",
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
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(5),
                                                      child: isWished? Image.asset(Images.unwished, height: 20, color: gold,
                                                      )
                                                          : Image.asset(Images.wish, height: 20, color: silvercolor,
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
                                                          return SimilarPopup(id: controller.shopByOccassionDetailsResponse?.data?.result?[index]!.childCategories![0]?.childCategoryProduct!.childCategoryId ?? 0,);
                                                        },
                                                      );
                                                    },
                                                    child: SizedBox(
                                                      height: 30,
                                                      width: 30,
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(5),
                                                        child: Image.asset(Images.similar,
                                                            color: silvercolor,
                                                            height: 20,
                                                            width: 20),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 5),
                                            child: Text(controller.shopByOccassionDetailsResponse?.data?.result?[index].brand?.brandName ?? "".toUpperCase(),
                                              maxLines: 1,
                                              style: railway.copyWith(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 4),
                                            child: Text(
                                              controller.shopByOccassionDetailsResponse?.data?.result?[index].name ?? "",
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: poppins.copyWith(
                                                  fontWeight: FontWeight.w200,
                                                  fontSize: 12,
                                                  color: Colors.black
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          /// main
                                          controller.shopByOccassionDetailsResponse?.data?.result?[index].discount == null || controller.shopByOccassionDetailsResponse?.data?.result?[index].discount == 0 ?
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 4),
                                            child: Text(
                                              "${controller.shopByOccassionDetailsResponse?.data?.result?[index].price ?? ''} BDT",
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
                                                  "${controller.shopByOccassionDetailsResponse?.data?.result?[index].discountedPrice ?? ''} BDT",
                                                  style: poppins.copyWith(
                                                      fontWeight: FontWeight
                                                          .w600,
                                                      color: gold,
                                                      fontSize: 12
                                                  ),
                                                ),
                                                const SizedBox(height: 4),
                                                Text(
                                                  "${controller.shopByOccassionDetailsResponse?.data?.result?[index].price ?? ''} BDT",
                                                  style: poppins.copyWith(
                                                      fontWeight: FontWeight
                                                          .w600,
                                                      decoration: TextDecoration
                                                          .lineThrough,
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
                          ),
                        ],
                      )
                    else const SizedBox(height: 100, child: Center(child: Text('Product Not Found')))
                  }

                  /// ====/@ New In Page View @/====
                  else
                    if (widget.page == AppConstants.newIn) ...{

                      if(controller.isLoading) const ProductShimmer()
                      else
                        if(controller.productsFound)
                          Column(
                            children: [
                              Text(
                                "Showing ${controller?.sectionNewInList.length ?? 0} results",
                                style: poppins.copyWith(
                                    fontSize: 10, color: Colors.grey),
                              ),
                              const SizedBox(height: 12),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12, right: 12),
                                  child: GridView.builder(
                                    physics: const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 15,
                                      crossAxisSpacing: 10,
                                      childAspectRatio: 0.5,
                                    ),
                                    itemCount: controller?.sectionNewInList.length ?? 0,
                                    // Since you want only one item per GridView, set itemCount to 1
                                    itemBuilder: (BuildContext context, int index) {
                                      bool isWished=Get.find<WishlistController>().getCheckWishlisted(controller.sectionNewInList?[index]?.id?.toString()??"");
                                      List<String> productImage=[];
                                      String? pic1= controller?.sectionNewInList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.frontPhoto;
                                      String? pic2=controller?.sectionNewInList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.backsidePhoto;
                                      String? pic3=controller?.sectionNewInList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.details1Photo;
                                      String? pic4=controller?.sectionNewInList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.details2Photo;
                                      String? pic5=controller?.sectionNewInList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.outfitPhoto;

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
                                      return Container(
                                        // color: Colors.deepPurpleAccent,
                                        color: const Color(0xffFAFBFB),
                                        child: InkWell(
                                          onTap: () {
                                            Get.to(ProductDetailsPage(
                                              productId: controller!.sectionNewInList[index].id.toString(),
                                              brandId: controller.sectionNewInList[index]?.brandId?.toString(),
                                              pageId: controller.sectionNewInList[index]?.pages?[controller.sectedColorVAriantIndex]?.pageProduct?.pageId!.toString(),
                                            ));
                                          },
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: Get.height / 3.2,
                                                child: Stack(
                                                  alignment: Alignment.topCenter,
                                                  children: [
                                                    CarouselSlider(
                                                      items: productImage.map((i) {
                                                        return Builder(
                                                          builder: (BuildContextcontext) {
                                                            return Container(
                                                              decoration: const BoxDecoration(
                                                                color: Color(0xffFBFBFB),),
                                                              child: ClipRRect(
                                                                child: CustomImageCached(
                                                                  image: '${AppConstants.BASE_URL}$i',
                                                                  fit: BoxFit.fill,
                                                                  isRound: false,),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      }).toList(),
                                                      options: CarouselOptions(
                                                        disableCenter: true,
                                                        viewportFraction: 1,
                                                        autoPlayInterval:
                                                        const Duration(seconds: 7),
                                                        height: Get.height / 2.4,
                                                        scrollDirection: Axis.horizontal,
                                                        onPageChanged: (index, reason) {
                                                          setState(() {
                                                            currentIndex = index; // If you want to track carousel index separately
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                    /// required
        /*                                            Positioned(
                                                      bottom: 20,
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          for (int i = 0; i < productImage.length; i++)
                                                            TabPageSelectorIndicator(
                                                              backgroundColor: i == currentIndex ? gold : silvercolor,
                                                              borderColor: i == currentIndex ? gold : silvercolor,
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
                                                            child: controller?.sectionNewInList[index].season != null ?
                                                            Text((controller?.sectionNewInList[index].season?.seasonName ?? "").toUpperCase(),
                                                              style: poppins.copyWith(
                                                                  color: Colors.black,
                                                                  fontSize: 9
                                                              ),
                                                            ) : const SizedBox(),
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
                                                              var customerId = await Get.find<AuthController>().getUserId();
                                                              await Get.find<WishlistController>().AddtoWishlist(
                                                                product_id: controller?.sectionNewInList[index].id?.toString()??"",
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
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(5),
                                                          child: isWished? Image.asset(Images.unwished, height: 20, color: gold,
                                                          )
                                                              : Image.asset(Images.wish, height: 20, color: silvercolor,
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
                                                              return SimilarPopup(id: controller?.sectionNewInList[index]!.childCategories![0]?.childCategoryProduct!.childCategoryId ?? 0,);
                                                            },
                                                          );
                                                        },
                                                        child: SizedBox(
                                                          height: 30,
                                                          width: 30,
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(5),
                                                            child: Image.asset(Images.similar,
                                                                color: silvercolor,
                                                                height: 20,
                                                                width: 20),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                                child: Text(controller.sectionNewInList[index].brand?.brandName ?? "".toUpperCase(),
                                                  maxLines: 1,
                                                  style: railway.copyWith(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w600),
                                                ),
                                              ),
                                              const SizedBox(height: 5),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 4),
                                                child: Text(
                                                  controller?.sectionNewInList[index].name ?? "",
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: poppins.copyWith(
                                                      fontWeight: FontWeight.w200,
                                                      fontSize: 12,
                                                      color: Colors.black
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 5),

                                              /// main
                                              controller?.sectionNewInList[index].discount == null || controller?.sectionNewInList[index].discount == 0
                                                  ? Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 4),
                                                child: Text(
                                                  "${controller?.sectionNewInList[index].price ?? ''} BDT",
                                                  style: poppins.copyWith(
                                                      fontWeight: FontWeight.w600,
                                                      color: gold,
                                                      fontSize: 12
                                                  ),
                                                ),
                                              )
                                                  : Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 4),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      "${controller?.sectionNewInList[index].discountedPrice ?? ''} BDT",
                                                      style: poppins.copyWith(
                                                          fontWeight: FontWeight.w600,
                                                          color: gold,
                                                          fontSize: 12
                                                      ),
                                                    ),
                                                    const SizedBox(height: 4),
                                                    Text(
                                                      "${controller?.sectionNewInList[index].price ?? ''} BDT",
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
                              ),
                            ],
                          )
                        else
                          const SizedBox(height: 100, child: Center(child: Text('Product Not Found')))

                    }

                    /// ==/@ Sell Page View
                    else
                      if (widget.page == AppConstants.sellPro) ...{

                        if(controller.isLoading) const ProductShimmer()
                        else
                          if(controller.productsFound)
                            Column(
                              children: [
                                Text("Showing ${controller?.sellProductList.length ?? 0} results",
                                  style: poppins.copyWith(
                                      fontSize: 10, color: Colors.grey),
                                ),
                                const SizedBox(height: 12),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12, right: 12),
                                    child: GridView.builder(
                                      physics: const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 15,
                                        crossAxisSpacing: 10,
                                        childAspectRatio: 0.5,
                                      ),
                                      itemCount: controller?.sellProductList.length ?? 0,
                                      // Since you want only one item per GridView, set itemCount to 1
                                      itemBuilder: (BuildContext context, int index) {
                                        bool isWished=Get.find<WishlistController>().getCheckWishlisted(controller.sellProductList?[index]?.id?.toString()??"");
                                        List<String> productImage=[];
                                        String? pic1= controller?.sellProductList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.frontPhoto;
                                        String? pic2=controller?.sellProductList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.backsidePhoto;
                                        String? pic3=controller?.sellProductList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.details1Photo;
                                        String? pic4=controller?.sellProductList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.details2Photo;
                                        String? pic5=controller?.sellProductList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.outfitPhoto;

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
                                        return Container(
                                          // color: Colors.deepPurpleAccent,
                                          color: const Color(0xffFAFBFB),
                                          child: InkWell(
                                            onTap: () {
                                              Get.to(ProductDetailsPage(
                                                productId: controller!.sellProductList[index].id.toString(),
                                                brandId: controller.sellProductList[index]?.brandId?.toString(),
                                                pageId: controller.sellProductList[index]?.pages?[controller.sectedColorVAriantIndex]?.pageProduct?.pageId!.toString(),
                                              ));
                                            },
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  height: Get.height / 3.2,
                                                  child: Stack(
                                                    alignment: Alignment.topCenter,
                                                    children: [
                                                      CarouselSlider(
                                                        items: productImage.map((i) {
                                                          return Builder(
                                                            builder: (BuildContextcontext) {
                                                              return Container(
                                                                decoration: const BoxDecoration(
                                                                  color: Color(0xffFBFBFB),),
                                                                child: ClipRRect(
                                                                  child: CustomImageCached(
                                                                    image: '${AppConstants.BASE_URL}$i',
                                                                    fit: BoxFit.fill,
                                                                    isRound: false,),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        }).toList(),
                                                        options: CarouselOptions(
                                                          disableCenter: true,
                                                          viewportFraction: 1,
                                                          autoPlayInterval:
                                                          const Duration(seconds: 7),
                                                          height: Get.height / 2.4,
                                                          scrollDirection: Axis.horizontal,
                                                          onPageChanged: (index, reason) {
                                                            setState(() {
                                                              currentIndex = index; // If you want to track carousel index separately
                                                            });
                                                          },
                                                        ),
                                                      ),
                                                      /// required
               /*                                       Positioned(
                                                        bottom: 20,
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            for (int i = 0; i < productImage.length; i++)
                                                              TabPageSelectorIndicator(
                                                                backgroundColor: i == currentIndex ? gold : silvercolor,
                                                                borderColor: i == currentIndex ? gold : silvercolor,
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
                                                              child: controller?.sellProductList[index].season != null ?
                                                              Text((controller?.sellProductList[index].season?.seasonName ?? "").toUpperCase(),
                                                                style: poppins.copyWith(
                                                                    color: Colors.black,
                                                                    fontSize: 9
                                                                ),
                                                              ) : const SizedBox(),
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
                                                                var customerId = await Get.find<AuthController>().getUserId();
                                                                await Get.find<WishlistController>().AddtoWishlist(
                                                                  product_id: controller?.sellProductList[index].id?.toString()??"",
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
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(5),
                                                            child: isWished? Image.asset(Images.unwished, height: 20, color: gold,
                                                            )
                                                                : Image.asset(Images.wish, height: 20, color: silvercolor,
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
                                                                return SimilarPopup(id: controller?.sellProductList[index]!.childCategories![0]?.childCategoryProduct!.childCategoryId ?? 0,);
                                                              },
                                                            );
                                                          },
                                                          child: SizedBox(
                                                            height: 30,
                                                            width: 30,
                                                            child: Padding(
                                                              padding: const EdgeInsets.all(5),
                                                              child: Image.asset(Images.similar,
                                                                  color: silvercolor,
                                                                  height: 20,
                                                                  width: 20),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(height: 8),
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 5),
                                                  child: Text(controller.sellProductList[index].brand?.name ?? "".toUpperCase(),
                                                    maxLines: 1,
                                                    style: railway.copyWith(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w600),
                                                  ),
                                                ),
                                                const SizedBox(height: 5),
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 4),
                                                  child: Text(
                                                    controller?.sellProductList[index].name ?? "",
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    style: poppins.copyWith(
                                                        fontWeight: FontWeight.w200,
                                                        fontSize: 12,
                                                        color: Colors.black
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(height: 5),

                                                /// main
                                                controller?.sellProductList[index].discount == null || controller?.sellProductList[index].discount == 0 ?
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 4),
                                                  child: Text(
                                                    "${controller?.sellProductList[index].price ?? ''} BDT",
                                                    style: poppins.copyWith(
                                                        fontWeight: FontWeight.w600,
                                                        color: gold,
                                                        fontSize: 12
                                                    ),
                                                  ),
                                                ) :
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 4),
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        "${controller?.sellProductList[index].discountedPrice ?? ''} BDT",
                                                        style: poppins.copyWith(
                                                            fontWeight: FontWeight.w600,
                                                            color: gold,
                                                            fontSize: 12
                                                        ),
                                                      ),
                                                      const SizedBox(height: 4),
                                                      Text(
                                                        "${controller?.sellProductList[index].price ?? ''} BDT",
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
                                ),
                              ],
                            )
                          else
                            const SizedBox(height: 100, child: Center(child: Text('Product Not Found')))

                      }


                      /// ====/@ Sub Category Page View @/====
                      else
                        if (widget.page == AppConstants.SUBCATEGORY) ...{

                          if(controller.isLoading) const ProductShimmer()
                          else
                            if(controller.productsFound)
                              Column(
                                children: [
                                  Text(
                                    "Showing ${controller?.subCategoryList.length ?? 0} results",
                                    style: poppins.copyWith(
                                        fontSize: 10, color: Colors.grey),
                                  ),
                                  const SizedBox(height: 12),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          left: 12, right: 12),
                                      child: GridView.builder(
                                        physics: const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          mainAxisSpacing: 15,
                                          crossAxisSpacing: 10,
                                          childAspectRatio: 0.5,
                                        ),
                                        itemCount: controller?.subCategoryList.length ?? 0,
                                        // Since you want only one item per GridView, set itemCount to 1
                                        itemBuilder: (BuildContext context, int index) {
                                          bool isWished=Get.find<WishlistController>().getCheckWishlisted(controller.subCategoryList?[index]?.id?.toString()??"");
                                          List<String> productImage=[];
                                          String? pic1= controller?.subCategoryList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.frontPhoto;
                                          String? pic2=controller?.subCategoryList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.backsidePhoto;
                                          String? pic3=controller?.subCategoryList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.details1Photo;
                                          String? pic4=controller?.subCategoryList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.details2Photo;
                                          String? pic5=controller?.subCategoryList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.outfitPhoto;

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
                                          return Container(
                                            // color: Colors.deepPurpleAccent,
                                            color: const Color(0xffFAFBFB),
                                            child: InkWell(
                                              onTap: () {
                                                Get.to(ProductDetailsPage(
                                                  productId: controller!.subCategoryList[index].id.toString(),
                                                  brandId: controller.subCategoryList[index]?.brandId?.toString(),
                                                  pageId: controller.subCategoryList[index]?.pages?[controller.sectedColorVAriantIndex]?.pageProduct?.pageId!.toString(),
                                                ));
                                              },
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    height: Get.height / 3.2,
                                                    child: Stack(
                                                      alignment: Alignment.topCenter,
                                                      children: [
                                                        CarouselSlider(
                                                          items: productImage.map((i) {
                                                            return Builder(
                                                              builder: (BuildContextcontext) {
                                                                return Container(
                                                                  decoration: const BoxDecoration(
                                                                    color: Color(
                                                                        0xffFBFBFB),),
                                                                  child: ClipRRect(
                                                                    child: CustomImageCached(
                                                                      image: '${AppConstants.BASE_URL}$i',
                                                                      fit: BoxFit.fill,
                                                                      isRound: false,),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          }).toList(),
                                                          options: CarouselOptions(
                                                            disableCenter: true,
                                                            viewportFraction: 1,
                                                            autoPlayInterval:
                                                            const Duration(seconds: 7),
                                                            height: Get.height / 2.4,
                                                            scrollDirection: Axis.horizontal,
                                                            onPageChanged: (index, reason) {
                                                              setState(() {
                                                                currentIndex = index; // If you want to track carousel index separately
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                        /// required
                           /*                             Positioned(
                                                          bottom: 20,
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              for (int i = 0; i < productImage.length; i++)
                                                                TabPageSelectorIndicator(
                                                                  backgroundColor: i == currentIndex ? gold : silvercolor,
                                                                  borderColor: i == currentIndex ? gold : silvercolor,
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
                                                                child: controller?.subCategoryList[index].season != null ?
                                                                Text((controller?.subCategoryList[index].season?.seasonName ?? "").toUpperCase(),
                                                                  style: poppins.copyWith(
                                                                      color: Colors.black,
                                                                      fontSize: 9
                                                                  ),
                                                                ) : const SizedBox(),
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
                                                                  var customerId = await Get.find<AuthController>().getUserId();
                                                                  await Get.find<WishlistController>().AddtoWishlist(
                                                                    product_id: controller?.subCategoryList[index].id?.toString()??"",
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
                                                            child: Padding(
                                                              padding: const EdgeInsets.all(5),
                                                              child: isWished? Image.asset(Images.unwished, height: 20, color: gold,
                                                              )
                                                                  : Image.asset(Images.wish, height: 20, color: silvercolor,
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
                                                                  return SimilarPopup(id: controller?.subCategoryList[index]!.childCategories![0]?.childCategoryProduct!.childCategoryId ?? 0,);
                                                                },
                                                              );
                                                            },
                                                            child: SizedBox(
                                                              height: 30,
                                                              width: 30,
                                                              child: Padding(
                                                                padding: const EdgeInsets.all(5),
                                                                child: Image.asset(Images.similar,
                                                                    color: silvercolor,
                                                                    height: 20,
                                                                    width: 20),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(height: 8),
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 5),
                                                    child: Text(controller.subCategoryList[index].brand?.brandName ?? "".toUpperCase(),
                                                      maxLines: 1,
                                                      style: railway.copyWith(
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.w600),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 5),
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 4),
                                                    child: Text(
                                                      controller?.subCategoryList[index].name ?? "",
                                                      overflow: TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                      style: poppins.copyWith(
                                                          fontWeight: FontWeight.w200,
                                                          fontSize: 12,
                                                          color: Colors.black
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 5),

                                                  /// main
                                                  controller?.subCategoryList[index].discount == null || controller?.subCategoryList[index].discount == 0 ?
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 4),
                                                    child: Text(
                                                      "${controller?.subCategoryList[index].price ?? ''} BDT",
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
                                                          "${controller?.subCategoryList[index].discountedPrice ?? ''} BDT",
                                                          style: poppins.copyWith(
                                                              fontWeight: FontWeight.w600,
                                                              color: gold,
                                                              fontSize: 12
                                                          ),
                                                        ),
                                                        const SizedBox(height: 4),
                                                        Text(
                                                          "${controller?.subCategoryList[index].price ?? ''} BDT",
                                                          style: poppins.copyWith(
                                                              fontWeight: FontWeight
                                                                  .w600,
                                                              decoration: TextDecoration
                                                                  .lineThrough,
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
                                  ),
                                ],
                              )
                            else
                              const SizedBox(height: 100, child: Center(child: Text('Product Not Found')))

                        }


                        /// ====/@ Child Category Page View @/====
                        else
                          if (widget.page == AppConstants.CHILDCATEGORY) ...{
                            if(controller.isLoading) const ProductShimmer()
                            else
                              if(controller.productsFound)
                                Column(
                                  children: [
                                    Text(
                                      "Showing ${controller?.childCategoryList.length ?? 0} results",
                                      style: poppins.copyWith(
                                          fontSize: 10, color: Colors.grey),
                                    ),
                                    const SizedBox(height: 12),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            left: 12, right: 12),
                                        child: GridView.builder(
                                          physics: const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            mainAxisSpacing: 15,
                                            crossAxisSpacing: 10,
                                            childAspectRatio: 0.5,
                                          ),
                                          itemCount: controller?.childCategoryList.length ?? 0,
                                          // Since you want only one item per GridView, set itemCount to 1
                                          itemBuilder: (BuildContext context, int index) {
                                            bool isWished=Get.find<WishlistController>().getCheckWishlisted(controller.childCategoryList?[index]?.id?.toString()??"");
                                            List<String> productImage=[];
                                            String? pic1= controller?.childCategoryList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.frontPhoto;
                                            String? pic2=controller?.childCategoryList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.backsidePhoto;
                                            String? pic3=controller?.childCategoryList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.details1Photo;
                                            String? pic4=controller?.childCategoryList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.details2Photo;
                                            String? pic5=controller?.childCategoryList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.outfitPhoto;

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
                                            return Container(
                                              // color: Colors.deepPurpleAccent,
                                              color: const Color(0xffFAFBFB),
                                              child: InkWell(
                                                onTap: () {
                                                  Get.to(ProductDetailsPage(
                                                    productId: controller!.childCategoryList[index].id.toString(),
                                                    brandId: controller.childCategoryList[index]?.brandId?.toString(),
                                                    pageId: controller.childCategoryList[index]?.pages?[controller.sectedColorVAriantIndex]?.pageProduct?.pageId!.toString(),
                                                  ));
                                                },
                                                // child: Container(height: 100, width: 200, color: Colors.red,),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                      height: Get.height / 3.2,
                                                      child: Stack(
                                                        alignment: Alignment.topCenter,
                                                        children: [
                                                          CarouselSlider(
                                                            items: productImage.map((i) {
                                                              return Builder(
                                                                builder: (BuildContextcontext) {
                                                                  return Container(
                                                                    decoration: const BoxDecoration(
                                                                      color: Color(0xffFBFBFB),),
                                                                    child: ClipRRect(
                                                                      child: CustomImageCached(
                                                                        image: '${AppConstants.BASE_URL}$i',
                                                                        fit: BoxFit.fill,
                                                                        isRound: false,),
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            }).toList(),
                                                            options: CarouselOptions(
                                                              disableCenter: true,
                                                              viewportFraction: 1,
                                                              autoPlayInterval:
                                                              const Duration(seconds: 7),
                                                              height: Get.height / 2.4,
                                                              scrollDirection: Axis.horizontal,
                                                              onPageChanged: (index, reason) {
                                                                setState(() {
                                                                  currentIndex = index; // If you want to track carousel index separately
                                                                });
                                                              },
                                                            ),
                                                          ),
                                                          /// required
                                /*                          Positioned(
                                                            bottom: 20,
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                for (int i = 0; i < productImage.length; i++)
                                                                  TabPageSelectorIndicator(
                                                                    backgroundColor: i == currentIndex ? gold : silvercolor,
                                                                    borderColor: i == currentIndex ? gold : silvercolor,
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
                                                                  child: controller?.childCategoryList[index].season != null ?
                                                                  Text((controller?.childCategoryList[index].season?.seasonName ?? "").toUpperCase(),
                                                                    style: poppins.copyWith(
                                                                        color: Colors.black,
                                                                        fontSize: 9
                                                                    ),
                                                                  ) : const SizedBox(),
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
                                                                    var customerId = await Get.find<AuthController>().getUserId();
                                                                    await Get.find<WishlistController>().AddtoWishlist(
                                                                      product_id: controller?.childCategoryList[index].id?.toString()??"",
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
                                                              child: Padding(
                                                                padding: const EdgeInsets.all(5),
                                                                child: isWished? Image.asset(Images.unwished, height: 20, color: gold,
                                                                )
                                                                    : Image.asset(Images.wish, height: 20, color: silvercolor,
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
                                                                    return SimilarPopup(id: controller?.childCategoryList[index]!.childCategories![0]?.childCategoryProduct!.childCategoryId ?? 0,);
                                                                  },
                                                                );
                                                              },
                                                              child: SizedBox(
                                                                height: 30,
                                                                width: 30,
                                                                child: Padding(
                                                                  padding: const EdgeInsets.all(5),
                                                                  child: Image.asset(Images.similar,
                                                                      color: silvercolor,
                                                                      height: 20,
                                                                      width: 20),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(height: 8),
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 5),
                                                      child: Text(controller.childCategoryList[index].brand?.brandName ?? "".toUpperCase(),
                                                        maxLines: 1,
                                                        style: railway.copyWith(
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.w600),
                                                      ),
                                                    ),
                                                    const SizedBox(height: 5),
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 4),
                                                      child: Text(
                                                        controller?.childCategoryList[index].name ?? "",
                                                        overflow: TextOverflow.ellipsis,
                                                        maxLines: 1,
                                                        style: poppins.copyWith(
                                                            fontWeight: FontWeight.w200,
                                                            fontSize: 12,
                                                            color: Colors.black
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(height: 5),

                                                    /// main
                                                    controller?.childCategoryList[index].discount == null /*|| controller?.subCategoryList[index].discount == 0 */?
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 4),
                                                      child: Text(
                                                        "${controller?.childCategoryList[index].price ?? ''} BDT",
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
                                                            "${controller?.childCategoryList[index].discountedPrice ?? ''} BDT",
                                                            style: poppins.copyWith(
                                                                fontWeight: FontWeight.w600,
                                                                color: gold,
                                                                fontSize: 12
                                                            ),
                                                          ),
                                                          const SizedBox(height: 4),
                                                          Text(
                                                            "${controller?.childCategoryList[index].price ?? ''} BDT",
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
                                    ),
                                  ],
                                )
                              else
                                const SizedBox(height: 100, child: Center(child: Text('Product Not Found')))
                          }


                          /// ====/@ Brand Page View @/====
                          else
                            if (widget.page == AppConstants.BRAND) ...{
                              if(controller.isLoading) const ProductShimmer()
                              else
                                if(controller.productsFound)
                                  Column(
                                    children: [
                                      Text(
                                        "Showing ${controller?.brandProductList.length ?? 0} results",
                                        style: poppins.copyWith(
                                            fontSize: 10, color: Colors.grey),
                                      ),
                                      const SizedBox(height: 12),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              left: 12, right: 12),
                                          child: GridView.builder(
                                            physics: const NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              mainAxisSpacing: 15,
                                              crossAxisSpacing: 10,
                                              childAspectRatio: 0.5,
                                            ),
                                            itemCount: controller?.brandProductList.length ?? 0,
                                            // Since you want only one item per GridView, set itemCount to 1
                                            itemBuilder: (BuildContext context, int index) {
                                              bool isWished=Get.find<WishlistController>().getCheckWishlisted(controller.brandProductList?[index]?.id?.toString()??"");
                                              List<String> productImage=[];
                                              String? pic1= controller?.brandProductList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.frontPhoto;
                                              String? pic2=controller?.brandProductList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.backsidePhoto;
                                              String? pic3=controller?.brandProductList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.details1Photo;
                                              String? pic4=controller?.brandProductList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.details2Photo;
                                              String? pic5=controller?.brandProductList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.outfitPhoto;

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
                                              return Container(
                                                // color: Colors.deepPurpleAccent,
                                                // color: const Color(0xffFAFBFB),
                                                child: InkWell(
                                                  onTap: () {
                                                    Get.to(ProductDetailsPage(
                                                      productId: controller!.brandProductList[index].id.toString(),
                                                      brandId: controller.brandProductList[index]?.brandId?.toString(),
                                                      pageId: controller.brandProductList[index]?.pages?[controller.sectedColorVAriantIndex]?.pageProduct?.pageId!.toString(),
                                                    ));
                                                  },
                                                  // child: Container(height: 100, width: 200, color: Colors.red,),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      SizedBox(
                                                        height: Get.height / 3.2,
                                                        child: Stack(
                                                          alignment: Alignment.topCenter,
                                                          children: [
                                                            CarouselSlider(
                                                              items: productImage.map((i) {
                                                                return Builder(
                                                                  builder: (BuildContextcontext) {
                                                                    return Container(
                                                                      decoration: const BoxDecoration(
                                                                        color: Color(
                                                                            0xffFBFBFB),),
                                                                      child: ClipRRect(
                                                                        child: CustomImageCached(
                                                                          image: '${AppConstants.BASE_URL}$i',
                                                                          fit: BoxFit.fill,
                                                                          isRound: false,),
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              }).toList(),
                                                              options: CarouselOptions(
                                                                disableCenter: true,
                                                                viewportFraction: 1,
                                                                autoPlayInterval:
                                                                const Duration(seconds: 7),
                                                                height: Get.height / 2.4,
                                                                scrollDirection: Axis.horizontal,
                                                                onPageChanged: (index, reason) {
                                                                  setState(() {
                                                                    currentIndex = index; // If you want to track carousel index separately
                                                                  });
                                                                },
                                                              ),
                                                            ),
                                                            /// required
                    /*                                        Positioned(
                                                              bottom: 20,
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: [
                                                                  for (int i = 0; i < productImage.length; i++)
                                                                    TabPageSelectorIndicator(
                                                                      backgroundColor: i == currentIndex ? gold : silvercolor,
                                                                      borderColor: i == currentIndex ? gold : silvercolor,
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
                                                                    child: controller?.brandProductList[index].season != null ?
                                                                    Text((controller?.brandProductList[index].season?.seasonName ?? "").toUpperCase(),
                                                                      style: poppins.copyWith(
                                                                          color: Colors.black,
                                                                          fontSize: 9
                                                                      ),
                                                                    ) : const SizedBox(),
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
                                                                      var customerId = await Get.find<AuthController>().getUserId();
                                                                      await Get.find<WishlistController>().AddtoWishlist(
                                                                        product_id: controller?.brandProductList[index].id?.toString()??"",
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
                                                                child: Padding(
                                                                  padding: const EdgeInsets.all(5),
                                                                  child: isWished? Image.asset(Images.unwished, height: 20, color: gold,
                                                                  )
                                                                      : Image.asset(Images.wish, height: 20, color: silvercolor,
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
                                                                      return SimilarPopup(id: controller?.brandProductList[index]!.childCategories![0]?.childCategoryProduct!.childCategoryId ?? 0,);
                                                                    },
                                                                  );
                                                                },
                                                                child: SizedBox(
                                                                  height: 30,
                                                                  width: 30,
                                                                  child: Padding(
                                                                    padding: const EdgeInsets.all(5),
                                                                    child: Image.asset(Images.similar,
                                                                        color: silvercolor,
                                                                        height: 20,
                                                                        width: 20),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(height: 8),
                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 5),
                                                        child: Text(controller.brandProductList[index].brand?.brandName ?? "".toUpperCase(),
                                                          maxLines: 1,
                                                          style: railway.copyWith(
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.w600),
                                                        ),
                                                      ),
                                                      const SizedBox(height: 5),
                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 4),
                                                        child: Text(
                                                          controller?.brandProductList[index].name ?? "",
                                                          overflow: TextOverflow.ellipsis,
                                                          maxLines: 1,
                                                          style: poppins.copyWith(
                                                              fontWeight: FontWeight.w200,
                                                              fontSize: 12,
                                                              color: Colors.black
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(height: 5),
                                              /// main
                                              controller?.brandProductList[index].discount == null || controller?.brandProductList[index].discount == 0
                                              ? Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 4),
                                              child: Text(
                                              "${controller?.brandProductList[index].price ?? ''} BDT",
                                              style: poppins.copyWith(
                                              fontWeight: FontWeight.w600,
                                              color: gold,
                                              fontSize: 12
                                              ),
                                              ),
                                              )
                                                  : Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 4),
                                              child: Column(
                                              children: [
                                              Text(
                                              "${controller?.brandProductList[index].discountedPrice ?? ''} BDT",
                                              style: poppins.copyWith(
                                              fontWeight: FontWeight.w600,
                                              color: gold,
                                              fontSize: 12
                                              ),
                                              ),
                                              const SizedBox(height: 4),
                                              Text(
                                              "${controller?.brandProductList[index].price ?? ''} BDT",
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
                                      ),
                                    ],
                                  )
                                else
                                  const SizedBox(height: 100, child: Center(child: Text('Product Not Found')))
                            }

                            /// ====/@ Search Page View @/====
                            else
                              if (widget.page == AppConstants.search) ...{
                                if(controller.isLoading) const ProductShimmer()
                                else
                                  if(controller.productsFound)
                                    Column(
                                      children: [
                                        Text(
                                          "Showing ${controller?.searchProductList.length ?? 0} results",
                                          style: poppins.copyWith(
                                              fontSize: 10, color: Colors.grey),
                                        ),
                                        const SizedBox(height: 12),
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                left: 12, right: 12),
                                            child: GridView.builder(
                                              physics: const NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                mainAxisSpacing: 15,
                                                crossAxisSpacing: 10,
                                                childAspectRatio: 0.5,
                                              ),
                                              itemCount: controller?.searchProductList.length ?? 0,
                                              // Since you want only one item per GridView, set itemCount to 1
                                              itemBuilder: (BuildContext context, int index) {
                                                bool isWished=Get.find<WishlistController>().getCheckWishlisted(controller.searchProductList?[index]?.id?.toString()??"");
                                                List<String> productImage=[];
                                                String? pic1= controller?.searchProductList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.frontPhoto;
                                                String? pic2=controller?.searchProductList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.backsidePhoto;
                                                String? pic3=controller?.searchProductList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.details1Photo;
                                                String? pic4=controller?.searchProductList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.details2Photo;
                                                String? pic5=controller?.searchProductList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.outfitPhoto;

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
                                                return Container(
                                                  // color: Colors.deepPurpleAccent,
                                                  color: const Color(0xffFAFBFB),
                                                  child: InkWell(
                                                    onTap: () {
                                                      Get.to(ProductDetailsPage(
                                                        productId: controller!.searchProductList[index].id.toString(),
                                                        brandId: controller.searchProductList[index]?.brandId?.toString(),
                                                        pageId: controller.searchProductList[index]?.pages?[controller.sectedColorVAriantIndex]?.pageProduct?.pageId!.toString(),
                                                      ));
                                                    },
                                                    // child: Container(height: 100, width: 200, color: Colors.red,),
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        SizedBox(
                                                          height: Get.height / 3.2,
                                                          child: Stack(
                                                            alignment: Alignment.topCenter,
                                                            children: [
                                                              CarouselSlider(
                                                                items: productImage.map((i) {
                                                                  return Builder(
                                                                    builder: (BuildContextcontext) {
                                                                      return Container(
                                                                        decoration: const BoxDecoration(
                                                                          color: Color(
                                                                              0xffFBFBFB),),
                                                                        child: ClipRRect(
                                                                          child: CustomImageCached(
                                                                            image: '${AppConstants.BASE_URL}$i',
                                                                            fit: BoxFit.fill,
                                                                            isRound: false,),
                                                                        ),
                                                                      );
                                                                    },
                                                                  );
                                                                }).toList(),
                                                                options: CarouselOptions(
                                                                  disableCenter: true,
                                                                  viewportFraction: 1,
                                                                  autoPlayInterval:
                                                                  const Duration(seconds: 7),
                                                                  height: Get.height / 2.4,
                                                                  scrollDirection: Axis.horizontal,
                                                                  onPageChanged: (index, reason) {
                                                                    setState(() {
                                                                      currentIndex = index; // If you want to track carousel index separately
                                                                    });
                                                                  },
                                                                ),
                                                              ),
                                                              /// required
                              /*                                Positioned(
                                                                bottom: 20,
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: [
                                                                    for (int i = 0; i < productImage.length; i++)
                                                                      TabPageSelectorIndicator(
                                                                        backgroundColor: i == currentIndex ? gold : silvercolor,
                                                                        borderColor: i == currentIndex ? gold : silvercolor,
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
                                                                      child: controller?.searchProductList[index].season != null ?
                                                                      Text((controller?.searchProductList[index].season?.seasonName ?? "").toUpperCase(),
                                                                        style: poppins.copyWith(
                                                                            color: Colors.black,
                                                                            fontSize: 9
                                                                        ),
                                                                      ) : const SizedBox(),
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
                                                                        var customerId = await Get.find<AuthController>().getUserId();
                                                                        await Get.find<WishlistController>().AddtoWishlist(
                                                                          product_id: controller?.searchProductList[index].id?.toString()??"",
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
                                                                  child: Padding(
                                                                    padding: const EdgeInsets.all(5),
                                                                    child: isWished? Image.asset(Images.unwished, height: 20, color: gold,
                                                                    )
                                                                        : Image.asset(Images.wish, height: 20, color: silvercolor,
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
                                                                        return SimilarPopup(id: controller?.searchProductList[index]!.childCategories![0]?.childCategoryProduct!.childCategoryId ?? 0,);
                                                                      },
                                                                    );
                                                                  },
                                                                  child: SizedBox(
                                                                    height: 30,
                                                                    width: 30,
                                                                    child: Padding(
                                                                      padding: const EdgeInsets.all(5),
                                                                      child: Image.asset(Images.similar,
                                                                          color: silvercolor,
                                                                          height: 20,
                                                                          width: 20),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        const SizedBox(height: 8),
                                                        Padding(
                                                          padding: const EdgeInsets.symmetric(horizontal: 5),
                                                          child: Text(controller.searchProductList[index].brand?.brandName ?? "".toUpperCase(),
                                                            maxLines: 1,
                                                            style: railway.copyWith(
                                                                fontSize: 16,
                                                                fontWeight: FontWeight.w600),
                                                          ),
                                                        ),
                                                        const SizedBox(height: 5),
                                                        Padding(
                                                          padding: const EdgeInsets.symmetric(horizontal: 4),
                                                          child: Text(
                                                            controller?.searchProductList[index].name ?? "",
                                                            overflow: TextOverflow.ellipsis,
                                                            maxLines: 1,
                                                            style: poppins.copyWith(
                                                                fontWeight: FontWeight.w200,
                                                                fontSize: 12,
                                                                color: Colors.black
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(height: 5),

                                                        /// main
                                                        controller?.searchProductList[index].discount == null /*|| controller?.subCategoryList[index].discount == 0 */?
                                                        Padding(
                                                          padding: const EdgeInsets.symmetric(horizontal: 4),
                                                          child: Text(
                                                            "${controller?.searchProductList[index].price ?? ''} BDT",
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
                                                                "${controller?.searchProductList[index].discountedPrice ?? ''} BDT",
                                                                style: poppins.copyWith(
                                                                    fontWeight: FontWeight.w600,
                                                                    color: gold,
                                                                    fontSize: 12
                                                                ),
                                                              ),
                                                              const SizedBox(height: 4),
                                                              Text(
                                                                "${controller?.searchProductList[index].price ?? ''} BDT",
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
                                        ),
                                      ],
                                    )
                                  else
                                    const SizedBox(height: 100, child: Center(child: Text('Product Not Found')))
                              }

                              else
                                if (widget.page == AppConstants.mostPopular) ...{
                                  if(controller.isLoading) const ProductShimmer()
                                  else
                                    if(controller.productsFound)
                                      Column(
                                        children: [
                                          Text(
                                            "Showing ${controller?.mostPopularList.length ?? 0} results",
                                            style: poppins.copyWith(
                                                fontSize: 10, color: Colors.grey),
                                          ),
                                          const SizedBox(height: 12),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 12, right: 12),
                                              child: GridView.builder(
                                                physics: const NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  mainAxisSpacing: 15,
                                                  crossAxisSpacing: 10,
                                                  childAspectRatio: 0.5,
                                                ),
                                                itemCount: controller?.mostPopularList.length ?? 0,
                                                // Since you want only one item per GridView, set itemCount to 1
                                                itemBuilder: (BuildContext context, int index) {
                                                  bool isWished=Get.find<WishlistController>().getCheckWishlisted(controller.mostPopularList?[index]?.id?.toString()??"");
                                                  List<String> productImage=[];
                                                  String? pic1= controller?.mostPopularList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.frontPhoto;
                                                  String? pic2=controller?.mostPopularList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.backsidePhoto;
                                                  String? pic3=controller?.mostPopularList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.details1Photo;
                                                  String? pic4=controller?.mostPopularList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.details2Photo;
                                                  String? pic5=controller?.mostPopularList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.outfitPhoto;

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
                                                  return Container(
                                                    // color: Colors.deepPurpleAccent,
                                                    color: const Color(0xffFAFBFB),
                                                    child: InkWell(
                                                      onTap: () {
                                                        Get.to(ProductDetailsPage(
                                                          productId: controller!.mostPopularList[index].id.toString(),
                                                          brandId: controller.mostPopularList[index]?.brandId?.toString(),
                                                          pageId: controller.mostPopularList[index]?.pages?[controller.sectedColorVAriantIndex]?.pageProduct?.pageId!.toString(),
                                                        ));
                                                      },
                                                      // child: Container(height: 100, width: 200, color: Colors.red,),
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [
                                                          SizedBox(
                                                            height: Get.height / 3.2,
                                                            child: Stack(
                                                              alignment: Alignment.topCenter,
                                                              children: [
                                                                CarouselSlider(
                                                                  items: productImage.map((i) {
                                                                    return Builder(
                                                                      builder: (BuildContextcontext) {
                                                                        return Container(
                                                                          decoration: const BoxDecoration(
                                                                            color: Color(
                                                                                0xffFBFBFB),),
                                                                          child: ClipRRect(
                                                                            child: CustomImageCached(
                                                                              image: '${AppConstants.BASE_URL}$i',
                                                                              fit: BoxFit.fill,
                                                                              isRound: false,),
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                  }).toList(),
                                                                  options: CarouselOptions(
                                                                    disableCenter: true,
                                                                    viewportFraction: 1,
                                                                    autoPlayInterval:
                                                                    const Duration(seconds: 7),
                                                                    height: Get.height / 2.4,
                                                                    scrollDirection: Axis.horizontal,
                                                                    onPageChanged: (index, reason) {
                                                                      setState(() {
                                                                        currentIndex = index; // If you want to track carousel index separately
                                                                      });
                                                                    },
                                                                  ),
                                                                ),
                                                                /// required
                                 /*                               Positioned(
                                                                  bottom: 20,
                                                                  child: Row(
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    children: [
                                                                      for (int i = 0; i < productImage.length; i++)
                                                                        TabPageSelectorIndicator(
                                                                          backgroundColor: i == currentIndex ? gold : silvercolor,
                                                                          borderColor: i == currentIndex ? gold : silvercolor,
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
                                                                        child: controller?.mostPopularList[index].season != null ?
                                                                        Text((controller?.mostPopularList[index].season?.seasonName ?? "").toUpperCase(),
                                                                          style: poppins.copyWith(
                                                                              color: Colors.black,
                                                                              fontSize: 9
                                                                          ),
                                                                        ) : const SizedBox(),
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
                                                                          var customerId = await Get.find<AuthController>().getUserId();
                                                                          await Get.find<WishlistController>().AddtoWishlist(
                                                                            product_id: controller?.mostPopularList[index].id?.toString()??"",
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
                                                                    child: Padding(
                                                                      padding: const EdgeInsets.all(5),
                                                                      child: isWished? Image.asset(Images.unwished, height: 20, color: gold,
                                                                      )
                                                                          : Image.asset(Images.wish, height: 20, color: silvercolor,
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
                                                                          return SimilarPopup(id: controller?.mostPopularList[index]!.childCategories![0]?.childCategoryProduct!.childCategoryId ?? 0,);
                                                                        },
                                                                      );
                                                                    },
                                                                    child: SizedBox(
                                                                      height: 30,
                                                                      width: 30,
                                                                      child: Padding(
                                                                        padding: const EdgeInsets.all(5),
                                                                        child: Image.asset(Images.similar,
                                                                            color: silvercolor,
                                                                            height: 20,
                                                                            width: 20),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          const SizedBox(height: 8),
                                                          Padding(
                                                            padding: const EdgeInsets.symmetric(horizontal: 5),
                                                            child: Text(controller.mostPopularList[index].brand?.brandName ?? "".toUpperCase(),
                                                              maxLines: 1,
                                                              style: railway.copyWith(
                                                                  fontSize: 16,
                                                                  fontWeight: FontWeight.w600),
                                                            ),
                                                          ),
                                                          const SizedBox(height: 5),
                                                          Padding(
                                                            padding: const EdgeInsets.symmetric(horizontal: 4),
                                                            child: Text(
                                                              controller?.mostPopularList[index].name ?? "",
                                                              overflow: TextOverflow.ellipsis,
                                                              maxLines: 1,
                                                              style: poppins.copyWith(
                                                                  fontWeight: FontWeight.w200,
                                                                  fontSize: 12,
                                                                  color: Colors.black
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(height: 5),

                                                          /// main
                                                          controller?.mostPopularList[index].discount == null /*|| controller?.subCategoryList[index].discount == 0 */?
                                                          Padding(
                                                            padding: const EdgeInsets.symmetric(horizontal: 4),
                                                            child: Text(
                                                              "${controller?.mostPopularList[index].price ?? ''} BDT",
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
                                                                  "${controller?.mostPopularList[index].discountedPrice ?? ''} BDT",
                                                                  style: poppins.copyWith(
                                                                      fontWeight: FontWeight.w600,
                                                                      color: gold,
                                                                      fontSize: 12
                                                                  ),
                                                                ),
                                                                const SizedBox(height: 4),
                                                                Text(
                                                                  "${controller?.mostPopularList[index].price ?? ''} BDT",
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
                                          ),
                                        ],
                                      )
                                    else
                                      const SizedBox(height: 100, child: Center(child: Text('Product Not Found')))
                                }

                                else
                                  if (widget.page == AppConstants.brandType) ...{
                                    if(controller.isLoading) const ProductShimmer()
                                    else
                                      if(controller.productsFound)
                                        Column(
                                          children: [
                                            Text(
                                              "Showing ${controller?.brandTypeList.length ?? 0} results",
                                              style: poppins.copyWith(
                                                  fontSize: 10, color: Colors.grey),
                                            ),
                                            const SizedBox(height: 12),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 12, right: 12),
                                                child: GridView.builder(
                                                  physics: const NeverScrollableScrollPhysics(),
                                                  shrinkWrap: true,
                                                  gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 2,
                                                    mainAxisSpacing: 15,
                                                    crossAxisSpacing: 10,
                                                    childAspectRatio: 0.5,
                                                  ),
                                                  itemCount: controller?.brandTypeList.length ?? 0,
                                                  // Since you want only one item per GridView, set itemCount to 1
                                                  itemBuilder: (BuildContext context, int index) {
                                                    bool isWished=Get.find<WishlistController>().getCheckWishlisted(controller.brandTypeList?[index]?.id?.toString()??"");
                                                    List<String> productImage=[];
                                                    String? pic1= controller?.brandTypeList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.frontPhoto;
                                                    String? pic2=controller?.brandTypeList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.backsidePhoto;
                                                    String? pic3=controller?.brandTypeList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.details1Photo;
                                                    String? pic4=controller?.brandTypeList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.details2Photo;
                                                    String? pic5=controller?.brandTypeList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.outfitPhoto;

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
                                                    return Container(
                                                      // color: Colors.deepPurpleAccent,
                                                      color: const Color(0xffFAFBFB),
                                                      child: InkWell(
                                                        onTap: () {
                                                          Get.to(ProductDetailsPage(
                                                            productId: controller!.brandTypeList[index].id.toString(),
                                                            brandId: controller.brandTypeList[index]?.brandId?.toString(),
                                                            pageId: controller.brandTypeList[index]?.pages?[controller.sectedColorVAriantIndex]?.pageProduct?.pageId!.toString(),
                                                          ));
                                                        },
                                                        // child: Container(height: 100, width: 200, color: Colors.red,),
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: [
                                                            SizedBox(
                                                              height: Get.height / 3.2,
                                                              child: Stack(
                                                                alignment: Alignment.topCenter,
                                                                children: [
                                                                  CarouselSlider(
                                                                    items: productImage.map((i) {
                                                                      return Builder(
                                                                        builder: (BuildContextcontext) {
                                                                          return Container(
                                                                            decoration: const BoxDecoration(
                                                                              color: Color(0xffFBFBFB),),
                                                                            child: ClipRRect(
                                                                              child: CustomImageCached(
                                                                                image: '${AppConstants.BASE_URL}$i',
                                                                                fit: BoxFit.fill,
                                                                                isRound: false,),
                                                                            ),
                                                                          );
                                                                        },
                                                                      );
                                                                    }).toList(),
                                                                    options: CarouselOptions(
                                                                      disableCenter: true,
                                                                      viewportFraction: 1,
                                                                      autoPlayInterval:
                                                                      const Duration(seconds: 7),
                                                                      height: Get.height / 2.4,
                                                                      scrollDirection: Axis.horizontal,
                                                                      onPageChanged: (index, reason) {
                                                                        setState(() {
                                                                          currentIndex = index; // If you want to track carousel index separately
                                                                        });
                                                                      },
                                                                    ),
                                                                  ),
                                                                  /// required
                       /*                                           Positioned(
                                                                    bottom: 20,
                                                                    child: Row(
                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                      children: [
                                                                        for (int i = 0; i < productImage.length; i++)
                                                                          TabPageSelectorIndicator(
                                                                            backgroundColor: i == currentIndex ? gold : silvercolor,
                                                                            borderColor: i == currentIndex ? gold : silvercolor,
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
                                                                          child: controller?.brandTypeList[index].season != null ?
                                                                          Text((controller?.brandTypeList[index].season?.seasonName ?? "").toUpperCase(),
                                                                            style: poppins.copyWith(
                                                                                color: Colors.black,
                                                                                fontSize: 9
                                                                            ),
                                                                          ) : const SizedBox(),
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
                                                                            var customerId = await Get.find<AuthController>().getUserId();
                                                                            await Get.find<WishlistController>().AddtoWishlist(
                                                                              product_id: controller?.brandTypeList[index].id?.toString()??"",
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
                                                                      child: Padding(
                                                                        padding: const EdgeInsets.all(5),
                                                                        child: isWished? Image.asset(Images.unwished, height: 20, color: gold,
                                                                        )
                                                                            : Image.asset(Images.wish, height: 20, color: silvercolor,
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
                                                                            return SimilarPopup(id: controller?.brandTypeList[index]!.childCategories![0]?.childCategoryProduct!.childCategoryId ?? 0,);
                                                                          },
                                                                        );
                                                                      },
                                                                      child: SizedBox(
                                                                        height: 30,
                                                                        width: 30,
                                                                        child: Padding(
                                                                          padding: const EdgeInsets.all(5),
                                                                          child: Image.asset(Images.similar,
                                                                              color: silvercolor,
                                                                              height: 20,
                                                                              width: 20),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            const SizedBox(height: 8),
                                                            Padding(
                                                              padding: const EdgeInsets.symmetric(horizontal: 5),
                                                              child: Text(controller.brandTypeList[index].brand?.brandName ?? "".toUpperCase(),
                                                                maxLines: 1,
                                                                style: railway.copyWith(
                                                                    fontSize: 16,
                                                                    fontWeight: FontWeight.w600),
                                                              ),
                                                            ),
                                                            const SizedBox(height: 5),
                                                            Padding(
                                                              padding: const EdgeInsets.symmetric(horizontal: 4),
                                                              child: Text(
                                                                controller?.brandTypeList[index].name ?? "",
                                                                overflow: TextOverflow.ellipsis,
                                                                maxLines: 1,
                                                                style: poppins.copyWith(
                                                                    fontWeight: FontWeight.w200,
                                                                    fontSize: 12,
                                                                    color: Colors.black
                                                                ),
                                                              ),
                                                            ),
                                                            const SizedBox(height: 5),

                                                            /// main
                                                            controller?.brandTypeList[index].discount == null /*|| controller?.subCategoryList[index].discount == 0 */?
                                                            Padding(
                                                              padding: const EdgeInsets.symmetric(horizontal: 4),
                                                              child: Text(
                                                                "${controller?.brandTypeList[index].price ?? ''} BDT",
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
                                                                    "${controller?.brandTypeList[index].discountedPrice ?? ''} BDT",
                                                                    style: poppins.copyWith(
                                                                        fontWeight: FontWeight.w600,
                                                                        color: gold,
                                                                        fontSize: 12
                                                                    ),
                                                                  ),
                                                                  const SizedBox(height: 4),
                                                                  Text(
                                                                    "${controller?.brandTypeList[index].price ?? ''} BDT",
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
                                            ),
                                          ],
                                        )
                                      else const SizedBox(height: 100, child: Center(child: Text('Product Not Found')))
                                  }


                                  /// ====/@ Men Shop Page View @/====
                                  else
                                    if (widget.page == AppConstants.menShop) ...{
                                      if(mainController.isLoading) const ProductShimmer()
                                      else
                                        if(mainController.productsFound)
                                          Column(
                                            children: [
                                              Text(
                                                "Showing ${mainController?.sectionHomepageList.length ?? 0} results",
                                                style: poppins.copyWith(fontSize: 10, color: Colors.grey),
                                              ),
                                              const SizedBox(height: 12),
                                              Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 12, right: 12),
                                                  child: GridView.builder(
                                                    physics: const NeverScrollableScrollPhysics(),
                                                    shrinkWrap: true,
                                                    gridDelegate:
                                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 2,
                                                      mainAxisSpacing: 15,
                                                      crossAxisSpacing: 10,
                                                      childAspectRatio: 0.5,
                                                    ),
                                                    itemCount: mainController.sectionHomepageList.length ?? 0,
                                                    // Since you want only one item per GridView, set itemCount to 1
                                                    itemBuilder: (BuildContext context, int index) {
                                                      bool isWished=Get.find<WishlistController>().getCheckWishlisted(controller.sectionHomepageList?[index]?.id?.toString()??"");
                                                      List<String> productImage=[];
                                                      String? pic1= controller?.sectionHomepageList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.frontPhoto;
                                                      String? pic2=controller?.sectionHomepageList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.backsidePhoto;
                                                      String? pic3=controller?.sectionHomepageList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.details1Photo;
                                                      String? pic4=controller?.sectionHomepageList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.details2Photo;
                                                      String? pic5=controller?.sectionHomepageList[index].productColorVariants?[controller.sectedColorVAriantIndex]?.outfitPhoto;

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
                                                      return Container(
                                                        // color: Colors.deepPurpleAccent,
                                                        color: const Color(0xffFAFBFB),
                                                        child: InkWell(
                                                          onTap: () {
                                                            Get.to(ProductDetailsPage(
                                                              childCategorieId: mainController.sectionHomepageList?.map<int>((item){
                                                                return item.childCategories?[index]?.childCategoryProduct?.childCategoryId ?? 0;
                                                              }).toList(),
                                                              page: mainController.sectionHomepageList?.map<int>((item){
                                                                return item.sections?[index]?.pageId ?? 0;
                                                              }).toList(),
                                                              // sectionId: controller.homePageAllDataResponse!.data![index].sectionHomepageDetails?.map<int>((item){
                                                              //   return item.sectionId ?? 0;
                                                              // }).toList(),
                                                              productId: mainController!.sectionHomepageList[index].id.toString(),
                                                              brandId: mainController.sectionHomepageList[index]?.brandId?.toString(),
                                                              pageId: mainController.sectionHomepageList[index]?.pages?[controller.sectedColorVAriantIndex]?.pageProduct?.pageId!.toString(),
                                                            ));
                                                          },
                                                          child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children: [
                                                              SizedBox(
                                                                height: Get.height / 3.2,
                                                                child: Stack(
                                                                  alignment: Alignment.topCenter,
                                                                  children: [
                                                                    CarouselSlider(
                                                                      items: productImage.map((i) {
                                                                        return Builder(
                                                                          builder: (BuildContextcontext) {
                                                                            return Container(
                                                                              decoration: const BoxDecoration(
                                                                                color: Color(0xffFBFBFB),),
                                                                              child: ClipRRect(
                                                                                child: CustomImageCached(
                                                                                  image: '${AppConstants.BASE_URL}$i',
                                                                                  fit: BoxFit.fill,
                                                                                  isRound: false,),
                                                                              ),
                                                                            );
                                                                          },
                                                                        );
                                                                      }).toList(),
                                                                      options: CarouselOptions(
                                                                        disableCenter: true,
                                                                        viewportFraction: 1,
                                                                        autoPlayInterval:
                                                                        const Duration(seconds: 7),
                                                                        height: Get.height / 2.4,
                                                                        scrollDirection:
                                                                        Axis.horizontal,
                                                                        onPageChanged: (index, reason) {
                                                                          setState(() {currentIndex = index; // If you want to track carousel index separately
                                                                          });
                                                                        },
                                                                      ),
                                                                    ),
                                              /// required
                                              /*                      Positioned(
                                                                      bottom: 20,
                                                                      child: Row(
                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                        children: [
                                                                          for (int i = 0; i < productImage.length; i++)
                                                                            TabPageSelectorIndicator(
                                                                              backgroundColor: i == currentIndex ? gold : silvercolor,
                                                                              borderColor: i == currentIndex ? gold : silvercolor,
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
                                                                            child: mainController.sectionHomepageList[index].season != null ?
                                                                            Text(
                                                                              (mainController.sectionHomepageList[index].season?.seasonName ?? "").toUpperCase(),
                                                                              style: poppins.copyWith(color: Colors.black,
                                                                                  fontSize: 9
                                                                              ),
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
                                                                              var customerId = await Get.find<AuthController>().getUserId();
                                                                              await Get.find<WishlistController>().AddtoWishlist(
                                                                                product_id: widget.controller2?.sectionHomepageList[index].id?.toString()??"",
                                                                                customer_id: customerId,
                                                                                corelation_id: deviceID,
                                                                              );/*
                                                                              setState(() {
                                                                                // Set your 'isHeartRed' variable or similar to control the button color
                                                                                isWished = !isWished; // Assuming 'isHeartRed' controls the heart color
                                                                              });*/
                                                                          } catch (e) {
                                                                            // Handle any errors that might occur during the asynchronous operation
                                                                            print("Error: $e");
                                                                          }
                                                                        },
                                                                        child: Padding(
                                                                          padding: const EdgeInsets.all(5),
                                                                          child: isWished? Image.asset(Images.unwished, height: 20, color: gold,
                                                                          )
                                                                              : Image.asset(Images.wish, height: 20, color: silvercolor,
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
                                                                            builder: (BuildContext context) {
                                                                              return SimilarPopup(id: mainController.sectionHomepageList[index]!.childCategories![0]?.childCategoryProduct!.childCategoryId ?? 0,);
                                                                            },
                                                                          );
                                                                        },
                                                                        child: SizedBox(
                                                                          height: 30,
                                                                          width: 30,
                                                                          child: Padding(
                                                                            padding: const EdgeInsets.all(5),
                                                                            child: Image.asset(Images.similar,
                                                                                color: silvercolor,
                                                                                height: 20,
                                                                                width: 20),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              const SizedBox(height: 8),
                                                              ///
                                                              Padding(
                                                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                                                child: Text(mainController.sectionHomepageList[index].brand?.brandName ?? "".toUpperCase(),
                                                                  maxLines: 1,
                                                                  style: railway.copyWith(
                                                                      fontSize: 16,
                                                                      fontWeight: FontWeight.w600),
                                                                ),
                                                              ),
                                                              const SizedBox(height: 5),
                                                              Padding(
                                                                padding: const EdgeInsets.symmetric(horizontal: 4),
                                                                child: Text(
                                                                  mainController.sectionHomepageList[index].name ?? "",
                                                                  overflow: TextOverflow.ellipsis,
                                                                  maxLines: 1,
                                                                  style: poppins.copyWith(
                                                                      fontWeight: FontWeight.w200,
                                                                      fontSize: 12,
                                                                      color: Colors.black
                                                                  ),
                                                                ),
                                                              ),
                                                              const SizedBox(height: 5),

                                                              /// main
                                                              mainController?.sectionHomepageList[index].discount == null ||
                                                                  mainController?.sectionHomepageList[index].discount == 0 ?
                                                              Padding(
                                                                padding: const EdgeInsets
                                                                    .symmetric(horizontal: 4),
                                                                child: Text(
                                                                  "${mainController?.sectionHomepageList[index].price ?? ''} BDT",
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
                                                                    Text("${mainController.sectionHomepageList[index].discountedPrice ?? ''} BDT",
                                                                      style: poppins.copyWith(fontWeight: FontWeight.w600, color: gold, fontSize: 12
                                                                      ),
                                                                    ),
                                                                    const SizedBox(height: 4),
                                                                    Text(
                                                                      "${mainController.sectionHomepageList[index].price ?? ''} BDT",
                                                                      style: poppins.copyWith(fontWeight: FontWeight.w600,
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
                                              ),
                                            ],
                                          )
                                        else const SizedBox(height: 100, child: Center(child: Text('Product Not Found')))},
                const SizedBox(height: 10)
              ],
            ),
          ),
        );
      });
    });
  }


}
