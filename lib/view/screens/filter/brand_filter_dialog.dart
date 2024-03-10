
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../controller/product/product_controller.dart';
import '../../../data/model/response/filter/brand/brand_product_filter_model.dart';
import '../../../data/model/response/filter/child_category_product_filter_model.dart';
import '../../../util/color.dart';
import '../../../util/styles.dart';
import 'people_filter_dialog.dart';

class BrandFilterPageDialog extends StatefulWidget {
  final BrandProductFilterTermModel? filterModel;
  final String? id;
  final int? pageId;

  const BrandFilterPageDialog({
    super.key,
    required this.filterModel,
    this.id,
    this.pageId,
  });

  @override
  State<BrandFilterPageDialog> createState() => _FilterPageScreenState();
}

class _FilterPageScreenState extends State<BrandFilterPageDialog> {

  int isClick = 0;
  TextEditingController minAmountCon = TextEditingController();
  TextEditingController maxAmountCon = TextEditingController();

  List<String> itemList = [
    'All\n Brands',
    'Size\nTypes',
    'Colour',
    'Discount',
    'New In',
    'Price',
  ];

  int? selectSection;
  void onSectionSelected(int sectionId) {
    log("====/@ Section ID: $sectionId");
    setState(() {
      selectSection = sectionId;
    });
  }

  List<int> selectedSizeIds = [];
  void onSizeSelected(int sizeId, bool isSelected) {
    log("====/@ Size ID: $sizeId, Selected: $isSelected");
    setState(() {
      if(isSelected){
        selectedSizeIds.add(sizeId);
      } else{
        selectedSizeIds.remove(sizeId);
      }
    });
  }

  List<int> selectedBrandsIds = [];
  void onBrandSelected(int brandId, bool isSelected) {
    log("====/@ Brand ID: $brandId, Selected: $isSelected");
    setState(() {
      if(isSelected){
        selectedBrandsIds.add(brandId);
      } else{
        selectedBrandsIds.remove(brandId);
      }
    });
  }

  List<int> selectedColorIds = [];
  void onColorSelected(int colorId, bool isSelected) {
    log("====/@ Brand ID: $colorId, Selected: $isSelected");
    setState(() {
      if(isSelected){
        selectedColorIds.add(colorId);
      } else{
        selectedColorIds.remove(colorId);
      }
    });
  }

  int? selectedDiscount;

  void onDiscountSelected(int discount) {
    log("====/@ Discount Selected: $discount");
    setState(() {
      selectedDiscount = discount;
    });
  }

  int? selectedNewIn;

  void onNewInSelected(int newIn) {
    log("====/@ New In Selected: $newIn");
    setState(() {
      selectedNewIn = newIn;
    });
  }

  void savePrice() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(AppConstants.minPrice, minAmountCon.text.trim());
    prefs.setString(AppConstants.maxPrice, maxAmountCon.text.trim());

    log('Min Price: ${minAmountCon.text.trim()}');
    log('Max Price: ${maxAmountCon.text.trim()}');

