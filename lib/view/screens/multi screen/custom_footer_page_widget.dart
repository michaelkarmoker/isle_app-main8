import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/custom_Image_cached.dart';
import 'package:isletestapp/view/screens/multi%20screen/video_player.dart';
import 'package:isletestapp/view/screens/search/search_screen.dart';
import 'package:isletestapp/view/screens/universal_bottom_nav/universal_bottom_nav.dart';
import 'package:isletestapp/view/screens/wish_list/custom_wish_item_count_widget.dart';
import 'package:isletestapp/view/screens/wish_list/wish_list.dart';

import '../custom logo/custom_logo_widget.dart';


class CustomFooterView extends StatelessWidget {
  final String? head;
  final String title;
  final String? shortDesc;
  final String desc;
  final String? image;
  final String? video;
  const CustomFooterView({
    super.key, required this.title, required this.desc,  this.shortDesc, this.head, this.image, this.video,
    // this.image,

  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: UniversalBottomNav(),
      backgroundColor: const Color(0xffFAFAFA),
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
        leadingWidth: Get.width/3.5,
        title: const CustomLogo(),
      ),
      body: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Column(
                children: [
                  image == null?
                  const SizedBox.shrink() :
                  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child:
                image== null?
                CustomImageCached(image: "${image}",fit: BoxFit.fill,
                  isRound: false,
                  height: image == null? 0: 220,
                  width: Get.width,
                )
                : const SizedBox.shrink(),
              ),
          ),
   /*    image != null?   SizedBox(height: 30) : SizedBox.shrink(),*/
                  image != null?
                  const SizedBox.shrink() :
                  const SizedBox(height: 20),
                  Center(
                      child: Column(
                        children: [
                          title!=null?
                          Text('${title}'.toUpperCase(), style: railwaybold.copyWith(fontSize: 15),)
                              : const SizedBox.shrink(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 100),
                            child: Divider(
                              thickness: 3,
                              color: gold,
                            ),
                          )
                        ],
                      )),

                  shortDesc!=null ? const SizedBox(height: 20): const SizedBox.shrink(),
                  shortDesc!=null?
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text('${shortDesc}', style: railwaybold.copyWith(fontSize: 12),),
                      ),
                    ],
                  )
                      : const SizedBox(),
                  const SizedBox(height: 0),
                  desc!=null?
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                        alignment: Alignment.topLeft,
                        child: HtmlWidget("${desc}",textStyle: railway.copyWith(fontSize: 10))),)
                      : const SizedBox(),

                  const SizedBox(height: 20),

                  video ==null?   const SizedBox.shrink() :
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child:  Container(
                      // height: 250,
                        child:
                        VideoPlayerWidget(url: "$video", )
                    ),),

                ],
              ),
            ),
          )
      ),
    );
  }
}
