import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/profile/about%20isle%20reward/about_isle_reward_controller.dart';
import 'package:isletestapp/helper/date_converter.dart';
import 'package:isletestapp/util/HexColor.dart';
import 'package:isletestapp/util/app_constants.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/coustom_searching.dart';
import 'package:isletestapp/view/base/custom_Image_cached.dart';
import 'package:isletestapp/view/base/custom_button.dart';
import 'package:isletestapp/view/base/custom_dropdown.dart';
import 'package:isletestapp/view/base/custom_only_textfield_with_border.dart';
import 'package:isletestapp/view/base/custom_snackbar.dart';
import 'package:isletestapp/view/base/my_text_field.dart';
import 'package:isletestapp/view/screens/custom%20logo/custom_logo_widget.dart';
import 'package:isletestapp/view/screens/search/search_screen.dart';
import 'package:isletestapp/view/screens/universal_bottom_nav/universal_bottom_nav.dart';


class AboutIsleRewards extends StatefulWidget {
  // final int pageIndex;
  // final int? page;
  AboutIsleRewards({Key? key,
    // required this.pageIndex,
    // this.page
  }) : super(key: key);
  bool isExpanded1 = false;
  bool isExpanded2 = false;
  bool isExpanded3 = false;
  bool isExpanded4 = false;

  @override
  State<AboutIsleRewards> createState() => _WishListPageState();
}

class _WishListPageState extends State<AboutIsleRewards> {
  TextEditingController earnpointCtr = TextEditingController();
  TextEditingController redeempointCtr = TextEditingController();
  FocusNode earnpointFcs = FocusNode();
  FocusNode redeempointFcs = FocusNode();
  double calculatedValue = 0.0;
  double calculatedValue1 = 0.0;

  PageController? _pageController;
  bool isOpen=false;
  String? selectedTierId;
  String? selectedTier= "SELECT";
  int selectedTierIndex=-1;