    setState(() {});
  }

  Future<void> loadPrices() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      minAmountCon.text = prefs.getString(AppConstants.minPrice) ?? '';
      maxAmountCon.text = prefs.getString(AppConstants.maxPrice) ?? '';
    });
  }

  void removePrices() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(AppConstants.minPrice);
    prefs.remove(AppConstants.maxPrice);

    // Log statements to confirm removal (optional)
    log('Min Price removed ${minAmountCon.text.trim()}');
    log('Max Price removed ${maxAmountCon.text.trim()}');

    setState(() {}); // Trigger a rebuild to update the UI
  }

  Future<bool> arePricesStored() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final minPrice = prefs.getString(AppConstants.minPrice);
    final maxPrice = prefs.getString(AppConstants.maxPrice);
    return minPrice != null && maxPrice != null;
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadPrices();
  }


  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductListController>(builder: (productController) {
      return Material(
        elevation: 0,
        color: Colors.white,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(10)
        // ),
        child: Padding(
          // padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
          padding: const EdgeInsets.only(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: Stack(
                  children: [
                    SizedBox(
                      height: 30,
                      width: Get.width,
                    ),
                    Center(
                      child: Text("Apply Filters",
                          style: poppins.copyWith(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400)),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(
                              Icons.close, color: Colors.black, size: 25)),
                    ),
                  ],
                ),
              ),

              FutureBuilder<bool>(
                future: arePricesStored(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // If the Future is still waiting, return a loading indicator or an empty container
                    return const SizedBox.shrink(); // or SizedBox.shrink();
                  } else if (snapshot.hasError) {
                    // If there's an error, handle it accordingly
                    return Text('Error: ${snapshot.error}');
                  } else {
                    // If the Future is complete, conditionally build the black container
                    final bool pricesStored = snapshot.data ?? false;

                    return pricesStored
                        ? Column(
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 10),
                            GestureDetector(
                              onTap: () {
                                removePrices();
                              },
                              child: Container(
                                padding:
                                const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.7),
                                    borderRadius: BorderRadius.circular(3)),
                                child: Row(
                                  children: [
                                    Text(
                                      '${minAmountCon.text.trim()} - ${maxAmountCon.text.trim()}',
                                      style: const TextStyle(fontSize: 12, color: Colors.white),
                                    ),
                                    const SizedBox(width: 5),
                                    const Icon(
                                      Icons.close,
                                      color: Colors.white,
                                      size: 12,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                        : const SizedBox.shrink(); // Hide the black container if prices are not stored
                  }
                },
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Row(
                  children: [
                    SizedBox(
                      width: 100,
                      // color: Colors.blue.withOpacity(0.3),
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: itemList.length,
                          itemBuilder: (ctx, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  isClick = index;
                                });
                              },
                              child: Container(
                                height: 65,
                                width: 100,
                                // margin: const EdgeInsets.symmetric(vertical: 5),
                                decoration: BoxDecoration(
                                    color: isClick == index
                                        ? Colors.transparent
                                        : Colors.blue.withOpacity(0.1),
                                    border: isClick == index
                                        ? Border.all(width: 1, color: gold)
                                        : Border.all(width: 0.5, color: Colors.grey.withOpacity(0.3))
                                    // color: isClick == index
                                    //     ? Colors.transparent
                                    //     : Colors.blue.withOpacity(0.1),
                                    // border: isClick == index ? Border(
                                    //     left: BorderSide(
                                    //         width: isClick == index ? 4 : 0,
                                    //         color: isClick == index
                                    //             ? Colors.brown
                                    //             : Colors.transparent)
                                    // ) : Border.all(width: 0.5,
                                    //     color: Colors.grey.withOpacity(0.3))
                                ),
                                child: Center(child: Text(itemList[index],
                                    textAlign: TextAlign.center)),
                              ),
                            );
                          }),
                    ),

                    const SizedBox(width: 10),
                    Expanded(
                        child: IndexedStack(
                          index: isClick,
                          children: [

                            BrandSectionRightSiteWidget(
                              sections: widget.filterModel?.data?.allBrands ?? [],
                              onSectionSelected: onSectionSelected,
                            ),
                            // const SizedBox(height: 30, width: 80),
                            // BrandBrandRightSiteWidget(
                            //   brandModel: widget.filterModel?.data?.allBrands ?? [],
                            //   onSizeSelected: onBrandSelected,
                            // ),
                            BrandSizeTypesRightSiteWidget(
                              sizedModel: widget.filterModel?.data?.sizes ?? [],
                              onSizeSelected: onSizeSelected,
                            ),
                            BrandColorRightSiteWidget(
                              colorModel: widget.filterModel?.data?.colors ?? [],
                              onSizeSelected: onColorSelected,
                            ),
                            // ChildCategoryDiscountRightSiteWidget(
                            //   discountModel: widget.filterModel!.data!.discount,
                            //   onDiscountSelected: onDiscountSelected,
                            // ),
                            BrandDiscountRightSiteWidget(
                              discountModel: widget.filterModel?.data?.discount,
                              onDiscountSelected: onDiscountSelected,
                            ),
                            BrandNewInRightSiteWidget(
                              newInModel: widget.filterModel?.data?.newIn,
                              onNewInSelected: onNewInSelected,
                            ),
                            BrandPriceRightSiteWidget(
                              maxAmountCon: maxAmountCon,
                              minAmountCon: minAmountCon,
                              onSavePrice: savePrice,
                            )
                          ],
                        )),

                  ],
                ),
              ),

              Container(
                width: Get.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          offset: const Offset(-4, -4),
                          blurRadius: 4
                      )
                    ]
                ),
                child: Column(
                  children: [
                    // const SizedBox(height: 20),
                    // const Text('618 items found',
                    //     style: TextStyle(
                    //         color: Colors.black
                    //     )
                    // ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  shadowColor: Colors.transparent,
                                  foregroundColor: Colors.white.withOpacity(0.1),
                                  backgroundColor: Colors.grey.withOpacity(0.3),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2)),
                                ),
                                child: const Text('RESET', style: TextStyle(
                                    color: Colors.grey
                                ),),
                              )
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  // savePrice();
                                  productController.getBrandProductData(
                                      id: widget.id ?? selectSection.toString(),
                                      pageId: widget.pageId,
                                      sizeId: selectedSizeIds,
                                      genderId: widget.pageId,
                                      // brandId: selectedBrandsIds,
                                      colorId: selectedColorIds,
                                      discount: selectedDiscount.toString(),
                                      days: selectedNewIn.toString(),
                                      minPrice: minAmountCon.text.trim(),
                                      maxPrice: maxAmountCon.text.trim(),
                                  );
                                  Get.back();
                                  /// ==
                                },
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  shadowColor: Colors.transparent,
                                  foregroundColor: Colors.grey.withOpacity(0.3),
                                  backgroundColor: Colors.black.withOpacity(0.7),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2)),
                                ),
                                child: const Text('Done', style: TextStyle(
                                    color: Colors.white
                                ),),
                              )
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}


class BrandSectionRightSiteWidget extends StatefulWidget {
  final List<BrandProductFilterTermAllBrands> sections;
  final Function onSectionSelected;

  const BrandSectionRightSiteWidget({
    super.key,
    required this.sections,
    required this.onSectionSelected
  });

  @override
  State<BrandSectionRightSiteWidget> createState() => _BrandSectionRightSiteWidgetState();
}

class _BrandSectionRightSiteWidgetState extends State<BrandSectionRightSiteWidget> {

  int isClick = -1;

  @override
  Widget build(BuildContext context) {
    return widget.sections != null && widget.sections.isNotEmpty ? ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: widget.sections.length,
        itemBuilder: (ctx, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                widget.onSectionSelected(widget.sections[index].id ?? 0);
              });
            },
            child: SizedBox(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 18),
                    Row(
                      children: [
                        const SizedBox(width: 20),
                        Text(widget.sections[index].name?.toUpperCase() ?? '',
                            textAlign: TextAlign.center),
                        Expanded(child: Container()),
                        Text('(${widget.sections[index].productCount})',
                            style: const TextStyle(
                                fontSize: 13,
                                color: Colors.grey
                            )
                        ),
                        const SizedBox(width: 15),
                        // const Expanded(child: SizedBox()),
                        // GestureDetector(
                        //   onTap: (){
                        //     setState(() {
                        //       isClick = isClick == index ? -1 : index;
                        //     });
                        //   },
                        //     child: isClick == index
                        //         ? const Icon(Icons.keyboard_arrow_up_outlined, color: Colors.grey)
                        //         : const Icon(Icons.keyboard_arrow_down_outlined, color: Colors.grey)),
                        // const SizedBox(width: 20),
                      ],
                    ),
                    const SizedBox(height: 18),
                    Container(height: 0.5, width: Get.width, color: Colors.grey,),
                    const SizedBox(height: 10)
                    // isClick == index ? const SizedBox(height: 10) : const SizedBox.shrink(),
                    // isClick == index ? ListView.builder(
                    //   shrinkWrap: true,
                    //   itemCount: widget.sections[index].children?.length ?? 0,
                    //     itemBuilder: (ctx, sectionIndex){
                    //       return GestureDetector(
                    //         onTap: () {
                    //           setState(() {
                    //             widget.onSectionSelected(widget.sections[index].children?[sectionIndex].id ?? 0);
                    //           });
                    //         },
                    //         child: SizedBox(
                    //           child: Column(
                    //             children: [
                    //               const SizedBox(height: 10),
                    //               Row(
                    //                 children: [
                    //                   const SizedBox(width: 40),
                    //                   Text(widget.sections[index].children?[sectionIndex].title ?? '',
                    //                     textAlign: TextAlign.center),
                    //                   Text(' (${widget.sections[index].children?[sectionIndex].productCount} Item)',
                    //                       style: const TextStyle(
                    //                           fontSize: 13,
                    //                           color: Colors.grey
                    //                       )
                    //                   ),
                    //                 ],
                    //               ),
                    //               const SizedBox(height: 10),
                    //             ],
                    //           ),
                    //         ),
                    //       );
                    //     }
                    // ) : const SizedBox.shrink()
                  ],
                ),
              ),
            ),
          );
        }
    ) : const SizedBox.shrink();
  }
}