  @override
  void initState() {
    // TODO: implement initState

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<AboutIsleRewardController>().dataInitialize();
    });
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
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
    return GetBuilder<AboutIsleRewardController>(
        builder: (controller) {
          return DefaultTabController(
            length: 7,
            child: Scaffold(
              bottomNavigationBar: const UniversalBottomNav(),
              appBar: AppBar(
                iconTheme: const IconThemeData(color: Color(0xff000000)),
                titleSpacing: 0,
                backgroundColor: const Color(0xffFFFFFF),
                centerTitle: true,
                elevation: 0,
                toolbarHeight: 62,
                actions: [
                  InkWell(
                      onTap: () {
                        Get.to(const SearchScreen());
                      },
                      // child: Icon(Icons.search,color: Color(0xff000000),size: 25,)):SizedBox(),
                      child: Image.asset(
                        Images.search,
                        height: 22,
                        width: 22,
                      )),
                  /*  SizedBox(width: 15),
                InkWell(
                  onTap: (){
                    Get.to(WishListPage(pageIndex: 0));
                  },
                  child: Image.asset(
                    Images.wish,
                    height: 22,
                    width: 22,
                    color: Color(0xff000000),
                  ),
                ),*/
                  const SizedBox(width: 10),
                ],
                leadingWidth: Get.width / 3.5,
                title: const CustomLogo(),
              ),
              // backgroundColor: Color(0xffEBEFF3),
              backgroundColor: const Color(0xffFFFFFF),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8, top: 20,bottom: 0),
                            child: Text("${controller.isleRewardSettingsResponse?.data?.title??""}", style: railwaybold.copyWith(fontSize: 18),),
                          ),
                          const SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8, top: 0,bottom: 0),
                            child: Text("${controller.isleRewardSettingsResponse?.data?.shortDescription??""}", style: railway.copyWith(fontSize: 12),),
                          ),
                        ],
                      )),
                      Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8, top: 8),
                            child: CustomImageCached(
                              image: '${AppConstants.BASE_URL}${controller.isleRewardSettingsResponse?.data?.isleRewardsBanner??""}',
                              height: 80, width: 120,
                            )
                          )
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  /// Tab Bar Part
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        border: Border.all(color: gold, width: 1 ),
                        borderRadius: BorderRadius.circular(0), // Adjust the radius as needed
                        color: Colors.white, // Background color for the Container
                      ),
                      child: TabBar(
                        isScrollable: true,
                        indicator: BoxDecoration(
                          border: Border.all(color: gold, ),
                          // borderRadius: BorderRadius.circular(20), // Same as Container's borderRadius
                          color: tabColor, // Use the tabColor variable
                        ),
                        indicatorPadding: const EdgeInsets.symmetric(horizontal: 0),
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
                              'How It\nWorks',
                              style: railway.copyWith(
                                color: Colors.black,
                                fontSize: 14,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Membership\nTiers',
                              style: railway.copyWith(
                                color: Colors.black,
                                fontSize: 14,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Membership\nBenefits',
                              style: railway.copyWith(
                                color: Colors.black,
                                fontSize: 14,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Redeeming\nPoints',
                              style: railway.copyWith(
                                color: Colors.black,
                                fontSize: 14,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Exclusive\nOffers',
                              style: railway.copyWith(
                                color: Colors.black,
                                fontSize: 14,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Points\nCalculator',
                              style: railway.copyWith(
                                color: Colors.black,
                                fontSize: 14,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Members terms\n& Condition',
                              style: railway.copyWith(
                                color: Colors.black,
                                fontSize: 14,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  /*         SizedBox(height: 5),
                Divider(
                  height: 3,
                  thickness: 3,
                  color: Color(0xffF2F6F9),
                  // color: Colors.pink,
                ),*/
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
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const SizedBox(height: 20),
                                        Text(
                                          'HOW IT WORKS',
                                          style: railwaybold.copyWith(
                                              color: Colors.black,
                                              fontSize: 18),
                                        ),
                                        const SizedBox(height: 12),
                                        controller.howItWorkResponse!=null? controller.howItWorkResponse!.data!.isNotEmpty?
                                        ListView.builder(
                                          itemCount: controller.howItWorkResponse!.data!.length??0,
                                            shrinkWrap: true,
                                            physics: const NeverScrollableScrollPhysics(),
                                            itemBuilder: (BuildContext context, int index) {
                                            return Padding(
                                              padding: const EdgeInsets.all(15),
                                              child: Container(
                                                alignment: Alignment.center,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    CustomImageCached(
                                                        placeholder: Images.placeholder,
                                                        image: "${AppConstants.BASE_URL}${controller.howItWorkResponse?.data?[index]?.image??""}",
                                                      height: 80,
                                                      width: 80,
                                                    ),
                                                    const SizedBox(height: 12),
                                                    Text(
                                                      (controller.howItWorkResponse?.data?[index]?.policyName??"").toUpperCase(),
                                                      style: railwaybold.copyWith(
                                                          color: Colors.black,
                                                          fontSize: 18),
                                                    ),
                                                    const SizedBox(height: 8),
                                                    Text(
                                                      controller.howItWorkResponse?.data?[index]?.policyDescription??"",
                                                      style: railway.copyWith(
                                                          color: Colors.black87,
                                                          fontSize: 12),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                            }
                                        )
                                        : const SizedBox() : const SizedBox(),

                                        const SizedBox(height: 80),
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
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const SizedBox(height: 20),
                                        Text(
                                          'MEMBERSHIP TIERS',
                                          style: railwaybold.copyWith(
                                              color: Colors.black,
                                              fontSize: 18),
                                        ),
                                        const SizedBox(height: 30),
                                        controller.membershipTierResponse != null ? controller.membershipTierResponse!.data!.length>0 ?
                                            ListView.builder(
                                              itemCount: controller.membershipTierResponse?.data?.length??0,
                                                shrinkWrap: true,
                                                physics: const NeverScrollableScrollPhysics(),
                                                itemBuilder: (BuildContext context, int index) {
                                                return Padding(
                                                  padding: const EdgeInsets.only(top: 12, bottom: 12),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Column(
                                                        children: [
                                                          Text(controller.membershipTierResponse?.data?[index].tiersName??"", style: railwaybold.copyWith(color: Colors.black, fontSize: 12),),
                                                          const SizedBox(height: 1),
                                                          Text('${controller.membershipTierResponse?.data?[index].isDefault == true?"Upon Joining" : controller.membershipTierResponse?.data?[index]?.upgradePoint??"0"}', style: poppins.copyWith(fontWeight: FontWeight.w500 ,color: Colors.black, fontSize: 10),),
                                                          const SizedBox(height: 5),
                                                          CustomImageCached(
                                                            placeholder: Images.placeholder,
                                                            image: "${AppConstants.BASE_URL}${controller.membershipTierResponse?.data?[index].image??""}",
                                                            height: 70,
                                                            width: 100,
                                                            fit: BoxFit.fill,
                                                          )
                                                        ],
                                                      ),
                                                      const SizedBox(width: 12),
                                                      Expanded(child: Row(
                                                        children: [
                                                          Expanded(child: Text(controller.membershipTierResponse?.data?[index].shortDescription ??"", style: railway.copyWith(color: Colors.black, fontSize: 12),)),
                                                        ],
                                                      ))
                                                    ],
                                                  ),
                                                );
                                                }
                                            )
                                        : const SizedBox() : const SizedBox(),
                                        const SizedBox(height: 25),
                                        Column(children: [
                                     /*     Text('FASHION, JEWELLERY, BEAUTY, HOME', style: railwaybold.copyWith(color: Colors.black, fontSize: 13),),
                                          const SizedBox(height: 8),*/
                                          Text('Points per ${controller.isleRewareRulesResponse?.data?[0]?.membershipIsleRewardRules?[0]?.isleRewardRule?.spentAmount??0} BDT spent', style: railwaybold.copyWith(color: Colors.black, fontSize: 12),),
                                        ],),
                                        const SizedBox(height: 30),
                                        controller.membershipTierResponse!=null? controller.membershipTierResponse!.data!.length>0 ?
                                        Container(
                                          height: 120,
                                          child: ListView.builder(
                                            itemCount: controller.membershipTierResponse?.data?.length ?? 0,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            physics: const BouncingScrollPhysics(),
                                            itemBuilder: (BuildContext context, int index) {
                                              return Container(
                                                // color: Colors.red,
                                                height: 100,
                                                margin: const EdgeInsets.symmetric(horizontal: 8.0), // Adjust the margin as needed
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      controller.membershipTierResponse?.data?[index]?.tiersName ?? "",
                                                      style: railwaybold.copyWith(color: Colors.black, fontSize: 12),
                                                      textAlign: TextAlign.center,
                                                    ),
                                                    const SizedBox(height: 15),
                                                    CircleAvatar(
                                                      radius: 37,
                                                      backgroundColor: HexColor(controller.membershipTierResponse?.data?[index]?.colorCode ?? ""),
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Text(
                                                            'Points'.toUpperCase(),
                                                            style: railwaybold.copyWith(color: Colors.white, fontSize: 10),
                                                            textAlign: TextAlign.center,
                                                          ),
                                                          Text(
                                                            '${controller.isleRewareRulesResponse?.data?[index]?.membershipIsleRewardRules?[0]?.rewardPoint??0}',
                                                            style: railwaybold.copyWith(color: Colors.white, fontSize: 14),
                                                            textAlign: TextAlign.center,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        )
                                        : const SizedBox() : const SizedBox(),

                                        const SizedBox(height: 30),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 12, right: 12),
                                          child: Text(
                                            "${controller.isleRewardSettingsResponse?.data?.memebershipShortDescription??""}",
                                            style: railwaybold.copyWith(color: Colors.black54, fontSize: 10),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),




                                        const SizedBox(height: 30),
                                      ],
                                    ),
                                  )
                              )
                          ),

                         /// 3rd
                          RefreshIndicator(
                              onRefresh: () async {
                                // showCustomSnackBar("2");
                              },
                              child: SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child:
                                    controller.abountIsleMumberShipBenefitList!=null?  controller.abountIsleMumberShipBenefitList.isNotEmpty?
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 0, right: 0, top: 8),
                                          child: Container(
                                            width: Get.width*1.5,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5.0),
                                              color: Colors.white,
                                            ),
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: SizedBox(
                                                width: Get.width*1.5,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text('MEMBERSHIP BENEFITS', style: railwaybold.copyWith(fontSize: 15),),
                                                    const SizedBox(height: 8),
                                                    Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Container(
                                                          width: Get.width/2.5,
                                                          height: 50,
                                                          padding: const EdgeInsets.symmetric(horizontal: 15),
                                                          decoration: BoxDecoration(
                                                            border: Border.all(width: 1, color: gold),
                                                          ),
                                                          child:  Center(child: Text('BENEFITS', style: railwaybold.copyWith(fontSize: 10),)),
                                                        ),
                                                        SizedBox(
                                                          height: 50,
                                                          child: ListView.builder(
                                                            physics: const NeverScrollableScrollPhysics(),
                                                            itemCount: controller.abountIsleMumberShipBenefitList[0].membershipIsleRewardRules?.length ?? 0,
                                                            scrollDirection: Axis.horizontal,
                                                            shrinkWrap: true,
                                                              itemBuilder: (ctx, index){
                                                                return Container(
                                                                  width: Get.width/4,
                                                                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                                                  decoration: BoxDecoration(
                                                               border: Border(top: BorderSide(color: gold, width: 1), right: BorderSide(color: gold, width: 1), bottom: BorderSide(color: gold, width: 1))
                                                                  ),
                                                                  child: Center(child: Text(controller.abountIsleMumberShipBenefitList[0].membershipIsleRewardRules?[index].membershipTier?.tiersName ??"", style: railwaybold.copyWith(
                                                                 color: HexColor("${controller.abountIsleMumberShipBenefitList[0]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                  fontSize: 10),)),
                                                                );
                                                              }
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        SizedBox(
                                                          width: Get.width/2.5,
                                                          child: ListView.builder(
                                                              physics: const NeverScrollableScrollPhysics(),
                                                              itemCount: controller.abountIsleMumberShipBenefitList.length ?? 0,
                                                              scrollDirection: Axis.vertical,
                                                              shrinkWrap: true,
                                                              itemBuilder: (ctx, index){
                                                                return Container(
                                                                  height: 50,
                                                                  // width: 100,
                                                                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                                                                  decoration: BoxDecoration(
                                                                      border: Border(bottom: BorderSide(color: gold, width: 1), right: BorderSide(color: gold, width: 1), left: BorderSide(color: gold, width: 1))

                                                                  ),
                                                                  child: SingleChildScrollView(
                                                                    scrollDirection: Axis.vertical,
                                                                      child: Column(
                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text("${controller.abountIsleMumberShipBenefitList[index].placeholder ?? ""}", style: railway.copyWith(fontSize: 10),),
                                                                        ],
                                                                  )),
                                                                );
                                                              }
                                                          ),
                                                        ),
                                                        Column(
                                                          children: [
                                                            SizedBox(
                                                              height: 50,
                                                              child: ListView.builder(
                                                                  physics: const NeverScrollableScrollPhysics(),
                                                                  itemCount: controller.abountIsleMumberShipBenefitList[0].membershipIsleRewardRules?.length ?? 0,
                                                                  scrollDirection: Axis.horizontal,
                                                                  shrinkWrap: true,
                                                                  itemBuilder: (ctx, index){
                                                                    return Container(
                                                                      width: Get.width/4,
                                                                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                                                      decoration: BoxDecoration(
                                                                          border: Border( right: BorderSide(color: gold, width: 1), bottom: BorderSide(color: gold, width: 1))
                                                                      ),
                                                                      child: Center(child:
                                                                      controller.abountIsleMumberShipBenefitList![0]!.rule == "reward_point_per_spent" ?
                                                                      Text("${controller.abountIsleMumberShipBenefitList[0].membershipIsleRewardRules?[index].rewardPoint.toString() ?? "0"} Points", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[0]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)
                                                                          : controller.abountIsleMumberShipBenefitList![0]!.rule == "minimum_point_to_redeem" ?
                                                                      Text("${controller.abountIsleMumberShipBenefitList[0].membershipIsleRewardRules?[index].minimumPoint.toString() ?? "0"} Points", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[0]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)
                                                                          : controller.abountIsleMumberShipBenefitList![0]!.rule == "reward_per_point" ?
                                                                      Text("${controller.abountIsleMumberShipBenefitList[0].membershipIsleRewardRules?[index].rewardAmount.toString() ?? "0"} Taka", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[0]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)
                                                                          : controller.abountIsleMumberShipBenefitList![0]!.rule == "birthday_or_isle_anniversary_reward_bonus" ?
                                                                      Text("${controller.abountIsleMumberShipBenefitList[0].membershipIsleRewardRules?[index].bonusPointMultiplier?.toString() ?? "0"}", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[0]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)
                                                                          : controller.abountIsleMumberShipBenefitList![0]!.membershipIsleRewardRules![index]?.available == true ? SizedBox(child: Text("Yes", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[2]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)) : SizedBox(child: Text('', style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[2]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)),
                                                                      ),
                                                                    );
                                                                  }
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 50,
                                                              child: ListView.builder(
                                                                  physics: const NeverScrollableScrollPhysics(),
                                                                  itemCount: controller.abountIsleMumberShipBenefitList[1].membershipIsleRewardRules?.length ?? 0,
                                                                  scrollDirection: Axis.horizontal,
                                                                  shrinkWrap: true,
                                                                  itemBuilder: (ctx, index){
                                                                    return Container(
                                                                      width: Get.width/4,
                                                                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                                                      decoration: BoxDecoration(
                                                                          border: Border( right: BorderSide(color: gold, width: 1), bottom: BorderSide(color: gold, width: 1))
                                                                      ),
                                                                      child: Center(child:
                                                                      controller.abountIsleMumberShipBenefitList![1]!.rule == "reward_point_per_spent" ?
                                                                      Text("${controller.abountIsleMumberShipBenefitList[1].membershipIsleRewardRules?[index].rewardPoint.toString() ?? "0"} Points", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[1]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)
                                                                          : controller.abountIsleMumberShipBenefitList![1]!.rule == "minimum_point_to_redeem" ?
                                                                      Text("${controller.abountIsleMumberShipBenefitList[1].membershipIsleRewardRules?[index].minimumPoint.toString() ?? "0"} Points", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[1]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)
                                                                          : controller.abountIsleMumberShipBenefitList![1]!.rule == "reward_per_point" ?
                                                                      Text("${controller.abountIsleMumberShipBenefitList[1].membershipIsleRewardRules?[index].rewardAmount.toString() ?? "0"} Taka", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[1]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)
                                                                          : controller.abountIsleMumberShipBenefitList![1]!.rule == "birthday_or_isle_anniversary_reward_bonus" ?
                                                                      Text("${controller.abountIsleMumberShipBenefitList[1].membershipIsleRewardRules?[index].bonusPointMultiplier?.toString() ?? "0"}", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[1]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)
                                                                          : controller.abountIsleMumberShipBenefitList![1]!.membershipIsleRewardRules![index]?.available == true ? SizedBox(child: Text("Yes", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[2]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)) : SizedBox(child: Text('', style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[2]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)),
                                                                      ),
                                                                    );
                                                                  }
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 50,
                                                              child: ListView.builder(
                                                                  physics: const NeverScrollableScrollPhysics(),
                                                                  itemCount: controller.abountIsleMumberShipBenefitList[2].membershipIsleRewardRules?.length ?? 0,
                                                                  scrollDirection: Axis.horizontal,
                                                                  shrinkWrap: true,
                                                                  itemBuilder: (ctx, index){
                                                                    return Container(
                                                                      width: Get.width/4,
                                                                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                                                      decoration: BoxDecoration(
                                                                          border: Border( right: BorderSide(color: gold, width: 1), bottom: BorderSide(color: gold, width: 1))
                                                                      ),
                                                                      child: Center(child:
                                                                      controller.abountIsleMumberShipBenefitList![2]!.rule == "reward_point_per_spent" ?
                                                                      Text("${controller.abountIsleMumberShipBenefitList[2].membershipIsleRewardRules?[index].rewardPoint.toString() ?? "0"} Points", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[2]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)
                                                                          : controller.abountIsleMumberShipBenefitList![2]!.rule == "minimum_point_to_redeem" ?
                                                                      Text("${controller.abountIsleMumberShipBenefitList[2].membershipIsleRewardRules?[index].minimumPoint.toString() ?? "0"} Points", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[2]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)
                                                                          : controller.abountIsleMumberShipBenefitList![2]!.rule == "reward_per_point" ?
                                                                      Text("${controller.abountIsleMumberShipBenefitList[2].membershipIsleRewardRules?[index].rewardAmount.toString() ?? "0"} Taka", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[2]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)
                                                                          : controller.abountIsleMumberShipBenefitList![2]!.rule == "birthday_or_isle_anniversary_reward_bonus" ?
                                                                      Text("${controller.abountIsleMumberShipBenefitList[2].membershipIsleRewardRules?[index].bonusPointMultiplier?.toString() ?? "0"}", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[2]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)
                                                                          : controller.abountIsleMumberShipBenefitList![2]!.membershipIsleRewardRules![index]?.available == true ? SizedBox(child: Text("Yes", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[2]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)) : SizedBox(child: Text('', style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[2]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)),
                                                                      ),
                                                                    );
                                                                  }
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 50,
                                                              child: ListView.builder(
                                                                  physics: const NeverScrollableScrollPhysics(),
                                                                  itemCount: controller.abountIsleMumberShipBenefitList[3].membershipIsleRewardRules?.length ?? 0,
                                                                  scrollDirection: Axis.horizontal,
                                                                  shrinkWrap: true,
                                                                  itemBuilder: (ctx, index){
                                                                    return Container(
                                                                      width: Get.width/4,
                                                                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                                                      decoration: BoxDecoration(
                                                                          border: Border( right: BorderSide(color: gold, width: 1), bottom: BorderSide(color: gold, width: 1))
                                                                      ),
                                                                      child: Center(child:
                                                                      controller.abountIsleMumberShipBenefitList![3]!.rule == "reward_point_per_spent" ?
                                                                      Text("${controller.abountIsleMumberShipBenefitList[3].membershipIsleRewardRules?[index].rewardPoint.toString() ?? "0"} Points", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[3]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)
                                                                          : controller.abountIsleMumberShipBenefitList![3]!.rule == "minimum_point_to_redeem" ?
                                                                      Text("${controller.abountIsleMumberShipBenefitList[3].membershipIsleRewardRules?[index].minimumPoint.toString() ?? "0"} Points", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[3]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)
                                                                          : controller.abountIsleMumberShipBenefitList![3]!.rule == "reward_per_point" ?
                                                                      Text("${controller.abountIsleMumberShipBenefitList[3].membershipIsleRewardRules?[index].rewardAmount.toString() ?? "0"} Taka", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[3]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)
                                                                          : controller.abountIsleMumberShipBenefitList![3]!.rule == "birthday_or_isle_anniversary_reward_bonus" ?
                                                                      Text("${controller.abountIsleMumberShipBenefitList[3].membershipIsleRewardRules?[index].bonusPointMultiplier?.toString() ?? "0"}", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[3]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)
                                                                          : controller.abountIsleMumberShipBenefitList![3]!.membershipIsleRewardRules![index]?.available == true ? SizedBox(child: Text("Yes", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[3]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)) : SizedBox(child: Text('', style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[3]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)),
                                                                      ),
                                                                    );
                                                                  }
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 50,
                                                              child: ListView.builder(
                                                                  physics: const NeverScrollableScrollPhysics(),
                                                                  itemCount: controller.abountIsleMumberShipBenefitList[4].membershipIsleRewardRules?.length ?? 0,
                                                                  scrollDirection: Axis.horizontal,
                                                                  shrinkWrap: true,
                                                                  itemBuilder: (ctx, index){
                                                                    return Container(
                                                                      width: Get.width/4,
                                                                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                                                      decoration: BoxDecoration(
                                                                          border: Border( right: BorderSide(color: gold, width: 1), bottom: BorderSide(color: gold, width: 1))
                                                                      ),
                                                                      child: Center(child:
                                                                      controller.abountIsleMumberShipBenefitList![4]!.rule == "reward_point_per_spent" ?
                                                                      Text("${controller.abountIsleMumberShipBenefitList[4].membershipIsleRewardRules?[index].rewardPoint.toString() ?? "0"} Points", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[4]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)
                                                                          : controller.abountIsleMumberShipBenefitList![4]!.rule == "minimum_point_to_redeem" ?
                                                                      Text("${controller.abountIsleMumberShipBenefitList[4].membershipIsleRewardRules?[index].minimumPoint.toString() ?? "0"} Points", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[4]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)
                                                                          : controller.abountIsleMumberShipBenefitList![4]!.rule == "reward_per_point" ?
                                                                      Text("${controller.abountIsleMumberShipBenefitList[4].membershipIsleRewardRules?[index].rewardAmount.toString() ?? "0"} Taka", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[4]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)
                                                                          : controller.abountIsleMumberShipBenefitList![4]!.rule == "birthday_or_isle_anniversary_reward_bonus" ?
                                                                      Text("${controller.abountIsleMumberShipBenefitList[4].membershipIsleRewardRules?[index].bonusPointMultiplier?.toString() ?? "0"}", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[4]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)
                                                                          : controller.abountIsleMumberShipBenefitList![4]!.membershipIsleRewardRules![index]?.available == true ? SizedBox(child: Text("Yes", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[4]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)) : SizedBox(child: Text('', style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[4]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)),
                                                                      ),
                                                                    );
                                                                  }
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 50,
                                                              child: ListView.builder(
                                                                  physics: const NeverScrollableScrollPhysics(),
                                                                  itemCount: controller.abountIsleMumberShipBenefitList[5].membershipIsleRewardRules?.length ?? 0,
                                                                  scrollDirection: Axis.horizontal,
                                                                  shrinkWrap: true,
                                                                  itemBuilder: (ctx, index){
                                                                    return Container(
                                                                      width: Get.width/4,
                                                                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                                                      decoration: BoxDecoration(
                                                                          border: Border( right: BorderSide(color: gold, width: 1), bottom: BorderSide(color: gold, width: 1))
                                                                      ),
                                                                      child: Center(child:
                                                                      controller.abountIsleMumberShipBenefitList![5]!.rule == "reward_point_per_spent" ?
                                                                      Text("${controller.abountIsleMumberShipBenefitList[5].membershipIsleRewardRules?[index].rewardPoint.toString() ?? "0"} Points", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[5]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)
                                                                          : controller.abountIsleMumberShipBenefitList![5]!.rule == "minimum_point_to_redeem" ?
                                                                      Text("${controller.abountIsleMumberShipBenefitList[5].membershipIsleRewardRules?[index].minimumPoint.toString() ?? "0"} Points", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[5]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)
                                                                          : controller.abountIsleMumberShipBenefitList![5]!.rule == "reward_per_point" ?
                                                                      Text("${controller.abountIsleMumberShipBenefitList[5].membershipIsleRewardRules?[index].rewardAmount.toString() ?? "0"} Taka", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[5]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)
                                                                          : controller.abountIsleMumberShipBenefitList![5]!.rule == "birthday_or_isle_anniversary_reward_bonus" ?
                                                                      Text("${controller.abountIsleMumberShipBenefitList[5].membershipIsleRewardRules?[index].bonusPointMultiplier?.toString() ?? "0"}x points", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[5]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)
                                                                          : controller.abountIsleMumberShipBenefitList![5]!.membershipIsleRewardRules![index]?.available == true ? SizedBox(child: Text("Yes", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[5]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)) : SizedBox(child: Text('', style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[5]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)),
                                                                      ),
                                                                    );
                                                                  }
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 50,
                                                              child: ListView.builder(
                                                                  physics: const NeverScrollableScrollPhysics(),
                                                                  itemCount: controller.abountIsleMumberShipBenefitList[6].membershipIsleRewardRules?.length ?? 0,
                                                                  scrollDirection: Axis.horizontal,
                                                                  shrinkWrap: true,
                                                                  itemBuilder: (ctx, index){
                                                                    return Container(
                                                                      width: Get.width/4,
                                                                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                                                      decoration: BoxDecoration(
                                                                          border: Border( right: BorderSide(color: gold, width: 1), bottom: BorderSide(color: gold, width: 1))
                                                                      ),
                                                                      child: Center(child:
                                                                      controller.abountIsleMumberShipBenefitList![6]!.rule == "reward_point_per_spent" ?
                                                                      Text("${controller.abountIsleMumberShipBenefitList[6].membershipIsleRewardRules?[index].rewardPoint.toString() ?? "0"} Points", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[6]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)
                                                                          : controller.abountIsleMumberShipBenefitList![6]!.rule == "minimum_point_to_redeem" ?
                                                                      Text("${controller.abountIsleMumberShipBenefitList[6].membershipIsleRewardRules?[index].minimumPoint.toString() ?? "0"} Points", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[6]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)
                                                                          : controller.abountIsleMumberShipBenefitList![6]!.rule == "reward_per_point" ?
                                                                      Text("${controller.abountIsleMumberShipBenefitList[6].membershipIsleRewardRules?[index].rewardAmount.toString() ?? "0"} Taka", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[6]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)
                                                                          : controller.abountIsleMumberShipBenefitList![6]!.rule == "birthday_or_isle_anniversary_reward_bonus" ?
                                                                      Text("${controller.abountIsleMumberShipBenefitList[6].membershipIsleRewardRules?[index].bonusPointMultiplier?.toString() ?? "0"}", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[6]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)
                                                                          : controller.abountIsleMumberShipBenefitList![6]!.membershipIsleRewardRules![index]?.available == true ? SizedBox(child: Text("Yes", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[6]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)) : SizedBox(child: Text('', style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[6]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)),
                                                                      ),
                                                                    );
                                                                  }
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 50,
                                                              child: ListView.builder(
                                                                  physics: const NeverScrollableScrollPhysics(),
                                                                  itemCount: controller.abountIsleMumberShipBenefitList[7].membershipIsleRewardRules?.length ?? 0,
                                                                  scrollDirection: Axis.horizontal,
                                                                  shrinkWrap: true,
                                                                  itemBuilder: (ctx, index){
                                                                    return Container(
                                                                      width: Get.width/4,
                                                                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                                                      decoration: BoxDecoration(
                                                                          border: Border( right: BorderSide(color: gold, width: 1), bottom: BorderSide(color: gold, width: 1))
                                                                      ),
                                                                      child: Center(child:
                                                                      controller.abountIsleMumberShipBenefitList![7]!.rule == "reward_point_per_spent" ?
                                                                      Text("${controller.abountIsleMumberShipBenefitList[7].membershipIsleRewardRules?[index].rewardPoint.toString() ?? "0"} Points", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[7]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)
                                                                          : controller.abountIsleMumberShipBenefitList![7]!.rule == "minimum_point_to_redeem" ?
                                                                      Text("${controller.abountIsleMumberShipBenefitList[7].membershipIsleRewardRules?[index].minimumPoint.toString() ?? "0"} Points", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[7]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)
                                                                          : controller.abountIsleMumberShipBenefitList![7]!.rule == "reward_per_point" ?
                                                                      Text("${controller.abountIsleMumberShipBenefitList[7].membershipIsleRewardRules?[index].rewardAmount.toString() ?? "0"} Taka", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[7]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)
                                                                          : controller.abountIsleMumberShipBenefitList![7]!.rule == "birthday_or_isle_anniversary_reward_bonus" ?
                                                                      Text("${controller.abountIsleMumberShipBenefitList[7].membershipIsleRewardRules?[index].bonusPointMultiplier?.toString() ?? "0"}", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[7]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)
                                                                          : controller.abountIsleMumberShipBenefitList![7]!.membershipIsleRewardRules![index]?.available == true ? SizedBox(child: Text("Yes", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[7]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)) : SizedBox(child: Text('', style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[7]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)),
                                                                      ),
                                                                    );
                                                                  }
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 50,
                                                              child: ListView.builder(
                                                                  physics: const NeverScrollableScrollPhysics(),
                                                                  itemCount: controller.abountIsleMumberShipBenefitList[8].membershipIsleRewardRules?.length ?? 0,
                                                                  scrollDirection: Axis.horizontal,
                                                                  shrinkWrap: true,
                                                                  itemBuilder: (ctx, index){
                                                                    return Container(
                                                                      width: Get.width/4,
                                                                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                                                      decoration: BoxDecoration(
                                                                          border: Border( right: BorderSide(color: gold, width: 1), bottom: BorderSide(color: gold, width: 1))
                                                                      ),
                                                                      child: Center(child:
                                                                      controller.abountIsleMumberShipBenefitList![8]!.rule == "reward_point_per_spent" ?
                                                                      Text("${controller.abountIsleMumberShipBenefitList[8].membershipIsleRewardRules?[index].rewardPoint.toString() ?? "0"} Points", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[8]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)
                                                                          : controller.abountIsleMumberShipBenefitList![8]!.rule == "minimum_point_to_redeem" ?
                                                                      Text("${controller.abountIsleMumberShipBenefitList[8].membershipIsleRewardRules?[index].minimumPoint.toString() ?? "0"} Points", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[8]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)
                                                                          : controller.abountIsleMumberShipBenefitList![8]!.rule == "reward_per_point" ?
                                                                      Text("${controller.abountIsleMumberShipBenefitList[8].membershipIsleRewardRules?[index].rewardAmount.toString() ?? "0"} Taka", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[8]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)
                                                                          : controller.abountIsleMumberShipBenefitList![8]!.rule == "birthday_or_isle_anniversary_reward_bonus" ?
                                                                      Text("${controller.abountIsleMumberShipBenefitList[8].membershipIsleRewardRules?[index].bonusPointMultiplier?.toString() ?? "0"}", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[8]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)
                                                                          : controller.abountIsleMumberShipBenefitList![8]!.membershipIsleRewardRules![index]?.available == true ? SizedBox(child: Text("Yes", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[8]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)) : SizedBox(child: Text('', style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[8]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)),
                                                                      ),
                                                                    );
                                                                  }
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 50,
                                                              child: ListView.builder(
                                                                  physics: const NeverScrollableScrollPhysics(),
                                                                  itemCount: controller.abountIsleMumberShipBenefitList[9].membershipIsleRewardRules?.length ?? 0,
                                                                  scrollDirection: Axis.horizontal,
                                                                  shrinkWrap: true,
                                                                  itemBuilder: (ctx, index){
                                                                    return Container(
                                                                      width: Get.width/4,
                                                                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                                                      decoration: BoxDecoration(
                                                                          border: Border( right: BorderSide(color: gold, width: 1), bottom: BorderSide(color: gold, width: 1))
                                                                      ),
                                                                      child: Center(child:
                                                                      controller.abountIsleMumberShipBenefitList![9]!.rule == "reward_point_per_spent" ?
                                                                      Text("${controller.abountIsleMumberShipBenefitList[9].membershipIsleRewardRules?[index].rewardPoint.toString() ?? "0"} Points", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[9]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)
                                                                          : controller.abountIsleMumberShipBenefitList![9]!.rule == "minimum_point_to_redeem" ?
                                                                      Text("${controller.abountIsleMumberShipBenefitList[9].membershipIsleRewardRules?[index].minimumPoint.toString() ?? "0"} Points", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[9]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)
                                                                          : controller.abountIsleMumberShipBenefitList![9]!.rule == "reward_per_point" ?
                                                                      Text("${controller.abountIsleMumberShipBenefitList[9].membershipIsleRewardRules?[index].rewardAmount.toString() ?? "0"} Taka", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[9]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)
                                                                          : controller.abountIsleMumberShipBenefitList![9]!.rule == "birthday_or_isle_anniversary_reward_bonus" ?
                                                                      Text("${controller.abountIsleMumberShipBenefitList[9].membershipIsleRewardRules?[index].bonusPointMultiplier?.toString() ?? "0"}", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[9]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)
                                                                          : controller.abountIsleMumberShipBenefitList![9]!.membershipIsleRewardRules![index]?.available == true ? SizedBox(child: Text("Yes", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[9]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)) : SizedBox(child: Text('', style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[9]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)),
                                                                      ),
                                                                    );
                                                                  }
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 50,
                                                              child: ListView.builder(
                                                                  physics: const NeverScrollableScrollPhysics(),
                                                                  itemCount: controller.abountIsleMumberShipBenefitList[10].membershipIsleRewardRules?.length ?? 0,
                                                                  scrollDirection: Axis.horizontal,
                                                                  shrinkWrap: true,
                                                                  itemBuilder: (ctx, index){
                                                                    return Container(
                                                                      width: Get.width/4,
                                                                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                                                      decoration: BoxDecoration(
                                                                          border: Border( right: BorderSide(color: gold, width: 1), bottom: BorderSide(color: gold, width: 1))
                                                                      ),
                                                                      child: Center(child:
                                                                      controller.abountIsleMumberShipBenefitList![10]!.rule == "reward_point_per_spent" ?
                                                                      Text("${controller.abountIsleMumberShipBenefitList[10].membershipIsleRewardRules?[index].rewardPoint.toString() ?? "0"} Points", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[10]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)
                                                                          : controller.abountIsleMumberShipBenefitList![10]!.rule == "minimum_point_to_redeem" ?
                                                                      Text("${controller.abountIsleMumberShipBenefitList[10].membershipIsleRewardRules?[index].minimumPoint.toString() ?? "0"} Points", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[10]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)
                                                                          : controller.abountIsleMumberShipBenefitList![10]!.rule == "reward_per_point" ?
                                                                      Text("${controller.abountIsleMumberShipBenefitList[10].membershipIsleRewardRules?[index].rewardAmount.toString() ?? "0"} Taka", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[10]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)
                                                                          : controller.abountIsleMumberShipBenefitList![10]!.rule == "birthday_or_isle_anniversary_reward_bonus" ?
                                                                      Text("${controller.abountIsleMumberShipBenefitList[10].membershipIsleRewardRules?[index].bonusPointMultiplier?.toString() ?? "0"}", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[10]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)
                                                                          : controller.abountIsleMumberShipBenefitList![10]!.membershipIsleRewardRules![index]?.available == true ? SizedBox(child: Text("Yes", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[10]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)) : SizedBox(child: Text('', style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[10]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)),
                                                                      ),
                                                                    );
                                                                  }
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 50,
                                                              child: ListView.builder(
                                                                  physics: const NeverScrollableScrollPhysics(),
                                                                  itemCount: controller.abountIsleMumberShipBenefitList[11].membershipIsleRewardRules?.length ?? 0,
                                                                  scrollDirection: Axis.horizontal,
                                                                  shrinkWrap: true,
                                                                  itemBuilder: (ctx, index){
                                                                    return Container(
                                                                      width: Get.width/4,
                                                                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                                                      decoration: BoxDecoration(
                                                                          border: Border( right: BorderSide(color: gold, width: 1), bottom: BorderSide(color: gold, width: 1))
                                                                      ),
                                                                      child: Center(child:
                                                                      controller.abountIsleMumberShipBenefitList![11]!.rule == "reward_point_per_spent" ?
                                                                      Text("${controller.abountIsleMumberShipBenefitList[11].membershipIsleRewardRules?[index].rewardPoint.toString() ?? "0"} Points", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[11]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)
                                                                          : controller.abountIsleMumberShipBenefitList![11]!.rule == "minimum_point_to_redeem" ?
                                                                      Text("${controller.abountIsleMumberShipBenefitList[11].membershipIsleRewardRules?[index].minimumPoint.toString() ?? "0"} Points", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[11]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)
                                                                          : controller.abountIsleMumberShipBenefitList![11]!.rule == "reward_per_point" ?
                                                                      Text("${controller.abountIsleMumberShipBenefitList[11].membershipIsleRewardRules?[index].rewardAmount.toString() ?? "0"} Taka", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[11]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)
                                                                          : controller.abountIsleMumberShipBenefitList![11]!.rule == "birthday_or_isle_anniversary_reward_bonus" ?
                                                                      Text("${controller.abountIsleMumberShipBenefitList[11].membershipIsleRewardRules?[index].bonusPointMultiplier?.toString() ?? "0"}", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[11]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)
                                                                          : controller.abountIsleMumberShipBenefitList![11]!.membershipIsleRewardRules![index]?.available == true ? SizedBox(child: Text("Yes", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[11]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)) : SizedBox(child: Text('', style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[11]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)),
                                                                      ),
                                                                    );
                                                                  }
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 50,
                                                              child: ListView.builder(
                                                                  physics: const NeverScrollableScrollPhysics(),
                                                                  itemCount: controller.abountIsleMumberShipBenefitList[12].membershipIsleRewardRules?.length ?? 0,
                                                                  scrollDirection: Axis.horizontal,
                                                                  shrinkWrap: true,
                                                                  itemBuilder: (ctx, index){
                                                                    return Container(
                                                                      width: Get.width/4,
                                                                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                                                      decoration: BoxDecoration(
                                                                          border: Border( right: BorderSide(color: gold, width: 1), bottom: BorderSide(color: gold, width: 1))
                                                                      ),
                                                                      child: Center(child:
                                                                      controller.abountIsleMumberShipBenefitList![12]!.rule == "reward_point_per_spent" ?
                                                                      Text("${controller.abountIsleMumberShipBenefitList[12].membershipIsleRewardRules?[index].rewardPoint.toString() ?? "0"} Points", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[12]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)
                                                                          : controller.abountIsleMumberShipBenefitList![12]!.rule == "minimum_point_to_redeem" ?
                                                                      Text("${controller.abountIsleMumberShipBenefitList[12].membershipIsleRewardRules?[index].minimumPoint.toString() ?? "0"} Points", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[12]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)
                                                                          : controller.abountIsleMumberShipBenefitList![12]!.rule == "reward_per_point" ?
                                                                      Text("${controller.abountIsleMumberShipBenefitList[12].membershipIsleRewardRules?[index].rewardAmount.toString() ?? "0"} Taka", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[12]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)
                                                                          : controller.abountIsleMumberShipBenefitList![12]!.rule == "birthday_or_isle_anniversary_reward_bonus" ?
                                                                      Text("${controller.abountIsleMumberShipBenefitList[12].membershipIsleRewardRules?[index].bonusPointMultiplier?.toString() ?? "0"}", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[12]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)
                                                                          : controller.abountIsleMumberShipBenefitList![12]!.membershipIsleRewardRules![index]?.available == true ? SizedBox(child: Text("Yes", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[12]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)) : SizedBox(child: Text('', style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[12]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)),
                                                                      ),
                                                                    );
                                                                  }
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 50,
                                                              child: ListView.builder(
                                                                  physics: const NeverScrollableScrollPhysics(),
                                                                  itemCount: controller.abountIsleMumberShipBenefitList[13].membershipIsleRewardRules?.length ?? 0,
                                                                  scrollDirection: Axis.horizontal,
                                                                  shrinkWrap: true,
                                                                  itemBuilder: (ctx, index){
                                                                    return Container(
                                                                      width: Get.width/4,
                                                                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                                                      decoration: BoxDecoration(
                                                                          border: Border( right: BorderSide(color: gold, width: 1), bottom: BorderSide(color: gold, width: 1))
                                                                      ),
                                                                      child: Center(child:
                                                                      controller.abountIsleMumberShipBenefitList![13]!.rule == "reward_point_per_spent" ?
                                                                      Text("${controller.abountIsleMumberShipBenefitList[13].membershipIsleRewardRules?[index].rewardPoint.toString() ?? "0"} Points", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[13]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)
                                                                          : controller.abountIsleMumberShipBenefitList![13]!.rule == "minimum_point_to_redeem" ?
                                                                      Text("${controller.abountIsleMumberShipBenefitList[13].membershipIsleRewardRules?[index].minimumPoint.toString() ?? "0"} Points", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[13]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)
                                                                          : controller.abountIsleMumberShipBenefitList![13]!.rule == "reward_per_point" ?
                                                                      Text("${controller.abountIsleMumberShipBenefitList[13].membershipIsleRewardRules?[index].rewardAmount.toString() ?? "0"} Taka", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[13]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)
                                                                          : controller.abountIsleMumberShipBenefitList![13]!.rule == "birthday_or_isle_anniversary_reward_bonus" ?
                                                                      Text("${controller.abountIsleMumberShipBenefitList[13].membershipIsleRewardRules?[index].bonusPointMultiplier?.toString() ?? "0"}", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[13]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)
                                                                          : controller.abountIsleMumberShipBenefitList![13]!.membershipIsleRewardRules![index]?.available == true ? SizedBox(child: Text("Yes", style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[13]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)) : SizedBox(child: Text('', style: poppins.copyWith(
                                                                          color: HexColor("${controller.abountIsleMumberShipBenefitList[13]?.membershipIsleRewardRules?[index]?.membershipTier?.colorCode??""}"),
                                                                          fontSize: 10),)),
                                                                      ),
                                                                    );
                                                                  }
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),

                                        /*  Divider(thickness: 0.8,color: Color(0xffD1D2D2)),*/

                                        const SizedBox(height: 30),
                                      ],
                                    )
                                    : const SizedBox() : const SizedBox(),
                                  )
                              )
                          ),

                          /// 4 th
                          RefreshIndicator(
                              onRefresh: () async {
                                // showCustomSnackBar("2");
                              },
                              child: SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const SizedBox(height: 20),
                                        Text(
                                          'REDEEMING POINTS',
                                          style: railwaybold.copyWith(
                                              color: Colors.black,
                                              fontSize: 18),
                                        ),
                                        const SizedBox(height: 8),
                                        controller.aboutIsleRedeemPointResponse!= null?
                                            Padding(
                                              padding: const EdgeInsets.only(left: 12, right: 12),
                                              child: Text(controller.aboutIsleRedeemPointResponse?.data?.title??"",
                                                  style: railway.copyWith(
                                                      color: Colors.black54,
                                                      fontSize: 12),
                                                ),
                                            ) : const SizedBox(),

                                        const SizedBox(height: 15),
                                        controller.aboutIsleRedeemPointResponse!=null? controller.aboutIsleRedeemPointResponse!.data!.redeemingPointsSteps!.isNotEmpty?
                                        ListView.builder(
                                            itemCount: controller.aboutIsleRedeemPointResponse!.data!.redeemingPointsSteps!.length??0,
                                            shrinkWrap: true,
                                            physics: const NeverScrollableScrollPhysics(),
                                            itemBuilder: (BuildContext context, int index) {
                                              return Padding(
                                                padding: const EdgeInsets.all(10),
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      CustomImageCached(
                                                        placeholder: Images.placeholder,
                                                        image: "${AppConstants.BASE_URL}${controller.aboutIsleRedeemPointResponse?.data?.redeemingPointsSteps?[index]?.image??""}",
                                                        height: 80,
                                                        width: 80,
                                                        fit: BoxFit.fill,
                                                        // isRound: false,
                                                      ),
                                                      const SizedBox(height: 12),
                                                      Text(
                                                        (controller.aboutIsleRedeemPointResponse?.data?.redeemingPointsSteps?[index]?.tagLine??"").toUpperCase(),
                                                        style: railwaybold.copyWith(
                                                            color: Colors.black,
                                                            fontSize: 18),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }
                                        )
                                            : const SizedBox() : const SizedBox(),
                                        const SizedBox(height: 20),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: HtmlWidget(  controller.aboutIsleRedeemPointResponse?.data?.description??"",
                                                  textStyle: railway.copyWith( fontWeight: FontWeight.w200,color: Colors.black,
                                                      fontSize: Get.width < 430 ? Get.width < 360 ? 9 : 12 : 14)),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 30),
                                      ],
                                    ),
                                  )
                              )
                          ),

                          /// 5
                          RefreshIndicator(
                              onRefresh: () async {
                                // showCustomSnackBar("2");
                              },
                              child: SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const SizedBox(height: 20),
                                        controller.exclusiveOfferResponse!=null? controller.exclusiveOfferResponse!.data!.isNotEmpty?
                                        ListView.builder(
                                            itemCount: controller.exclusiveOfferResponse!.data!.length??0,
                                            shrinkWrap: true,
                                            physics: const NeverScrollableScrollPhysics(),
                                            itemBuilder: (BuildContext context, int index) {
                                              return Padding(
                                                padding: const EdgeInsets.all(8),
                                                child: Container(
                                                  color: const Color(0xffE5E7EB),
                                                  alignment: Alignment.center,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 8, right: 8, top: 20, bottom: 15),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        CustomImageCached(
                                                          placeholder: Images.placeholder,
                                                          image: "${AppConstants.BASE_URL}${controller.exclusiveOfferResponse?.data?[index]?.image??""}",
                                                          height: 50,
                                                          width: 50,
                                                          fit: BoxFit.fill,
                                                          // isRound: false,
                                                        ),
                                                        const SizedBox(height: 12),
                                                        Text(
                                                          controller.exclusiveOfferResponse?.data?[index]?.offerName??"",
                                                          style: railwaybold.copyWith(
                                                              color: Colors.black,
                                                              fontSize: 13),
                                                        ),
                                                        const SizedBox(height: 6),
                                                        Text(
                                                          'Validity until ${DateConverter.stringToLocalDateOnly(controller.exclusiveOfferResponse?.data?[index]?.validDate??"")}',
                                                          style: poppins.copyWith(
                                                              color: Colors.black54,
                                                              fontSize: 10),
                                                        ),
                                                        const SizedBox(height: 15),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                        )
                                            : const SizedBox() : const SizedBox(),
                                        const SizedBox(height: 30),

                                      ],
                                    ),
                                  )
                              )
                          ),
                          /// 6
                          RefreshIndicator(
                              onRefresh: () async {
                                // showCustomSnackBar("2");
                              },
                              child: SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ListView.builder(
                                      itemCount: 1,
                                        shrinkWrap: true,
                                        physics: const NeverScrollableScrollPhysics(),
                                        itemBuilder: (BuildContext context, int index){
                                        return ListView.builder(
                                            itemCount: 1,
                                            shrinkWrap: true,
                                            physics: const NeverScrollableScrollPhysics(),
                                            itemBuilder: (BuildContext context, int index2){
                                              return Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  const SizedBox(height: 15),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          height: 40,
                                                          color: const Color(0xff2D2D2D),
                                                          child: Center(
                                                            child: Text(
                                                              "EARN POINTS",
                                                              style: railwaybold.copyWith(
                                                                  color: Colors.white, fontSize: 12),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          height: 40,
                                                          color: const Color(0xff6B7280),
                                                          child: Center(
                                                            child: Text(
                                                              "REDEEM POINTS",
                                                              style: railwaybold.copyWith(
                                                                  color: Colors.white, fontSize: 12),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                      color: const Color(0xffF3F4F6),
                                                      height: 55,
                                                      child: Center(
                                                        child: Text(
                                                          "CALCULATE HOW MANY POINTS YOU CAN EARN",
                                                          style: railwaybold.copyWith(color: Colors.black54),
                                                        ),
                                                      )),
                                                  InkWell(
                                                    onTap: () {
                                                      Get.dialog(
                                                        barrierDismissible: false,
                                                        CustomSearching(
                                                          title: '',
                                                          hint: '',
                                                          datalist: controller.membershiptierList!,
                                                          onSelect: (value) async {
                                                            Get.back();
                                                            selectedTierIndex = value;
                                                            selectedTier = controller.membershiptierList[value];
                                                            selectedTierId = controller.membershipTierResponse?.data?[selectedTierIndex]!.id!.toString() ?? "";
                                                            print("My Click Value is ==>${selectedTierId}");
                                                          },
                                                          onClose: () {
                                                            Get.back();
                                                          },
                                                        ),
                                                      );
                                                    },
                                                    child: CustomDropDown(
                                                      selectfontsize: 11,
                                                      text: selectedTier!,
                                                      title: '',
                                                    ),
                                                  ),
                                                  Container(
                                                      color: const Color(0xffF3F4F6),
                                                      width: Get.width,
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          const SizedBox(height: 12),
                                                          Text("Enter the amount including vat",
                                                            style: railwaybold.copyWith(
                                                                color: Colors.black54, fontSize: 11),
                                                          ),
                                                          const SizedBox(height: 6),
                                                          Row(
                                                            children: [
                                                              Container(
                                                                height: 38,
                                                                width: 45,
                                                                color: const Color(0xffD1D5DB),
                                                                child: Center(
                                                                  child: Text("BDT",
                                                                    style: railwaybold.copyWith(
                                                                        color: Colors.black54),
                                                                  ),
                                                                ),
                                                              ),
                                                              const SizedBox(width: 8),
                                                              Expanded(
                                                                child: CustomOnlyTextFieldWithBorder(
                                                                  height: 40,
                                                                  controller: earnpointCtr,
                                                                  focusNode: earnpointFcs,
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ],
                                                      )),
                                                  const SizedBox(height: 20),
                                                  Center(child: Text("You will earn ${calculatedValue.toStringAsFixed(0)} points")),
                                                  const SizedBox(height: 30),
                                                  CustomButton(
                                                      onPressed: () {
                                                        Iterable<int> rewardPointList = controller.membershipTierResponse?.data?[selectedTierIndex]?.membershipIsleRewardRules
                                                            ?.where((item) => item.isleRewardRule?.rule == "reward_point_per_spent").map((item) => item.rewardPoint ?? 0) ?? [];
                                                        Iterable<int> spentAmountList = controller.membershipTierResponse?.data?[selectedTierIndex]?.membershipIsleRewardRules
                                                            ?.where((item) => item.isleRewardRule?.rule == "reward_point_per_spent").map((item) => item.isleRewardRule?.spentAmount ?? 0) ?? [];
                                                        List<int> filteredRewardPointList = rewardPointList.where((value) => value != 0).toList();
                                                        List<int> spentAmountPointList = spentAmountList.where((value) => value != 0).toList();
                                                        print('Reward Point List: $filteredRewardPointList');
                                                        print('Reward Point List: $spentAmountPointList');
                                                        double redeemPoints = double.tryParse(earnpointCtr.text) ?? 0.0;
                                                        int rewardPoint = filteredRewardPointList.isNotEmpty ? filteredRewardPointList.first : 0;
                                                        int spentAmount = spentAmountPointList.isNotEmpty ? spentAmountPointList.first : 0;
                                                        double calculatedResult = calculator1cal(redeemPoints, rewardPoint, spentAmount);
                                                        setState(() {
                                                          calculatedValue = calculatedResult;
                                                        });
                                                      },
                                                      height: 40,
                                                      radius: 0,
                                                      buttoncolor: const Color(0xff9CA3AF),
                                                      buttontextcolor: Colors.white,
                                                      fontSize: 14,
                                                      myfontweight: FontWeight.bold,
                                                      buttonText: "CALCULATE"),

                                                  ///
                                                  const SizedBox(height: 20),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          height: 40,
                                                          color: const Color(0xff2D2D2D),
                                                          child: Center(
                                                            child: Text(
                                                              "REDEEM POINTS",
                                                              style: railwaybold.copyWith(
                                                                  color: Colors.white, fontSize: 12),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          height: 40,
                                                          color: const Color(0xff6B7280),
                                                          child: Center(
                                                            child: Text(
                                                              "EARN POINTS",
                                                              style: railwaybold.copyWith(
                                                                  color: Colors.white, fontSize: 12),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                      color: const Color(0xffF3F4F6),
                                                      height: 55,
                                                      child: Center(
                                                        child: Text(
                                                          "CALCULATE THE VALUE OF POINTS YOU CAN REDEEM",
                                                          style: railwaybold.copyWith(color: Colors.black54),
                                                        ),
                                                      )),
                                                  Container(
                                                      color: const Color(0xffF3F4F6),
                                                      width: Get.width,
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [

                                                          const SizedBox(height: 6),
                                                          Row(
                                                            children: [
                                                              Container(
                                                                height: 38,
                                                                width: 65,
                                                                color: const Color(0xffD1D5DB),
                                                                child: Center(
                                                                  child: Text(
                                                                    "POINTS",
                                                                    style: railwaybold.copyWith(
                                                                        color: Colors.black54),
                                                                  ),
                                                                ),
                                                              ),
                                                              const SizedBox(width: 8),
                                                              Expanded(
                                                                child: CustomOnlyTextFieldWithBorder(
                                                                  height: 40,
                                                                  controller: redeempointCtr,
                                                                  focusNode: redeempointFcs,
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ],
                                                      )),
                                                  const SizedBox(height: 20),
                                                  Center(child: Text("You will redeem BDT ${calculatedValue1.toStringAsFixed(0)}")),
                                                  const SizedBox(height: 30),
                                                  CustomButton(
                                                      onPressed: () {
                                                        // Call the calculator function when the button is pressed
                                                        calculatePoints();
                                                      },
                                                      height: 40,
                                                      radius: 0,
                                                      buttoncolor: const Color(0xff9CA3AF),
                                                      buttontextcolor: Colors.white,
                                                      fontSize: 14,
                                                      myfontweight: FontWeight.bold,
                                                      buttonText: "CALCULATE"),
                                                  const SizedBox(height: 40),
                                                ],
                                              );
                                            }
                                        );
                                        }
                                    )
                                    ,
                                  )
                              )
                          ),
                          /// 7
                          RefreshIndicator(
                              onRefresh: () async {
                                // showCustomSnackBar("2");
                              },
                              child: SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const SizedBox(height: 30),
                                        Text(
                                          'MEMBERS TERMS & CONDITION',
                                          style: railwaybold.copyWith(
                                              color: Colors.black,
                                              fontSize: 18),
                                        ),
                                        const SizedBox(height: 40),
                                        controller.memberTermsConditionsResponse!=null? controller.memberTermsConditionsResponse!.data!.isNotEmpty?
                                        ListView.builder(
                                            itemCount: controller.memberTermsConditionsResponse!.data!.length??0,
                                            shrinkWrap: true,
                                            physics: const NeverScrollableScrollPhysics(),
                                            itemBuilder: (BuildContext context, int index) {
                                              return Padding(
                                                padding: const EdgeInsets.all(3),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                                      // mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        const Text("●  "),
                                                        Expanded(
                                                          child: Text(
                                                            controller.memberTermsConditionsResponse?.data?[index]?.termsCondition??"",
                                                            style: railway.copyWith(
                                                                color: Colors.black,
                                                                fontSize: 11),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }
                                        )
                                            : const SizedBox() : const SizedBox(),

                                        const SizedBox(height: 30),
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

  double calculator1cal(double input, int rewardPoint, int spentAmount) {
    final numericInput = input;
    print("Input ==> $input");
    print("Reward Point ==> $rewardPoint");
    print("Spent Amount ==> $spentAmount");
    return (numericInput * rewardPoint) / spentAmount;
  }



// Function to calculate points based on the redeempointCtr value
  void calculatePoints() {
    // Assuming redeempointCtr.text returns a String representation of the user input
    String inputText = redeempointCtr.text;
    // Convert the input text to a double (assuming it contains a valid numeric value)
    double inputValue = double.tryParse(inputText) ?? 0.0;
    // Perform your calculation logic here (replace this with your actual calculation)
    calculatedValue1 = inputValue; // Replace this with your actual calculation logic
    // Force a re-render to update the UI with the new calculated value
    setState(() {});
  }










}