class BrandSizeTypesRightSiteWidget extends StatefulWidget {
  final List<BrandProductFilterTermSizes> sizedModel;
  final Function onSizeSelected;


  const BrandSizeTypesRightSiteWidget({
    Key? key,
    required this.sizedModel,
    required this.onSizeSelected
  }) : super(key: key);

  @override
  State<BrandSizeTypesRightSiteWidget> createState() =>
      _BrandSizeTypesRightSiteWidgetState();
}

class _BrandSizeTypesRightSiteWidgetState extends State<BrandSizeTypesRightSiteWidget> {

  Map<int, bool> selectedSizes = {};

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.sizedModel.length,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(
              widget.sizedModel[index].typeName ?? '',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            widget.sizedModel != null && widget.sizedModel.isNotEmpty ?
            ListView.builder(
              itemCount: widget.sizedModel[index].sizes?.length ?? 0,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, sizeIndex) {
                int sizedId = widget.sizedModel[index].sizes?[sizeIndex].id ?? 0;
                return Column(
                  children: [
                    const SizedBox(height: 5),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          activeColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.0),
                          ),
                          side: MaterialStateBorderSide.resolveWith(
                                (states) =>
                            const BorderSide(width: 1.0, color: Colors.grey),
                          ),
                          value: selectedSizes[sizedId] ?? false,
                          onChanged: (val) {
                            setState(() {
                              selectedSizes[sizedId] = val ?? false;
                              widget.onSizeSelected(sizedId, val ?? false);
                            });
                          },
                        ),
                        Text(widget.sizedModel[index].sizes?[sizeIndex].sizeCode ?? '',
                            style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black
                            )
                        ),
                        Expanded(child: Container()),
                        Text('(${widget.sizedModel[index].sizes?[sizeIndex].productCount})',
                            style: const TextStyle(
                                fontSize: 13,
                                color: Colors.grey
                            )
                        ),
                        const SizedBox(width: 15),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Container(
                      height: 0.5, width: Get.width, color: Colors.grey,)
                  ],
                );
              },
            ) : const SizedBox.shrink(),
          ],
        );
      },
    );
  }
}


/// ================================================================


class BrandBrandRightSiteWidget extends StatefulWidget {
  final List<BrandProductFilterTermAllBrands> brandModel;
  final Function onSizeSelected;
  const BrandBrandRightSiteWidget({
    super.key,
    required this.brandModel,
    required this.onSizeSelected
  });

  @override
  State<BrandBrandRightSiteWidget> createState() => _BrandBrandRightSiteWidgetState();
}

class _BrandBrandRightSiteWidgetState extends State<BrandBrandRightSiteWidget> {

  Map<int, bool> selectedBrands = {};

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.brandModel != null && widget.brandModel.isNotEmpty ?
          ListView.builder(
            itemCount: widget.brandModel.length ?? 0,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, brandIndex) {
              int sizedId = widget.brandModel[brandIndex].id ?? 0;
              return Column(
                children: [
                  const SizedBox(height: 5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        activeColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                        side: MaterialStateBorderSide.resolveWith(
                              (states) =>
                          const BorderSide(width: 1.0, color: Colors.grey),
                        ),
                        value: selectedBrands[sizedId] ?? false,
                        onChanged: (val) {
                          setState(() {
                            selectedBrands[sizedId] = val ?? false;
                            widget.onSizeSelected(sizedId, val ?? false);
                          });
                        },
                      ),
                      Text(widget.brandModel[brandIndex].name ?? '',
                          style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black
                          )
                      ),
                      const SizedBox(width: 10),
                      Text('(${widget.brandModel[brandIndex].productCount})',
                          style: const TextStyle(
                              fontSize: 13,
                              color: Colors.grey
                          )
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Container(
                    height: 0.5, width: Get.width, color: Colors.grey,)
                ],
              );
            },
          ) : const SizedBox.shrink(),
        ],
      ),
    );
  }
}


class BrandColorRightSiteWidget extends StatefulWidget {
  final List<BrandProductFilterTermColors> colorModel;
  final Function onSizeSelected;

  const BrandColorRightSiteWidget({
    super.key,
    required this.colorModel,
    required this.onSizeSelected
  });

  @override
  State<BrandColorRightSiteWidget> createState() => _BrandColorRightSiteWidgetState();
}

class _BrandColorRightSiteWidgetState extends State<BrandColorRightSiteWidget> {

  Map<int, bool> selectedColor = {};

// Add a new method to parse color codes
  Color? parseColor(String colorCode) {
    try {
      // Parse the hexadecimal color code and return a Color object
      return Color(int.parse(colorCode.replaceAll("#", ""), radix: 16) + 0xFF000000);
    } catch (e) {
      // Handle any parsing errors, you can return a default color if needed
      log("Error parsing color code: $colorCode");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.colorModel != null && widget.colorModel.isNotEmpty ?
          ListView.builder(
            itemCount: widget.colorModel.length ?? 0,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, colorIndex) {
              int sizedId = widget.colorModel[colorIndex].id ?? 0;
              return Column(
                children: [
                  const SizedBox(height: 5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        activeColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                        side: MaterialStateBorderSide.resolveWith(
                              (states) =>
                          const BorderSide(width: 1.0, color: Colors.grey),
                        ),
                        value: selectedColor[sizedId] ?? false,
                        onChanged: (val) {
                          setState(() {
                            selectedColor[sizedId] = val ?? false;
                            widget.onSizeSelected(sizedId, val ?? false);
                          });
                        },
                      ),
                      Text(widget.colorModel[colorIndex].name ?? '',
                          style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black
                          )
                      ),
                      Text('  (${widget.colorModel[colorIndex].productCount})',
                          style: const TextStyle(
                              fontSize: 13,
                              color: Colors.grey
                          )
                      ),
                      Expanded(child: Container()),
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: parseColor(widget.colorModel[colorIndex].colorCode ?? ''),
                        ),
                      ),
                      const SizedBox(width: 20),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Container(
                    height: 0.5, width: Get.width, color: Colors.grey,)
                ],
              );
            },
          ) : const SizedBox.shrink()

        ],
      ),
    );
  }
}


class BrandPriceRightSiteWidget extends StatefulWidget {

  final TextEditingController minAmountCon;
  final TextEditingController maxAmountCon;
  final Function onSavePrice;

  const BrandPriceRightSiteWidget({
    super.key,
    required this.minAmountCon,
    required this.maxAmountCon,
    required this.onSavePrice,
  });

  @override
  State<BrandPriceRightSiteWidget> createState() => _BrandPriceRightSiteWidgetState();
}

class _BrandPriceRightSiteWidgetState extends State<BrandPriceRightSiteWidget> {

  final FocusNode _minAmountFocusNode = FocusNode();
  final FocusNode _maxAmountFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('MINIMUM AMOUNT',
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black
              )
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Text('BDT',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black
                  )
              ),
              const SizedBox(width: 5),
              Expanded(
                child: SizedBox(
                  height: 30,
                  child: TextFormField(
                    controller: widget.minAmountCon,
                    focusNode: _minAmountFocusNode,
                    cursorColor: Colors.grey,
                    keyboardType: TextInputType.phone,
                    style: const TextStyle(
                        fontSize: 14
                    ),
                    decoration: priceDecoration.copyWith(
                      contentPadding: const EdgeInsets.only(top: 10, left: 5),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              const Text('(MIN)',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black
                  )
              ),
              const SizedBox(width: 15),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            height: 0.5, width: Get.width, color: Colors.grey,),
          const SizedBox(height: 20),
          const Text('MAXIMUM AMOUNT',
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black
              )
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Text('BDT',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black
                  )
              ),
              const SizedBox(width: 5),
              Expanded(
                child: SizedBox(
                  height: 30,
                  child: TextFormField(
                    controller: widget.maxAmountCon,
                    focusNode: _maxAmountFocusNode,
                    cursorColor: Colors.grey,
                    keyboardType: TextInputType.phone,
                    style: const TextStyle(
                        fontSize: 14
                    ),
                    decoration: priceDecoration.copyWith(
                      contentPadding: const EdgeInsets.only(top: 10, left: 5),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              const Text('(MAX)',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black
                  )
              ),
              const SizedBox(width: 15),
            ],
          ),
          const SizedBox(height: 10),
          Container(
              height: 0.5, width: Get.width, color: Colors.grey),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ElevatedButton(
              onPressed: () {
                FocusScope.of(context).requestFocus(FocusNode());
                widget.onSavePrice();
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shadowColor: Colors.transparent,
                foregroundColor: Colors.grey.withOpacity(0.3),
                backgroundColor: Colors.black.withOpacity(0.7),
                maximumSize: Size(Get.width, 35),
                minimumSize: Size(Get.width, 35),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2)),
              ),
              child: const Text('Apply', style: TextStyle(
                  color: Colors.white
              ),),
            ),
          )
        ],
      ),
    );
  }
}

class BrandNewInRightSiteWidget extends StatefulWidget {
  final BrandProductFilterTermNewInDataModel? newInModel;
  final Function(int) onNewInSelected;

  const BrandNewInRightSiteWidget({
    super.key,
    required this.newInModel,
    required this.onNewInSelected
  });

  @override
  State<BrandNewInRightSiteWidget> createState() => _BrandNewInRightSiteWidgetState();
}

class _BrandNewInRightSiteWidgetState extends State<BrandNewInRightSiteWidget> {
  int? selectedNewIn;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Column(
            children: [
              const SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    activeColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    side: MaterialStateBorderSide.resolveWith((states) =>
                    const BorderSide(width: 1.0, color: Colors.grey),
                    ),
                    value: selectedNewIn == 7,
                    onChanged: (val) {
                      setState(() {
                        selectedNewIn = val! ? 7 : null;
                        widget.onNewInSelected(selectedNewIn!);
                      });
                    },
                  ),
                  const Text(
                    'Last 7 Days',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(child: Container()),
                  Text(
                    '(${widget.newInModel?.lastWeekProductCount ?? 0})',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 15),
                ],
              ),
              const SizedBox(height: 5),
              Container(
                height: 0.5,
                width: Get.width,
                color: Colors.grey,
              ),
            ],
          ),


          Column(
            children: [
              const SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    activeColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    side: MaterialStateBorderSide.resolveWith((states) =>
                    const BorderSide(width: 1.0, color: Colors.grey),
                    ),
                    value: selectedNewIn == 15,
                    onChanged: (val) {
                      setState(() {
                        selectedNewIn = val! ? 15 : null;
                        widget.onNewInSelected(selectedNewIn!);
                      });
                    },
                  ),
                  const Text(
                    'Last 15 Days',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(child: Container()),
                  Text(
                    '(${widget.newInModel?.last15DaysProductCount ?? 0})',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 15),
                ],
              ),
              const SizedBox(height: 5),
              Container(
                height: 0.5,
                width: Get.width,
                color: Colors.grey,
              ),
            ],
          ),

          Column(
            children: [
              const SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    activeColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    side: MaterialStateBorderSide.resolveWith((states) =>
                    const BorderSide(width: 1.0, color: Colors.grey),
                    ),
                    value: selectedNewIn == 30,
                    onChanged: (val) {
                      setState(() {
                        selectedNewIn = val! ? 30 : null;
                        widget.onNewInSelected(selectedNewIn!);
                      });
                    },
                  ),
                  const Text(
                    'Last 30 Days',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(child: Container()),
                  Text(
                    '(${widget.newInModel?.lastMonthProductCount ?? 0})',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 15),
                ],
              ),
              const SizedBox(height: 5),
              Container(
                height: 0.5,
                width: Get.width,
                color: Colors.grey,
              ),
            ],
          ),

          Column(
            children: [
              const SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    activeColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    side: MaterialStateBorderSide.resolveWith((states) =>
                    const BorderSide(width: 1.0, color: Colors.grey),
                    ),
                    value: selectedNewIn == 365,
                    onChanged: (val) {
                      setState(() {
                        selectedNewIn = val! ? 365 : null;
                        widget.onNewInSelected(selectedNewIn!);
                      });
                    },
                  ),
                  const Text(
                    'Last 1 Years',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(child: Container()),
                  Text(
                    '(${widget.newInModel?.lastYearProductCount ?? 0})',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 15),
                ],
              ),
              const SizedBox(height: 5),
              Container(
                height: 0.5,
                width: Get.width,
                color: Colors.grey,
              ),
            ],
          ),

        ],
      ),
    );
  }
}


class BrandDiscountRightSiteWidget extends StatefulWidget {
  final BrandProductFilterTermDiscount? discountModel;
  final Function(int) onDiscountSelected;

  const BrandDiscountRightSiteWidget({
    super.key,
    required this.discountModel,
    required this.onDiscountSelected,
  });

  @override
  State<BrandDiscountRightSiteWidget> createState() => _BrandDiscountRightSiteWidgetState();
}

class _BrandDiscountRightSiteWidgetState extends State<BrandDiscountRightSiteWidget> {
  int? selectedDiscount;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [


          Column(
            children: [
              const SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    activeColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    side: MaterialStateBorderSide.resolveWith((states) =>
                    const BorderSide(width: 1.0, color: Colors.grey),
                    ),
                    value: selectedDiscount == 10,
                    onChanged: (val) {
                      setState(() {
                        selectedDiscount = val! ? 10 : null;
                        widget.onDiscountSelected(selectedDiscount!);
                      });
                    },
                  ),
                  const Text(
                    '10%',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(child: Container()),
                  Text('(${widget.discountModel?.discount10 ?? 0})',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 15),
                ],
              ),
              const SizedBox(height: 5),
              Container(
                height: 0.5,
                width: Get.width,
                color: Colors.grey,
              ),
            ],
          ),


          Column(
            children: [
              const SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    activeColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    side: MaterialStateBorderSide.resolveWith((states) =>
                    const BorderSide(width: 1.0, color: Colors.grey),
                    ),
                    value: selectedDiscount == 20,
                    onChanged: (val) {
                      setState(() {
                        selectedDiscount = val! ? 20 : null;
                        widget.onDiscountSelected(selectedDiscount!);
                      });
                    },
                  ),
                  const Text(
                    '20%',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(child: Container()),
                  Text(
                    '(${widget.discountModel?.discount20 ?? 0})',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 15),
                ],
              ),
              const SizedBox(height: 5),
              Container(
                height: 0.5,
                width: Get.width,
                color: Colors.grey,
              ),
            ],
          ),


          Column(
            children: [
              const SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    activeColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    side: MaterialStateBorderSide.resolveWith((states) =>
                    const BorderSide(width: 1.0, color: Colors.grey),
                    ),
                    value: selectedDiscount == 30,
                    onChanged: (val) {
                      setState(() {
                        selectedDiscount = val! ? 30 : null;
                        widget.onDiscountSelected(selectedDiscount!);
                      });
                    },
                  ),
                  const Text(
                    '30%',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(child: Container()),
                  Text(
                    '(${widget.discountModel?.discount30 ?? 0})',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 15),
                ],
              ),
              const SizedBox(height: 5),
              Container(
                height: 0.5,
                width: Get.width,
                color: Colors.grey,
              ),
            ],
          ),


          Column(
            children: [
              const SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    activeColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    side: MaterialStateBorderSide.resolveWith((states) =>
                    const BorderSide(width: 1.0, color: Colors.grey),
                    ),
                    value: selectedDiscount == 40,
                    onChanged: (val) {
                      setState(() {
                        selectedDiscount = val! ? 40 : null;
                        widget.onDiscountSelected(selectedDiscount!);
                      });
                    },
                  ),
                  const Text(
                    '40%',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(child: Container()),
                  Text(
                    '(${widget.discountModel?.discount40 ?? 0})',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 15),
                ],
              ),
              const SizedBox(height: 5),
              Container(
                height: 0.5,
                width: Get.width,
                color: Colors.grey,
              ),
            ],
          ),


          Column(
            children: [
              const SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    activeColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    side: MaterialStateBorderSide.resolveWith((states) =>
                    const BorderSide(width: 1.0, color: Colors.grey),
                    ),
                    value: selectedDiscount == 50,
                    onChanged: (val) {
                      setState(() {
                        selectedDiscount = val! ? 50 : null;
                        widget.onDiscountSelected(selectedDiscount!);
                      });
                    },
                  ),
                  const Text(
                    '50%',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(child: Container()),
                  Text(
                    '(${widget.discountModel?.discount50 ?? 0})',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 15),
                ],
              ),
              const SizedBox(height: 5),
              Container(
                height: 0.5,
                width: Get.width,
                color: Colors.grey,
              ),
            ],
          ),


          widget.discountModel?.discount60 != 0 ?
          Column(
            children: [
              const SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    activeColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    side: MaterialStateBorderSide.resolveWith((states) =>
                    const BorderSide(width: 1.0, color: Colors.grey),
                    ),
                    value: selectedDiscount == 60,
                    onChanged: (val) {
                      setState(() {
                        selectedDiscount = val! ? 60 : null;
                        widget.onDiscountSelected(selectedDiscount!);
                      });
                    },
                  ),
                  const Text(
                    '60%',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(child: Container()),
                  Text(
                    '(${widget.discountModel?.discount60 ?? 0})',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 15),
                ],
              ),
              const SizedBox(height: 5),
              Container(
                height: 0.5,
                width: Get.width,
                color: Colors.grey,
              ),
            ],
          ) : const SizedBox.shrink(),


          Column(
            children: [
              const SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    activeColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    side: MaterialStateBorderSide.resolveWith((states) =>
                    const BorderSide(width: 1.0, color: Colors.grey),
                    ),
                    value: selectedDiscount == 70,
                    onChanged: (val) {
                      setState(() {
                        selectedDiscount = val! ? 70 : null;
                        widget.onDiscountSelected(selectedDiscount!);
                      });
                    },
                  ),
                  const Text(
                    '70%',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(child: Container()),
                  Text(
                    '(${widget.discountModel?.discount70 ?? 0})',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 15),
                ],
              ),
              const SizedBox(height: 5),
              Container(
                height: 0.5,
                width: Get.width,
                color: Colors.grey,
              ),
            ],
          ),


          Column(
            children: [
              const SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    activeColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    side: MaterialStateBorderSide.resolveWith((states) =>
                    const BorderSide(width: 1.0, color: Colors.grey),
                    ),
                    value: selectedDiscount == 80,
                    onChanged: (val) {
                      setState(() {
                        selectedDiscount = val! ? 80 : null;
                        widget.onDiscountSelected(selectedDiscount!);
                      });
                    },
                  ),
                  const Text('80%',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(child: Container()),
                  Text(
                    '(${widget.discountModel?.discount80 ?? 0})',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 15),
                ],
              ),
              const SizedBox(height: 5),
              Container(
                height: 0.5,
                width: Get.width,
                color: Colors.grey,
              ),
            ],
          ),


          Column(
            children: [
              const SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    activeColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    side: MaterialStateBorderSide.resolveWith((states) =>
                    const BorderSide(width: 1.0, color: Colors.grey),
                    ),
                    value: selectedDiscount == 90,
                    onChanged: (val) {
                      setState(() {
                        selectedDiscount = val! ? 90 : null;
                        widget.onDiscountSelected(selectedDiscount!);
                      });
                    },
                  ),
                  const Text(
                    '90%',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(child: Container()),
                  Text(
                    '(${widget.discountModel?.discount90 ?? 0})',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 15),
                ],
              ),
              const SizedBox(height: 5),
              Container(
                height: 0.5,
                width: Get.width,
                color: Colors.grey,
              ),
            ],
          ),


          Column(
            children: [
              const SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    activeColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    side: MaterialStateBorderSide.resolveWith((states) =>
                    const BorderSide(width: 1.0, color: Colors.grey),
                    ),
                    value: selectedDiscount == 100,
                    onChanged: (val) {
                      setState(() {
                        selectedDiscount = val! ? 100 : null;
                        widget.onDiscountSelected(selectedDiscount!);
                      });
                    },
                  ),
                  const Text(
                    '100%',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(child: Container()),
                  Text(
                    '(${widget.discountModel?.discount100 ?? 0})',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 15),
                ],
              ),
              const SizedBox(height: 5),
              Container(
                height: 0.5,
                width: Get.width,
                color: Colors.grey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

